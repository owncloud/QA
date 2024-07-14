#! /bin/sh
# Reference: https://github.com/owncloud/files_external_dropbox#configuring-oauth2
#
# Lots of manual steps to be done on the dropbox side:

source ./env.sh		# needed for oc10_fqdn

occ app:enable files_external
occ app:enable files_external_dropbox

cat << EOF | sed -e "s/^/external_dropbox: /g" >>  ~/POSTINIT.msg
firefox https://www.dropbox.com/developers	(login pin is probably sent into spam folder)
 -> [Create apps ->]
(or, if you end up with a files listing,
	Account -> Settings > Apps >
	Apps you connect will show up here. Get started on App Center.
	-> https://www.dropbox.com/apps
	 -> [manage] -> [build an app]
)
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
 Development teams	1/0 ...
 Development users	-> Enable additional users	??maybe not needed.??
			1/500

 OAuth2
	Redirect URI:	https://$oc10_fqdn/index.php/settings/admin?sectionid=storage
		-> Add
	Redirect URI:	https://$oc10_fqdn/settings/admin?sectionid=storage
		-> Add
 Switch from 'Settings' to 'Permissions' tab
        Files and folder
		-> [x]
		check all checkboxes in that section.
		-> Submit

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

