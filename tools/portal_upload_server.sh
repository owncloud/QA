#! /bin/bash

dl=https://download.owncloud.com/server/stable/
suf="tar.bz2.asc tar.bz2.sha256 tar.bz2.md5 tar.bz2 zip.asc zip.sha256 zip.md5 zip"

if [ -z "$1" ]; then
cat <<EOF
portal_upload_server.sh Usage:

  $0 10.13.3 complete-20231121
  
These two arguments will be used to find packages
with suffixes $suff
on server $dl

The first argument will be used to also find a
third-party-licenses-....zip file
  
EOF
  exit 1
fi


tmpdir=/tmp/portal_up_$$
mkdir -p $tmpdir
cd $tmpdir
for v in $*; do
  for s in $suf; do
    wget -nv $dl/owncloud-$v.$s
  done
done
wget -nv $dl/third-party-licenses-$1.zip

cat <<EOF
Files downloaded to $tmpdir

Do this
 1) Login as ldap user
 2) Create a new subfolder for the ownCloud version e.g. oC-10.13.3
 3) Upload all 17 files.

for each of the following URLs:
* https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Server%2FownCloud-10.0
* https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Enterprise%2FownCloud-10
* https://portal.owncloud.com/apps/files/?dir=/Portal%20Data/All%20Account%20Data/ownCloud%20Enterprise%20Resources%20Data/Server&fileid=5661

EOF
