#!/bin/bash
#
# References:
# - https://owncloud.github.io/ocis/
# - https://owncloud.github.io/ocis/deployment/basic-remote-setup/
# - https://github.com/owncloud/ocis/blob/master/deployments/examples/ocis_traefik/docker-compose.yml
# - ~/ownCloud/release/ocis/test-*.txt,issues.txt
#
# based on make_ocis_eos_compose_test.sh -- but without all the EOS overhead.
# 2020-12-15, jw@owncloud.com

echo "Estimated setup time (when weather is fine): 2 minutes ..."

compose_subdir=deployments/examples/ocis_traefik
compose_yml=docker-compose.yml
ocis_bin=/usr/bin/ocis

if [ -z "$OCIS_VERSION" ]; then
  # export OCIS_VERSION=master
  export OCIS_VERSION=v1.0.0-rc7
  echo "No OCIS_VERSION specified, using $OCIS_VERSION"
  sleep 3
fi
if [ -z "$OCIS_DOCKER_TAG" ]; then
  export OCIS_DOCKER_TAG=$(echo $OCIS_VERSION | sed -e 's/v//')
  test "$OCIS_DOCKER_TAG" = "master" && OCIS_DOCKER_TAG=latest
  echo "No OCIS_DOCKER_TAG specified, using $OCIS_DOCKER_TAG"
  sleep 3
fi

d_tag=$(echo $OCIS_DOCKER_TAG  | tr '[A-Z]' '[a-z]' | tr . -)-$(date +%m%d)
BASE_DOMAIN=ocis-$d_tag.jw-qa.owncloud.works
TRAEFIK_DOMAIN=traefik.$BASE_DOMAIN
OCIS_DOMAIN=web.$BASE_DOMAIN

# use a cx31 -- we need more than 40GB disk space.
source lib/make_machine.sh -t cx31 -u ocis-${OCIS_VERSION} -p git,vim,screen,docker.io,docker-compose,binutils,ldap-utils "$@"
set -x

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1;
fi

version_file=this-is-ocis-$OCIS_VERSION.txt
user_portrait_url=https://upload.wikimedia.org/wikipedia/commons/3/32/Max_Liebermann_Portrait_Albert_Einstein_1925.jpg
# user_speech_url=https://upload.wikimedia.org/wikipedia/commons/4/46/03_ALBERT_EINSTEIN.ogg
user_speech_url=https://www.einstein-website.de/z_biography/einstein1930.mp3

INIT_SCRIPT <<EOF

wait_for_ocis () {
  ## it compiles code upon first start. this can take ca 6 minutes.
  while true; do
    docker-compose -f $compose_yml logs --tail=10 ocis
    docker-compose -f $compose_yml ps
    if [ -n "\$(docker-compose -f $compose_yml ps | grep 'Up' | grep '0.0.0.0:443->443/tcp')" ]; then
      if [ "\$(docker-compose exec ocis wget -O - http://localhost:9200/.well-known/openid-configuration | grep https: | wc -l)" -gt 3 ]; then
	break
      fi
      echo " ... 0.0.0.0:443 is up, but no .well-known seen."
    else
      echo " ... waiting for a service at 0.0.0.0:443 ..."
    fi
    sleep 10;
  done
}

echo -e "#! /bin/sh\ncd ~/ocis/$compose_subdir\ndocker-compose -f $compose_yml logs -f --tail=10 --no-color ocis" > /usr/local/bin/show_logs
chmod a+x /usr/local/bin/show_logs

cd ~
rm -rf ./ocis
docker images -q | xargs -r docker rmi --force
docker system prune --all --force
docker volume prune --force

git clone https://github.com/owncloud/ocis.git -b $OCIS_VERSION
cd ~/ocis/$compose_subdir

## .env hacking is always needed. Otherwise we only have localhost endpoints in
## curl -k https://$IPADDR/.well-known/openid-configuration | grep https:
## and the webpage remains blank. No login possible.
#
echo >> .env IPADDR=$IPADDR
echo >> .env OCIS_VERSION=$OCIS_VERSION
echo >> .env OCIS_DOCKER_TAG=$OCIS_DOCKER_TAG
echo >> .env OCIS_DOMAIN=$OCIS_DOMAIN
echo >> .env TRAEFIK_DOMAIN=$TRAEFIK_DOMAIN
echo >> .env OCIS_LOG_LEVEL=debug

docker-compose -f $compose_yml up -d
wait_for_ocis

if [ -f ~/INIT.bashrc ]; then
  echo >  ./$version_file '\`\`\`'
  echo >> ./$version_file "OCIS_VERSION:         $OCIS_VERSION"
  echo >> ./$version_file "ocis --version:       \$(docker-compose -f $compose_yml exec ocis $ocis_bin --version)"
  echo >> ./$version_file "git log:              \$(git log --decorate=full | head -1)"
  echo >> ./$version_file "$ocis_bin contains:"
  docker-compose -f $compose_yml exec ocis strings $ocis_bin | grep '^dep\s.*owncloud' | sort -u >> $version_file
  ## FIXME: six of these versions are still unintialized. E.g. "ocis-phoenix   v0.0.0-00010101000000-000000000000"

  # make some files appear within the owncloud
  echo '\`\`\`' > ~/INIT.bashrc.md
  cat ~/INIT.bashrc >>  ~/INIT.bashrc.md
  wget $user_speech_url	  -O speech.ogg
  wget $user_portrait_url -O portrait.jpg

  echo "127.0.0.1 $OCIS_DOMAIN" >> /etc/hosts	# local DNS entry, in case remote DNS is not yet set up
  # First auto-create einstein's home ...
  curl -k -u einstein:relativity -X PROPFIND         https://$OCIS_DOMAIN/remote.php/webdav
  # ... then prepopulating some files
  curl -k -u einstein:relativity -X MKCOL            https://$OCIS_DOMAIN/remote.php/webdav/init
  curl -k -u einstein:relativity -T ./speech.ogg     https://$OCIS_DOMAIN/remote.php/webdav/speech.ogg
  curl -k -u einstein:relativity -T ./portrait.jpg   https://$OCIS_DOMAIN/remote.php/webdav/portrait.jpg
  curl -k -u einstein:relativity -T ./$version_file  https://$OCIS_DOMAIN/remote.php/webdav/init/$version_file
  curl -k -u einstein:relativity -T ~/INIT.bashrc.md https://$OCIS_DOMAIN/remote.php/webdav/init/INIT.bashrc.md
fi

echo "Now log in with user einstein at https://${OCIS_DOMAIN}"

uptime
sleep 5
cat <<EOM

---------------------------------------------
# This shell is now connected to root@$IPADDR
# Connect your browser or client to

   https://$OCIS_DOMAIN

# you may first need to add the DNS entries at https://dash.cloudflare.com
	$IPADDR *.$BASE_DOMAIN

# try also

   curl -k -s https://$OCIS_DOMAIN/.well-known/openid-configuration | grep https

   curl -k -X PROPFIND https://$OCIS_DOMAIN/remote.php/webdav -u einstein:relativity

# if login fails, try

   docker-compose exec ocis bash -c 'ocis kill glauth; sleep 5; ocis glauth server &'

---------------------------------------------
EOM
EOF
