#!/bin/bash
#
# References:
# - https://doc.owncloud.com/ocis/next/deployment/services/s-list/web.html
# - https://doc.staging.owncloud.com/ocis/next/depl-examples/ubuntu-compose/ubuntu-compose-hetzner.html	(this is for 5.0.6 !)
# - https://owncloud.dev/ocis/deployment/ocis_full/
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

compose_dir=/root/ocis/deployments/examples/ocis_full	# only available since tag v6.0.0
ocis_bin=/usr/bin/ocis
export REVA_CLI_VERSION=2.19.3
projname=$(basename $compose_dir)

if [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo "Usage:"
  echo "	$0 [ocm] ..."
  echo "	env BASE_DOMAIN=ocis2-DATE $0 [ocm] ..."
  echo "	env OCIS_VERSION=master BASE_DOMAIN=ocis2-latest-DATE $0 ocm"
  echo "	env OCIS_DOCKER_IMAGE=owncloud/ocis-rolling BASE_DOMAIN=fedi-rolling-DATE $0 ocm"
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
if [ -z "$OCIS_DOCKER_IMAGE" ]; then
  export OCIS_DOCKER_IMAGE=owncloud/ocis
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
mydir="$(dirname -- "$(readlink -f -- "$0")")"	# find related scripts, even if called through a symlink.
source $mydir/lib/make_machine.sh -t cx31 -u ocis-${OCIS_VERSION} -p git,vim,screen,xattr,file,jq,apache2-utils,docker.io,binutils,ldap-utils,golang-go,python3-pip "$@"
set -x

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1
fi
scp $mydir/bin/ocis/* root@$IPADDR:/usr/local/bin

INIT_SCRIPT <<EOF

export EDITOR=vim
echo >> .bashrc "export EDITOR=vim"
echo >> .bashrc "export ADMIN_PASS=$admin_pass"
echo >> .bashrc "export OCIS_API_PASS=$admin_pass"
export LC_ALL=C

useradd -u 1000 ocis	# so that we can refer to the ocis user in ocmproviders-add.sh

TASKd=\$HOME/tasks/ocis
test -e \$TASKd/env.sh || ln -s ~/env.sh \$TASKd/env.sh

## FIXME: when docker compose was started using the /root/o symlink, we must always use the symlink, otherwise it complains 'service "ocis" is not running'
echo -e "#! /bin/sh\ncd /root/$compose_dir\ndocker compose logs -f --tail=10 --no-color ocis" > /usr/local/bin/show_logs
echo -e "#! /bin/sh\ncd /root/$compose_dir\ndocker compose exec ocis $ocis_bin \"\\\$@\"" > /usr/local/bin/ocis.sh
chmod a+x /usr/local/bin/*

# docker-compose v1 or v2?
## /usr/bin/docker-compose is the legacy v1 python script.
## docker compose is the supported go implementation of v2. It is missing in 22.04 jammy. We have to add the upstream docker repo
# FROM: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
echo "deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \$(. /etc/os-release && echo "\$VERSION_CODENAME") stable" > /etc/apt/sources.list.d/docker.list
apt update
apt install -y docker-compose-plugin

# jq was an apt package, but yq is a pip package.
# msgpack is needed by mpkq
pip install yq msgpack

# used by make_machine.sh / cf_dns --poll
echo >  ~/env.sh "base_fqdn=$BASE_DOMAIN"
echo >> ~/env.sh "CERTBOT=none"
echo >> ~/env.sh "DNS_WILDCARD=true"

git clone https://github.com/owncloud/ocis.git -b $OCIS_VERSION --depth 1
ln -s $compose_dir o
ln -s /root/volume/ocis-data/storage o/storage	# make dump_decomposedsh and list_decomposed.sh happy.

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

# FIXME:
# docker compose exec depends on the $PWD variable for "finding" the current directory. How silly is this?
set -o physical         # tcsh: set symlinks=chase
echo "set -o physical" >> /etc/bash.bashrc

cd $compose_dir
# nano .env //enter your domain
dot_env_last_line=\$(grep COMPOSE_FILE= .env)

cat >> .env <<EOT
# --- edits by $0 ---
IPADDR=$IPADDR
# ----
OCIS_DOCKER_TAG=$OCIS_DOCKER_TAG
OCIS_DOCKER_IMAGE=$OCIS_DOCKER_IMAGE
ADMIN_PASSWORD=$admin_pass
DEMO_USERS=true
LOG_LEVEL=debug
INSECURE=false
OCIS_WEB_YML=:ocis-web.yml
OCIS_DOMAIN=$OCIS_DOMAIN
# FIXME: next two should not be hardcoded here. They should come from tasks/ocis/ocm.sh
FRONTEND_OCS_INCLUDE_OCM_SHAREES=true
FRONTEND_OCS_ENABLE_DENIALS=true
FRONTEND_OCS_LIST_OCM_SHARES=true
#
PROXY_ENABLE_BASIC_AUTH=true
OCIS_SHOW_USER_EMAIL_IN_RESULTS=true
# ---
TRAEFIK_DOMAIN=traefik.$BASE_DOMAIN
TRAEFIK_ACME_MAIL=qa@owncloud.com
TRAEFIK_DASHBOARD=true
## FIXME: 5.0 docs and the .env says plaintext admin:admin,  4.0 docs says htpaswd encoded. 6.0 example has it htpasswd encoded again.
##   According to YAML specification we need to escape the $ symbol by doubling it ($$). Or put the entire string into doublequotes.
##   (The latter is IMHO a bad choice, as it contradicts the distinction betwwen double and single quotes seen in other languages.)
TRAEFIK_BASIC_AUTH_USERS=\$(htpasswd -nb admin $admin_pass | sed -e 's@\\\$@\$\$@g')
# ---
# FIXME: this .env should use an OCIS_BASE_DOMAIN variable and default this to owncloud.test,
# instead of defaulting eigth times the same thing.
INBUCKET_DOMAIN=mail.$BASE_DOMAIN
MINIO_DOMAIN=minio.$BASE_DOMAIN
COLLABORA_DOMAIN=collabora.$BASE_DOMAIN
WOPISERVER_DOMAIN=wopi.$BASE_DOMAIN
COMPANION_DOMAIN=companion.$BASE_DOMAIN
ONLYOFFICE_DOMAIN=onlyoffice.$BASE_DOMAIN
WOPISERVER_ONLYOFFICE_DOMAIN=wopi-oo.$BASE_DOMAIN
EOT


# https://docs.docker.com/compose/compose-file/13-merge/
# -> A YAML mapping gets merged by adding missing entries and merging the conflicting ones.
#    (later yaml files overwrite values from earlier yaml files, no conflict is escalated)
# -> A YAML sequence is merged by appending values from the overriding Compose file to the previous one.
#    (duplicates are not merged)
## create a ocis-web.yml that adds one volume containing our web.yaml, so that we
## can configure the web service.
## (We can also use !reset and !override pragmas, nice!)
cat <<EOT > ocis-web.yml
services:
  ocis:
    volumes:
      - ./config/ocis/web.yaml:/etc/ocis/web.yaml
      - ./patch_ocis_yaml.sh:/etc/ocis/patch_ocis_yaml.sh
    # FIXME: hack into the generated /etc/ocis/ocis.yaml
    command: [ "-c", "ocis init || true; /etc/ocis/patch_ocis_yaml.sh || true; ocis server" ]
    environment:
      # seen in github.com/owncloud/ocis/tests/config/drone/.env-federation
      FRONTEND_OCS_INCLUDE_OCM_SHAREES: "${FRONTEND_OCS_INCLUDE_OCM_SHAREES:-true}"
      FRONTEND_OCS_LIST_OCM_SHARES: "${FRONTEND_OCS_LIST_OCM_SHARES:-true}"
      FRONTEND_ENABLE_FEDERATED_SHARING_INCOMING: "${FRONTEND_ENABLE_FEDERATED_SHARING_INCOMING:-true}"
      FRONTEND_ENABLE_FEDERATED_SHARING_OUTGOING: "${FRONTEND_ENABLE_FEDERATED_SHARING_OUTGOING:-true}"
      OCIS_ADD_RUN_SERVICES: "${OCIS_ADD_RUN_SERVICES:-ocm}"
      GRAPH_INCLUDE_OCM_SHAREES: "${GRAPH_INCLUDE_OCM_SHAREES:-true}"
      OCIS_DECOMPOSEDFS_PROPAGATOR: "${OCIS_DECOMPOSEDFS_PROPAGATOR:-async}"

EOT
mkdir -p ~/volume/
ln -s /var/lib/docker/volumes/${projname}_certs/_data ~/volume/traefik-certs
ln -s /var/lib/docker/volumes/${projname}_ocis-config/_data ~/volume/ocis-config
ln -s /var/lib/docker/volumes/${projname}_ocis-data/_data ~/volume/ocis-data
ln -s ~/volume/ocis-data ~/data
# HACK: make wopi.secret appear as needed by the collaboration service.
cat <<EOT > patch_ocis_yaml.sh
set -x
grep -q 'wopi:' /etc/ocis/ocis.yaml && exit 0	# everything okay, we already have a wopi: key.
# else: ocis 5.1.x docker has a wopiapp: key, we need to copy the secret from there.
sed -i -e 's@\\bsecret:\\s\\(\\S*\\)@secret: \\1\\n  wopi:\\n    secret: \\1@' /etc/ocis/ocis.yaml
EOT
chmod a+x patch_ocis_yaml.sh

# FIXME: how do I find a list of available apps? How do I find the list of default apps?
cat <<EOT >> config/ocis/web.yaml
extra:
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
      - ocm
EOT
# yaml keys must be uniq, we can only merge by appending somethin with a diffeent name, and then run a jq merge operator.
# funny but nice: the += array merge does not explode when .web.config.apps is absent.
# this also merges correctly, when web.yaml was completely absent, and also when it has external-apps in config.
yq '.web.config.apps += .extra.config.apps | del(.extra)' config/ocis/web.yaml -y > temp.yaml; mv temp.yaml config/ocis/web.yaml

for app_name in \$PARAM; do
  if [ -f \$TASKd/\$app_name.sh ]; then
    echo "ERROR: \$app requested. NOT IMPL. Running \$TASKd/\$app_name.sh ..." | tee -a ~/POSTINIT.msg
  else
    echo "ERROR: \$TASKd/\$app_name.sh not found." | tee -a ~/POSTINIT.msg
  fi
done

# Three \\\ preserve one $ sign here.
# HACK: the colon separator is part of OCIS_WEB_YML as with all the other entries in this line.
echo "\$dot_env_last_line\\\${OCIS_WEB_YML:-}" >> .env

echo "+ docker compose up -d"
docker compose up -d
sleep 10

# install and configure reva cli
mkdir -p ~/go/bin
wget https://github.com/cs3org/reva/releases/download/v${REVA_CLI_VERSION}/reva_v${REVA_CLI_VERSION}_linux_amd64 -O ~/go/bin/reva
chmod a+x ~/go/bin/reva
api_gw=\$(ocis.sh version | grep com.owncloud.api.gateway | tr -d ' ' | cut -d '|' -f 3)
(echo admin; echo "\$admin_pass") | script -c "reva -insecure -host \$api_gw login basic"
# we now should have .reva.config and .reva-token
# we still must call it as 'reva -insecure'
echo 'alias reva="reva -insecure"' >> ~/.bash_aliases
reva -insecure whoami

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
Check if something is restarting:
 - cd ~/o; docker compose ls
 - docker ps -a
 - docker logs o-collaboration-1

After changing configs:
  cd ~/o; docker compose restart

---------------------------------------------
EOM
EOF
