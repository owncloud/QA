#! /bin/bash
#
# Prepare a test setup for openidconnect with an Azure-AD IDP
# (instead of default kopano)

export HOSTNAME_SUFFIX=azure
export OWNCLOUD_RELEASE_DOCKER_TAG=10.9.1

# Pack all this into one bashrc, which is run after everything else. Quoting hell, but works.
#
# Variables used:
#  - OWNCLOUD_DOMAIN	fqdn of the user facing owncloud server
#
export POSTINIT_BASHRC="
oc_hostname=\"\$(sed -ne 's/127.* oc/oc/p' /etc/hosts)\"

# The 'http.cookie.samesite' None setting avoids an error:
# Error in OpenIdConnect:AADSTS50148: The code_verifier does not match the code_challenge supplied in the authorization request for PKCE.

docker_exec () { docker-compose -f ~/compose-playground/compose/merged.yml exec \"\$@\"; }
oc_exec () { docker_exec owncloud \"\$@\"; }
oc_exec sed -i -e \"s/'openid-connect' =>/'openid-connect-off' =>/\" config/config.php
cat <<EO_AZ_CONF | docker_exec -T owncloud sh -c 'cat > config/openidconnect_azure.config.php'
<?php
\\\$CONFIG = array (
  'http.cookie.samesite' => 'None',
  'openid-connect' =>
  array (
    // from Directory (tenant) ID
    'provider-url' => 'https://login.microsoftonline.com/XXX_DUMMY_XXX/v2.0',
    // from Application (client) ID
    'client-id' => 'XXX_DUMMY_XXX',
    // from Certificates & Secrets -> New -> Value
    'client-secret' => 'XXX_DUMMY_XXX',
    'loginButtonName' => 'Azure AD (oidc)',
    'scopes' =>
    array (
          // from Expose an API -> Scopes:
          'openid', 'api://XXX_DUMMY_XXX/owncloud', 'profile', 'email', 'offline_access'
    ),
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
    'redirect-url' => 'https://\$OWNCLOUD_DOMAIN/index.php/apps/openidconnect/redirect',
    // bring us back to the login page....
    'post_logout_redirect_uri' => 'https://\$OWNCLOUD_DOMAIN.owncloud.works/',
  )
);

EO_AZ_CONF

cat <<EOM
= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
ATTENTION: The Kopano IDP config is disabled. The .well-known URL returns empty until the azure-ad config is done.
To finalize the switch to Azure-AD setup do:
0) Add the dns records to cloudflare, as shown above

1) log in at
	https://aad.portal.azure.com and navigate to
	-> Azure Active Directory -> App Registrations -> 'ownCloud-QA'

2) For the next step record the values of
	Directory (tenant) ID		-> provider-url
	Application (client) ID		-> client-id
	Certificates & Secrets->New->Value	-> client-secret
	Expose an API -> Scopes:	-> scopes

3) docker exec -ti compose_owncloud_1 vi config/openidconnect_azure.config.php

	Edit all XXX_DUMMY_XXX placeholders.
	For the next step record the redirect-url and post_logout_redirect_uri seen there.

4) at https://aad.portal.azure.com  -> ownCloud-QA
	-> Manage -> Authenticaton -> Web -> Redirect URIs
		-> Add URI
    		https://\$OWNCLOUD_DOMAIN
    		https://\$OWNCLOUD_DOMAIN/index.php/apps/openidconnect/redirect
		-> Save

5) to convert from config.php config to db config:
	json=\$(php -r 'require(\"config/openidconnect_azure.config.php\"); echo json_encode(\$CONFIG[\"openid-connect\"], JSON_UNESCAPED_SLASHES);' | sed -e 's/(oidc)/(oidc-db)/')
	mv config/openidconnect_azure.config.php  config/openidconnect_azure.config.php.off
	occ config:app:set openidconnect openid-connect --value \"\$json\"
	occ config:system:set http.cookie.samesite --value None

(To switch back to Kopano, change 'openid-connect-off' to 'openid-connect' in config.php and remove openidconnect_azure.config.php)
= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
EOM
"

bash ./deploy_openidconnect_test.sh "$@"
