#!/bin/bash
#
# 2021-02-03, jw@owncloud.com
# 2022-01-25, jw@owncloud.com, added marketplace download support
# 2023-04-05, jw@owncloud.com, testing prerequisites from https://doc.owncloud.com/server/10.12/developer_manual/testing/ui-testing.html
#
# Special apps supported:
# - files_antivirus with a local clamav
# - files_antivirus with dockerized clamav-c-icap
# - files_antivirus with (if tar and key are present) Kaspersky Scan Engine
# - metrics, wopi, windows_network_drive
#
# support for github download:  owncloud/appname=vTAG	(private repos also supported!)
# - the download is resolved locally
# - using your GITHUB_USER and GITHUB_TOKEN (if needed)
# - and sent to the target system via scp.
#
# Support for installing ca-certs added, suffix *.crt

echo "Estimated setup time: 5 minutes ..."

vers=10.12.2
vers=10.13.0-beta.1

test -n "$OC_VERSION" && vers="$OC_VERSION"
test -n "$OC10_VERSION" && vers="$OC10_VERSION"
test "$vers" = "10.13.0-beta.1"                 && tar=https://download.owncloud.com/server/testing/owncloud-complete-20230811.tar.bz2
test "$vers" = "10.13.0-alpha.1"                && tar=https://download.owncloud.com/server/testing/owncloud-complete-20230727.tar.bz2
test "$vers" = "10.12.2"                        && tar=https://download.owncloud.com/server/stable/owncloud-complete-20230606.tar.bz2
test "$vers" = "10.12.2-rc.1"                   && tar=https://download.owncloud.com/server/testing/owncloud-complete-20230531.tar.bz2
test "$vers" = "10.12.1"  -o "$vers" = "10.12"  && tar=https://download.owncloud.com/server/stable/owncloud-complete-20230415.tar.bz2
test "$vers" = "10.12.1-rc.3"                   && tar=https://download.owncloud.com/server/testing/owncloud-complete-20230406-qa.tar.bz2
test "$vers" = "10.12.0"  -o "$vers" = "10.12"  && tar=https://download.owncloud.com/server/stable/owncloud-complete-20230313.tar.bz2
test "$vers" = "10.11.0"  -o "$vers" = "10.11"  && tar=https://download.owncloud.com/server/stable/owncloud-complete-20220919.tar.bz2
test "$vers" = "10.10.0"  -o "$vers" = "10.10"  && tar=https://download.owncloud.com/server/stable/owncloud-complete-20220518.tar.bz2
test "$vers" = "10.9.1"   -o "$vers" = "10.9"   && tar=https://download.owncloud.com/server/stable/owncloud-complete-20220112.tar.bz2
test "$vers" = "10.9.0"                         && tar=https://download.owncloud.com/server/stable/owncloud-complete-20211220.tar.bz2
test "$vers" = "10.8.0"   -o "$vers" = "10.8"   && tar=https://download.owncloud.com/server/stable/owncloud-complete-20210721.tar.bz2
test "$vers" = "10.7.0"   -o "$vers" = "10.7"   && tar=https://download.owncloud.com/server/stable/owncloud-complete-20210326.tar.bz2
test "$vers" = "10.6.0"   -o "$vers" = "10.6"   && tar=https://download.owncloud.com/server/stable/owncloud-complete-20201216.tar.bz2
test "$vers" = "10.5.0"   -o "$vers" = "10.5"   && tar=https://download.owncloud.com/server/stable/owncloud-complete-20200731.tar.bz2
test "$vers" = "10.4.1"   -o "$vers" = "10.4"   && tar=https://attic.owncloud.org/community/owncloud-10.4.1.tar.bz2
test "$vers" = "10.3.2"   -o "$vers" = "10.3"   && tar=https://attic.owncloud.org/community/owncloud-10.3.2.tar.bz2
test "$vers" = "10.2.1"   -o "$vers" = "10.2"   && tar=https://attic.owncloud.org/community/owncloud-10.2.1.tar.bz2
test "$vers" = "10.1.0"   -o "$vers" = "10.1"   && { echo "No tar known for version $vers - OC10_TAR_URL not set."; exit 1; }
test "$vers" = "10.0.0"   -o "$vers" = "10.0"   && { echo "No tar known for version $vers - OC10_TAR_URL not set."; exit 1; }
test "$vers" = "9.1.8"    -o "$vers" = "9.1"    && tar=https://attic.owncloud.org/community/owncloud-9.1.8.tar.bz2
test "$vers" = "9.0.9"    -o "$vers" = "9.0"    && tar=https://attic.owncloud.org/community/owncloud-9.0.9.tar.bz2
test "$vers" = "8.2.11"   -o "$vers" = "8.2"    && tar=https://attic.owncloud.org/community/owncloud-8.2.11.tar.bz2
## oc7 says, that when running php7.4, we should use oc82, but oc82 explodes already with php 7.3
test "$vers" = "8.1.12"   -o "$vers" = "8.1"    && tar=https://attic.owncloud.org/community/owncloud-8.1.12.tar.bz2
test "$vers" = "8.0.16"   -o "$vers" = "8.0"    && tar=https://attic.owncloud.org/community/owncloud-8.0.16.tar.bz2
test "$vers" = "7.0.15"   -o "$vers" = "7.0"    && tar=https://attic.owncloud.org/community/owncloud-7.0.15.tar.bz2
test "$vers" = "daily"	  -o "$vers" = "master" && tar=https://download.owncloud.org/community/daily/owncloud-daily-master.tar.bz2
test -n "$OC10_TAR_URL" &&  tar="$OC10_TAR_URL"

test -z "$OC10_DATABASE" && OC10_DATABASE=mysql		# 'mysql' or 'pgsql' or 'pgsql15' or 'sqlite'
test -z "$OC10_DATADIR" && OC10_DATADIR=data		# must exist. Relative to /var/www/owncloud, if relative.

case $vers in
  10.9.1 | 10.10 | 10.10.* )
    # Server 10.10 is incompatible with PHP 8.1, but we install php-7-4 from ondrej's ppa.
    # We switch the default to the new 'problematic' image, but we want to be able to manually override this.
    test -z "$HCLOUD_SERVER_IMAGE" && export HCLOUD_SERVER_IMAGE=ubuntu-22.04
    ;;
  10.3 | 10.3.* | 10.2 | 10.2.* | 10.1 | 10.1.* )
    export HCLOUD_SERVER_IMAGE=ubuntu-18.04
    ;;
  9* | 8* )
    # Server 8.1 is incompatible with PHP 7.1, debian-9 has PHP-7.0
    # Server 8.2 is incompatible with PHP 7.3, which is found on debian-10
    # Hetzner no longer offers debian-9, 2023-03-01, jw
    export HCLOUD_SERVER_IMAGE=debian-10
    echo "CAUTION: vers=$vers using $tar"
    echo "CAUTION: Trying this on Debian-9, untested..."
    sleep 5
    ;;
esac

# webroute=/owncloud	# what we document
webroute=/		# what users expect
admin_pass="admin$(date +%Y%m%d)"	# an unsecure default. To be overridden by env OC10_ADMIN_PASS
location=hel1		# hel1, fsn1, nbg1

if [ -z "$1" -o "$1" = "-" -o "$1" = "-h" ]; then
  echo "Usage examples:"
# echo "  $0 https://github.com/owncloud/files_antivirus/releases/download/v0.16.0RC1/files_antivirus-0.16.0RC1.tar.gz Kaspersky_ScanEngine-Linux-x86_64-2.0.0.1157-Release.tar.gz 575F7141.key"
  echo "  $0 customgroups"
  echo "  $0 owncloud/metrics=v0.6.1RC2"
  echo "  $0 ~/Download/richdocuments.tar.gz"
  echo "  $0 marketplace:onlyoffice"
  echo "  $0 marketplace:onlyoffice=7.1.3"
  echo "  $0 bundled:web"
  echo "  $0 --"
  echo ""
  echo "Local file names are copied into the machine."
  echo "File URLs are passed into the machine and downloaded there."
  echo "Names prefixed marketplace: (or m:) are looked up at marketplace.owncloud.com"
  echo "Other parameters that do not look like any of the above"
  echo "  should be names of github/owncloud projects."
  echo "  The latest release tar.gz is downloaded or a release asset matching a tag specified after '='."
  echo ""
  echo "To start with no extra apps and no extra files, use: $0 --"
  echo ""
  echo "Environment:"
  echo "   OC10_DNSNAME=oc1080rc1-DATE	set the FQDN to oc1070rc1-$(date +%Y%m%d).jw-qa.owncloud.works (Default: as needed by apps)"
  echo "   OC10_FQDN=t3.owncloud.works	set the FQDN. Overrides OC10_DNSNAME."
  echo "   OC10_VERSION=10.8.0-rc1	set the version label. Should match the download url. Default: $vers"
  echo "   OC10_TAR_URL=...	        define the download url. Default: $tar"
  echo "   OC10_DATABASE=pgsql:15	define the database type. Default: $OC10_DATABASE"
  echo "   OC10_DATADIR=nfs-soft-data	define the data folder. Default: $OC10_DATADIR"
  echo "   OC10_WEBROUTE=/owncloud	define a subdirectory for owncloud. May not work with wopi. Default: $webroute"
  echo "   OC10_WITH_INDEX_PHP=yes	skip index-php-less config."
  echo "   OC10_ADMIN_PASS='Passw0rd!'	define password for the owncoud addmin acocunt. Default: $admin_pass"
  echo "   HCLOUD_SERVER_IMAGE=ubuntu-18.04	to use an old php-7.2 base system."
  echo "   HCLOUD_SERVER_IMAGE=debian-10	to use an old php-7.3 base system."
  echo "   HCLOUD_MACHINE_TYPE=ccx11		to use a machine with dedicated CPUs."
  echo "   HCLOUD_LOCATION=nbg1		define the compute center location. hel1, fsn1, nbg1. Default: $location"
  exit 1
fi

test -n "$HCLOUD_LOCATION" && location="$HCLOUD_LOCATION"
test -n "$OC10_WEBROUTE" && webroute="$OC10_WEBROUTE"
test -n "$OC10_ADMIN_PASS" && admin_pass="$OC10_ADMIN_PASS"

# Prepend owncloud home, unless it starts with a /
echo "$OC10_DATADIR" | grep -q '^/' || OC10_DATADIR="/var/www/owncloud/$OC10_DATADIR"

tmpdir="/tmp/make_oc10_apps_dl_$$"
mkdir -p $tmpdir
test "$1" = "--" && shift
ARGV=()
for arg in "$@"; do
  case "$arg" in
    http://*)
      echo "App $arg is a URL..."
      ;;
    https://*)
      echo "App $arg is a URL ..."
      ;;
    bundled:* | builtin:* | b:* )
      arg="$(echo "$arg" | sed -e 's/^\w*:/b:/')"		# makemachine.sh ignores b:... arguments, and just passes them on into PARAM
      echo "$arg: App is bundled ..."
      ;;
    marketplace:* | m:* )
      arg="$(echo "$arg" | sed -e 's/^[^:]*://')"		# strip marketplace prefix
      echo "m:$arg: App lookup at marketplace ..."
      appname="$(echo "$arg" | sed -e 's/[:=].*$//')"		# strip version suffix, if given.
      test "$appname" != "$arg" && appvers="$(echo "$arg" | sed -e 's/.*[:=]//')" # only version suffix, if given.
      curl=curl
      if [ -z "$appvers" ]; then
        # find the latest release
	appvers="$($curl -s "https://marketplace.owncloud.com/ajax/apps/$appname" | jq '.releases[0].version' -r )"
        test -z "$appvers" -o "$appvers" = null && { echo "Could not find $appname at https://marketplace.owncloud.com"; exit 1; }
      fi
      asseturl="$($curl -s "https://marketplace.owncloud.com/ajax/apps/$appname/$appvers" | jq .url -r)"
      test -z "$asseturl" -o "$asseturl" = null && { echo "No asseturl for $appname $appvers at https://marketplace.owncloud.com"; exit 1; }
      assetname=$appname-$appvers.tar.gz
      echo "Found $assetname at marketplace: $asseturl"
      arg="$tmpdir/$assetname"
      $curl -L -H 'Accept: application/octet-stream' "$asseturl" > "$arg"
      ;;
    *)
      if [ -e "$arg" -o -n "$(echo "$arg" | sed -ne 's@^\.*/@LOCAL @p' -ne 's@^\w\w*://@URL @p')" ]; then

        if [ -n "$(echo "$arg" | sed -ne 's@^\w\w*://@URL @p')" ]; then
	  echo "Passing strange URL $arg as is..."
	elif [ -e "$arg" ]; then
          echo "Will scp local file $arg ..."
        else
          echo "ERROR: local file $arg not found."
	  exit 1
	fi

      else
	# Everything that is not a local file, and not a URL should be an app.
        echo "App lookup at github ..."
	appname="$(echo "$arg" | sed -e 's/[:=].*$//')"		# strip version suffix, if given.
	echo "$arg" | grep -q / || arg="owncloud/$arg"		# prepend owncloud/ orga, if no orga given.
	oc_app="$(echo "$arg" | sed -e 's/[:=].*$//')"		# strip version suffix, if given.
	tagname="v$(echo "$arg" | sed -e 's/.*[:=]//' -e 's/^v//')"	# construct a tag. should work with or without leading v.
	echo "Using https://github.com/$oc_app ..."
        curl=curl
        test -n "$GITHUB_USER" -a -n "$GITHUB_TOKEN" && curl="curl -u $GITHUB_USER:$GITHUB_TOKEN"
        releases_api_url="https://api.github.com/repos/$oc_app/releases"
        # oc_app and arg are equal, when no version number was specified. then we query github for the latest tag.
        test "$oc_app" = "$arg" && tagname=$($curl -s "$releases_api_url" | jq '.[0].tag_name' -r 2>/dev/null)
	# echo      $curl -s "$releases_api_url" \| jq '.[] | select(.tag_name == "'$tagname'"'
	rel_json="$($curl -s "$releases_api_url" | jq '.[] | select(.tag_name == "'"$tagname"'")')"
        if [ -z "$rel_json" -o "$rel_json" = "null" ]; then
          echo "ERROR: no release tag $tagname seen in: https://github.com/$oc_app/releases"
          echo "  Is $arg correct?"
          echo "  To specify a version, use APPNAME=vN.N.N"
          test "$curl" = curl && echo '  Or retry after setting environment variables GITHUB_USER and GITHUB_TOKEN'
          exit 0
        fi
	# There may be multiple assets, e.g. web app has md5sum.txt and other stuff first.
	# Rank the assets by
	# a) correctname or correctname-app, c) having the versionnumber.
	#
	assetnames="$(echo "$rel_json" | jq '.assets[].name' -r 2>/dev/null)"
	appversion="$(echo $tagname | tr -d v)"
	#set -x
        assetname=''
	test -z "$assetname" && assetname="$(echo "$assetnames" | grep -F "$appname-$appversion")"		# substring web-4.4.0
	test -z "$assetname" && assetname="$(echo "$assetnames" | grep -F "$appname-app-$appversion")"		# substring web-app-4.4.0
	test -z "$assetname" && assetname="$(echo "$assetnames" | grep -F "$appname" | grep -F "$appversion")"	# any combination of web and 4.4.0
	test -z "$assetname" && assetname="$(echo "$assetnames" | grep -F "$appname-app")"			# just substring web-app
	test -z "$assetname" && assetname="$(echo "$assetnames" | grep -F "$appname")"				# just substring web
	test -z "$assetname" && assetname="$(echo "$assetnames" | head -n 1)"					# fall back to the first
	assetname="$(echo "$assetname" | head -n 1)"								# assert only one match.
	set +x
	if [ -n "$assetname" ]; then
	  asseturl="$(echo "$rel_json" | jq '.assets[] | select(.name == "'$assetname'") | .url' -r 2>/dev/null)"	# get url from name
	  echo "... expanded to $asseturl -> $assetname (from tag $tagname)"
	else
	  echo "ERROR: no asset found with name $appname, trying href from the body..."
	  link=$(echo "$rel_json" | jq .body -r | grep $appname-$appversion)
	  assetname=$(echo $link | sed -e 's/.*\[//' -e 's/\].*//')
	  asseturl=$(echo $link | sed -e 's/.*(//' -e 's/).*//')
	  test -n "$link" && echo "Link found: $link"
	  sleep 10
	fi
	if [ -z "$assetname" ]; then
	  echo "ERROR: no asset found with name $appname, and nothing linked in the body ..."
	  exit 1;
	fi
	arg="$tmpdir/$assetname"
	$curl -L -H 'Accept: application/octet-stream' "$asseturl" > "$arg"
	sleep 3
      fi

      ;;
  esac
  ARGV+=($arg)
done

## Default to always have a DNS name. Uncomment the next line, to skip preparations for DNS.
for firstarg in ${ARGV[@]}; do case "$firstarg" in -*);; *) break;; esac; done
# firstarg is now the first non-option argument.
firstarg="-$(echo "$firstarg" | sed -e 's@.*/@@' -e 's@^\w*:@@' -e 's@\b\.tar\.gz\b@@' )"	# cut away any path prefix, and any tar.gz suffix
test "$firstarg" = "-" && firstarg=
# try to keep the name short. certbot explodes on long names
firstarg=$(echo "$firstarg" | sed -e 's/^\-windows_network_drive/-wnd/' -e 's/^\-ransomware_protection/-rwp/' -e 's/^\-user_/-/' -e 's/^\-files_/-/')
# make dns/docker friendly: lowercase all; remove .; _ to -; shorten -alpha, -beta to a,b in both oc10 and app version.
test -z "$OC10_DNSNAME" && OC10_DNSNAME="$(echo "oc$vers$firstarg" | tr -d .=+ | sed -e 's/-\?alpha/a/g' -e 's/-\?beta/b/g' -e 's/-\?rc/rc/g')-date"
OC10_DNSNAME="$(echo "$OC10_DNSNAME" | tr '[A-Z]_' '[a-z]-' | tr -d =+ | tr ._ -)"
h_name="$OC10_DNSNAME"
test -z "$h_name" && h_name=oc-$vers-date
d_name=$(echo $h_name  | sed -e "s/date/$(date +%Y%m%d)/i")

if [ -z "$HCLOUD_MACHINE_TYPE" ]; then
  machine_type=cx11
  # cx11: 20 GB
  # cx21: 40 GB
  # cpx21: 80 GB
  # ccx11: 80 GB, 2 CPUs dedicated.
  # cpx31: 160 GB
  echo "$*" | grep files_antivirus   && machine_type=cx21	# c-icap docker consumes 1.4GB -> https://github.com/owncloud/files_antivirus/issues/437
  echo "$*" | grep search_elastic    && machine_type=cx21	# elasticsearch server docker consumes 1.8GB
  echo "$*" | grep files_primary_s3  && machine_type=cpx31 # yarn tsc fails very often on a cx11.
  echo "$*" | grep files_external_s3 && machine_type=cx21	# yarn tsc fails very often on a cx11.
  echo "$*" | grep objectstore       && machine_type=cx21	# yarn tsc fails very often on a cx11.
fi

network=$HCLOUD_NETWORK_NAME
if [ -z "$HCLOUD_NETWORK_NAME" ]; then
  echo "$*" | grep user_ldap             && network=testlab	# ldap may want to use ad01.testlab.owncloud.works
  echo "$*" | grep windows_network_drive && network=testlab	# wnd may want to use wnd.testlab.owncloud.works
  echo "$*" | grep kerberos              && network=kerberos.jw	# ad01.ker lives there
fi

function title() { wmctrl -r :ACTIVE: -N "$@"; }
title "$d_name - hetzner"

mydir="$(dirname -- "$(readlink -f -- "$0")")"	# find related scripts, even if called through a symlink.
source $mydir/lib/make_machine.sh -L $location -t $machine_type -u $d_name -p git,screen,wget,apache2,ssl-cert,docker.io,jq "${ARGV[@]}"
scp $mydir/bin/* root@$IPADDR:/usr/local/bin

if [ -n "$network" ]; then
  if [ -z "$(which hcloud)" ]; then
    echo "ERROR: HCLOUD_NETWORK_NAME=$network but no hcloud binary found."
    echo " (press CTRL-C to abort or wait 5 sec to continue anyway)"
    sleep 5
  else
    echo "+ hcloud server attach-to-network -n $network $NAME"
    hcloud server attach-to-network -n "$network" "$NAME" || true # continue anyway...
  fi
fi

rm -rf $tmpdir

dbpass="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"

INIT_SCRIPT << EOF
#
# Deployed via https://github.com/owncloud/QA/blob/master/tools/hetzner-deploy/deploy_oc10_apps.sh
# (C) 2020, jw@owncloud.com
#
TASKd=\$HOME/tasks
# ls -la \$TASKd

## Prepare FQDN and env.sh as early as possible, so that cf_dns can run in parallel.
## FIXME: Can we run cf_dns before we pass control into the new machine?

test -n "$OC10_DNSNAME" &&  oc10_fqdn="$(echo "$OC10_DNSNAME" | sed -e "s/date/$(date +%Y%m%d)/i").jw-qa.owncloud.works"
if [ -n "$OC10_FQDN" ]; then
  oc10_fqdn="$OC10_FQDN"
  OC10_DNSNAME="$(echo "$OC10_FQDN" | cut -d. -f1)"	# take first name component
fi

# This unintended-upgrade script can block us for many minutes! Kill it.
:> /usr/bin/unattended-upgrade
systemctl disable unattended-upgrades.service
systemctl stop    unattended-upgrades.service


## aptQ silences most of the usless clutter from apt. This is what apt -q should do, but does not do.
# We use tr to "insert" a newline at [Y/n], so that prompts are visible
# We use stdbuf on tr, so that it is not linebuffered
# We use2 >&1, so that stderr is captured.
# At the end we use a test of PIPESTATUS, so that the return value is whatever apt returns.
aptQ() { echo "+ apt \$@"; apt "\$@" 2>&1 | stdbuf -o0 tr ] '\n' | grep -E -v "^(Preparing to|Get:|Selecting previously unselected|^WARNING: apt does not have|Creating config|Created symlink|Processing triggers|^Fetched |^Setting up |^Need to |^After this |^\s*\(Reading |^Reading |^Building|^\$|^0 upgraded, )"; test \${PIPESTATUS[0]} -eq 0; }
export DEBIAN_FRONTEND=noninteractive	# try prevent ssh install to block wit whiptail
export LC_ALL=C LANGUAGE=C
aptQ install -y certbot python3-certbot-apache python3-certbot-dns-cloudflare

export EMAIL_HOST=localhost
export TEST_SERVER_URL=https://\$oc10_fqdn
export TEST_SERVER_FED_URL=https://TODO-find-another-server-for-federation-testing.owncloud.works    # username=admin, password=$admin_pass ... works, but not mentioned in the docs.
export HCLOUD_MACHINE_TYPE=$machine_type
export HCLOUD_NETWORK_NAME=$network
export HCLOUD_SERVER_IMAGE=$HCLOUD_SERVER_IMAGE
export OC10_DATABASE=$OC10_DATABASE
export BROWSER=chrome

if [ "$network" = 'testlab-network' ]; then
 # we expect these machines in the network
 ping -c 1 -W 1 10.1.0.3 > /dev/null && echo >> /etc/hosts "10.1.0.3 ad01.testlab.owncloud.works"
 ping -c 1 -W 1 10.1.0.4 > /dev/null && echo >> /etc/hosts "10.1.0.4 wnd.testlab.owncloud.works"
fi
if [ "$network" = 'kerberos.jw-network' ]; then
 ping -c 1 -W 1 ad01.ker-int.jw-qa.owncloud.works > /dev/null && echo "ad01.ker-int.jw-qa.owncloud.works is reachable ..."
fi

env_sh_vars="HCLOUD_SERVER_IMAGE oc10_fqdn webroute HCLOUD_NETWORK_NAME HCLOUD_MACHINE_TYPE OC10_DATABASE TEST_SERVER_URL TEST_SERVER_FED_URL BROWSER"

# We almost always assign a DNS name.

# Attention: quoting hell ahead. INIT.bashrc should really be a file all by itself, instead of being embedded here.
echo > ~/env.sh "IPADDR=$IPADDR"
for i in \$env_sh_vars; do eval echo export "\$i=\'\\\$\$i\'"; done >> ~/env.sh
echo >> ~/env.sh "OC10_VERSION=$vers"
echo >> ~/env.sh "OC10_TAR_URL=$tar"
echo >> ~/env.sh "OC10_ADMIN_PASS=$admin_pass"
echo >> ~/env.sh "ARGV='${ARGV[@]}'"

test -e \$TASKd/env.sh || ln -s ~/env.sh \$TASKd/env.sh

# We need a 2.x composer (ubuntu only has 1.x), in case we want to run some unit or acceptance tests here.
wget https://getcomposer.org/installer -O composer-setup.php
php ./composer-setup.php
chmod a+x composer.phar
mv composer.phar /usr/local/bin/composer	# has prioity over /usr/bin/composer
## From https://doc.owncloud.com/server/10.12/developer_manual/testing/ui-testing.html
#docker pull selenium/standalone-chrome:3.141.59-oxygen
#docker pull selenium/standalone-chrome-debug:3.141.59-oxygen
#docker pull selenium/standalone-firefox
#docker pull selenium/standalone-firefox-debug
#docker pull inbucket/inbucket

if [ "\$OC10_DATABASE" = pgsql:15 ]; then
  # https://github.com/owncloud/enterprise/issues/5936#issuecomment-1676295161
  export OC10_DATABASE=pgsql
  curl -fSsL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor > /usr/share/keyrings/postgresql.gpg
  subrepo="\$(. /etc/os-release ; echo \$VERSION_CODENAME)-pgdg main"
  echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt/ \$subrepo" | tee /etc/apt/sources.list.d/postgresql.list
  apt purge postgres	# remove any postgresql-12 packages, otherwise both, 12 and 15 will start together.
  aptQ update
fi

# FROM
# * https://doc.owncloud.com/server/admin_manual/installation/ubuntu_18_04.html
# * https://doc.owncloud.com/server/next/admin_manual/installation/manual_installation/manual_installation_prerequisites.html
# * https://doc.owncloud.com/server/next/admin_manual/installation/manual_installation/server_prep_ubuntu_20.04.html#clean-ubuntu-20-04-installation
#####
case "\$(lsb_release -d -s)" in
  "Ubuntu 22"* | "Ubuntu 21.10" )
    # default is php8.1 - we need php7.4 - ondrej has it.
    aptQ update
    aptQ install -y software-properties-common
    echo "+ add-apt-repository ppa:ondrej/php"
    echo "+ add-apt-repository ppa:ondrej/apache2"
    LC_ALL=C.UTF-8 add-apt-repository --yes ppa:ondrej/php
    LC_ALL=C.UTF-8 add-apt-repository --yes ppa:ondrej/apache2
    aptQ update
    aptQ install -y libapache2-mod-php7.4 php7.4-imagick php7.4-common php7.4-curl php7.4-gd php7.4-imap php7.4-intl
    aptQ install -y php7.4-ldap php7.4-pgsql php7.4-json php7.4-mbstring php7.4-mysql php7.4-sqlite3 php7.4-ssh2
    aptQ install -y php7.4-xml php7.4-zip php7.4-apcu php7.4-redis php7.4-gmp
    aptQ install -y php7.4-bcmath php7.4-igbinary  # seen in https://github.com/owncloud/docs-server/pull/369/files
    aptQ install -y php-phpseclib || echo "php-phpseclib seen in https://github.com/owncloud/docs-server/pull/369/files failed to install, check https://phpseclib.com/docs/install"
    ;;
  *)
    aptQ install -y libapache2-mod-php php-imagick php-common php-curl php-gd php-imap php-intl
    aptQ install -y php-ldap php-pgsql php-json php-mbstring php-mysql php-sqlite3 php-ssh2
    aptQ install -y php-xml php-zip php-apcu php-redis php-gmp
    ;;
esac

php --version
if [ -n "\$(php --version | grep 'PHP 8')" ]; then
  echo ""
  echo "ERROR: ownCloud does not run on PHP 8"
  echo "Check if '\$(lsb_release -d -s)' is covered in $0"
  echo ""
  exit 1
fi

aptQ install -y ssh apache2 mariadb-server openssl redis-server wget bzip2 zip rsync curl jq inetutils-ping
aptQ install -y smbclient coreutils ldap-utils postgresql libhttp-dav-perl

## external FTP, FTPS storage
aptQ install -y pure-ftpd  # not used. We use the local ssh-server
aptQ install -y sshfs 	   # for /mnt/sftp mount, which is then unused.

## external SFTP storage
ftppass=ftp${RANDOM}data
deluser ftpdata 2>/dev/null && true
echo -e "\$ftppass\\n\$ftppass" | adduser ftpdata --gecos ""
mkdir -p /home/ftpdata/.ssh /home/ftpdata/data
touch /home/ftpdata/.ssh/authorized_keys
echo "Hello, world!" >  /home/ftpdata/data/hello.txt
chown -R ftpdata. /home/ftpdata
chmod 700 /home/ftpdata/.ssh
# switch to RSA public key: copy the key generated in the admin interface, paste it into /home/ftpdata/.ssh/authorized_keys

## prepare an NFS server too...
aptQ install -y nfs-server
mkdir -p /pub/data
echo "Hello, NFS!" > /pub/data/hello-nfs.txt
chown -R www-data.  /pub
echo >> /etc/exports "/pub            *(rw,insecure,no_root_squash,no_all_squash,no_subtree_check)"
exportfs -a
showmount -e localhost
# should now reflect the contents of /etc/exports
mkdir -p /var/www/owncloud/nfs-{hard,soft}-data
mount -t nfs -o proto=tcp,hard 			  localhost:/pub/data /var/www/owncloud/nfs-hard-data	# prone to freezing processes
mount -t nfs -o proto=tcp,soft,timeo=50,retrans=2 localhost:/pub/data /var/www/owncloud/nfs-soft-data	# prone to data loss
ls -la /var/www/owncloud/nfs-*-data
# expect to see hello-nfs.txt
# -> nfs-server.service ( nfs-idmapd.service nfs-mountd.service )


cd /var/www
if [ -f owncloud/config/config.php ]; then
 echo "ERROR: /var/www/owncloud/config/config.php already exists."
 echo "ERROR: Cannot continue. Please (backup and) remove."
fi
# set -x
echo "... installing $tar"
echo "+ curl -L $tar | tar jxf -"
curl -L $tar | tar jxf - || exit 1
chown -R www-data. owncloud
# chmod a+x owncloud/tests/acceptance/run.sh	# in case we want to run some acceptance tests here.

cat <<EOCONF > /etc/apache2/sites-available/owncloud.conf
Alias $webroute "/var/www/owncloud/"

<Directory /var/www/owncloud/>
  Options +FollowSymlinks
  AllowOverride All

 <IfModule mod_dav.c>
  Dav off
 </IfModule>
 SetEnv HOME /var/www/owncloud
 SetEnv HTTP_HOME /var/www/owncloud
</Directory>

<IfModule mod_headers.c>
  Header always set Strict-Transport-Security "max-age=15552000; includeSubDomains"
</IfModule>

EOCONF
a2dismod mpm_event	# conflicts with php7.4
for mod in php7.4 ssl headers env dir mime unique_id rewrite setenvif; do
  a2enmod \$mod
done
for site in owncloud default-ssl; do
   a2ensite \$site
done
service apache2 restart

## prepare databases to choose from
# postgresql
su - postgres -c "psql -c \"ALTER SYSTEM SET listen_addresses = '';\""	# no TCP connections please
# There is probably an early 'local all all peer' rule, that prevents later md5 rules. Disarm that one first.
sed -i -e 's/^local\s*all\s*all\s*peer.*/local all all md5/' /etc/postgresql/*/main/pg_hba.conf
# Add an md5 rule for the owncloud user, so that we can authentiate a user that does not exist in linux with password
for hba_file in /etc/postgresql/*/main/pg_hba.conf; do
  # There may be multiple postgres versions installed simultaneously
  echo "local owncloud owncloud md5" >> \$hba_file
done
service postgresql restart
su - postgres -c "psql -c 'DROP DATABASE owncloud'" 2>&1 | grep -v 'does not exist'
su - postgres -c "psql -c 'DROP ROLE     owncloud'" 2>&1 | grep -v 'does not exist'
(echo "$dbpass"; echo "$dbpass"; ) | su - postgres -c "createuser -e -P owncloud" 2>&1 | grep -v '^Enter '
su - postgres -c "createdb -e -O owncloud owncloud"

# ... and myql/mariadb
mysql -u root -e "DROP DATABASE owncloud;" 2>/dev/null || true
mysql -u root -e "CREATE DATABASE IF NOT EXISTS owncloud; GRANT ALL PRIVILEGES ON owncloud.* TO owncloud@localhost IDENTIFIED BY '$dbpass'"

OC10_DATABASE_HOST=localhost
test "\$OC10_DATABASE" = pgsql && OC10_DATABASE_HOST=/var/run/postgresql

set -x
occ maintenance:install --database "\$OC10_DATABASE"  --database-name "owncloud" --database-user "owncloud" --database-pass "$dbpass" --database-host "\$OC10_DATABASE_HOST" --data-dir "$OC10_DATADIR" --admin-user "admin" --admin-pass "$admin_pass" || echo "ERROR: occ maintenance:install with \$OC10_DATABASE failed, trying sqlite ... " | tee -a ~/POSTINIT.msg
occ status    || sleep 15	# in case there was an error, let the user study that for a while...
set +x
occ status -q || occ maintenance:install --database "sqlite" --database-name "owncloud" --database-user "owncloud" --database-pass "$dbpass" --data-dir "$OC10_DATADIR" --admin-user "admin" --admin-pass "$admin_pass" || { echo "ERROR: occ maintenance:install with sqlite also failed"; exit 1; }

occ config:system:set trusted_domains 1 --value "$IPADDR"
occ log:owncloud --enable -vvv
occ log:manage --level=info -vvv				# info=1, okayis - debug=0, way too much token refresh nonsense.
# occ config:system:set log_query --value true			# seen in 9.1/admin_manual
occ config:system:set upgrade.disable-web --value false		# default is false. Just here to make it appear in config.php

if [ -z "$OC10_WITH_INDEX_PHP" ]; then
  occ config:system:set htaccess.RewriteBase --value "$webroute"	# index.php less setup
  occ maintenance:update:htaccess					# index.php less setup
fi

echo "*/5  *  *  *  * /var/www/owncloud/occ system:cron" > oc.crontab
crontab -u www-data oc.crontab		# only the crontab command triggers a reload.
occ background:cron

occ config:system:set memcache.local --value '\OC\Memcache\APCu'
occ config:system:set memcache.locking --value '\OC\Memcache\Redis'
occ config:system:set redis --type json --value '{"host": "127.0.0.1", "port": "6379"}'

## initialize mailhog
docker rm mailhog --force 2>/dev/null && true
docker run --rm --name mailhog -d -p 8025:8025 mailhog/mailhog
hog_ip=\$(docker inspect mailhog | jq '.[0].NetworkSettings.IPAddress' -r)


sql="UPDATE oc_accounts SET email='admin@oc.example.com' WHERE user_id='admin';"
test "$OC10_DATABASE" = mysql && mysql owncloud -e "\$sql"
test "$OC10_DATABASE" = pgsql && su - postgres -c "psql -d owncloud -c \\"\$sql\\""

occ config:system:set mail_domain       --value oc.example.com
occ config:system:set mail_from_address --value mail
occ config:system:set mail_smtpmode     --value smtp
occ config:system:set mail_smtphost     --value \$hog_ip
occ config:system:set mail_smtpport     --value 1025
## We don't really need auth for mailhog. Both with and without is supported. Mailhog accepts any password.
if true; then
  occ config:system:set mail_smtpauth	--value 1
  occ config:system:set mail_smtpname	--value smtpuser
  occ config:system:set mail_smtppassword	--value 1234567890
  occ config:system:set mail_smtpauthtype	--value PLAIN
fi
echo >> ~/POSTINIT.msg "mailhog: try these commands: mailhog_dump, mailhog_del"


## always set here to either true or false, so that it appears in config.php for easier editing.
occ config:system:set file_storage.save_version_author --type boolean --value true

## allow entry of password in the user add dialog.
occ config:app:set core umgmt_set_password --value true		# not a boolean here, but a string value :-(

## even simpler than sftp...
## https://doc.owncloud.com/server/next/admin_manual/configuration/files/external_storage/local.html
# Holger says, this is strongly discouraged, as it mixes owncloud admin with local sysamin scopes:
occ config:system:set files_external_allow_create_new_local --value false

occ app:list '^files_external$' --output=json
occ app:enable files_external	# OOPS: not auto-enabled in 10.10.0RC1 ??
occ market:install files_clipboard
occ app:enable files_clipboard	# a copy paste function is great for testing ...

# install app files_external_ftp
occ files_external:create /SFTP sftp password::password -c host=localhost -c root="/home/ftpdata/data" -c user=ftpdata -c password=\$ftppass
occ config:app:set core enable_external_storage --value yes

## mount the SFTP also as a linux filesystem, so that we can play with files_external
mkdir /mnt/sftp
# May ask for authenticity of host unless we provide -o StrictHostKeyChecking=no
echo "\$ftppass" | sshfs -o password_stdin -o StrictHostKeyChecking=no -o allow_other ftpdata@localhost:/home/ftpdata/data /mnt/sftp
# occ files_external:create /local-mnt-sftp local null::null -c datadir=/mnt/sftp


curl -k https://$IPADDR$webroute/status.php
echo; sleep 5
cd
ln -s /var/www/owncloud o
ln -s o/data/owncloud.log .
echo "alias cd='cd -P'" >> ~/.bash_aliases
. ~/.bash_aliases
#################################################################

install_app() { echo "install_app: \$1"; ( test -f "\$1" && cat "\$1" || curl -L -s "\$1" ) | su www-data -s /bin/sh -c 'tar zxf - -C /var/www/owncloud/apps-external'; }

apps_installed=
for param in \$PARAM; do
  param="\$(basename \$param)"
  # Find if it is an app tar.gz file by looking for an appinfo/info.xml
  if echo "\$param" | grep -q ".tar.gz" && tar tf "\$param" 2>/dev/null | grep -q appinfo/info.xml; then
    # This param is an app
    app="\$(basename "\$param")"
    app_name=\$(echo "\$app" | sed -e 's/[-\\.].*//')
    install_app "\$app"
    apps_installed="\$apps_installed \$app_name"
    case "\$app" in
      *)
	set -x
        if [ -f \$TASKd/\$app_name.sh ]; then
          echo "\$app requested. Running \$TASKd/\$app_name.sh ..."
          source \$TASKd/\$app_name.sh
          ret=\$?
          if [ "\$ret" = 0 ]; then
	    echo >> ~/POSTINIT.msg "SUCCESS: \$TASKd/\$app_name.sh"
          else
	    echo >> ~/POSTINIT.msg "WARNING: \$TASKd/\$app_name.sh return code \$ret, check log."
          fi
	else
          echo -e "\$app installed. Try this to activate:\n\n\tocc app:enable \$app_name\n"
	fi
        ;;

    esac
    occ app:list \$app_name
    occ upgrade	# just in case, e.g. pdf_viewer 0.12.0 needs it.
    occ app:list \$app_name

  else
    echo "\$param" | grep -q '^b:' && bundled_app=true
    param="\$(echo "\$param" | sed -e 's/^b://')"	# this is how we tunnel bundled apps in here.
    if [ -f "\$TASKd/\$param.sh" ]; then
      # this is not a downloaded app, but bundled app that has an init script in the tasks folder.
      echo "Running \$TASKd/\$param.sh ..."
      source \$TASKd/\$param.sh
      ret=\$?
      if [ "\$ret" = 0 ]; then
        echo >> ~/POSTINIT.msg "SUCCESS: \$TASKd/\$param.sh"
      else
        echo >> ~/POSTINIT.msg "WARNING: \$TASKd/\$param.sh return code \$ret, check log."
      fi
    elif \$bundled_app; then
      # this is not a downloaded app, but bundled app and we have no init script for this.
      echo "+ occ app:enable \$param"
      occ app:enable \$param
    elif [ -e "/root/\$param" ]; then
      # This param is not an app.
      echo "File added: /root/\$param"
      case "\$param" in
	*.crt)
          # https://doc.owncloud.com/server/10.8/admin_manual/configuration/user/user_auth_ldap.html#ldaps-configuration
          cp /root/\$param /usr/local/share/ca-certificates/
          update-ca-certificates
          ls -l /etc/ssl/certs/* | grep "\$param" || echo "ERROR: cert was not added into /etc/ssl/certs??"
          openssl x509 -in /root/\$param -noout -issuer -subject -dates -alias # -pubkey
          # TODO do we need to restart apache now?
        ;;
      esac
    else
      echo "env var PARAM contains basename '\$param', but no such file added."
    fi
  fi
done

test "\$OC10_DATABASE" = pgsql && echo >> ~/POSTINIT.msg 'POSTGRESQL: su - postgres -c "psql -d owncloud"'

if [ -n "\$oc10_fqdn" ]; then
  # We use certbot with --redirect, that adds a HTTP to HTTPS defult redirect to the servers.
  occ config:system:set trusted_domains 2 --value "\$oc10_fqdn"
  occ config:system:set overwrite.cli.url --value "https://\$oc10_fqdn$webroute"	# Avoid http://localhost in notifcations emails.
  if grep -q 'Congratulations! You have successfully enabled' ~/CF_DNS.msg >/dev/null 2>&1; then
    echo >> ~/POSTINIT.msg "DNS: SSL-Cert succeeded via cf_dns - access this system"
    echo >> ~/POSTINIT.msg "DNS:"
    echo >> ~/POSTINIT.msg "DNS: 				https://\$oc10_fqdn$webroute"
    echo >> ~/POSTINIT.msg ""
  else
    echo >> ~/POSTINIT.msg "DNS: The following manual steps are needed to setup your dns name:"
    echo >> ~/POSTINIT.msg "DNS:  - Register at cloudflare and get a letsencrypt certificate:"
    echo >> ~/POSTINIT.msg "DNS:         cf_dns $IPADDR \$oc10_fqdn bot:qa@owncloud.com"
    # echo >> ~/POSTINIT.msg "DNS:  - To get a certificate, run:        certbot -m qa@owncloud.com --no-eff-email --agree-tos --redirect -d \$oc10_fqdn"
    echo >> ~/POSTINIT.msg "DNS:  - Then try:                         firefox https://\$oc10_fqdn$webroute"
    echo >> ~/POSTINIT.msg ""
  fi
fi

for app in \$apps_installed; do
  echo -n "Checking app \$app ... "
  occ integrity:check-app \$app && echo "OK." || echo -e "  OOPS. If needed, use:\n\t occ c:s:s integrity.check.disabled --type bool --value true"
done

grace_period="\$(occ config:app:get core grace_period)"
if [ -n "\$grace_period" ]; then
  cat <<GRACE
  Enterprise grace_period activated. Please add a license.key or try:
	sed -i -e 's@60 \\* 24;@60 * 24 * 30;@' /var/www/owncloud/lib/private/License/LicenseManager.php
	occ c:s:set integrity.check.disabled --type bool --value true
	occ c:s:set grace_period.demo_key.show_popup --type bool --value false
GRACE
fi

for uid in Alice bob carol dave einstein; do
  env OC_PASS=secret occ user:add --password-from-env -g \$uid-g \$uid
done
occ user:modify admin email "admin@jw-qa.owncloud.works"
occ user:modify alice displayname "Alice in Wonderland, down the rabbit hole and through the lookin"	# max 64 chars
occ user:modify carol displayname "Carol
L€wis"
env OC_PASS="s€cret" occ user:resetpassword --password-from-env einstein


uptime
cat << EOM
( Mailhog access: http://$IPADDR:8025 )
Server $vers is ready.

From remote
	firefox https://$IPADDR$webroute
		admin / $admin_pass
EOM
EOF
