source ./env.sh		# need to access https://$IPADDR to initialize the Backend

sync_early=true;	# set to false, if you want to prepare e.g. homeFolderNamingRule first.

case "$(lsb_release -d -s)" in
  "Ubuntu 22"* | "Ubuntu 21.10" )
    apt install -y php7.4-ldap ldap-utils	# probably already installed.
    ;;
  * )
    apt install -y php-ldap ldap-utils	# probably already installed.
    ;;
esac

# phpenmod php-ldap		# TODO: is this needed? My php -m shows ldap is builtin.

# https://doc.owncloud.com/server/admin_manual/configuration/user/user_auth_ldap.html#ldaps-configuration
# https://doc.owncloud.com/server/admin_manual/configuration/user/user_auth_ldap.html#testing-the-configuration
# refers to a 7 year old https://github.com/valerytschopp/owncloud-ldap-schema saying:
#  ownCloud Inc. has register the OID http://oid-info.com/get/1.3.6.1.4.1.39430 and we extended it to define the required LDAP objects
#
# Proxy idea: https://ldaptor.readthedocs.io/en/latest/cookbook/ldap-proxy.html
#
# Thomas Kinsky says:
# there is shat-ldap, for the shat/kibana poc, not really needed anymore with
# some users configured very basically (openldap 2.4) with memberof overlay,
# might need some configuration

## hetzner QA project: testlab-network
# ldap_server=ad01.testlab.owncloud.works	# 10.1.0.3
# ldap_login="CN=Administrator,CN=Users,DC=TESTLAB,DC=OWNCLOUD,DC=WORKS"
# base="DC=TESTLAB,DC=OWNCLOUD,DC=WORKS"
# -> Test Base DN: 	253 entries available within the provided Base DN
#
## this returns ca 6000 lines, with users administrator, e.einstein, w.heisenberg
# ldapsearch -d 0 -H ldap://10.1.0.3 -D administrator@testlab.owncloud.works -w "$password" -b dc=testlab,dc=owncloud,dc=works
## but owncloud cannot find any users there....

## From Gerald
ldap_server=95.217.210.161
ldap_login="cn=admin,dc=example,dc=com"	# grep -h olcRootDN /etc/ldap/slapd.d/*/*.ldif
ldap_pass="owncloud"			# grep -h olcRootPW /etc/ldap/slapd.d/*/*.ldif
base="dc=example,dc=com"		# grep -i BASE /etc/ldap/ldap.conf
scope="subtree"				# base, one, sub or children
opts="-LLL -d 0"			# -LLL: do not include comments, -d 0: no debugging
proto="ldap"				# switch to ldaps, if available.

cat <<EOH>> /etc/hosts
# Hetzner network: kerberos.jw
10.42.0.2 ad01.ker-int.jw-qa.owncloud.works

EOH

## upgrade Gerald's openldap server to allow LDAPS
# see also: https://openldap.org/doc/admin24/slapdconf2.html
# sed -i -e 's@^SLAPD_SERVICES=.*@SLAPD_SERVICES="ldap:/// ldaps:/// ldapi:///"@' /etc/default/slapd
# service slapd restart
## SSL Does not work. The test command fails with "no peer certificate available:
## or with: 140267127543104:error:0200206E:system library:connect:Connection timed out:../crypto/bio/b_sock2.c:110:
timeout 10 openssl s_client -connect $ldap_server:636 < /dev/null && proto=ldaps

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

set -x
# https://doc.owncloud.com/server/admin_manual/configuration/user/user_auth_ldap.html#ldaps-configuration
confID=s01
occ ldap:create-empty-config "$confID"
occ ldap:set-config "$confID" ldapHost $proto://$ldap_server
if [ $proto = ldaps ]; then
  occ ldap:set-config "$confID" ldapPort 636
  occ ldap:set-config "$confID" ldapTLS 0
else
  occ ldap:set-config "$confID" ldapPort 389
  occ ldap:set-config "$confID" ldapTLS 0	# 1: LDAP over TLS. this is different than LDAPS
fi

##
## so far we ldap:test-config reports:
# "message":"Configuration Error (prefix s01): No LDAP Login Filter given!
# "message":"Configuration Error (prefix s01): login filter does not contain %uid place holder."}

## for openLDAP:  objectclass=posixGroup objectclass=inetOrgPerson
## for AD(fsweb): objectclass=group      objectclass=organizationalPerson

occ ldap:set-config "$confID" ldapAgentName $ldap_login		# User DN
occ ldap:set-config "$confID" ldapAgentPassword $ldap_pass
occ ldap:set-config "$confID" ldapBase $base
occ ldap:set-config "$confID" ldapEmailAttribute mail
occ ldap:set-config "$confID" ldapExpertUUIDUserAttr entryuuid
occ ldap:set-config "$confID" ldapGroupFilter '(|(objectclass=posixGroup)(objectclass=group))'
occ ldap:set-config "$confID" ldapGroupFilterMode 1
occ ldap:set-config "$confID" ldapGroupFilterObjectclass posixGroup
occ ldap:set-config "$confID" ldapLoginFilter '(&(|(objectclass=inetOrgPerson)(objectClass=organizationalPerson))(|(uid=%uid)(name=%uid)(sAMAccountName=%uid)(mailPrimaryAddress=%uid)(mail=%uid)))'
occ ldap:set-config "$confID" ldapLoginFilterEmail 1
occ ldap:set-config "$confID" ldapNetworkTimeout 20
occ ldap:set-config "$confID" ldapQuotaAttribute roomNumber
occ ldap:set-config "$confID" ldapQuotaDefault '66 MB'
occ ldap:set-config "$confID" ldapUserDisplayName cn
occ ldap:set-config "$confID" ldapUserDisplayName2 displayuser
occ ldap:set-config "$confID" ldapUserFilter '(|(objectclass=inetOrgPerson)(objectclass=organizationalPerson))'
occ ldap:set-config "$confID" ldap_configuration_active 1	# Initialization "bug": default is inactive here, but active when user click on the web UI.

conftest=$(occ ldap:test-config "$confID" | tee -a /dev/stderr)
if echo "$conftest" | grep -q -i invalid; then
  grep '"app":"user_ldap"' /var/www/owncloud/data/owncloud.log  | jq .message
  echo >> ~/POSTINIT.msg
  echo "ERROR: 'invalid' seen in occ ldap:test-config" >> ~/POSTINIT.msg
  sleep 5
fi

## prepare user sync every 5 min. sync users

# ## Workaround for a backend initialization bug: It initializes only, when queried via POST requests. occ only sees the backend afterwards.
# ## Caution: $oc10_fqdn is not yet in trusted_domains, but $IPADDR is.
# curl_POST() { curl -L -s -k -b cookie.jar -c cookie.jar "https://$IPADDR/index.php/$1" --data-raw "$2"; } 	# index.php urls work also in index.php-less setup
# for try in 1 2 3 4 5 fail; do
#   curl_POST login 'user=admin&password=admin' | grep data-user && break							# login, fetch cookie, prints username and token
#   sleep 5
# done
# if [ $try = fail ]; then echo "Login failed:"; set -x; curl_POST login 'user=admin&password=admin'; fi
# # curl_POST apps/user_ldap/ajax/getConfiguration.php "ldap_serverconfig_chooser=s01" | jq 			# -> huge json structure, but still shows no LDAP backend.
# curl_POST apps/user_ldap/ajax/testConfiguration.php  "ldap_serverconfig_chooser=s01" | jq			# "status": "success"
# curl_POST apps/user_ldap/ajax/wizard.php             "ldap_serverconfig_chooser=s01&action=countInBaseDN" | jq	# "ldap_test_base": 10
# ## TODO: check if getConfiguration is also needed.

crontab=/var/spool/cron/crontabs/www-data
occ user:sync -l | grep -q User_LDAP || echo "FIXME: admin must visit User Authentication page to initialize class OCA\User_LDAP\User_Proxy" >> ~/POSTINIT.msg
test $ldap_server == 95.217.210.161 &&  echo "TODO: admin please visit User Authentication page Login Attributes and check usernames testy, user1, user2" >> ~/POSTINIT.msg
if $sync_early; then
  if occ user:sync "OCA\User_LDAP\User_Proxy" --showCount --re-enable --missing-account-action=disable; then
    echo "ldap user:sync tested successfully, adding to crontab"
    if ! grep -q user:sync $crontab; then
      echo "*/5  *  *  *  * /var/www/owncloud/occ user:sync 'OCA\User_LDAP\User_Proxy' -c -r -m disable -vvv" >> $crontab
      crontab -u www-data $crontab	# fix permissions and wake up cron
    fi
  else
    echo "ERROR: ldap user:sync failed" | tee -a ~/POSTINIT.msg
    sleep 5
  fi
fi

echo "database table oc_accounts has:"
echo 'select user_id,display_name,email from oc_accounts;' | mysql owncloud

