#!/bin/bash
#
# 2020-10-26, jw@owncloud.com
#
# https://doc.owncloud.com/server/developer_manual/testing/ui-testing.html
# See also: https://github.com/owncloud/files_texteditor/issues/345#issuecomment-834498939

echo "Estimated setup time: 2 minutes ..."

d_name=marketplace-staging-proxy-$(date +%Y%m%d)

function title() { wmctrl -r :ACTIVE: -N "$@"; }
title "$d_name - hetzner"

source lib/make_machine.sh -u $d_name -p screen,telnet,selinux-utils "$@"

# No code here. Just instructions.

INIT_SCRIPT << EOF
  # allow ports to bind to all interfaces. Without 'GatewayPorts' we can only bind to localhost
  echo >> /etc/ssh/sshd_config GatewayPorts yes
  systemctl restart sshd

  ## we want to allow sshd to bind to port 443 and 80.
  ## (ports 440, 441, 442, 446, 447 all show up fine in lsof, but not 443, 444, or 445)
  # setcap cap_net_bind_service=+eip /usr/sbin/sshd
  # setenforce 0
  ## Solution: it only seems it does not work when using 'lsof | grep :443'
  ## This is because lsof does not say :443, it says :https, gna gna...

  cat <<EOM > ~/POSTINIT.msg
---------------------------------------------
From a laptop within ownCloud VPN run:
  ssh -v -R 443:marketplace.staging.owncloud.services:443 -N -o ExitOnForwardFailure=yes root@$IPADDR

With this running, we can connect machines outside of the VPN to the staging marketplace:
  echo >> /etc/hosts $IPADDR marketplace.staging.owncloud.services
  echo >> /etc/hosts $IPADDR marketplace-storage.staging.owncloud.services
  occ config:system:set appstoreurl --value https://marketplace.staging.owncloud.services
  occ config:app:set market key --value "34xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx97"

---------------------------------------------
EOM
EOF
