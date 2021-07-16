#!/bin/bash
#
# References:
# - https://owncloud.github.io/ocis/eos/
# - https://github.com/owncloud/ocis/blob/master/ocis/docker-compose-eos-test.yml
# - ~/ownCloud/release/ocis/test-2020-07-13.txt
#
# This setup should be greatly simplified by
# - https://github.com/owncloud/ocis/pull/519		[POC] setting up tests with eos on drone-ci
# - https://github.com/owncloud/product/issues/165	jira-OCIS-376	Local deployment for EOS with two nodes (scale-out) (CD)
# - https://jira.owncloud.com/browse/OCIS-392		streamline docker-compose.yml
#
# 2020-08-26, jw@owncloud.com
# 2020-11-05, jw@owncloud.com
# 2020-11-11, jw@owncloud.com
# 2020-11-30, jw@owncloud.com

echo "Estimated setup time (when weather is fine): 10 minutes ..."

compose_yml=docker-compose-eos-test.yml
ocis_bin=/usr/local/bin/ocis

if [ -z "$OCIS_VERSION" ]; then
  # export OCIS_VERSION=master
  export OCIS_VERSION=v1.0.0-rc7
  echo "No OCIS_VERSION specified, using $OCIS_VERSION"
  sleep 3
fi
if [ -z "$EOS_OCIS_TAG" ]; then
  export EOS_OCIS_TAG=$(echo $OCIS_VERSION | sed -e 's/v//')
  echo "No EOS_OCIS_TAG specified, using $EOS_OCIS_TAG"
  sleep 3
fi

# use a cx31 -- we need more than 40GB disk space.
source lib/make_machine.sh -t cx31 -u ocis-${OCIS_VERSION}-eos -p git,vim,screen,docker.io,docker-compose,binutils,ldap-utils "$@"
set -x

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1;
fi

version_file=this-is-ocis-$OCIS_VERSION.txt
user_portrait_url=https://upload.wikimedia.org/wikipedia/commons/3/32/Max_Liebermann_Portrait_Albert_Einstein_1925.jpg
user_speech_url=https://upload.wikimedia.org/wikipedia/commons/4/46/03_ALBERT_EINSTEIN.ogg
eos_home_einstein=/eos/dockertest/reva/users/4/4c510ada-c86b-4815-8820-42cdf82c3d51/
eos_uid=20000
eos_gid=30000

INIT_SCRIPT <<EOF

wait_for_ocis () {
  ## it compiles code upon first start. this can take ca 6 minutes.
  while true; do
    docker-compose -f $compose_yml logs --tail=10 ocis
    docker-compose -f $compose_yml ps
    if [ -n "\$(docker-compose -f $compose_yml ps | grep 'Up' | grep '0.0.0.0:9200->9200/tcp')" ]; then
      if [ "\$(curl -s -k https://localhost:9200/.well-known/openid-configuration | grep https: | wc -l)" -gt 3 ]; then
	break
      fi
    fi
    echo " ... waiting for 0.0.0.0:9200 ..."
    sleep 10;
  done
}

wait_for_ldap () {
  # expect nslcd is running.
  while test -z "\$(docker-compose -f $compose_yml exec ocis ps -ef | grep nslcd | grep -v grep)"; do
    echo "waiting for nslcd ...";
    sleep 3;
  done
}

wait_for_eos_fst () {
  # expect (at least) four fst entries.
  while [ "\$(docker-compose -f $compose_yml exec ocis eos fs ls -m | grep host=fst | wc -l)" -lt 4 ]; do
    echo "waiting for four fst to appear in 'eos fs ls' ..."
    sleep 3;
    docker-compose -f $compose_yml exec ocis eos fs ls
  done
}

wait_for_eos_health () {
  echo "Expect to see status 'online', 'ok', 'fine', 'default.0' here:"
  for i in 1 2 3 4 5 6 7 8 9 0; do
    # immediately after start, default.0 is shown as 0B free and 'full'
    docker-compose -f $compose_yml exec ocis eos health -a
    if [ -z "\$(docker-compose -f $compose_yml exec ocis eos health -m | grep status=full)" ]; then
      break	# nothing is full, carry on.
    fi
    sleep 2
  done
}

echo -e "#! /bin/sh\ncd ~/ocis/ocis\ndocker-compose -f $compose_yml logs -f --tail=10 --no-color ocis" > /usr/local/bin/show_logs
chmod a+x /usr/local/bin/show_logs


cd ~
rm -rf ./ocis
docker images -q | xargs -r docker rmi --force
docker system prune --all --force
docker volume prune --force


git clone https://github.com/owncloud/ocis.git -b $OCIS_VERSION
cd ocis/ocis

## .env hacking is always needed. Otherwise we only have localhost endpoints in
## curl -k https://$IPADDR:9200/.well-known/openid-configuration | grep https:
## and the webpage remains blank. No login possible.
#
# BRANCH is actually a buildarg in docker/eos-ocis/Dockerfile
echo >  .env OCIS_DOMAIN=$IPADDR
echo >> .env BRANCH=$OCIS_VERSION
echo >> .env EOS_OCIS_TAG=$EOS_OCIS_TAG
echo >> .env STORAGE_FRONTEND_UPLOAD_DISABLE_TUS=false

cat .env >> config/eos-docker.env

##################################################
# Keep the code below in sync with https://github.com/owncloud/ocis/blob/master/docs/eos.md

## 1. Start eos & ocis containers
##
## Start the eos cluster and ocis via the compose stack.
##
docker-compose -f $compose_yml up -d
wait_for_ocis

## FIXME: the identifier-registration.yaml now only exists inside the continer. Need to patch it there...
## FIXME: without this we get http error 400.  when trying to login. The log has 'invalid redirect: https://95.216.209.166:9200/oidc-callback.html'
## FIXME: -> https://github.com/owncloud/ocis/issues/812
docker-compose -f $compose_yml exec ocis sed -i -e 's@://localhost:9@://$IPADDR:9@' /config/identifier-registration.yaml || true
docker-compose -f $compose_yml exec ocis sed -i -e 's@://localhost:9@://$IPADDR:9@' /ocis/config/identifier-registration.yaml || true
# # docker-compose -f $compose_yml restart ocis
docker-compose -f $compose_yml stop ocis
docker-compose -f $compose_yml up -d
# wait_for_ocis


## Check that the OS in the ocis container can now resolve einstein or the other demo users
##
wait_for_ldap
docker-compose -f $compose_yml exec ocis id einstein
for i in 1 2 3 4 5 6 7 8 9 0; do
  docker-compose -f $compose_yml exec ocis id einstein && break
  sleep 5
done
docker-compose -f $compose_yml exec ocis id einstein | grep -q 'no such user' && exit 1
# uid=20000(einstein) gid=30000 groups=30000


## new in latest eos.md:
## indeed that path does not exist... as Joern said, I should not do it???
# docker-compose exec ocis eos mkdir -p /eos/dockertest/ocis/metadata
# docker-compose exec ocis eos chown 2:2 /eos/dockertest/ocis/metadata
# docker-compose exec ocis $ocis_bin kill storage-metadata
# docker-compose exec -e STORAGE_METADATA_DRIVER=eos -e STORAGE_METADATA_ROOT=/eos/dockertest/ocis/metadata ocis $ocis_bin run storage-metadata

# still needed: enable trashbin
docker-compose -f $compose_yml exec ocis eos space config default space.policy.recycle=on
docker-compose -f $compose_yml exec ocis eos recycle config --add-bin /eos/dockertest/reva/users
docker-compose -f $compose_yml exec ocis eos recycle config --size 1G

# show some nice stats
docker-compose -f $compose_yml exec ocis eos fs ls --io | sed -e 's/  / /g'
docker-compose -f $compose_yml exec ocis eos space ls --io


if [ -f ~/INIT.bashrc ]; then
  echo >  $version_file '\`\`\`'
  echo >> $version_file "OCIS_VERSION:         $OCIS_VERSION"
  echo >> $version_file "ocis --version:       \$(docker-compose -f $compose_yml exec ocis $ocis_bin --version)"
  echo >> $version_file "git log:              \$(git log --decorate=full | head -1)"
  echo >> $version_file "eos --version:        \$(docker-compose -f $compose_yml exec ocis eos --version | head -1)"
  echo >> $version_file "xrootd -v:            \$(docker-compose -f $compose_yml exec ocis /opt/eos/xrootd/bin/xrootd -v)"
  # echo >> $version_file "rpm -q quarkdb:       \$(docker-compose -f $compose_yml exec quark-3 rpm -q quarkdb)"
  # echo >> $version_file "rpm -q zeromq:        \$(docker-compose -f $compose_yml exec quark-3 rpm -q zeromq)"
  # echo >> $version_file "rpm -q eos-protobuf3: \$(docker-compose -f $compose_yml exec quark-3 rpm -q eos-protobuf3)"
  echo >> $version_file "$ocis_bin contains:"
  docker-compose -f $compose_yml exec ocis strings $ocis_bin | grep '^dep\s.*owncloud' | sort -u >> $version_file
  ## FIXME: six of these versions are still unintialized. E.g. "ocis-phoenix   v0.0.0-00010101000000-000000000000"


  # make some files appear within the owncloud
  echo '\`\`\`' > ~/INIT.bashrc.md
  cat ~/INIT.bashrc >>  ~/INIT.bashrc.md
  docker cp ~/INIT.bashrc.md ocis:/
  docker cp $version_file    ocis:/

  # Fix https://github.com/owncloud/product/issues/127
  # try auto-create einstein's home
  curl -k -X PROPFIND https://$IPADDR:9200/remote.php/webdav -u einstein:relativity

  docker-compose -f $compose_yml exec ocis eos -r $eos_uid $eos_gid mkdir $eos_home_einstein/init
  docker-compose -f $compose_yml exec ocis eos -r $eos_uid $eos_gid cp /$version_file /INIT.bashrc.md $eos_home_einstein/init/

  docker-compose -f $compose_yml exec ocis curl $user_portrait_url -so /tmp/Portrait.jpg
  docker-compose -f $compose_yml exec ocis curl $user_speech_url   -so /tmp/Speech.ogg
  docker-compose -f $compose_yml exec ocis eos -r $eos_uid $eos_gid cp /tmp/Speech.ogg /tmp/Portrait.jpg $eos_home_einstein/
fi


echo "Now log in with user einstein at https://${IPADDR}:9200"
echo "... and accept the self signed cert"
docker-compose -f $compose_yml exec ocis eos newfind /eos

uptime
sleep 5
cat <<EOM

## To list the globally trashed files (all users):
# docker-compose exec ocis eos -r 0 0 recycle ls -g

---------------------------------------------
# This shell is now connected to root@$IPADDR
# Connect your browser or client to

   https://$IPADDR:9200

---------------------------------------------
EOM
EOF
