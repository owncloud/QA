apt install -y php-ldap ldap-utils	# probably already installed.
# phpenmod php-ldap		# TODO: is this needed? My php -m shows ldap is builtin.

# https://doc.owncloud.com/server/admin_manual/configuration/user/user_auth_ldap.html#ldaps-configuration
# https://doc.owncloud.com/server/admin_manual/configuration/user/user_auth_ldap.html#testing-the-configuration
# refers to a 7 year old https://github.com/valerytschopp/owncloud-ldap-schema saying:
#  ownCloud Inc. has register the OID http://oid-info.com/get/1.3.6.1.4.1.39430 and we extended it to define the required LDAP objects

## From Gerald
ldap_server=95.217.210.161
ldap_login="cn=admin,dc=example,dc=com"	# grep -h olcRootDN /etc/ldap/slapd.d/*/*.ldif
ldap_pass="owncloud"			# grep -h olcRootPW /etc/ldap/slapd.d/*/*.ldif
base="dc=example,dc=com"		# grep -i BASE /etc/ldap/ldap.conf
scope="subtree"				# base, one, sub or children
opts="-LLL -d 0"			# -LLL: do not include comments, -d 0: no debugging
proto="ldap"				# switch to ldaps, if available.

## upgrade Gerald's openldap server to allow LDAPS
# see also: https://openldap.org/doc/admin24/slapdconf2.html
# sed -i -e 's@^SLAPD_SERVICES=.*@SLAPD_SERVICES="ldap:/// ldaps:/// ldapi:///"@' /etc/default/slapd
# service slapd restart
## SSL Does not work. The test command fails with "no peer certificate available:
openssl s_client -connect $ldap_server:636 < /dev/null && proto=ldaps

opts="$opts -H $proto://$ldap_server -D $ldap_login -w $ldap_pass -b $base -s $scope"


## get all potential owncloud users, but don't show the classes, only dn, cn, uid, mail
ldapsearch $opts '(&(objectClass=inetOrgPerson)(uid=*))' cn uid mail	# inetOrgPerson in objectClass AND uid == testy
## list all groups and their members. (gidNumber of the users are not used here..., that is a different query)
ldapsearch $opts '(&(objectClass=posixGroup)(cn=*group*))' cn memberUid

# TODO:
# enable revers Group Membership in openLDAP, so that user entries have a memberOf field.
# https://www.openldap.org/doc/admin24/overlays.html#Reverse%20Group%20Membership%20Maintenance

# Bug: default is s01ldap_display_name is displayName, although the gui shows DisplayName cn.
# fix:


occ app:enable user_ldap
# New LDAP logins can attempt to reuse existing accounts if:
# - They match the resolved username attribute.
# - They have User_Proxy set as their backend
occ config:app:set user_ldap reuse_accounts --value=yes

# https://doc.owncloud.com/server/admin_manual/configuration/user/user_auth_ldap.html#ldaps-configuration
confID=s01
occ ldap:create-empty-config $confID
occ ldap:set-config $confID ldapHost $proto://$ldap_server
if [ $proto = ldaps ]; then
  occ ldap:set-config $confID ldapPort 389
  occ ldap:set-config $confID ldapTLS 0
else
  occ ldap:set-config $confID ldapPort 636
  occ ldap:set-config $confID ldapTLS 0	# 1: LDAP over TLS. this is different than LDAPS
fi
occ ldap:set-config $confID ldapAgentName $ldap_login		# User DN
occ ldap:set-config $confID ldapAgentPassword $ldap_pass
occ ldap:set-config $confID ldapBase $base
conftest=$(occ ldap:test-config $confID | tee -a /dev/stderr)
if echo "$conftest" | grep -q -i invalid; then
  grep '"app":"user_ldap"' /var/www/owncloud/data/owncloud.log  | jq .message
  exit 1
fi

## prepare user sync every 5 min. sync users

crontab=/var/spool/cron/crontabs/www-data
if occ user:sync "OCA\User_LDAP\User_Proxy" --showCount --re-enable --missing-account-action=disable; then
  echo "ldap user:sync tested successfully, adding to crontab"
  if ! grep -q user:sync $crontab; then
    echo "*/5  *  *  *  * /var/www/owncloud/occ user:sync 'OCA\User_LDAP\User_Proxy' -c -r -m disable -vvv" >> $crontab
    chown www-data.crontab $crontab
  fi
else
  echo "ERROR: ldap user:sync failed"
  exit 1
fi


