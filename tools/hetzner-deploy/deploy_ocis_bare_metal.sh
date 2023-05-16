#!/bin/bash
#
# References:
# - https://doc.owncloud.com/ocis/next/depl-examples/bare-metal.html
# - https://owncloud.github.io/ocis/
# - https://owncloud.github.io/ocis/deployment/basic-remote-setup/
#
# 2023-05-15, jw@owncloud.com

echo "Estimated setup time (when weather is fine): 2 minutes ..."

compose_subdir=deployments/examples/ocis_traefik
compose_yml=docker-compose.yml
ocis_bin=/usr/bin/ocis


if [ -z "$OCIS_VERSION" ]; then
  export OCIS_VERSION=v1.0.0-rc7
  export OCIS_VERSION=v2.0.0
  export OCIS_VERSION=v3.0.0-alpha.2
  export OCIS_VERSION=daily
  echo "No OCIS_VERSION specified, using $OCIS_VERSION"
  sleep 3
fi
vers=$(echo "$OCIS_VERSION" | sed -e 's/^v//')

if [ "$vers" == "testing" -o "$vers" == "daily" ]; then
  ocis_url=https://download.owncloud.com/ocis/ocis/daily/ocis-testing-linux-amd64
else

  ocis_url=https://download.owncloud.com/ocis/ocis/stable/$vers/ocis-$vers-linux-amd64
  http_code=$(curl -s -L --head -w '%{http_code}\n' $ocis_url -o /dev/null)
  
  if [ "$http_code" != 200 ]; then
    echo "Version $vers not found in stable. Trying testing..."
    ocis_url=https://download.owncloud.com/ocis/ocis/testing/$vers/ocis-$vers-linux-amd64
    http_code=$(curl -s -L --head -w '%{http_code}\n' $ocis_url -o /dev/null)
  fi
  
  if [ "$http_code" != 200 ]; then
    echo "Version $vers not found: check https://download.owncloud.com/ocis/ocis/"
    exit 1
  fi
fi  

echo "Download from $ocis_url"

d_tag=$(echo $vers  | tr '[A-Z]' '[a-z]' | tr . -)-$(date +%Y%m%d)
export BASE_DOMAIN=ocis-$d_tag.jw-qa.owncloud.works

# It does not work with the ubuntu-20.04-preload server image.
export HCLOUD_SERVER_IMAGE=ubuntu-22.04

# use a cx31 -- we need more than 40GB disk space.
source lib/make_machine.sh -t cx31 -u ocis-${OCIS_VERSION} -p git,vim,screen,xattr,file,jq,docker.io,binutils,ldap-utils,golang-go,python3-pip "$@"
set -x

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1;
fi

version_file=this-is-ocis-$vers.txt
user_portrait_url=https://upload.wikimedia.org/wikipedia/commons/3/32/Max_Liebermann_Portrait_Albert_Einstein_1925.jpg
# user_speech_url=https://upload.wikimedia.org/wikipedia/commons/4/46/03_ALBERT_EINSTEIN.ogg
user_speech_url=https://www.einstein-website.de/z_biography/einstein1930.mp3

INIT_SCRIPT <<EOF

# https://doc.owncloud.com/ocis/next/depl-examples/bare-metal.html#install-and-configure-the-infinite-scale-binary
wget -O /usr/local/bin/ocis $ocis_url
chmod +x /usr/local/bin/ocis

# Create a service user
useradd --system --no-create-home --shell=/sbin/nologin ocis

# Infinite Scale Data Directory
mkdir -p /var/lib/ocis
chown ocis:ocis /var/lib/ocis

# Infinite Scale Configuration File
mkdir -p /etc/ocis
touch /etc/ocis/ocis.env
chown -R ocis:ocis /etc/ocis

cat <<EOT>> /etc/ocis/ocis.env
OCIS_URL=https://$BASE_DOMAIN
OCIS_VERSION_STRING=\$(ocis version | grep -i version)
PROXY_HTTP_ADDR=0.0.0.0:9200
PROXY_TLS=false
OCIS_INSECURE=false

OCIS_LOG_LEVEL=warn

OCIS_CONFIG_DIR=/etc/ocis
OCIS_BASE_DATA_PATH=/var/lib/ocis
EOT

ln -s /etc/ocis/ocis.env env.sh

rm -f /etc/ocis/ocis.yaml	# BUG: --force-overwrite does not work.
sudo -u ocis ocis init --insecure --force-overwrite --config-path /etc/ocis
## this prints the admin_password. You can always retrieve the password with
# grep admin_password /etc/ocis/ocis.yaml
## 
# import yaml
# o = yaml.load(open('/etc/ocis/ocis.yaml'))
# o['idm']['service_user_passwords']['admin_password']


# screen -d -m -S ocis-server -Logfile screenlog-ocis -L /usr/local/bin/ocis server

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

pip install boltdb

go install go.etcd.io/bbolt/cmd/bbolt@latest	# cli-tool to inspect boltdb files.
export PATH="$PATH:/root/go/bin"

echo >> .env IPADDR=$IPADDR
echo >> .env OCIS_VERSION=$OCIS_VERSION
echo >> .env OCIS_DOCKER_TAG=$OCIS_DOCKER_TAG
echo >> .env OCIS_DOMAIN=$OCIS_DOMAIN
echo >> .env TRAEFIK_DOMAIN=$TRAEFIK_DOMAIN
echo >> .env OCIS_LOG_LEVEL=debug
## Seen in $compose_yml
# basic auth (not recommended, but needed for eg. WebDav clients that do not support OpenID Connect)
echo >> .env PROXY_ENABLE_BASIC_AUTH=true
echo >> .env DEMO_USERS=true

# wait_for_ocis

# # ocis.sh webdav health
# 
# if [ -f ~/INIT.bashrc ]; then
#   echo >  ./$version_file '\`\`\`'
#   echo >> ./$version_file "OCIS_VERSION:         $OCIS_VERSION"
#   echo >> ./$version_file "ocis version:         \$(ocis.sh version | head -2)"
#   echo >> ./$version_file "git log:              \$(git log --decorate=full | head -1)"
# 
#   echo >> ./dependencies.md "\`\`\`\n$ocis_bin contains:"
#   docker-compose -f $compose_yml exec ocis strings $ocis_bin | grep '^dep\s' | sort -u >> ./dependencies.md
#   ## FIXME: most dependencies disappeared. Only: github.com/owncloud/libre-graph-api-go  v1.0.2-0.20230330145712
# 
#   # make some files appear within the owncloud
#   echo '\`\`\`' > ~/INIT.bashrc.md
#   cat ~/INIT.bashrc >>  ~/INIT.bashrc.md
#   wget $user_speech_url	  -O speech.ogg
#   wget $user_portrait_url -O portrait.jpg
# 
#   echo "127.0.0.1 $OCIS_DOMAIN" >> /etc/hosts	# local DNS entry, in case remote DNS is not yet set up
# 
#   # FIXME: we no longer support basic auth webdav.
#   # FIXME: old URL scheme is /remote.php/webdav, new schemes are
#   #   /remote.php/dav/files/$UUID
#   #   /remote.php/dav/files/$USERNAME
#   #   /dav/spaces/9f25300f-36d8-4e55-8e9a-ba9d9ae429dc$ed9c404f-4983-4309-814e-f38988777943/
#   #
#   # To capture the http respponse code, use e.g. this:
#   #   curl -s -w '%{stderr}%{http_code}\n'  2> http_code.txt ....
#   # First try auto-create einstein's home ...
#   #   curl -k -u einstein:relativity -X PROPFIND         https://$OCIS_DOMAIN/remote.php/webdav
#   #   # ... then prepopulating some files
#   #   curl -k -u einstein:relativity -X MKCOL            https://$OCIS_DOMAIN/remote.php/webdav/init
#   #   curl -k -u einstein:relativity -T ./speech.ogg     https://$OCIS_DOMAIN/remote.php/webdav/speech.ogg
#   #   curl -k -u einstein:relativity -T ./portrait.jpg   https://$OCIS_DOMAIN/remote.php/webdav/portrait.jpg
#   #   curl -k -u einstein:relativity -T ./$version_file  https://$OCIS_DOMAIN/remote.php/webdav/init/$version_file
#   #   curl -k -u einstein:relativity -T ~/INIT.bashrc.md https://$OCIS_DOMAIN/remote.php/webdav/init/INIT.bashrc.md
# fi
# 
# echo "Now log in with user admin at https://${OCIS_DOMAIN}"
# 
# uptime
# sleep 5
# cat <<EOM
# 
# ---------------------------------------------
# # This shell is now connected to root@$IPADDR
# # Connect your browser or client to
# 
#    https://$OCIS_DOMAIN
# 
# # You may first need to add the DNS entries at https://dash.cloudflare.com
# 	cf_dns $IPADDR '*.$BASE_DOMAIN'
# 
# # Try also
# 
#    curl -k -s https://$OCIS_DOMAIN/.well-known/openid-configuration | grep https
# 
#    # FIXME: outdated
#    # curl -k -X PROPFIND https://$OCIS_DOMAIN/remote.php/webdav -u einstein:relativity
# 
# # If login fails, try
# 
#    # FIXME: outdated
#    # docker-compose exec ocis bash -c 'ocis kill glauth; sleep 5; ocis glauth server &'
# 
# # inspect some boltdb contents
# 
#   cp data/idm/ocis.boltdb /tmp/bolt.db; bbolt buckets /tmp/bolt.db; bbolt keys /tmp/bolt.db dn2id; rm /tmp/bolt.db
# 
# ---------------------------------------------
# EOM
EOF
