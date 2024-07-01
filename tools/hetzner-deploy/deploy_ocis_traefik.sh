#!/bin/bash
#
# References:
# - https://owncloud.dev/ocis/deployment/ocis_traefik/
# - https://github.com/owncloud/ocis/blob/master/deployments/examples/ocis_traefik/docker-compose.yml
# - https://owncloud.github.io/ocis/deployment/basic-remote-setup/
# - ~/ownCloud/release/ocis/test-*.txt,issues.txt
# - https://doc.staging.owncloud.com/ocis/next
#
# 2020-12-15, jw@owncloud.com
# 2024-05-23, jw@owncloud.com
#	based on deploy_ocis_docker_compose.sh, but stripped down and restarted acording to the dev docs.
# 2024-06-03, jw	- local.yaml, web.yaml and .env in my own compose_dir, not messing with the original example code any more.
#                       - refacored ocm init into tasks/ocis/ocm.sh
#

echo "Estimated setup time (when weather is fine): 6 minutes ..."

compose_dir_orig=/root/ocis/deployments/examples/ocis_traefik	# only available until tag v6.0.0, no longer in master.
compose_yml_orig=docker-compose.yml
# we call the above via a wapper:
compose_dir=/root/run/ocis_traefik
compose_yml=local.yml

ocis_bin=/usr/bin/ocis

if [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo "Usage:"
  echo "	$0 [ocm] ..."
  echo "	env BASE_DOMAIN=ocis2-DATE $0 [ocm] ..."
  echo "	env OCIS_VERSION=master BASE_DOMAIN=ocis2-latest-DATE $0 ocm"
  echo ""
  echo "Check tasks/ocis/*.sh for possible command line parameters"
  exit 1
fi

if [ -z "$OCIS_VERSION" ]; then
  export OCIS_VERSION=master
  export OCIS_VERSION=v5.0.5
  echo "No OCIS_VERSION specified, using $OCIS_VERSION"
  sleep 3
fi
if [ -z "$OCIS_DOCKER_TAG" ]; then
  export OCIS_DOCKER_TAG=$(echo $OCIS_VERSION | sed -e 's/v//')
  test "$OCIS_DOCKER_TAG" = "master" && OCIS_DOCKER_TAG=latest
  echo "No OCIS_DOCKER_TAG specified, using $OCIS_DOCKER_TAG"
  sleep 3
fi

OCIS_TRAEFIK_GIT_TAG=$OCIS_VERSION
if [ "$OCIS_TRAEFIK_GIT_TAG" == "master" ]; then
  # the example/ocis_traefik is gone in master.
  OCIS_TRAEFIK_GIT_TAG=v6.0.0
  echo "WARNING: using OCIS_TRAEFIK_GIT_TAG=$OCIS_TRAEFIK_GIT_TAG instead of $OCIS_VERSION"
  echo "WARNING: $0 is based on $compose_dir_orig, which may be deprecated..."
  sleep 5
fi

d_tag=$(echo $OCIS_DOCKER_TAG  | tr '[A-Z]' '[a-z]' | tr . -)-$(date +%m%d)
if [ -z "$BASE_DOMAIN" ]; then
  BASE_DOMAIN=ocis-$d_tag
else
  BASE_DOMAIN=$(echo $BASE_DOMAIN | sed -e "s/\bDATE\b/$(date +%Y%m%d)/")
fi
echo "$BASE_DOMAIN" | grep -qF '.' - || BASE_DOMAIN=$BASE_DOMAIN.jw-qa.owncloud.works
OCIS_DOMAIN=web.$BASE_DOMAIN

admin_pass="admin$(date +%Y%m%d)"	# an unsecure default. To be overridden by env OC10_ADMIN_PASS
test -n "$OC10_ADMIN_PASS" && admin_pass="$OC10_ADMIN_PASS"
test -n "$OCIS_ADMIN_PASS" && admin_pass="$OCIS_ADMIN_PASS"

# It does not work with the ubuntu-20.04-preload server image.
export HCLOUD_SERVER_IMAGE=ubuntu-22.04


# use a cx31 -- we need more than 40GB disk space.
source lib/make_machine.sh -t cx31 -u ocis-${OCIS_VERSION} -p git,vim,screen,xattr,file,jq,apache2-utils,docker.io,docker-compose,binutils,ldap-utils,golang-go,python3-pip "$@"
set -x

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1
fi

version_file=this-is-ocis-$OCIS_VERSION.txt
user_portrait_url=https://upload.wikimedia.org/wikipedia/commons/3/32/Max_Liebermann_Portrait_Albert_Einstein_1925.jpg
# user_speech_url=https://upload.wikimedia.org/wikipedia/commons/4/46/03_ALBERT_EINSTEIN.ogg
user_speech_url=https://www.einstein-website.de/z_biography/einstein1930.mp3

INIT_SCRIPT <<EOF

export LC_ALL=C
TASKd=\$HOME/tasks/ocis
test -e \$TASKd/env.sh || ln -s ~/env.sh \$TASKd/env.sh

echo -e "#! /bin/sh\ncd $compose_dir\ndocker-compose logs -f --tail=10 --no-color ocis" > /usr/local/bin/show_logs
echo -e "#! /bin/sh\ncd $compose_dir\ndocker-compose exec ocis $ocis_bin \"\\\$@\"" > /usr/local/bin/ocis.sh
chmod a+x /usr/local/bin/*

# docker-compose v1 or v2?
## /usr/bin/docker-compose is the legacy v1 python script.
## docker compose is the supported go implementation of v2. It is missing in 22.04 jammy. We have to add the upstream docker repo
# FROM: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
echo "deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \$(. /etc/os-release && echo "\$VERSION_CODENAME") stable" > /etc/apt/sources.list.d/docker.list
apt update
apt install -y docker-compose-plugin

cd ~
## WORKAROUND: the paths are hardcoded to use docker volumes....
ln -s /var/lib/docker/volumes/ocis_traefik_ocis-data/_data data
ln -s /var/lib/docker/volumes/ocis_traefik_ocis-config/_data config
go install go.etcd.io/bbolt/cmd/bbolt@latest	# cli-tool to inspect boltdb files.
export PATH="\$PATH:/root/go/bin"

# used by make_machine.sh / cf_dns --poll
echo >  ~/env.sh "base_fqdn=$BASE_DOMAIN"
echo >> ~/env.sh "CERTBOT=none"
echo >> ~/env.sh "DNS_WILDCARD=true"

rm -rf ./ocis
docker images -q | xargs -r docker rmi --force
docker system prune --all --force
docker volume prune --force

git clone https://github.com/owncloud/ocis.git -b $OCIS_TRAEFIK_GIT_TAG
ln -s $compose_dir_orig o

mkdir -p $compose_dir/{config,data}
cd $compose_dir

## .env hacking is always needed. Otherwise we only have localhost endpoints in
## curl -k https://$IPADDR/.well-known/openid-configuration | grep https:
## and the webpage remains blank. No login possible.
#
cat <<EOT>>.env
"# $0 ---- below"
COMPOSE_FILE=$compose_dir_orig/$compose_yml_orig:local.yml
IPADDR=$IPADDR
OCIS_VERSION=$OCIS_VERSION
INSECURE=false
OCIS_DOCKER_TAG=$OCIS_DOCKER_TAG
OCIS_DOMAIN=$OCIS_DOMAIN
INBUCKET_DOMAIN=mail.$BASE_DOMAIN
TRAEFIK_DOMAIN=traefik.$BASE_DOMAIN
TRAEFIK_ACME_MAIL=qa@owncloud.com
TRAEFIK_DASHBOARD=true
TRAEFIK_BASIC_AUTH_USERS=\$(htpasswd -nb admin $admin_pass)
ADMIN_PASSWORD=$admin_pass
DEMO_USERS=true
OCIS_LOG_LEVEL=debug
## Seen in $compose_yml
## basic auth (not recommended, but needed for eg. WebDav clients that do not support OpenID Connect)
# PROXY_ENABLE_BASIC_AUTH=true
EOT

echo "# ocis_env.sh is where "apps" can add environment variable to the ocis service" > ocis_env.sh

## we also add our own local.yml to override some bad defaults, and allow adding apps to the web service.
cat <<EOT>>local.yml
---
volumes:
  ocis-config:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: $compose_dir/config
  ocis-data:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: $compose_dir/data

services:
  ocis:
    env_file: $compose_dir/ocis_env.sh
    environment:
      XXWEB_UI_CONFIG_FILE: /etc/ocis/web.config-extra.json
    volumes:
EOT

# Unused:
cat <<EOT>>web.config-extra.json
{
	"apps": [ "admin-settings", "draw-io", "epub-reader", "external", "files", "ocm", "pdf-viewer", "preview", "search", "text-editor" ]
}
EOT

# Adding a web.config-extra.json leads to startup errors.
# Adding a web.yaml without setting the WEB_UI_CONFIG_FILE variable works niceley. The name must be web.yaml (my-web-extra.yaml or web.yml do not work!)
# However, in any case, we also must repeat the list of standard apps, we cannot just add one app.
# TODO: find a way to a) inspect the defaults, b) add a delta
cat <<EOT>>web.yaml
common_apps: @common_apps [ "admin-settings", "epub-reader", "external", "files", "pdf-viewer", "preview", "search", "text-editor" ]

web:
  config:
    apps:
      - admin-settings
      - draw-io
      - epub-reader
      - external
      - files
      - pdf-viewer
      - preview
      - search
      - text-editor
EOT
## CAUTION: tasks/ocis/*.sh can assume that web.yaml ends in web.config.apps: at indentation level 6.


for app_name in \$PARAM; do
  if [ -f \$TASKd/\$app_name.sh ]; then
    echo "\$app requested. Running \$TASKd/\$app_name.sh ..."
    source \$TASKd/\$app_name.sh
    ret=\$?
    if [ "\$ret" = 0 ]; then
      echo >> ~/POSTINIT.msg "SUCCESS: \$TASKd/\$app_name.sh"
    else
      echo >> ~/POSTINIT.msg "WARNING: \$TASKd/\$app_name.sh return code \$ret, check log."
    fi
  else
    echo "ERROR: \$TASKd/\$app_name.sh not found." | tee -a ~/POSTINIT.msg
  fi
done

# TODO: check, if we should add our extra file volumes to more services, than just 'ocis'
for svc in ocis; do
  for app_yaml in *.yaml; do
    echo "      - $compose_dir/\$app_yaml:/etc/ocis/\$app_yaml" >> local.yml
  done
done

docker-compose up -d

cat <<EOM > ~/POSTINIT.msg

---------------------------------------------
# This shell is now connected to root@$IPADDR
# Connect your browser or client to

   https://$OCIS_DOMAIN

---------------------------------------------
You may first need to
 - wait some minutes until all services are fully ready, ...
 - maybe run: ocis.sh webdav health

TODO: docs say to run ocis init before starting the server. Clarify: the docker-compose.yml takes care.
TODO: evaluate the health check and build a wait loop.


---------------------------------------------
EOM
EOF
