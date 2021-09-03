#! /bin/bash
#
# 2021-09-02, jw@owncloud.com

pushd /var/www/owncloud/apps/
sed -i -e 's/3600/180/g' oauth2/lib/Db/AccessToken.php
sed -i -e 's/600/120/g'  oauth2/lib/Db/AuthorizationCode.php
grep "EXPIRATION_TIME =" oauth2/lib/Db/*.php
# oauth2/lib/Db/AccessToken.php:        const EXPIRATION_TIME = 180;
# oauth2/lib/Db/AuthorizationCode.php:  const EXPIRATION_TIME = 120;
popd

occ app:enable oauth2

cat << EOM >>  ~/POSTINIT.msg
oauth2:  AccessToken REFRESH_TIMEOUT 180 seconds
oauth2:  Please enable https with proper dns. Oauth2 requires an encrypted connection.
oauth2:  mitmproxy reference: https://github.com/owncloud/enterprise/issues/4270#issuecomment-729922143
oauth2:  Try: grep 'generating token' /var/www/owncloud/data/owncloud.log | grep mirall | jq '.time+" - "+.user'
--------------------------------------------------------
EOM
