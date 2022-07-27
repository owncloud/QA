#!/bin/bash
#
# 2020-10-26, jw@owncloud.com
#
# https://doc.owncloud.com/server/developer_manual/testing/ui-testing.html
# See also: https://github.com/owncloud/files_texteditor/issues/345#issuecomment-834498939
#
# This works for a while, then suddenly fails with:
# - No marketplace connection: Client error response [url] https://marketplace.staging.owncloud.services/api/v1/platform/10.8.0/apps.json [status code] 403 [reason phrase] Forbidden
#

echo "Estimated setup time: 2 minutes ..."

d_name=marketplace-staging-proxy-$(date +%Y%m%d)

function title() { wmctrl -r :ACTIVE: -N "$@"; }
title "$d_name - hetzner"

source lib/make_machine.sh -u $d_name -p screen,telnet,selinux-utils "$@"

# Almost no code here. Mostly instructions.

INIT_SCRIPT << EOF
  ## Allow ports to bind to all interfaces. Without 'GatewayPorts' we can only bind to localhost
  echo >> /etc/ssh/sshd_config GatewayPorts yes
  systemctl restart sshd

  ## Not needed: disable selinux
  # setenforce 0

  cat << EOM > ~/POSTINIT.msg
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
