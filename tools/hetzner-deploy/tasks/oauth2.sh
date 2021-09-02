#! /bin/bash
#
# 2021-09-02, jw@owncloud.com

sed -i -e 's/3600/180/g' /var/www/owncloud/apps/oauth2/lib/Db/AccessToken.php
grep 180 /var/www/owncloud/apps/oauth2/lib/Db/AccessToken.php
occ app:enable oauth2
# -> const EXPIRATION_TIME = 180;

cat << EOM >>  ~/POSTINIT.msg
oauth2:  AccessToken REFRESH_TIMEOUT 180 seconds
oauth2:  Please enable https with proper dns. Oauth2 requires an encrypted connection.
oauth2:  mitmproxy reference: https://github.com/owncloud/enterprise/issues/4270#issuecomment-729922143
--------------------------------------------------------
EOM
