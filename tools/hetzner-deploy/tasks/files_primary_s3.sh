#! /bin/bash
#
# References:
#  - https://doc.owncloud.com/server/next/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html#scality-s3
#  - https://confluence.owncloud.com/display/~gleikam/Install+Scality+S3+Server+%28Zenko+CloudServer%29+on+ubuntu+20.04
#  - https://github.com/scality/cloudserver#readme
#  - https://s3-server.readthedocs.io/en/latest/

# source ./env.sh	# probably not needed.

curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
./nodesource_setup.sh

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt update && apt install -y nodejs git make g++ yarn s3cmd screen

git clone https://github.com/scality/S3.git
cd ./S3
yarn cache clean
yarn install --frozen-lockfile

## Caution: Keep in sync with s3cfg and s3prim.config.php below
cat << EOF > conf/authdata.json
{
    "accounts": [{
        "name": "owncloud",
        "email": "jw-qa@owncloud.com",
        "arn": "arn:aws:iam::123456789012:root",
        "canonicalID": "jw-qa@owncloud.com",
        "shortid": "123456789012",
        "keys": [{
            "access": "owncloud",
            "secret": "owncloud"
        }]
    }]
}
EOF

cat << EOF > ~/.s3cfg
[default]
access_key = owncloud
secret_key = owncloud
host_base = localhost:8000
host_bucket = %(bucket).localhost:8000
signature_v2 = False
use_https = False
EOF

## Caution: Keep in sync with s3cfg and authdata.json above
cat <<'EOF' > /var/www/owncloud/config/s3primary.config.php
<?php
$CONFIG = [
    'objectstore' => [
        'class' => 'OCA\Files_Primary_S3\S3Storage',
        'arguments' => [
            // replace with your bucket
            'bucket' => 'owncloud',
            // uncomment to enable server side encryption
            //'serversideencryption' => 'AES256',
            'options' => [
                // version and region are required
                'version' => '2006-03-01',
                // change to your region
                'region'  => 'eu-central-1',
                'credentials' => [
                    // replace key and secret with your credentials
                    'key' => 'owncloud',
                    'secret' => 'owncloud',
                ],
            'use_path_style_endpoint' => true,
            'endpoint' => 'http://localhost:8000/',
            ],
        ],
    ],
];
EOF
chown www-data. /var/www/owncloud/config/s3primary.config.php

screen -d -m -S s3prim -L env REMOTE_MANAGEMENT_DISABLE=1 yarn start

while ! s3cmd mb s3://owncloud 2>/dev/null; do
  # wait for the server to to start...
  echo -n .
  sleep 2
done
grep '"action"' screenlog.0

s3cmd info s3://owncloud
s3cmd du s3://owncloud

occ app:enable files_primary_s3

echo >> ~/POSTINIT.msg "S3:	To view the scality S3 server log: "
echo >> ~/POSTINIT.msg "S5:		screen -D -R s3prim"

