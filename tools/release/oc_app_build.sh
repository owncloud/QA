#! /bin/sh
# oc_app_build.sh - use a gitea checkout to build & sign an app
#
# (C) 2021 jw@owncloud.com, distribute under GPLv2
#
# References:
#	- https://github.com/cli/cli/releases/
#	- https://github.com/owncloud/QA/blob/master/Server

appname=$1
appvers=$2

# where to create the issue:
appsigning_dir=$HOME/src/gitea/appsigning/apps/
appdest_dir=$HOME/Downloads/apps
build_sh=buildApp
test -n "$APPSIGNING_DIR" && appsigning_dir=$APPSIGNING_DIR
test -n "$APPDEST_DIR" && appdest_dir=$APPDEST_DIR

if [ ! -f "$appsigning_dir/$build_sh" ]; then
  echo "ERROR: could not find a checkout of the appsigning script $build_sh in"
  echo "       $appsigning_dir"
  echo "       Use environment variable APPSIGNING_DIR to override"
  exit 0
fi

if [ -z "$2" ]; then
  echo "Usage:"
  echo "	oc_release app:build ."
  echo "	env OC_REL_VESION_IS_BRANCH=1 oc_release app:build . BRANCH"
  echo "	$0 APPNAME APPVERSION"
  echo ""
  echo "build an app, using $appsigning_dir/$build_sh "
  exit 1
fi

# if we don't have a numeric version, with or without leading v, then we can imply OC_REL_VERSION_IS_BRANCH
test -z "$(echo "$appvers" | sed -n -e 's@^v\?[0-9]@VERSION@p')" && OC_REL_VERSION_IS_BRANCH=1

if [ -n "$OC_REL_VERSION_IS_BRANCH" ]; then
  tagname="$appvers"
else
  appvers=$(echo "$appvers" | sed -e 's/^v//')	# always without leading v
  tagname="v$appvers"				# always with leading v
fi

set -x
cd $appsigning_dir
bash ./$build_sh $appname $tagname
set +x
title=$(echo $appvers | sed -e 's/-rc\./+RC+/')

test -n "$OC_REL_VESION_IS_BRANCH" && exit 0	# don't recommend upload when built from a branch.

echo "Now create a new release at"
echo "	https://github.com/owncloud/$appname/releases/new?tag=$tagname&title=$title"
echo ""
echo "Copy / paste the latet changlog entries from the above output..."
echo "and upload $appdest_dir/$appname-$appvers.tar.gz"
echo ""
