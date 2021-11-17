#! /bin/bash
#
# Configure one of our well-known wopi servers.
# Should work with 
# - mso.owncloud.works
# - collabora.owncloud-demo.com(?)
# But cannot directly work with our office365 server at https://ffc-onenote.officeapps.live.com/hosting/discovery
# - this needs the upcoming proxy.
wopi_key="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"
test -z "$oc10_fqdn" && oc10_fqdn="wopi-$(date +%Y%m%d).jw-qa.owncloud.works"
occ app:enable wopi	# CAUTION: triggers license grace period!
occ config:system:set wopi.token.key --value "$wopi_key"
occ config:system:set wopi.office-online.server --value 'https://mso.owncloud.works'
# occ config:system:set wopi.office-online.server --value 'https://collabora.owncloud-demo.com'
echo >> ~/POSTINIT.msg "WOPI:  - To check the office-server, run:  occ c:s:get wopi.office-online.server"
echo >> ~/POSTINIT.msg "WOPI:  - To try with collabora, run: occ c:s:set wopi.office-online.server --value 'https://collabora.owncloud-demo.com'"

