#! /bin/bash
#
# 2022-12-17, jw@owncloud.com
#
# References:
#  - https://doc.owncloud.com/server/next/admin_manual/configuration/user/oidc/oidc.html
#    Says, "A distributed memcache setup - such as Redis or Memcached - is required to operate this app"
#    -> we don't have that, and it still works.... Oooh!
#  - https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_apps_sample_php_parameters.html#app-openid-connect-oidc
#  - setup with authelia or authenitic IDP: https://helgeklein.com/blog/owncloud-infinite-scale-with-openid-connect-authentication-for-home-networks/

source ./env.sh	# needed for $webroute

# CAUTION: the client id and secret must be set from within the keycloak admin interface!
keycloak_realm=owncloud.works
keycloak_base_url=https://keycloak-20221129.jw-qa.owncloud.works:19443
keycloak_client_id=$oc10_fqdn
keycloak_client_secret=g6XbJF3r____dummy_value____qT5X6

keycloak_url="$keycloak_base_url/realms/$keycloak_realm"
keycloak_admin_url="$keycloak_base_url/admin/master/console/#/$keycloak_realm"

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
    RewriteRule .* $webroute/index.php/apps/openidconnect/config [P]
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
// Without autoprovisioning, keycloak users end up in owncloud with
// "User with kalice@example.com is not known."
//
\$CONFIG = [
  'openid-connect' => [
    'provider-url'    => '$keycloak_url',
    'client-id'       => '$keycloak_client_id',
    'client-secret'   => '$keycloak_client_secret',
    'loginButtonName' => 'Keycloak OIDC',
    // 'post_logout_redirect_uri' => 'https://$oc10_fqdn/$webroute/index.php',	// FIXME: https://github.com/owncloud/openidconnect/issues/276
    // mode: This is the attribute in the owncloud accounts table to search for users. The default value is email. The alternative value is: userid.
    'auto-provision'  => [
      // explicit enable the auto provisioning mode
      'enabled' => true,
      // documentation about standard claims: https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims
      'mode' => 'email',	// FIXME: https://github.com/owncloud/openidconnect/issues/277
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

cat <<EO_AZ_CONF>/var/www/owncloud/config/oidc-azure.config.php.disabled
// see also: HOWTO/azure-ad.txt
//
<?php
\$CONFIG = array (
  'http.cookie.samesite' => 'None',
  'openid-connect' => [
    // from Directory (tenant) ID
    //      Verzeichnis-ID (mandant)
    'provider-url' => 'https://login.microsoftonline.com/ccb3d46e-f612-456c-ac25-18eecd3c7147/v2.0',
    // from Application (client) ID
    //      Anwendungs-ID (client)
    'client-id' => 'd4cf3f6c-8fe2-4531-9416-62b494489773',
    // from Certificates & Secrets -> New -> Value
    //      Zertifikate & Geheimnisse -> Neuer geheimer Clientschlüssel -> name: oidc220rc1, ablauf: 2025-01-25 -> Wert
    'client-secret' => 'XXX_DUMMY_XXX',
    'loginButtonName' => 'Azure AD (oidc)',
    'scopes' => [
          // from Expose an API -> Scopes: (same as client-id above)
          'openid', 'api://XXX_DUMMY_XXX/owncloud', 'profile', 'email', 'offline_access'
    ],
    'auto-provision' => [
        // explicit enable the auto provisioning mode
        'enabled' => true,
        // documentation about standard claims: https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims
        // only relevant in userid mode,  defines the claim which holds the email of the user
        'email-claim' => 'email',
        // defines the claim which holds the display name of the user
        'display-name-claim' => 'given_name',
        // defines the claim which holds the picture of the user - must be a URL
        // 'picture-claim' => 'picture',        // https://github.com/owncloud/openidconnect/issues/138
        // defines a list of groups to which the newly created user will be added automatically
        'groups' => ['admin', 'guests', 'employees'],
    ],
    'mode' => 'email',
    'autoRedirectOnLoginPage' => false,
    'search-attribute' => 'unique_name',
    'use-access-token-payload-for-user-info' => true,
    'redirect-url' => 'https://$oc10_fqdn/$webroute/index.php/apps/openidconnect/redirect',
    // bring us back to the login page....
    'post_logout_redirect_uri' => 'https://$oc10_fqdn/$webroute/index.php',
  ]
);
EO_AZ_CONF

cat << EOM | sed -e "s/^/openidconnect: /g" >>  ~/POSTINIT.msg
CAUTION: Written keycloak config with dummy values.
Please enter this owncloud instance as a client in keycloak.
The admin interface may be found at $keycloak_admin_url/clients
 0) Select Realm: [owncloud.works]

 1) Manage -> Clients -> Create client
 - Client type:         OpenID Connect
 - Client ID:           $oc10_fqdn
 -> Next - Client Authentication: [x] On -> Save

 2) Client details $oc10_fqdn -> Settings tab - Access Settings
   - Root URL:                  https://$oc10_fqdn
   - Home URL:                  https://$oc10_fqdn
   - Valid redirect URIs:       [*]
   - Valid post logout redirect URIs:   [+]
   - Web origins                        [+] [*] -> Save

 3) Client details $oc10_fqdn -> Roles tab
  - Create Role - Role name:  [admin] -> Save

 4) Client details $oc10_fqdn -> Client scopes tab
  -> Click on [ ] oc10110-20221130.jw-qa.owncloud.works-dedicated
    Mappers tab -> [Add predefined mapper] -> search: client roles -> [x] client roles -> Add
    -> Click on [client roles]
        (Client ID:             $oc10_fqdn
        Token Claim Name:       [roles] -> Save

 5) Client details $oc10_fqdn -> Credentials tab
  -> Client secret -> copy/paste into o/config/oidc-keycloak.config.php

 6) Client scopes tab -> Click on [ ] $oc10_fqdn-dedicated
      -> Scope tab -> Full Scope Allowed:       [ ] Off
        [Assign role] -> [x] default-roles-owncloud.works -> Assign

Then paste the new client id (!) and secret into o/config/oidc-keycloak.config.php

To switch from keycloak to azure,
 - fill in variables in o/config/oidc-azure.config.php.disabled
 - mv o/config/oidc-azure.config.php{.disabled,}
 - mv o/config/oidc-keycloak.config.php{,.disabled}
EOM

