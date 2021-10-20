# setup for a small local ldap server. 

ocis_ldif_url=https://raw.githubusercontent.com/owncloud/ocis/master/deployments/examples/oc10_ocis_parallel/config/ldap/ldif/
mkdir ldif; cd ldif
wget -c $ocis_ldif_url/10_owncloud_schema.ldif
wget -c $ocis_ldif_url/20_users.ldif
wget -c $ocis_ldif_url/30_groups.ldif
cd ..

## FIXME: The groups file causes an already exists conflict?
rm -f ldif/30_groups.ldif

## FIXME: sAMAccountName is not set. Needed to verify e.g. https://github.com/owncloud/oauth2/pull/307#issuecomment-947578357
cat <<EOF1 > $ocis_ldif_url/10_owncloud_schema.ldif
# This LDIF files describes the ownCloud schema and can be used to
# add two optional attributes: ownCloudQuota and ownCloudUUID
# The ownCloudUUID is used to store a unique, non-reassignable, persistent identifier for users and groups
dn: cn=owncloud,cn=schema,cn=config
objectClass: olcSchemaConfig
cn: owncloud
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.1 NAME 'ownCloudQuota' DESC 'User Quota (e.g. 2 GB)' EQUALITY caseExactMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.2 NAME 'ownCloudUUID' DESC 'A non-reassignable and persistent account ID)' EQUALITY uuidMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.1.16.1 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.3 NAME 'ownCloudSelector' DESC 'A selector attribute for a route in the ownCloud Infinte Scale proxy)' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcAttributeTypes: ( 1.3.6.1.4.1.39430.1.1.4 NAME 'sAMAccountName' DESC 'Originally from LSDN, but openldap does not have that field.' EQUALITY caseIgnoreMatch SUBSTR caseIgnoreSubstringsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 SINGLE-VALUE )
olcObjectClasses: ( 1.3.6.1.4.1.39430.1.2.1 NAME 'ownCloud' DESC 'ownCloud LDAP Schema' AUXILIARY MAY ( ownCloudQuota $ ownCloudUUID $ ownCloudSelector $ sAMAccountName ) )
EOF1

cat <<EOF2 > $ocis_ldif_url/20_users.ldif
dn: ou=users,dc=owncloud,dc=com
objectClass: organizationalUnit
ou: users

# Start dn with uid (user identifier / login), not cn (Firstname + Surname)
dn: uid=einstein,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: einstein
givenName: Albert
sn: Einstein
cn: albert-einstein
sAMAccountName: AlbertEinstein
displayName: Albert Einstein
description: A German-born theoretical physicist who developed the theory of relativity, one of the two pillars of modern physics (alongside quantum mechanics).
mail: einstein@example.org
uidNumber: 20000
gidNumber: 30000
homeDirectory: /home/einstein
ownCloudUUID:: NGM1MTBhZGEtYzg2Yi00ODE1LTg4MjAtNDJjZGY4MmMzZDUx
userPassword:: e1NTSEF9TXJEcXpFNGdKbXZxbVRVTGhvWEZ1VzJBbkV3NWFLK3J3WTIvbHc9PQ==
ownCloudSelector: ocis


dn: uid=marie,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: marie
givenName: Marie
sn: Curie
cn: marie-curie
sAMAccountName: MarieCurie
displayName: Marie Skłodowska Curie
description: A Polish and naturalized-French physicist and chemist who conducted pioneering research on radioactivity.
mail: marie@example.org
uidNumber: 20001
gidNumber: 30000
homeDirectory: /home/marie
ownCloudUUID:: ZjdmYmY4YzgtMTM5Yi00Mzc2LWIzMDctY2YwYThjMmQwZDlj
userPassword:: e1NTSEF9UmFvQWs3TU9jRHBIUWY3bXN3MGhHNnVraFZQWnRIRlhOSUNNZEE9PQ==
ownCloudSelector: oc10

dn: uid=richard,ou=users,dc=owncloud,dc=com
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: ownCloud
objectClass: person
objectClass: posixAccount
objectClass: top
uid: richard
givenName: Richard
sn: Feynman
cn: richard-feynman
sAMAccountName: RichardFeynman
displayName: Richard Phillips Feynman
description: An American theoretical physicist, known for his work in the path integral formulation of quantum mechanics, the theory of quantum electrodynamics, the physics of the superfluidity of supercooled liquid helium, as well as his work in particle physics for which he proposed the parton model.
mail: richard@example.org
uidNumber: 20002
gidNumber: 30000
homeDirectory: /home/richard
ownCloudUUID:: OTMyYjQ1NDAtOGQxNi00ODFlLThlZjQtNTg4ZTRiNmIxNTFj
userPassword:: e1NTSEF9Z05LZTRreHdmOGRUREY5eHlhSmpySTZ3MGxSVUM1d1RGcWROTVE9PQ==
ownCloudSelector: ocis
EOF2

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

