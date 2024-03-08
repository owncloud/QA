#! /bin/bash
#
# make_machine.sh -- create a hetzner machine and return its ip address
#
# Study:
#  https://github.com/hetznercloud/cli
#
# jw, 2020-05-18	v0.1	first stab to implement with the hetznercloud/cli
version=0.2

exec 3>&1 1>&2		# all output goes to stderr.
export LC_ALL=C		# prevent tr and sed to explode on mac.
set -e

hcloud_url=https://github.com/hetznercloud/cli/releases/latest/download/hcloud-linux-amd64.tar.gz
test -z "$HCLOUD_TOKEN" && export HCLOUD_TOKEN=$TF_VAR_hcloud_token
if [ -z "$HCLOUD_TOKEN" ]; then
  echo "Environment variable HCLOUD_TOKEN not set."
  exit 1
fi

test -z "$HCLOUD_SSHKEY_NAMES" && export HCLOUD_SSHKEY_NAMES="$TF_SSHKEY_NAMES"
ssh_key_names="$HCLOUD_SSHKEY_NAMES"
ssh_keys="$HCLOUD_SSHKEY"
extra_pkg=""
server_image="$HCLOUD_SERVER_IMAGE"
test -z "$server_image" && server_image="ubuntu-20.04"
datacenter="fsn1-dc14"
server_type="cx11"
mk_unique=false
do_login=false
used_for="server_testing"
NAME=
PARAM=

# getopts cannot do long names and needs more code.
while [ "$#" -gt 0 ]; do
  case "$1" in
    -s|--ssh-key-names) ssh_key_names="$2"; shift ;;
    -d|--datacenter) datacenter="$2"; shift ;;
    -p|--packages) extra_pkg="$2"; shift ;;
    -i|--image) server_image="$2"; shift ;;
    -t|--type) server_type="$2"; shift ;;
    -u|--unique) mk_unique=true; NAME="$2"; shift ;;
    -n|--name) NAME="$2"; shift ;;
    -l|--login) do_login=true ;;
    -f|--used-for) used_for="$2"; shift ;;
    -h|--help) NAME=-h ;;
    -*) echo "Unknown option '$1'. Try --help"; exit 1 ;;
    *) test -z "$PARAM" && PARAM="$1" || PARAM="$PARAM $1" ;;
  esac
  shift
done

test -z "$HCLOUD_USER" && HCLOUD_USER=$(echo "$ssh_key_names" | sed -e 's/[\s,@].*$//')
test -z "$HCLOUD_USER" && HCLOUD_USER=$USER
export HCLOUD_USER

if [ "$NAME" = '-h' ]; then
  cat <<EOF
  $0 V$version

  Usage:
    export HCLOUD_SSHKEY_NAMES="jw@owncloud.com"
    export HCLOUD_TOKEN=123..........xyz
    $0 [OPTIONS] -n MACHINE_NAME
    eval \$(bash ./make_machine.sh ...)
    source ./make_machine.sh ...

  Where options are:

    -i|--image ...          server image. Default: $server_image
    -t|--type ...           server type. Default: $server_type
    -d|--datacenter ...	    server datacenter. Default: $datacenter
    -s|--ssh-key-names ...  comma-separated names of uploaded public keys
    -p|--packages ...       comma-separated list of linux packages to install
    -u|--unique NAME        make name unique by prepending user and appending a suffix
    -n|--name NAME          specify a name. Default: derive from image
    -l|--login              ssh into the machine, when ready
    -f|--used-for           label with purpose of the machine. Default: $used_for

  HCLOUD_TOKEN is specific to a project at https://console.hetzner.cloud
  consult with the project owner to get a token.
  HCLOUD_SSHKEY_NAMES: comma-separated list of names of one or more.
  HCLOUD_SSHKEY: content of an ~/.ssh/id_XXX.pub file. This must not be an uploaded key.
  HCLOUD_USER is optional. Default: derived from the first element of \$HCLOUD_SSHKEY_NAMES or \$USER.

  The MACHINE_NAME should mention the user, and must be unique in the project.
  Use -u to assert that.
  Example: 'make_machine.sh -u eostest' might result in a machine named 'jw-eostest-3z4ya'

  Return values:
    "export IPADDR=... NAME=... PARAM='...'" is printed on stdout describing the deploy target.
EOF
  test ! -t 3 && echo 1>&3 "export IPADDR= NAME=-h PARAM="
  exit 1
fi

# convert comma-separated to whitespace separated:
extra_pkg=$(echo $extra_pkg | tr , ' ')

# convert to comma-separated to comma-separated quoted strings
ssh_key_names=$(echo '"'$ssh_key_names'"' | sed -e 's/,/","/')
test "$ssh_key_names" = '""' && ssh_key_names=''
ssh_keys=$(echo '"'$ssh_keys'"' | sed -e 's/,/","/')
test "$ssh_keys" = '""' && ssh_keys=''

if [ -z "$ssh_key_names$ssh_keys" ]; then
  echo "ERROR: No ssh-key specified. The machine cannot be accessed without one."
  echo "ERROR: Please set environment variable HCLOUD_SSHKEY_NAMES or HCLOUD_SSHKEY."
  exit 1
fi

if [ -z "$NAME" ]; then
  NAME=$server_image
  mk_unique=true
  echo "No MACHINE_NAME specified, generating one: '$NAME'"
fi

NAME="$(echo $NAME | tr ._ -)"	# avoid _ and . in name. Always
NAME_BASE=$NAME
test $mk_unique && NAME="$HCLOUD_USER-$NAME-$(tr -dc 'a-z0-9' < /dev/urandom | head -c 3)"

if [ "$NAME" != "$NAME_BASE" ]; then
  echo "MACHINE_NAME '$NAME_BASE' expanded to '$NAME'"
fi

cd $(dirname $0)

if [ ! -e "bin/hcloud" ]; then
  mkdir -p bin
  wget -q $hcloud_url -O bin/hcloud.tar.gz
  (cd bin; tar xf hcloud.tar.gz)
  rm bin/hcloud.tar.gz
  chmod a+x bin/hcloud
fi

ssh_key_mult="$(echo "$HCLOUD_SSHKEY_NAMES" | sed -e 's/,/ --ssh-key /g')"

set -x
bin/hcloud server create --name "$NAME" --image "$server_image" --type "$server_type" --label "origin=hcloud_cli_make_machine_sh" --label "owner=$HCLOUD_USER" --label "used_for=$used_for" --ssh-key $ssh_key_mult
IPADDR="$(bin/hcloud server ip "$NAME")"
test -z "$IPADDR" && exit 1

ssh-keygen -f ~/.ssh/known_hosts -R $IPADDR	# needed to make life easier later.
# StrictHostKeyChecking=no automatically adds new host keys and accepts changed host keys.
# maybe 'ssh -o UserKnownHostsFile=/dev/null' helps?

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 last; do
  to=5
  test "$i" -gt 10 && to=15
  sleep $to
  echo -n .
  timeout $to ssh -o ConnectTimeout=5 -o CheckHostIP=no -o StrictHostKeyChecking=no -o PasswordAuthentication=no root@$IPADDR uptime && break
  if [ $i = last ]; then
    echo "Error: cannot ssh into machine at $IPADDR -- tried multiple times."
    set -x
    hcloud server describe -o json "$NAME" | jq .status
    exit 1
  fi
done

noclutter() { grep -E -v "^(Preparing to|Get:|Selecting previously unselected|Setting up|Creating config|Created symlink|Processing triggers|)"; }

if [ -n "$extra_pkg" ]; then
  case "$server_image" in
    ubuntu*|debian*)
      ssh root@$IPADDR sh -x -s <<END | noclutter
	export LC_ALL=C
	export DEBIAN_FRONTEND=noninteractive
        apt-get update
        apt-get upgrade -y
        apt-get install -y $extra_pkg
END
	;;
    fedora*|centos*)
      ssh root@$IPADDR sh -x -s <<END
	export LC_ALL=C
        yum install -y $extra_pkg
END
	;;
    *) echo "platform installer not implemented for $server_image. Skipping package installation of $extra_pkg"
        ;;
  esac
fi

rm -f $NAME.plan	# keeping $NAME.tftate should be enough...

if $do_login; then
  echo "+ ssh root@$IPADDR"
  ssh root@$IPADDR
  cat <<END
--------------------------------------------------
When no longer needed, please destroy the machine with e.g.

  ./destroy_machine.sh $NAME
--------------------------------------------------
END
else
  cat <<END
--------------------------------------------------
Machine created. Try

    ssh root@$IPADDR

To destroy the machine later, you can use

    ./destroy_machine.sh $NAME
--------------------------------------------------
END
fi
sleep 2

echo 1>&3 "export IPADDR=$IPADDR NAME=$NAME PARAM='$PARAM'"
exit 0
