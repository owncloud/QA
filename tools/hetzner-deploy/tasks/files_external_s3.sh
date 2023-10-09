#! /bin/bash
#
# References:
#  - https://doc.owncloud.com/server/next/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html#scality-s3
#  - https://confluence.owncloud.com/display/~gleikam/Install+Scality+S3+Server+%28Zenko+CloudServer%29+on+ubuntu+20.04
#  - https://github.com/scality/cloudserver#readme
#  - https://s3-server.readthedocs.io/en/latest/
#
# TODO: deprecate setup_16.x, use deb package: https://github.com/nodesource/distributions
#
# CAUTION: keep in sync with files_primary_s3 and objectstore

# source ./env.sh	# probably not needed.

secret="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 32)"
if [ -f ~/.s3cfg ]; then
  # may be already there...
  secret=$(sed -ne 's@secret_key\s*=\s*@@p' ~/.s3cfg)
else
  cat << EOF > ~/.s3cfg
[default]
access_key = owncloud
secret_key = $secret
host_base = localhost:8000
host_bucket = %(bucket).localhost:8000
signature_v2 = False
use_https = False
EOF
fi

if [ ! -x ~/nodesource_setup.sh ]; then
  ## update 2022-03-18: Node.js 10.x is no longer actively supported!
  # curl -sL https://deb.nodesource.com/setup_10.x -o ~/nodesource_setup.sh
  curl -sL https://deb.nodesource.com/setup_16.x -o ~/nodesource_setup.sh
  chmod +x ~/nodesource_setup.sh
  ~/nodesource_setup.sh

  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor > /usr/share/keyrings/yarnkey.gpg
  echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" >> /etc/apt/sources.list.d/yarn.list
fi

apt update && apt install -y nodejs git make gcc g++ yarn s3cmd screen netcat

if nc -z localhost 8000; then
  echo "S3 server on localhost:8000 is already running"
else
  # s3 server not yet there. (may have been started by one of the other s3 tasks...)
  git clone https://github.com/scality/cloudserver.git
  cd cloudserver

  yarn cache clean
  ## yarn install usually fails once with
  # error https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz: Extracting tar content of undefined failed,
  # the file appears to be corrupt: "ENOENT: no such file or directory, chmod
  # '/usr/local/share/.cache/yarn/v6/npm-lodash-4.17.21-679591c564c3bffaae8454cf0b3df370c3d6911c-integrity/node_modules/lodash/fp/isArrayBuffer.js'"
  #
  # As long as people are discussing https://github.com/yarnpkg/yarn/issues/4147
  # we'll have to use --frozen-lockfile to actually lock the lockfile, otherwise it is unlocked,
  # updates itself and we get unpredictable dependency versions.
  when=$(date +%s)
  while ! yarn install --frozen-lockfile; do
    echo " ... retrying yarn install ...";
    if [ $(expr $(date +%s) - $when) -gt 600 ]; then
      # why did it take so long? Try clean the cache...
      echo " ... with clean caches after 10 min of bad luck ... ";
      when=$(date +%s)
      yarn cache clean
    fi
    sleep 5
  done
  # still, at runtime, it sometimes fails with Error: Cannot find module 'lodash/assign'
  yarn add lodash

  ## Caution: Keep in sync with s3cfg and s3ext.config.php below
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
            "secret": "$secret"
        }]
    }]
}
EOF
  screen -d -m -S s3server -L env REMOTE_MANAGEMENT_DISABLE=1 yarn start
  cd
fi

for i in 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1; do
  s3cmd mb s3://oc-external 2>/dev/null && break
  # wait for the server to to start...
  echo -n .
  sleep 2
  if ! screen -ls s3server > /dev/null; then
    echo >> ~/POSTINIT.msg "S3:	Starting scality cloudserver failed. See ~/cloudserver/screenlog.0"
    tail ~/cloudserver/screenlog.0
    exit 1
  fi
done
grep '"action"' ~/cloudserver/screenlog.0

s3cmd info s3://oc-external
s3cmd du s3://oc-external
success=$?

occ app:enable files_external_s3

occ files_external:create /s3-bucket files_external_s3 amazons3::accesskey -c bucket=oc-external -c hostname=localhost -c port=8000 -c use_ssl=0 -c use_path_style=0 -c key=owncloud -c secret=$secret

s3cmd put /var/www/owncloud/data/owncloud.log s3://oc-external/logs/oc.log
s3cmd put ~/env.sh s3://oc-external/env.sh.txt

occ file:scan --all	# Do we still suffer from https://github.com/owncloud/files_external_s3/issues/971 ?
app=external_s3
if [ $success -eq 0 ]; then
  cat << EOM | sed -e "s/^/$app: /g" >>  ~/POSTINIT.msg
Storage created: /s3-bucket
To clean up the bucket use:
	s3cmd del --recursive --force s3://oc-external/
EOM
fi

cat << EOM | sed -e "s/^/$app: /g" >>  ~/POSTINIT.msg
To view the scality S3 server log:
	screen -D -R s3server
EOM

