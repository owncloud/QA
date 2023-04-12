#!/bin/bash
#
# 2023-04-15, jw@owncloud.com
#
#
echo "Estimated setup time: 2 minutes ..."

d_name=ubuntu-desktop-$(date +%Y%m%d)

function title() { wmctrl -r :ACTIVE: -N "$@"; }
title "$d_name - hetzner"

location=fsn1	# nbg1 hel1
export HCLOUD_SERVER_IMAGE=ubuntu-22.04
source lib/make_machine.sh -u $d_name -t cx21 -L $location -p software-properties-common,x11vnc,screen,telnet,selinux-utils "$@"

# Almost no code here. Mostly instructions.
scp ubuntu-desktop.sh root@$IPADDR:

INIT_SCRIPT << EOF
  export IPADDR=$IPADDR
  bash ./ubuntu-desktop.sh

  cat << EOM > ~/POSTINIT.msg
---------------------------------------------
Connect with x2goclient
	Host: $IPADDR
	User: testy
with same ssh-key as user root
---------------------------------------------
EOM
EOF
