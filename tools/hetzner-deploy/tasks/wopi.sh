#! /bin/bash
#
# Configure one of our well-known wopi servers.
# Should work with 
# - mso.owncloud.works			- maintained by Dmitry
# - collabora.owncloud-demo.com(?)	- FIXME: this hangs with "message":"Undefined offset: 0 at \/var\/www\/owncloud\/apps\/wopi\/lib\/Service\/DiscoveryService.php#93"
# - deepdiver's proxy setup
#   ~/wopi-officeapps.config.php	- FIXME: word: "Sorry, we ran into a problem", excel: "The workbook cannot be openend."
# - only-office 			- TODO. See https://api.onlyoffice.com/editors/wopi
#
# Allow list for a wopi proxy is mentioned in https://confluence.owncloud.com/display/~tbaader/Allow+list+for+oC+WOPI+Proxy
#  - This also mentions wopi.owncloud.online as a 'maybe' 	- FIXME: this leads to internal server error.
#

. ./env.sh	# requires oc10_fqdn

wopi_key="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"
test -z "$oc10_fqdn" && oc10_fqdn="wopi-$(date +%Y%m%d).jw-qa.owncloud.works"
occ app:enable wopi	# CAUTION: triggers license grace period!
occ config:system:set wopi.token.key            --value "$wopi_key"
# occ config:system:set debug      --type boolean --value true

occ config:system:set wopi.office-online.server --value 'https://mso.owncloud.works'	# Maintainer Dmitry

# occ config:system:set wopi.office-online.server --value 'https://collabora.owncloud-demo.com'
echo >> ~/POSTINIT.msg "WOPI:  - To check the office-server, run:  occ c:s:get wopi.office-online.server"
echo >> ~/POSTINIT.msg "WOPI:  - For collabora, try: occ c:s:del wopi.proxy.url; occ c:s:set wopi.office-online.server --value 'https://collabora.owncloud-demo.com'"
echo >> ~/POSTINIT.msg "WOPI:  - For office365, try: cp ~/wopi-office365.config.php o/config/"

cat << EOF >> ~/wopi-office365.config.php
<?php
\$CONFIG = [
	'debug' => true,
	'wopi.token.key' => '$wopi_key',
	'wopi.office-online.server' => 'https://ffc-onenote.officeapps.live.com/hosting/discovery',
	'wopi.proxy.url' => 'https://office.owncloud.works/wopi/files/',
	'http.cookie.samesite' => 'Lax',	# needed for the proxy
];
EOF
