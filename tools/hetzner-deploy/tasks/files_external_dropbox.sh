#! /bin/sh
# Reference: https://github.com/owncloud/files_external_dropbox#configuring-oauth2
#
# Lots of manual steps to be done on the dropbox side:

source ./env.sh		# needed for oc10_fqdn

occ app:enable files_external
occ app:enable files_external_dropbox

cat <<EOF 
firefox https://www.dropbox.com/developers
 -> [App console] -> [Create app]
 1) Choose an API
  (*) Scoped access New
 2) Choose the type of access you need
  (*) App folder
 3) Name your app
  [oc-qa]
 [x] I agree ...
	-> [Create app]
 Copy paste
	App key:	t7jq77oebgdmey8
	App secret: 	[show] .....
 OAuth2
	Redirect URI:	https://$oc10_fqdn/index.php/settings/admin?sectionid=storage
		-> Add

firefox https://$oc10_fqdn/index.php/settings/admin?sectionid=storage
 -> Add Storage -> Dropbox V2
  -> paste App key    into [Client ID]
  -> paste App secret into [Client secret]
   -> grant Access
	This app only has a small number of users and may not be the app you were intending to link.
	-> Continue
	oc-qa would like to: View basic information about your Dropbox account ...
	-> Allow
 -> re-login at owncloud, and check that the new Dropbox storage is green.

EOF

