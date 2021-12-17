#!/bin/bash
#
# 2021-02-05, jw@owncloud.com
#

echo "Estimated setup time: 3 minutes ..."

source lib/make_machine.sh -u oc-10-linux-pkg -p git,screen,docker.io,wget "$@"

INIT_SCRIPT << EOF
export LC_ALL=C
wget -nv https://download.owncloud.org/download/repositories/production/Ubuntu_20.04/Release.key -O - | apt-key add -
echo 'deb http://download.owncloud.org/download/repositories/production/Ubuntu_20.04/ /' > /etc/apt/sources.list.d/owncloud.list
apt update
apt install -y owncloud-complete-files
apt install -y apache2 libapache2-mod-php ssl-cert php-bz2 php-sqlite3 php-mysql php-curl php-gd php-imagick php-intl php-mbstring php-xml php-zip php-gmp
set -x
cp /usr/share/doc/owncloud-complete-files/owncloud-config-apache.conf.default /etc/apache2/conf-available/owncloud.conf
a2dismod mpm_event
a2enmod php7.4
a2enmod ssl
a2ensite default-ssl
a2enconf owncloud
systemctl restart apache2
sudo -u www-data /var/www/owncloud/occ maintenance:install --admin-pass=admin
sudo -u www-data /var/www/owncloud/occ config:system:set trusted_domains 1 --value="$IPADDR"
set +x
service apache2 restart
curl -k https://$IPADDR/owncloud/status.php
echo ""
uptime
echo ""
echo "Try: firefox https://$IPADDR/owncloud"
EOF
