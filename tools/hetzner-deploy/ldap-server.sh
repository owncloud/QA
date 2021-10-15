# setup for a small local ldap server. 

ocis_ldif_url=https://raw.githubusercontent.com/owncloud/ocis/master/deployments/examples/oc10_ocis_parallel/config/ldap/ldif/
mkdir ldif; cd ldif
wget -c $ocis_ldif_url/10_owncloud_schema.ldif
wget -c $ocis_ldif_url/20_users.ldif
wget -c $ocis_ldif_url/30_groups.ldif
cd ..

## FIXME: The groups file causes an already exists conflict?
rm -f ldif/30_groups.ldif

admin_pass="12345678"
admin_dn="cn=admin,dc=owncloud,dc=com"

ports="-p 389:389 -p 636:636"
mount="$PWD/ldif:/container/service/slapd/assets/config/bootstrap/ldif/custom"
opts="-v $mount $ports --env LDAP_ADMIN_PASSWORD=$admin_pass --env LDAP_ORGANISATION=ownCloud --env LDAP_DOMAIN=owncloud.com"

docker run --rm --name openldap -$opts -d osixia/openldap --copy-service --loglevel debug
sleep 5
ldapserver=$(docker inspect openldap | jq '.[0].NetworkSettings.IPAddress' -r)

ldapsearch -x -H ldap://$ldapserver -b dc=owncloud,dc=com -D "$admin_dn" -w "$admin_pass" -v

docker run --rm -p 6443:443 --name phpldapadmin-server --env PHPLDAPADMIN_LDAP_HOSTS=$ldapserver --detach osixia/phpldapadmin

echo "Connect to php ldapadmin:"
echo "  https://$(hostname -I  | sed -e 's/ .*//'):6443"
echo "  Login DN: $admin_dn"
echo "  Password: $admin_pass"

