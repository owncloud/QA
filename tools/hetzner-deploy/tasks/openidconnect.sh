#! /bin/bash
#
# 2022-12-17, jw@owncloud.com

source ./env.sh	# probably not needed.

# CAUTION: the client id and secret must be set from within the keycloak admin interface!
keycloak_realm=owncloud.works
keycloak_url=https://keycloak-20221129.jw-qa.owncloud.works:19443/realms/$keycloak_realm
keycloak_client_id=openidconnect-220rc6-20221216
keycloak_client_secret=g6XbJF3raJis7YFB8rXQtrgnWu1qT5X6

occ app:enable openidconnect

# The openidconnect app - when configured correctly - has its config at
#   $oc10_fqdn/index.php/apps/openidconnect/config
# The desktop client expects that info at
#   $oc10_fqdn/.well-known/openid-configuration
# We need a ReWriteRule according to https://doc.owncloud.com/server/next/admin_manual/configuration/user/oidc/oidc.html#set-up-service-discovery
for mod in rewrite proxy proxy_http proxy_connect; do
  a2enmod $mod
done

cat <<EOF>/etc/apache2/conf-available/owncloud-oidc.conf
<Location /.well-known/openid-configuration >
  <IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteRule .* /index.php/apps/openidconnect/config [P]
  </IfModule>
</Location>

# LogLevel alert rewrite:trace8         # make /var/log/apache2/error.log really verbose with rewrite debug output.

SSLProxyEngine On     #This can be omitted if no SSL is used
EOF

a2enconf owncloud-oidc
service apache2 restart


cat <<EOF>/var/www/owncloud/config/oidc-keycloak.config.php
<?php
// Here, provider-url must have the realm/... path, (unlike kopano)
// otherwise owncloud explodes in apps/opeindconnect/redirect with 
// "The provider authorization_endpoint could not be fetched. Make sure your provider has a well known configuration available."
//
// Without autoprovisioning, keycloack users end up in owncloud with 
// "User with kalice@exmaoke.com is not known."
//
\$CONFIG = [
  'openid-connect' => [
    'provider-url'    => '$keycloak_url',
    'client-id'       => '$keycloak_client_id',
    'client-secret'   => '$keycloak_client_secret',
    'loginButtonName' => 'Keycloak OIDC',
    'auto-provision'  => [
      // explicit enable the auto provisioning mode
      'enabled' => true,
      // documentation about standard claims: https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims
      // the mode to search for user in ownCloud - either userid or email
      'mode' => 'email',
      // only relevant in userid mode,  defines the claim which holds the email of the user
      'email-claim' => 'email',
      // defines the claim which holds the display name of the user
      'display-name-claim' => 'name',   // family_name, given_name, email, preferred_username
      // defines the claim which holds the picture of the user - the value of key 'picture' must be a URL
      'picture-claim' => 'picture',
      // defines a list of groups to which the newly created user will be added automatically
      'groups' => ['keycloak'],         // nonexistant owncloud-groups are silently ignored.
      'update' => [
        // update user account info with current information provided by the OpenID Connect provider upon each log in.
        'enabled' => true,              // FIXME: changed display-name-claim from 'given_name' to 'name', logout login kalice, nothing changes.
      ],
    ],
  ],
];

EOF


cat << EOM | sed -e "s/^/openidconnect: /g" >>  ~/POSTINIT.msg
CAUTION: Written keycloak config with dummy values.
Please enter this owncloud instance as a client in keycloak.
The admin interface may be found at $keycloak_base/admin/master/console/#/$keycloak_realm/clients
Then paste the new client id and secret into o/config/oidc-keycloak.config.php
EOM

