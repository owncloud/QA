#! /bin/bash

CREATE_SECURE_OWNCLOUD_ADMIN_PASSWORD=true
CREATE_SECURE_DATABASE_PASSWORD=true

SECURE_PASSWORD_LENGTH=18

MY_IP=$(hostname -I|cut -f1 -d ' ')
MY_DOMAIN="oc01.kerberos.test.owncloud.works"

OWNCLOUD_ADMIN_USER="admin"
OWNCLOUD_ADMIN_PASSWORD="admin"
OWNCLOUD_VERSiON="owncloud-complete-latest.tar.bz2"
OWNCLOUD_DATA_DIR="/var/www/owncloud/data"

# switch database_type to sqlite or mariadb
DATABASE_TYPE="mysql"
DATABASE_HOST="localhost"
DATABASE_NAME="owncloud"
DATABASE_USER="---dummy-username---"
DATABASE_PASSWORD="---dummy-password---"

USE_REDIS_LOCAL=true
REDIS_HOST="127.0.0.1"
REDIS_PORT="6379"

USE_SMBCLIENT=true

USE_LDAP=true
LDAP_HOST_IP="10.11.0.2"
LDAP_HOST_DOMAIN="ad01.kerberos.test.owncloud.works"
LDAP_ADMIN_USER="---dummy-admin-name---"
LDAP_PASSWORD="---dummy-pasword---"
LDAP_DOMAIN="kerberos.test.owncloud.works"
LDAP_LOGIN="${LDAP_ADMIN_USER}@${LDAP_DOMAIN}"
LDAP_BASE_DN="dc=kerberos,dc=test,dc=owncloud,dc=works"
LDAP_SCOPE="subtree"
LDAP_PROTOCOL="ldap"

USE_KERBEROS=true

# Start Installation

REQUIRED_PACKAGES="apache2 libapache2-mod-php openssl"
RECOMMENDED_PACKAGES="wget unzip bzip2 rsync curl jq inetutils-ping nmap"
REDIS_PACKAGES="redis-server"
MARIADB_PACKAGES="mariadb-server php-mysql"
SQLITE_PACKAGES="sqlite3 php-sqlite3"
PHP_PACKAGES="php-imagick php-common php-curl php-gd php-gmp php-bcmath php-imap \
  php-intl php-json php-mbstring php-ssh2 php-xml php-zip php-apcu php-phpseclib php-redis"
SMBCLIENT_PACKAGES="libsmbclient-dev php-dev php-pear smbclient"
LDAP_PACKAGES="php-ldap ldap-utils"
KERBEROS_PACKAGES="libkrb5-dev krb5-user msktutil"

export DEBIAN_FRONTEND=noninteractive

CURRENT_USER=$(whoami)
CURRENT_USER_HOME=$(eval echo ~"$CURRENT_USER")
SETUP_LOG=$(eval echo "$CURRENT_USER_HOME/owncloud_setup.log")
touch "$SETUP_LOG"

trap_command () {
  if [ "$BASH_COMMAND" != "tee -a \$SETUP_LOG" ] && [[ "$BASH_COMMAND" != *"=="* ]]; then
    if [[ "$BASH_COMMAND" == *"function"* ]]; then
      echo "" >> $SETUP_LOG
      echo "run function: $BASH_COMMAND" | tee -a $SETUP_LOG 1>&2
    else
      echo "" >> $SETUP_LOG
      echo " -> run cmd: $BASH_COMMAND" | tee -a $SETUP_LOG 1>&2
      echo "" >> $SETUP_LOG
    fi
  fi
}

function_generate_secure_password () {
  trap trap_command DEBUG
  echo $(openssl rand -base64 $SECURE_PASSWORD_LENGTH)
  return 0
}

function_update_system () {
  trap trap_command DEBUG
  apt update -y | tee -a $SETUP_LOG
  apt upgrade -y | tee -a $SETUP_LOG
}

function_install_apt_packages () {
  trap trap_command DEBUG
  apt install -y $1 | tee -a $SETUP_LOG
}

function_generate_helper_script () {
  trap trap_command DEBUG
  # local FILE="/usr/local/bin/occ"
  /bin/cat <<EOM >"/usr/local/bin/occ"
    #! /bin/bash
    cd /var/www/owncloud
    sudo -E -u www-data /usr/bin/php /var/www/owncloud/occ "\$@"
EOM
  chmod +x "/usr/local/bin/occ" | tee -a $SETUP_LOG
}

function_configure_firewall () {
  trap trap_command DEBUG
  ufw allow 'Apache Full' | tee -a $SETUP_LOG
  ufw delete allow 'Apache' | tee -a $SETUP_LOG
  ufw allow ssh | tee -a $SETUP_LOG
  ufw app list | tee -a $SETUP_LOG
  echo "y" | sudo ufw enable | tee -a $SETUP_LOG
  ufw status | tee -a $SETUP_LOG
}

function_build_php_smbclient_module () {
  trap trap_command DEBUG
  # update pecl php channel
  pecl channel-update pecl.php.net
  #create cache dir
  mkdir -p /tmp/pear/cache
  # build smbclient php module
  pecl install smbclient-stable | tee -a $SETUP_LOG
  # create .so file for smbclient module
  echo "extension=smbclient.so" > /etc/php/7.4/mods-available/smbclient.ini
  # enable smbclient module
  phpenmod smbclient | tee -a $SETUP_LOG
}

function_build_php_krb5_module () {
  trap trap_command DEBUG
  # update pecl php channel
  pecl channel-update pecl.php.net
  #create cache dir
  mkdir -p /tmp/pear/cache
  # build krb5 php module
  pecl install krb5 | tee -a $SETUP_LOG
  # create .so file for krb5 module
  echo "extension=krb5.so" > /etc/php/7.4/mods-available/krb5.ini
  # enable krb5 module
  phpenmod krb5 | tee -a $SETUP_LOG
}

function_create_krb5_conf_file () {
  trap trap_command DEBUG
  /bin/cat <<EOM >"/etc/krb5.conf"
[libdefaults]
        default_realm = KERBEROS.OWNCLOUD.WORKS
        rdns = no
        dns_lookup_kdc = false
        dns_lookup_realm = false

# The following krb5.conf variables are only for MIT Kerberos.
        kdc_timesync = 1
        ccache_type = 4
        forwardable = true
        proxiable = true

# The following encryption type specification will be used by MIT Kerberos
# if uncommented.  In general, the defaults in the MIT Kerberos code are
# correct and overriding these specifications only serves to disable new
# encryption types as they are added, creating interoperability problems.
#
# The only time when you might need to uncomment these lines and change
# the enctypes is if you have local software that will break on ticket
# caches containing ticket encryption types it doesn't know about (such as
# old versions of Sun Java).

#       default_tgs_enctypes = des3-hmac-sha1
#       default_tkt_enctypes = des3-hmac-sha1
#       permitted_enctypes = des3-hmac-sha1

# The following libdefaults parameters are only for Heimdal Kerberos.
        fcc-mit-ticketflags = true

[realms]
        KERBEROS.OWNCLOUD.WORKS = {
                kdc = ad01.kerberos.owncloud.works
                admin_server = ad01.kerberos.owncloud.works
        }
[domain_realm]
        .kerberos.owncloud.works = KERBEROS.OWNCLOUD.WORKS
EOM
}

function_configure_apache2_webserver () {
  trap trap_command DEBUG
  # create virtual host file for apache
  cat <<EOM >"/etc/apache2/sites-available/owncloud.conf"
  <VirtualHost *:80>
  ServerName $MY_DOMAIN
  DirectoryIndex index.php index.html
  DocumentRoot /var/www/owncloud
  <Directory /var/www/owncloud>
    Options +FollowSymlinks -Indexes
    AllowOverride All
    Require all granted

   <IfModule mod_dav.c>
    Dav off
   </IfModule>

   SetEnv HOME /var/www/owncloud
   SetEnv HTTP_HOME /var/www/owncloud
  </Directory>
  </VirtualHost>
EOM
  # disable default host conf
  a2dissite 000-default | tee -a $SETUP_LOG
  # enable owncloud host conf
  a2ensite owncloud.conf | tee -a $SETUP_LOG
  # enable recommended apache modules
  a2enmod dir env headers mime rewrite setenvif | tee -a $SETUP_LOG
  # restart apache server
  systemctl restart apache2 | tee -a $SETUP_LOG
}

function_cunfigure_database () {
  trap trap_command DEBUG
  # configure database
  if [ $DATABASE_TYPE == "mysql" ]; then
    # ensure transaction-isolation level is set and performance_schema on.
    sed -i "/\[mysqld\]/atransaction-isolation = READ-COMMITTED\nperformance_schema = on" /etc/mysql/mariadb.conf.d/50-server.cnf | tee -a $SETUP_LOG
    # restart mariadb server
    systemctl start mariadb | tee -a $SETUP_LOG
    # create database
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME}; \
    GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* \
      TO ${DATABASE_USER}@localhost \
      IDENTIFIED BY '${DATABASE_PASSWORD}'";
  fi
}

function_download_and_install_owncloud () {
  trap trap_command DEBUG
  # download, extract and change ownership of the latest owncloud server
  cd /var/www/
  wget https://download.owncloud.com/server/stable/$OWNCLOUD_VERSiON && \
  tar -xjf $OWNCLOUD_VERSiON && \
  chown -R www-data. owncloud
  # install owncloud
  occ maintenance:install \
      --database "$DATABASE_TYPE" \
      --database-host "$DATABASE_HOST" \
      --database-name "$DATABASE_NAME" \
      --database-user "$DATABASE_USER" \
      --database-pass "$DATABASE_PASSWORD" \
      --data-dir "$OWNCLOUD_DATA_DIR" \
      --admin-user "$OWNCLOUD_ADMIN_USER" \
      --admin-pass "$OWNCLOUD_ADMIN_PASSWORD"
  occ config:system:set trusted_domains 1 --value="$MY_IP"
  occ config:system:set trusted_domains 2 --value="$MY_DOMAIN"
  occ background:cron
}

functions_configure_cron_jobs () {
  trap trap_command DEBUG
  echo "*/15  *  *  *  * /var/www/owncloud/occ system:cron" \
    | sudo -u www-data -g crontab tee -a \
    /var/spool/cron/crontabs/www-data
  echo "0  2  *  *  * /var/www/owncloud/occ dav:cleanup-chunks" \
    | sudo -u www-data -g crontab tee -a \
    /var/spool/cron/crontabs/www-data
  if [ $USE_LDAP == true ]; then
    # configure cronjob for ldap user sync
    echo "1 */6 * * * /var/www/owncloud/occ user:sync \
      'OCA\User_LDAP\User_Proxy' -m disable -vvv >> \
      /var/log/ldap-sync/user-sync.log 2>&1" \
      | sudo -u www-data -g crontab tee -a \
      /var/spool/cron/crontabs/www-data
    mkdir -p /var/log/ldap-sync
    touch /var/log/ldap-sync/user-sync.log
    chown www-data. /var/log/ldap-sync/user-sync.log
  fi
}

function_configure_file_caching_and_locking () {
  trap trap_command DEBUG
  # configure caching and file locking
  redis_config=$( jq -n \
    --arg redis_host "$REDIS_HOST" \
    --arg redis_port "$REDIS_PORT" \
    '{host: $redis_host, port: $redis_port}')
  echo $redis_config
  occ config:system:set \
     memcache.local \
     --value '\OC\Memcache\APCu'
  occ config:system:set \
     memcache.locking \
     --value '\OC\Memcache\Redis'
  occ config:system:set \
     redis \
     --value "$redis_config" \
     --type json
}

function_configure_log_rotation () {
  trap trap_command DEBUG
  # configure log rotation
  cat <<EOM >"/etc/logrotate.d/owncloud"
  /var/www/owncloud/data/owncloud.log {
    size 10M
    rotate 12
    copytruncate
    missingok
    compress
    compresscmd /bin/gzip
  }
EOM
}

function_append_hosts_file_with_ldap_server () {
  trap trap_command DEBUG
  # adding private network entry for ad server to hosts file
  sed -i "11i$LDAP_HOST_IP $LDAP_HOST_DOMAIN\n" /etc/hosts
  # nmap the ldap server and check that all necessary port are open
  nmap $LDAP_HOST_DOMAIN
}

function_enable_apps () {
  trap trap_command DEBUG
  if [ "$USE_LDAP" == true ]; then
    occ app:enable user_ldap
    function_append_hosts_file_with_ldap_server
    function_configure_ldap_app
  fi
  if [ "$USE_KERBEROS" == true ]; then
    function_install_owncloud_kerberos_app
    occ app:enable kerberos
  fi
}

function_finalize () {
  trap trap_command DEBUG
  # finalize installation
  cd /var/www/
  chown -R www-data. owncloud
}

function_print_owncloud_installation () {
  occ -V | tee -a $SETUP_LOG
  echo "Your admin user name is: "$OWNCLOUD_ADMIN_USER | tee -a $SETUP_LOG 1>&2
  echo "Your admin user password is: "$OWNCLOUD_ADMIN_PASSWORD | tee -a $SETUP_LOG 1>&2
  echo "It's documented at /etc/.owncloud_admin.txt" | tee -a $SETUP_LOG 1>&2
  echo "Your database user is: "$DATABASE_USER | tee -a $SETUP_LOG 1>&2
  echo "Your Database Password is: "$DATABASE_PASSWORD | tee -a $SETUP_LOG 1>&2
  echo "It's documented at /etc/.database.txt and in your config.php" | tee -a $SETUP_LOG 1>&2
  echo "Your ownCloud is accessible under: "$MY_DOMAIN | tee -a $SETUP_LOG 1>&2
  echo "The Installation is complete." | tee -a $SETUP_LOG 1>&2
}

function_configure_ldap_app () {
  trap trap_command DEBUG
  occ config:app:set user_ldap reuse_accounts --value=yes
  # set -x
  CONF_ID=s01
  occ ldap:create-empty-config "$CONF_ID"
  occ ldap:set-config "$CONF_ID" ldapHost $LDAP_HOST_DOMAIN
  if [ "$LDAP_PROTOCOL" == "ldaps" ]; then
    occ ldap:set-config "$CONF_ID" ldapPort 636
    occ ldap:set-config "$CONF_ID" ldapTLS 0
  else
    occ ldap:set-config "$CONF_ID" ldapPort 389
    occ ldap:set-config "$CONF_ID" ldapTLS 0	# 1: LDAP over TLS. this is different than LDAPS
  fi
  occ ldap:set-config "$CONF_ID" has_memberof_filter_support 1
  occ ldap:set-config "$CONF_ID" ldapAgentName $LDAP_LOGIN		# User DN
  occ ldap:set-config "$CONF_ID" ldapAgentPassword $LDAP_PASSWORD
  occ ldap:set-config "$CONF_ID" ldapBase $LDAP_BASE_DN
  occ ldap:set-config "$CONF_ID" ldapExpertUUIDUserAttr "objectguid"
  occ ldap:set-config "$CONF_ID" ldapGroupFilter '(&(|(objectclass=group))(|(cn=CloudUsers)))'
  occ ldap:set-config "$CONF_ID" ldapGroupFilterObjectclass group
  occ ldap:set-config "$CONF_ID" ldap_groupfilter_groups "CloudUsers"
  occ ldap:set-config "$CONF_ID" ldapLoginFilter "(&(&(|(objectclass=person))(|(|(memberof=CN=cloudUsers,OU=ldapGroups,DC=kerberos,DC=owncloud,DC=works)(primaryGroupID=1109))))(|(samaccountname=%uid)(|(mailPrimaryAddress=%uid)(mail=%uid))(|(cn=%uid)(displayName=%uid)(givenName=%uid)(name=%uid)(sAMAccountName=%uid)(userPrincipalName=%uid))))"
  occ ldap:set-config "$CONF_ID" ldapLoginFilterEmail 1
  occ ldap:set-config "$CONF_ID" ldapNetworkTimeout 20
  occ ldap:set-config "$CONF_ID" ldapQuotaDefault '66 MB'
  occ ldap:set-config "$CONF_ID" ldapUserDisplayName "displayName"
  occ ldap:set-config "$CONF_ID" ldap_userfilter_groups "CloudUsers"
  occ ldap:set-config "$CONF_ID" ldap_userfilter_objectclass "person"
  occ ldap:set-config "$CONF_ID" ldap_configuration_active 1
  occ ldap:set-config "$CONF_ID" ldap_expert_username_attr "samAccountName"
  occ user:sync "OCA\User_LDAP\User_Proxy" --showCount --re-enable --missing-account-action=disable
}

function_install_owncloud_kerberos_app () {
  trap trap_command DEBUG
  cd /var/www/owncloud/apps-external
  mv /root/setup/kerberos-1.0.0-rc.2.tar.gz .
  tar -xvf /var/www/owncloud/apps-external/kerberos-1.0.0-rc.2.tar.gz
  rm /var/www/owncloud/apps-external/kerberos-1.0.0-rc.2.tar.gz
  mv /root/setup/oc01.kerberos.owncloud.works.keytab /etc/apache2/oc01.kerberos.owncloud.works.keytab
  cat <<EOM >"/var/www/owncloud/config/kerberos.config.php"
<?php \$CONFIG = [

    /**
    * path to keytab to use, default is '/etc/krb5.keytab'
    */
    'kerberos.keytab' => '/etc/apache2/oc01.kerberos.owncloud.works.keytab',

    /**
    * timeout before re-enableing spnego based auth after logout, default is 60
    */
    'kerberos.suppress.timeout' => 0,

    /**
    * the domain name - remove from principals to match the pure username
    * e.g. alice@corp.dir will look for the user alice in ldap if 'kerberos.domain' is set to corp.dir
    */
    'kerberos.domain' => '',

    /**
    * Name of login button on login page
    */
    'kerberos.login.buttonName' => 'Windows Domain Login',

    /**
    * If set to true the login page will immediately try to log in via Kerberos
    */
    'kerberos.login.autoRedirect' => false

];
EOM
  cd /var/www
}

trap trap_command DEBUG

if [ "$CREATE_SECURE_OWNCLOUD_ADMIN_PASSWORD" == true ]; then
  OWNCLOUD_ADMIN_PASSWORD=$(function_generate_secure_password)
fi

if [ "$CREATE_SECURE_DATABASE_PASSWORD" == true ]; then
  DATABASE_PASSWORD=$(function_generate_secure_password)
fi

function_update_system
function_install_apt_packages "$REQUIRED_PACKAGES"
function_install_apt_packages "$RECOMMENDED_PACKAGES"
function_install_apt_packages "$PHP_PACKAGES"

if [ "$DATABASE_TYPE" == "mysql" ]; then
  function_install_apt_packages "$MARIADB_PACKAGES"
fi

if [ "$DATABASE_TYPE" == "sqlite" ]; then
  function_install_apt_packages "$SQLITE_PACKAGES"
fi

if [ "$USE_REDIS_LOCAL" == true ]; then
  function_install_apt_packages "$REDIS_PACKAGES"
fi

if [ "$USE_SMBCLIENT" == true ]; then
  function_install_apt_packages "$SMBCLIENT_PACKAGES"
  function_build_php_smbclient_module
fi

if [ "$USE_LDAP" == true ]; then
  function_install_apt_packages "$LDAP_PACKAGES"
fi

if [ "$USE_KERBEROS" == true ]; then
  function_create_krb5_conf_file
  function_install_apt_packages "$KERBEROS_PACKAGES"
  function_build_php_krb5_module
fi

function_generate_helper_script
function_configure_firewall
function_configure_apache2_webserver
function_cunfigure_database
function_download_and_install_owncloud
functions_configure_cron_jobs
function_configure_file_caching_and_locking
function_configure_log_rotation
function_enable_apps
function_finalize
function_print_owncloud_installation
