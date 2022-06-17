#!/bin/sh
#
# Load an app tar ball into all three portals.
# I am tired of asking why we maintain three portals. I just script that madness away.
#
# 2022-01-01, jw@owncloud.com

mydir=$(dirname $0)
occopy="$mydir/occopy"
test -x "$occopy" || occopy="$mydir/occopy.sh"

if [ -z "$1" ]; then
  echo "Usage: $0 ~/Downloads/apps/web-5.0.0.tar.gz"
  echo ""
  exit 0
fi
appfilename=$(basename "$1")

is_enterprise_app=false
tar xf "$1" --wildcards '*/appinfo/info.xml' -O | grep -q '<licence>OCL' && is_enterprise_app=true

if $is_enterprise_app; then

  echo "This is an enterprise app ..."
  dest="'Enterprise Apps/$appfilename'"
  env OC_USER=jw OC_PASS=$OC10_UPLOADER_TOKEN_PORTAL "$occopy" 'https://portal.owncloud.com/remote.php/webdav/Portal Data/All Account Data/ownCloud Enterprise Resources Data/Server' put $1 $dest
  env OC_USER=btr-uploader OC_PASS=$OC10_UPLOADER_TOKEN_CUSTOMER "$occopy" 'https://customer.owncloud.com/owncloud/remote.php/webdav/ownCloud-Enterprise/ownCloud-10' put $1 $dest

else

  echo "Not an enterprise app ..."
  dest="'Non-Enterprise Apps/$appfilename'"
  env OC_USER=jw OC_PASS=$OC10_UPLOADER_TOKEN_PORTAL "$occopy" 'https://portal.owncloud.com/remote.php/webdav/Portal Data/All Account Data/ownCloud Enterprise Resources Data/Server' put $1 $dest
  env OC_USER=btr-uploader OC_PASS=$OC10_UPLOADER_TOKEN_CUSTOMER "$occopy" 'https://customer.owncloud.com/owncloud/remote.php/webdav/ownCloud-Enterprise/ownCloud-10' put $1 $dest
  env OC_USER=btr-uploader OC_PASS=$OC10_UPLOADER_TOKEN_CUSTOMER "$occopy" 'https://customer.owncloud.com/owncloud/remote.php/webdav/ownCloud-Server/ownCloud-10.0' put $1 $dest

fi

