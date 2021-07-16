#! /bin/bash
# Factory switcher to choose between hcloud_tf, hcloud_py, and simple.
#
# 2021-03-01 jw, 	support for POSTINIT_MSG, POSTINIT_BASHRC added.
#

if [ -z "$BASH_SOURCE" ]; then
  libdir=$(dirname $0)/lib	# a source command does not update $0, we have to add the lib ourselves. grrr.
else
  libdir=$(dirname "$BASH_SOURCE")
fi
echo libdir=$libdir

test -z "$HCLOUD_TOKEN" && export HCLOUD_TOKEN=$TF_VAR_hcloud_token
test -z "$OC_DEPLOY" -a -n "$OC_DEPLOY_ADDR" && OC_DEPLOY=simple
if [ -z "$OC_DEPLOY" -a -n "$HCLOUD_TOKEN" ]; then
  test -z "$(python3 -c 'import hcloud' 2>&1)" && OC_DEPLOY=hcloud_py || OC_DEPLOY=hcloud_tf
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

echo "$PARAM"

scp -q -r $libdir/../task root@$IPADDR:
PARAM_BASENAME=
for param in $PARAM; do
  if [ -e "$param" ]; then
    echo "+ scp -q -r '$param' root@$IPADDR:"
    scp -q -r "$param" root@$IPADDR:
  else
    echo "+ ssh root@$IPADDR wget '$param' "
    ssh root@$IPADDR wget --progress=bar:force:noscroll "$param"
  fi
  sleep 2
  if [ -z "$PARAM_BASENAME" ]; then
    PARAM_BASENAME="$(basename $param)"
  else
    PARAM_BASENAME="$PARAM_BASENAME $(basename $param)"
  fi
done

echo "$PARAM_BASENAME"

tmpscriptfile=./tmpscript$$.sh
scriptfile=$tmpscriptfile
scriptfolder=
function LOAD_SCRIPT {
  if [ -z "$1" ]; then
     # inline style usage with <<EOF or such ...
     echo  > $scriptfile "export PARAM='$PARAM'"
     echo >> $scriptfile "export PARAM_BASENAME='$PARAM_BASENAME'"
     echo >> $scriptfile "ls -l \$PARAM_BASENAME"
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
        ./destroy_machine.sh $NAME

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


# not used normally, but fulfill what the usage says:
echo export IPADDR=$IPADDR NAME=$NAME
