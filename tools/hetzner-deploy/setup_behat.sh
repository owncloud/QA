#!/bin/bash
#
# 2020-10-26, jw@owncloud.com
#
# https://doc.owncloud.com/server/developer_manual/testing/ui-testing.html
# See also: https://github.com/owncloud/files_texteditor/issues/345#issuecomment-834498939

echo "Estimated setup time: 8 minutes ..."

vers=10.6.0beta1
d_vers=$(echo $vers  | tr '[A-Z]' '[a-z]' | tr . -)	# -$(date +%Y%m%d)
source lib/make_machine.sh -u acceptance-$d_vers -p git,screen,docker.io,composer,make,libxml2-utils,apache2,libapache2-mod-php,openssl,php-imagick,php-common,php-curl,php-gd,php-imap,php-intl,php-json,php-mbstring,php-mysql,php-ssh2,php-xml,php-zip,php-apcu,php-ldap,php-gmp,wget "$@"

# from https://github.com/owncloud-docker/server/pull/204#issuecomment-714388044
example_make_cmd="make test-acceptance-webui BEHAT_FEATURE=tests/acceptance/features/webUIAdminSettings/adminAppsSettings.feature"

INIT_SCRIPT << EOF
  cat <<EOCC > /usr/local/bin/occ
#! /bin/bash

cd /var/www/owncloud
sudo -u www-data /usr/bin/php /var/www/owncloud/occ "\\\$@"
EOCC
  chmod a+x /usr/local/bin/occ

  cd /var/www
  git clone -b v$vers https://github.com/owncloud/core.git owncloud
  chown -R www-data:www-data owncloud
  cd owncloud
  git clone https://github.com/owncloud/testing apps/testing

  $example_make_cmd

  cat <<EOM
---------------------------------------------
  cd /var/www/owncloud
  $example_make_cmd
---------------------------------------------
EOM
EOF
