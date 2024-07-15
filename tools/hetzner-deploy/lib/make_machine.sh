#! /bin/bash
# Factory switcher to choose between hcloud_tf, hcloud_py, and simple.
#
# 2021-03-01 jw, 	support for POSTINIT_MSG, POSTINIT_BASHRC added.
# 2021-07-16 jw, 	print better instructions also when running standalone
# 2022-09-12, jw	if cf_dns_add_move.sh is found, automate cloudflare DNS and certbot.
# 2024-07-15, jw	use env MAKE_MACHINE_CF_DNS= ... to skip generating DNS names and certs while debugging.
#
# TODO:
#  - ssh -o UserKnownHostsFile=/dev/null  could simplify things...

if [ -z "$BASH_SOURCE" ]; then
  libdir=$(dirname $0)/lib	# a source command does not update $0, we have to add the lib ourselves. grrr.
else
  libdir=$(dirname "$BASH_SOURCE")
fi
# echo libdir=$libdir

test -z "$HCLOUD_TOKEN" && export HCLOUD_TOKEN=$TF_VAR_hcloud_token
test -z "$OC_DEPLOY" -a -n "$OC_DEPLOY_ADDR" && OC_DEPLOY=simple
if [ -z "$OC_DEPLOY" -a -n "$HCLOUD_TOKEN" ]; then
  if [ -z "$(python3 -c 'import hcloud' 2>&1)" ]; then
    OC_DEPLOY=hcloud_py
  else
    OC_DEPLOY=hcloud_tf
    cat <<EOM
Warning hcloud python module not found
======================================

Please press CTRL-C and retry after running

	pip install hcloud

(or wait 10 seconds to try with deprecated hcloud_tf)
EOM
    sleep 5
    echo .
    sleep 4
    echo .
    sleep 3
    echo .
    sleep 2
  fi
fi
test -z "$OC_DEPLOY" -o ! -d $libdir/$OC_DEPLOY && { echo 1>&2 "define HCLOUD_TOKEN or set OC_DEPLOY to one of $(ls -m $libdir)"; exit 1; }

test "$OC_DEPLOY" = hcloud_py && suf=py || suf=sh
echo 1>&2 "Using OC_DEPLOY=$OC_DEPLOY ..."
NAME=
IPADDR=
eval $($libdir/$OC_DEPLOY/make_machine.$suf "$@")

if [ -z "$IPADDR" ]; then
  if [ "$NAME" = '-h' ]; then		# usage was printed.
    cat <<EOF

Additional parameters can be URLs or filenames. They are copied into the machine.

Additonal environment variables:

  OC_DEPLOY_ADDR=localhost		Deploy at localhost. Skip machine creation. Will use 'sudo'.
  OC_DEPLOY_ADDR=XX.XX.XX.XX		Deploy at existing IPv4-address. Skip machine creation. Will use 'ssh root@...'
  OC_DEPLOY_ADDR=			(Empty or undefined). Create machine at Hetzner cloud.
EOF
  else
    echo "Error: make_machine.sh failed."
  fi
  exit 1;
fi


reset	# clear screen when all was well.

## mitigate CVE-2024-6387, 2024-07-02. jw
ssh_opts="-o ConnectTimeout=10 -o CheckHostIP=no -o StrictHostKeyChecking=no -o PasswordAuthentication=no"
echo "LoginGraceTime 0" | timeout 20 ssh $ssh_opts root@$IPADDR tee -a /etc/ssh/sshd_config.d/nograce.conf
timeout 20 ssh $ssh_opts root@$IPADDR service sshd restart
timeout 20 ssh $ssh_opts root@$IPADDR sshd -T | grep -i grace
echo "expected output above: logingracetime 0"

echo NAME=$NAME
echo "$PARAM"

scp -q -r $libdir/../tasks root@$IPADDR:
PARAM_BASENAME=
for param in $PARAM; do
  if [ -e "$param" ]; then
    echo "+ scp -q -r '$param' root@$IPADDR:"
    scp -q -r "$param" root@$IPADDR:
  else
    if echo "$param" | grep -q '^b:'; then
      # nothing to do, but only a comment is invalid syntax in an if clause.
      echo "bundled app: $param"
    else
      if echo "$param" | grep -q '://'; then
        echo "+ ssh root@$IPADDR wget '$param' "
        ssh root@$IPADDR wget --progress=bar:force:noscroll "$param"
      else
        echo "$0: non-magic param: $param"
      fi
    fi
  fi
  sleep 2
  if [ -z "$PARAM_BASENAME" ]; then
    PARAM_BASENAME="$(basename $param)"
  else
    PARAM_BASENAME="$PARAM_BASENAME $(basename $param)"
  fi
done

echo "$PARAM_BASENAME"

# try find cf_dns
cf_dns=$(type -P cf_dns)
test -z "$cf_dns" && cf_dns=$(type -P cf_dns.sh)
test -z "$cf_dns" && cf_dns=$libdir/../../cf_dns.sh
test -n "$MAKE_MACHINE_CF_DNS" && cf_dns=$MAKE_MACHINE_CF_DNS

if [ -n "$cf_dns" ]; then
  # Automate DNS name and certbot.
  # A DNS-name can be obtained through cloudflare via the cf_dns script.
  # But as the required credentials are quite powerfull, we do not expose them to our new cloud machine.
  # Instead, we run cf_dns from the local machine, using this trick:
  # - as we just scp'd stuff into the new cloud machine, we can scp into the machine
  # - During its initialization, the new cloud machine eventually creates a /root/env.sh file containing the
  #   fqdn chosen by the init script.
  # - We a) don't know exactly when that happens, and b) cannot simply fetch this env.sh after the init script is done,
  #   as the init script may shell out an interactive prompt with the user, and we only re-gain control here, when the
  #   user is done with the machine. We want the user to have DNS name and certificates ready before he goes interactive.
  # - Thus we instead fork a cf_dns --poll call as a background job. (--poll waits ca 10 min for this env.sh to appear)
  #   - the backgound job should not mess with onscreen IO, so we fully redirect its output to a file.
  #   - when done, (successful or not), we scp the tempfile into the machine as CF_DNS.msg, and hope to do that, before the init script is done.
  #   - if all that succeeds, the init script in the machine simply prints out the content of CF_DNS.msg at the end,
  #     otherwise it prints a suggestion to run cf_dns manually.
  # What a mess, to just keep the credentials away from the cloud instance.
  cf_dns_tmp=/tmp/cf_dns_$$.log
  ($cf_dns $IPADDR --poll < /dev/null > $cf_dns_tmp 2>&1; scp -q $cf_dns_tmp root@$IPADDR:CF_DNS.msg; rm -f $cf_dns_tmp) &
  echo "+ $cf_dns $IPADDR --poll &"
else
  cf_dns_tmp=/tmp/cf_dns_$$.log
  echo "No cf_dns found. Try manually: cf_dns $IPADDR --poll" | tee -a $cf_dns_tmp
  scp -q $cf_dns_tmp root@$IPADDR:CF_DNS.msg
  rm -f $cf_dns_tmp
  sleep 10
fi

tmpscriptfile=./tmpscript$$.sh
scriptfile=$tmpscriptfile
scriptfolder=
function LOAD_SCRIPT {
  if [ -z "$1" ]; then
     # inline style usage with <<EOF or such ...
     echo  > $scriptfile "export PARAM='$PARAM'"
     echo >> $scriptfile "export PARAM_BASENAME='$PARAM_BASENAME'"
     echo >> $scriptfile "# ls -l \$PARAM_BASENAME"
     cat  >> $scriptfile
  else
     # TODO: add INIT.bashrc prolog like above
     scriptfolder=$(dirname "$1")
     if [ "$scriptfolder" == "." ]; then
       scriptfolder=
       cp "$1" $scriptfile
     else
       scriptfile="$1"
     fi
  fi
}

function RUN_SCRIPT {
  if [ "$OC_DEPLOY_ADDR" = localhost -o "$OC_DEPLOY_ADDR" = 127.0.0.1 ]; then
    sudo bash $scriptfile
    test -n "$POSTINIT_MSG" && echo "$POSTINIT_MSG"
  else
    if [ -z "$scriptfolder" ]; then
      test -n "$POSTINIT_BASHRC" && echo "$POSTINIT_BASHRC" | ssh root@$IPADDR "cat > POSTINIT.bashrc"
      test -n "$POSTINIT_MSG"    && echo "$POSTINIT_MSG"    | ssh root@$IPADDR "cat > POSTINIT.msg"
      echo 'set +x; cd ~' >> $scriptfile
      echo 'test -f ~/POSTINIT.bashrc && . ~/POSTINIT.bashrc' >> $scriptfile
      echo 'test -f ~/POSTINIT.msg && cat ~/POSTINIT.msg' >> $scriptfile
      echo '. ~/.bashrc' >> $scriptfile
      scp -q $scriptfile root@$IPADDR:INIT.bashrc
      ssh -t root@$IPADDR bash --rcfile INIT.bashrc
    else
      scp -q -r $scriptfolder root@$IPADDR:INIT
      test -n "$POSTINIT_BASHRC" && echo "$POSTINIT_BASHRC" | ssh root@$IPADDR "cat > ~/INIT/POSTINIT.bashrc"
      test -n "$POSTINIT_MSG"    && echo "$POSTINIT_MSG"    | ssh root@$IPADDR "cat > ~/INIT/POSTINIT.msg"
      echo >  $tmpscriptfile "cd INIT; source $(basename $scriptfile)"
      echo >> $tmpscriptfile "set +x; cd ~"
      echo >> $tmpscriptfile "test -f ~/INIT/POSTINIT.bashrc && source ~/INIT/POSTINIT.bashrc"
      echo >> $tmpscriptfile 'test -f ~/INIT/POSTINIT.msg && cat ~/INIT/POSTINIT.msg'
      echo >> $tmpscriptfile "source ~/.bashrc"
      scp -q  $tmpscriptfile root@$IPADDR:INIT.bashrc
      ssh -t root@$IPADDR bash --rcfile INIT.bashrc
    fi
  fi
  set +x
  rm -f $tmpscriptfile

  if [ "$OC_DEPLOY" != 'simple' ]; then
    cat <<EOF
---------------------------------------------
# Log into the machine with

	ssh root@$IPADDR

# When you no longer need the machine, destroy it with e.g.
        $libdir/../destroy_machine.sh $IPADDR

---------------------------------------------
EOF
  fi
}

function INIT_SCRIPT {
  LOAD_SCRIPT $1
  # For an interactive session, we must not have a stdin redirect. Use exec blackmagic to remove one, if any.
  exec </dev/tty	
  RUN_SCRIPT
}


if [ "$OC_DEPLOY" != 'simple' ]; then
    cat <<EOF
---------------------------------------------
# Log into the machine with

	ssh root@$IPADDR

# When you no longer need the machine, destroy it with e.g.
        $libdir/../destroy_machine.sh $IPADDR

---------------------------------------------
EOF
fi
# not used normally, but fulfill what the usage says:
echo export IPADDR=$IPADDR NAME=$NAME
