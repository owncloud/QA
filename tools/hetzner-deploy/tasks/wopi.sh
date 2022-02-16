#! /bin/bash
#
# Configure one of our well-known wopi servers.
# Should work with 
# - mso.owncloud.works(?no more, cert expired 20220110, jw)
# - collabora.owncloud-demo.com(?)
# - deepdiver's proxy setup
# - only-office via https://api.onlyoffice.com/editors/wopi
#

. ./env.sh	# requires oc10_fqdn

wopi_key="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"
test -z "$oc10_fqdn" && oc10_fqdn="wopi-$(date +%Y%m%d).jw-qa.owncloud.works"
occ app:enable wopi	# CAUTION: triggers license grace period!
occ config:system:set wopi.token.key            --value "$wopi_key"
# occ config:system:set debug      --type boolean --value true
# occ config:system:set wopi.office-online.server --value 'https://ffc-onenote.officeapps.live.com/hosting/discovery'
# occ config:system:set wopi.proxy.url            --value 'https://office.owncloud.works/wopi/files/'
# occ config:system:set http.cookie.samesite      --value 'Lax'	# needed for the proxy

occ config:system:set wopi.office-online.server --value 'https://mso.owncloud.works'	# Maintainer Dmitry

# occ config:system:set wopi.office-online.server --value 'https://collabora.owncloud-demo.com'
echo >> ~/POSTINIT.msg "WOPI:  - To check the office-server, run:  occ c:s:get wopi.office-online.server"
echo >> ~/POSTINIT.msg "WOPI:  - For collabora, try: occ c:s:del wopi.proxy.url; occ c:s:set wopi.office-online.server --value 'https://collabora.owncloud-demo.com'"
echo >> ~/POSTINIT.msg "WOPI:  - For office265, try: cp ~/wopi-office365.config.php ~/config/"

cat << EOF >> ~/wopi-office365.config.php
<?php
\$CONFIG = [
	'debug' => true,
	'wopi.token.key' => '$wopi_key',
	'wopi.office-online.server' => 'https://ffc-onenote.officeapps.live.com/hosting/discovery',
	'wopi.proxy.url' => 'https://office.owncloud.works/wopi/files/',
	'http.cookie.samesite' => 'Lax',
];
EOF
