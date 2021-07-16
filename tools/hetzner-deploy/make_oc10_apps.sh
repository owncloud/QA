#!/bin/bash
#
# 2021-02-03, jw@owncloud.com
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

echo "Estimated setup time: 5 minutes ..."

vers=10.8.0beta2
tar=https://download.owncloud.org/community/owncloud-complete-20210326.tar.bz2
test -n "$OC_VERSION" && vers="$OC_VERSION"
test -n "$OC10_VERSION" && vers="$OC10_VERSION"
test "$vers" = "10.8.0-beta2" -o "$vers" = "10.8.0beta2" && tar=https://download.owncloud.org/community/testing/owncloud-complete-20210705.tar.bz2
test "$vers" = "10.8.0-beta1" -o "$vers" = "10.8.0beta1" && tar=https://download.owncloud.org/community/testing/owncloud-complete-20210621.tar.bz2
test "$vers" = "10.7.0"       -o "$vers" = "10.7"        && tar=https://download.owncloud.org/community/owncloud-complete-20210326.tar.bz2
test "$vers" = "10.6.0"       -o "$vers" = "10.6"        && tar=https://download.owncloud.org/community/owncloud-complete-20201216.tar.bz2
test "$vers" = "10.5.0"       -o "$vers" = "10.5"        && tar=https://download.owncloud.org/community/owncloud-complete-20200731.tar.bz2
test -n "$OC10_TAR_URL" &&  tar="$OC10_TAR_URL"

if [ -z "$1" -o "$1" = "-" -o "$1" = "-h" ]; then
  echo "Usage examples:"
  echo "  $0 https://github.com/owncloud/files_antivirus/releases/download/v0.16.0RC1/files_antivirus-0.16.0RC1.tar.gz Kaspersky_ScanEngine-Linux-x86_64-2.0.0.1157-Release.tar.gz 575F7141.key"
  echo "  $0 customgroups"
  echo "  $0 owncloud/metrics=v0.6.1RC2"
  echo "  $0 https://storage.marketplace.owncloud.com/apps/metrics-1.0.0.tar.gz"
  echo "  $0 --"
  echo ""
  echo "Local file names are copied into the machine."
  echo "File URLs are passed into the machine and downloaded there."
  echo "Other parameters that do not look like URLs and do not exist as local files:"
  echo "  should be names of github/owncloud projects."
  echo "  The latest release tar.gz is downloaded or a release asset matching a tag specified after '='."
  echo ""
  echo "To start without extra apps or extra files, use: $0 --"
  echo ""
  echo "Environment:"
  echo "   OC10_DNSNAME=oc1070rc1-DATE	set the FQDN to oc1070rc1-$(date +%Y%m%d).jw-qa.owncloud.works (Default: as needed by apps)"
  echo "   OC10_VERSION=10.7.0-rc1	set the version label. Should match the download url. Default: $vers"
  echo "   OC10_TAR_URL=...	        define the download url. Default: $tar"
  exit 1
fi

tmpdir="/tmp/make_oc10_apps_dl_$$"
mkdir -p $tmpdir
test "$1" = "--" && shift
ARGV=()
for arg in "$@"; do
  case arg in
    http://*)
      ;;
    https://*)
      ;;
    *)
      if [ -e $arg ]; then
	echo "Using local file $arg ..."
      else
	echo "$arg" | grep -q / || arg="owncloud/$arg"
	oc_app="$(echo "$arg" | sed -e 's/[:=].*$//')"
	tagname="v$(echo "$arg" | sed -e 's/.*[:=]//' -e 's/^v//')"	# should work with or without leading v.
	echo "Using https://github.com/$oc_app ..."
        curl=curl
        test -n "$GITHUB_USER" -a -n "$GITHUB_TOKEN" && curl="curl -u $GITHUB_USER:$GITHUB_TOKEN"
        releases_api_url="https://api.github.com/repos/$oc_app/releases"
        test "$oc_app" = "$arg" && tagname=$($curl -s "$releases_api_url" | jq '.[0].tag_name' -r 2>/dev/null)
	rel_json="$($curl -s "$releases_api_url" | jq '.[] | select(.tag_name == "'"$tagname"'")')"
        if [ -z "$rel_json" -o "$rel_json" = "null" ]; then
          echo "ERROR: no release tag $tagname seen in: https://github.com/$oc_app/releases"
          echo "  Is $arg correct?"
          echo "  To specify a version, use APPNAME=vN.N.N"
          test "$curl" = curl && echo '  Or retry after setting environment variables GITHUB_USER and GITHUB_TOKEN'
          exit 0
        fi
        asseturl=$(echo  "$rel_json" | jq '.assets[0].url' -r 2>/dev/null)
        assetname=$(echo "$rel_json" | jq '.assets[0].name' -r 2>/dev/null)
	echo "... expanded to $asseturl -> $assetname (from tag $tagname)"
	arg="$tmpdir/$assetname"
	$curl -L -H 'Accept: application/octet-stream' "$asseturl" > "$arg"
      fi

      ;;
  esac
  ARGV+=($arg)
done

## Default to always have a DNS name. Uncomment the next line, to skip preparations for DNS.
firstarg="-$(echo "${ARGV[0]}" | sed -e 's@.*/@@' -e 's@\b\.tar\.gz\b@@' )"	# cut away any path prefix, and any tar.gz suffix
test -z "$OC10_DNSNAME" && OC10_DNSNAME="$(echo "oc$vers$firstarg" | tr '[A-Z]' '[a-z]' | tr -d .=)-DATE"
h_name="$OC10_DNSNAME"
test -z "$h_name" && h_name=oc-$vers-DATE
d_name=$(echo $h_name  | sed -e "s/DATE/$(date +%Y%m%d)/" | tr '[A-Z]' '[a-z]' | tr . -)
machine_type=cx11
echo "$*" | grep files_antivirus && machine_type=cx21	# c-icap docker consumes 1.4GB -> https://github.com/owncloud/files_antivirus/issues/437

source $(dirname $0)/lib/make_machine.sh -t $machine_type -u $d_name -p git,screen,wget,apache2,ssl-cert,docker.io,jq "${ARGV[@]}"

rm -rf $tmpdir

dbpass="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 10)"

INIT_SCRIPT << EOF
TASKd=\$HOME/task
ls -la \$TASKd

export LC_ALL=C LANGUAGE=C
# FROM https://doc.owncloud.com/server/admin_manual/installation/ubuntu_18_04.html
apt install -y apache2 libapache2-mod-php mariadb-server openssl php-imagick php-common php-curl php-gd php-imap php-intl
apt install -y php-json php-mbstring php-mysql php-ssh2 php-xml php-zip php-apcu php-redis redis-server php-gmp wget
apt install -y ssh bzip2 rsync curl jq inetutils-ping smbclient coreutils php-ldap ldap-utils
# We almost always assign a DNS name.
apt install -y certbot python3-certbot-apache python3-certbot-dns-cloudflare

cd /var/www
if [ -f owncloud/config/config.php ]; then
 echo "ERROR: /var/www/owncloud/config/config.php already exists."
 echo "ERROR: Cannot continue. Please (backup and) remove."
fi
echo "... installing $tar"
curl $tar | tar jxf - || exit 1
chown -R www-data. owncloud

cat <<EOCONF > /etc/apache2/sites-available/owncloud.conf
Alias /owncloud "/var/www/owncloud/"

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

cat << EOOCC > /usr/bin/occ
#! /bin/sh
cd /var/www/owncloud
sudo -E -u www-data /usr/bin/php /var/www/owncloud/occ "\\\$@"
EOOCC
chmod a+x /usr/bin/occ

cat << EOLV > /usr/bin/oc_log_view
#! /bin/sh
set -x
tail -f /var/www/owncloud/data/owncloud.log | grep -v Session::validateToken | grep -v Session::checkTokenCredentials | grep -v DefaultTokenProvider::
EOLV
chmod a+x /usr/bin/oc_log_view

cat << EOAI > /usr/bin/oc_app_install
#! /bin/sh
if [ -z "\\\$1" ]; then
  echo "Usage: \\\$0 APPTAR_FILE|APPTAR_URL|-"
  exit 0
fi
mkdir /var/www/owncloud/apps-external/_tmp
if [ "\\\$1" = '-' ]; then
  tar xzf - -C /var/www/owncloud/apps-external/_tmp || exit 1
elif [ -e "\\\$1" ]; then
  tar xf "\\\$1" -C /var/www/owncloud/apps-external/_tmp || exit 1
else
  curl -L "\\\$1" | tar zxf - -C /var/www/owncloud/apps-external/_tmp || exit 1
fi
cd /var/www/owncloud/apps-external
appname="\\\$(cd _tmp; ls)"
test -d \\\$appname && mv \\\$appname _tmp/old_\\\$appname
mv _tmp/\\\$appname .
rm -rf _tmp/old_\\\$appname
rmdir _tmp || exit 1
chown -R www-data. \\\$appname
occ app:list \\\$appname
echo "Press ENTER to enable \\\$appname, or CTRL-C to keep it as is."; read a
occ app:enable \\\$appname
occ app:list \\\$appname
EOAI
chmod a+x /usr/bin/oc_app_install

mysql -u root -e "DROP DATABASE owncloud;" 2>/dev/null || true
mysql -u root -e "CREATE DATABASE IF NOT EXISTS owncloud; GRANT ALL PRIVILEGES ON owncloud.* TO owncloud@localhost IDENTIFIED BY '$dbpass'"
occ maintenance:install --database "mysql" --database-name "owncloud" --database-user "owncloud" --database-pass "$dbpass" --admin-user "admin" --admin-pass "admin" || exit 1

occ config:system:set trusted_domains 1 --value="$IPADDR"
occ log:owncloud --enable -vvv
occ log:manage --level=debug -vvv
# occ config:system:set log_query --value="true"	# seen in 9.1/admin_manual

echo "*/5  *  *  *  * /var/www/owncloud/occ system:cron" > /var/spool/cron/crontabs/www-data
chown www-data.crontab /var/spool/cron/crontabs/www-data
occ background:cron

occ config:system:set memcache.local --value '\OC\Memcache\APCu'
occ config:system:set memcache.locking --value '\OC\Memcache\Redis'
occ config:system:set redis --type json --value '{"host": "127.0.0.1", "port": "6379"}'

## initialize mailhog
docker rm mailhog --force 2>/dev/null && true
docker run --rm --name mailhog -d -p 8025:8025 mailhog/mailhog
hog_ip=\$(docker inspect mailhog | jq .[0].NetworkSettings.IPAddress -r)
mysql owncloud -e 'UPDATE oc_accounts SET email="admin@oc.example.com" WHERE user_id="admin";'
occ config:system:set mail_domain       --value oc.example.com
occ config:system:set mail_from_address --value mail
occ config:system:set mail_smtpmode     --value smtp
occ config:system:set mail_smtphost     --value \$hog_ip
occ config:system:set mail_smtpport     --value 1025

## external SFTP storage
apt install -y pure-ftpd
ftppass=ftp${RANDOM}data
deluser ftpdata 2>/dev/null && true
echo -e "\$ftppass\\n\$ftppass" | adduser ftpdata --gecos ""
occ files_external:create /SFTP sftp password::password -c host=localhost -c root="/home/ftpdata" -c user=ftpdata -c password=\$ftppass
occ config:app:set core enable_external_storage --value yes

test -n "$OC10_DNSNAME" &&  oc10_fqdn="$(echo "$OC10_DNSNAME" | sed -e "s/DATE/$(date +%Y%m%d)/").jw-qa.owncloud.works"

curl -k https://$IPADDR/owncloud/status.php
echo; sleep 5
cd

#################################################################

install_app() { ( test -f "\$1" && cat "\$1" || curl -L -s "\$1" ) | su www-data -s /bin/sh -c 'tar zxvf - -C /var/www/owncloud/apps-external'; }

apps_installed=
for param in \$PARAM; do
  # find app tar.gz files by looking for an appinfo/info.xml in them.
  param="\$(basename \$param)"
  if echo "\$param" | grep -q ".tar.gz" && tar tf "\$param" 2>/dev/null | grep -q appinfo/info.xml; then
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
          if [ "$?" = 0 ]; then
	    echo >> ~/POSTINIT.msg "SUCCESS: \$TASKd/\$app_name.sh"
          else
	    echo >> ~/POSTINIT.msg "WARNING: \$TASKd/\$app_name.sh return code $ret, check log."
          fi
	else
          echo "\$app installed. Try this to get activate: occ app:enable \$app_name"
	fi
        ;;

    esac
    occ app:list \$app_name
    occ upgrade	# just in case, e.g. pdf_viewer 0.12.0 needs it.
    occ app:list \$app_name

  else
    if [ -e "/root/\$param" ]; then
      echo "File added: /root/\$param"
    else
      echo "env var PARAM contains basename '\$param', but no such file added."
    fi
  fi
done

if [ -n "\$oc10_fqdn" ]; then
  occ config:system:set trusted_domains 2 --value="\$oc10_fqdn"
  occ config:system:set overwrite.cli.url --value="https://\$oc10_fqdn/owncloud"	# Avoid http://localhost in notifcations emails.
  echo >> ~/POSTINIT.msg "DNS: The following manual steps are needed to setup your dns name:"
  echo >> ~/POSTINIT.msg "DNS:  - Register at cloudflare     cf_dns $IPADDR \$oc10_fqdn"
  echo >> ~/POSTINIT.msg "DNS:  - To get a certificate, run:        certbot -m qa@owncloud.com --no-eff-email --agree-tos --redirect -d \$oc10_fqdn"
  echo >> ~/POSTINIT.msg "DNS:  - Then try:                         firefox https://\$oc10_fqdn/owncloud"
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

uptime
cat << EOM
( Mailhog access: http://$IPADDR:8025 )
Server $vers is ready.

From remote
	firefox https://$IPADDR/owncloud
EOM
EOF
