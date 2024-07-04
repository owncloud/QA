#!/bin/bash
#
# References:
# - https://streaming.media.ccc.de/osc24/relive/4662 33:01
# - https://owncloud.dev/ocis/deployment/ocis_traefik/
# - https://github.com/owncloud/ocis/blob/master/deployments/examples/ocis_traefik/docker-compose.yml
# - https://owncloud.github.io/ocis/deployment/basic-remote-setup/
# - ~/ownCloud/release/ocis/test-*.txt,issues.txt
# - https://doc.staging.owncloud.com/ocis/next
#
# 2024-07-02, jw@owncloud.com
#

echo "Estimated setup time (when weather is fine): 6 minutes ..."

compose_dir_orig=/root/ocis/deployments/examples/ocis_full	# only available until tag v6.0.0, no longer in master.
compose_yml_orig=docker-compose.yml
# we call the above via a wapper:
compose_dir=/root/run/ocis_full
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
  echo "No OCIS_VERSION specified, using $OCIS_VERSION"
  sleep 3
fi
if [ -z "$OCIS_DOCKER_TAG" ]; then
  export OCIS_DOCKER_TAG=$(echo $OCIS_VERSION | sed -e 's/v//')
  test "$OCIS_DOCKER_TAG" = "master" && OCIS_DOCKER_TAG=latest
  echo "No OCIS_DOCKER_TAG specified, using $OCIS_DOCKER_TAG"
  sleep 3
fi

d_tag=$(echo ocis-$OCIS_DOCKER_TAG  | tr '[A-Z]' '[a-z]' | tr . - | sed -e 's/-latest//')-$(date +%m%d)
if [ -z "$BASE_DOMAIN" ]; then
  BASE_DOMAIN=$d_tag
else
  BASE_DOMAIN=$(echo $BASE_DOMAIN | sed -e "s/\bDATE\b/$(date +%Y%m%d)/")
fi
echo "$BASE_DOMAIN" | grep -qF '.' - || BASE_DOMAIN=$BASE_DOMAIN.jw-qa.owncloud.works
export OCIS_DOMAIN=web.$BASE_DOMAIN


admin_pass="admin$(date +%Y%m%d)"	# an unsecure default. To be overridden by env OC10_ADMIN_PASS
test -n "$OC10_ADMIN_PASS" && admin_pass="$OC10_ADMIN_PASS"
test -n "$OCIS_ADMIN_PASS" && admin_pass="$OCIS_ADMIN_PASS"

# It does not work with the ubuntu-20.04-preload server image.
export HCLOUD_SERVER_IMAGE=ubuntu-22.04


# use a cx31 -- we need more than 40GB disk space.
source lib/make_machine.sh -t cx31 -u ocis-${OCIS_VERSION} -p git,vim,screen,xattr,file,jq,apache2-utils,docker.io,binutils,ldap-utils,golang-go,python3-pip "$@"
set -x

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1
fi

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

# used by make_machine.sh / cf_dns --poll
echo >  ~/env.sh "base_fqdn=$BASE_DOMAIN"
echo >> ~/env.sh "CERTBOT=none"
echo >> ~/env.sh "DNS_WILDCARD=true"

git clone https://github.com/owncloud/ocis.git -b $OCIS_VERSION
ln -s $compose_dir_orig o

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do
  test -f ~/CF_DNS.msg && break;
  echo "$i: waiting for CF_DNS.msg"
  sleep 4
done
if grep -q '"success": true,' ~/CF_DNS.msg >/dev/null 2>&1; then
  echo >> ~/POSTINIT.msg "DNS: Domain name registered *.$BASE_DOMAIN"
else
  echo >> ~/POSTINIT.msg "DNS: FAILED to register domain name registered *.$BASE_DOMAIN"
fi

# now we have a DNS Name.

# nano .env //enter your domain
last_line=$(grep COMPOSE_FILE= .env)

cat >> .env <<EOF
# --- edits by $0 ---
IPADDR=$IPADDR
# ----
OCIS_DOCKER_TAG=$OCIS_DOCKER_TAG
ADMIN_PASSWORD=$admin_pass
DEMO_USERS=true
LOG_LEVEL=debug
INSECURE=false
OCIS_WEB_YML=:ocis-web.yml
FRONTEND_OCS_INCLUDE_OCM_SHAREES=true
FRONTEND_OCS_ENABLE_DENIALS=true
# ---
TRAEFIK_DOMAIN=traefik.$BASE_DOMAIN
TRAEFIK_ACME_MAIL=qa@owncloud.com
TRAEFIK_DASHBOARD=true
## FIXME: 5.0 docs and the .env says plaintext admin:admin,  4.0 docs says htpaswd encoded.
TRAEFIK_BASIC_AUTH_USERS_4=\$(htpasswd -nb admin $admin_pass)
TRAEFIK_BASIC_AUTH_USERS=admin:$admin_pass
# ---
INBUCKET_DOMAIN=mail.$BASE_DOMAIN
EOF


echo "$last_line:\${OCIS_WEB_YML:-}" >> .env

# https://docs.docker.com/compose/compose-file/13-merge/
## TODO create a ocis-web.yml that adds one volume 
## We can also use !reset and !override pragmas

:(
docker compose up -d

cat <<EOM >> ~/POSTINIT.msg

---------------------------------------------
# This shell is now connected to root@$IPADDR
# Connect your browser or client to

   https://$OCIS_DOMAIN

   user: admin
   pass: $admin_pass

---------------------------------------------
You may first need to
 - maybe run: ocis.sh webdav health

After changing configs:
  cd o
  docker compose restart

---------------------------------------------
EOM
EOF
