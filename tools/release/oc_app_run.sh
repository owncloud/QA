#! /bin/sh
# oc_app_run.sh - pull the latest version of an owncloud app from github and suggest a docker run command.
#
# (C) 2021 jw@owncloud.com, distribute under GPLv2
#
# 2021-01-15, v1.0 jw -- initial draught
#
# references: https://docs.github.com/en/rest/overview/endpoints-available-for-github-apps

orga=owncloud
test -n "$GITHUB_ORGA" && orga=$GITHUB_ORGA

curl=curl
test -n "$CURL_OPTS" && curl="curl $CURL_OPTS"

appsdir=mnt_oc/apps
test -n "$OC_APPS_DIR" && appsdir=$OC_APPS_DIR

appname=$1

if [ -z "$1" ]; then
  echo "Usage:"
  echo "	$0 APPNAME"
  echo ""
  echo "Retrieves the latest asset from github.com/$orga/APPNAME/releases and suggest docker run commands"
  exit 1
fi

releases_api_url="https://api.github.com/repos/$orga/$appname/releases"
# v1.0.4RC1
tagname=$(curl -s "$releases_api_url" | jq '.[0].tag_name' -r 2>/dev/null)
if [ -z "$tagname" -o "$tagname" = "null" ]; then
  echo "ERROR: no release: https://github.com/$orga/$appname/releases"
  echo "       Is this the correct name: '$appname' ?"
  exit 1
fi

mkdir -p $appsdir || exit 1

version=$(echo $tagname | sed -e 's/v//')
assetname="$appname-$version.tar.gz"
browser_download_url="https://github.com/$orga/$appname/releases/download/$tagname/$assetname"
echo "+ wget $browser_download_url"
wget -q $browser_download_url -O $appsdir/$assetname

if [ ! -s "$appsdir/$assetname" ]; then
  echo "... oops. Is the asset not named '$assetname'? searching ..."
  assetname="$(curl -s "$releases_api_url" | jq '.[0].assets[0].name')"
  if [ "$assetname" = "null" ]; then
    echo "ERROR: No assets for tag=$tagname ... you can fetch a generated archive with"
    echo "  wget https://github.com/$orga/$appname/archive/$tagname.tar.gz -O $appname-$tagname.tar.gz"
    exit 1
  fi
  browser_download_url="https://github.com/$orga/$appname/releases/download/$tagname/$assetname"
  echo "+ wget $browser_download_url"
  wget -q $browser_download_url -O "$appsdir/$assetname"
  if [ ! -s "$appsdir/$assetname" ]; then
    echo "ERROR: download to $appsdir/$appsdir failed."
    exit 1
  fi
fi

cd $appsdir || exit 1
if [ $orga = "owncloud" -a $appname != "client" -a $appname != "core" ]; then
  # expect an owncloud app, unpack it.
  echo "+ tar xf $appsdir/$assetname"
  tar xf "$assetname"
  rm $assetname		# we no longer need the tar archive

  info_xml=$appname*/appinfo/info.xml
  test -f $info_xml && echo " ... checking info.xml:"
  vers_name=$(grep -e '</version>\|</namespace>' $info_xml 2>/dev/null | sort | sed -e 's/<[^>]*>//g')
  if [ -z "$vers_name" ]; then
    echo "WARNING: no version or namespace in info.xml?"
    echo "         ... not an owncloud app?"
    echo "+ ls -la $appsdir"
    ls -la
  else
    echo ""
    echo "$vers_name"
    echo "Checked out into $appsdir/"
    cd ..
    chmod -R 777 . 2>/dev/null	# may print many errors when adding a second app while owncloud is running...
    dockermount=$(pwd -P)

    if [ -n "$(echo $dockermount | grep :)" ]; then
      echo "WARNING: your current working directory contains a ':' character. That does not work with docker -v"
    else
      echo ""
      echo "To run $assetname with an owncloud server in docker, try (within screen)"
      echo ""
      echo "  docker run --rm -ti -v $dockermount:/mnt/data -p 883:8080 owncloud/server:latest"
      echo "  docker exec -ti \$(docker ps -q | head -1) occ app:enable $appname"
      echo "  firefox http://localhost:883"
      echo ""
    fi
  fi
fi
