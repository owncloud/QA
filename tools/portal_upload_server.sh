#! /bin/bash

dl=https://download.owncloud.com/server/stable/
suf="tar.bz2 tar.bz2.asc tar.bz2.sha256 tar.bz2.md5 zip zip.asc zip.sha256 zip.md5"

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

echo $tmpdir
