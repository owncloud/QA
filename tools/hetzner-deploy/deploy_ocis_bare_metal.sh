#!/bin/bash
#
# References:
# - https://doc.owncloud.com/ocis/next/deployment/services/s-list/web.html
# - https://doc.owncloud.com/ocis/next/depl-examples/bare-metal.html
# - https://owncloud.github.io/ocis/
# - https://owncloud.github.io/ocis/deployment/basic-remote-setup/
# TODO:
# - Add some services: e.g. https://doc.owncloud.com/ocis/next/deployment/services/s-list/antivirus.html
# - the collaboration service is not autostarted. Find out, how to start it.
#
# Apache error messages seen:
# - AH01144: No protocol handler was valid for the URL /
#     fix: a2enmod proxy_http  (a2enmd proxy is not enough)
# - AH02003: SSL Proxy connect failed
#   Library Error: error:0A00010B:SSL routines::wrong version number
#     fix: use http://localhost:9200 (instead of https://)
#
#
# Alternative to bare-metal:
#  - full blown docker compose including ollabora and onlyoffice:
#    - cd ~/src/github/owncloud/ocis/deployments/examples/ocis_wopi/; git pull
#    - edit .env there, and add a random string to WOPI_JWT_SECRET=.... - everything can remain at default values.
#    - entrypoint is the https://ocis.owncloud.test domain, but certificates fail unless
#      manually accepted for https://onlyoffic.owncloud.test and https://collabora.owncloud.test - then wopi works.
#    - if not both icons for only onlyoffice and collabora show up in the context menu of a file, then
#      docker-compose restart ocis-appprovider-collabora
#      docker-compose restart ocis-appprovider-onlyoffice
#
# 2023-05-23, jw@owncloud.com
# 2023-11-15, jw@owncloud.com
# 2024-09-23, jw@owncloud.com
#
if [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo "Usage:"
  echo "	$0 [ocm] ..."
  echo "	env OCIS_VERSION=v6.4.0 OCIS_DNSNAME=bare1-640-DATE $0 [ocm]"
  echo ""
  echo "Check tasks/ocis/*.sh for possible command line parameters"
  exit 1
fi

echo "Estimated setup time (when weather is fine): 2 minutes ..."

compose_subdir=deployments/examples/ocis_traefik
# ocis_bin=/usr/bin/ocis
ocis_data=/var/lib/ocis
ocis_import=https://raw.githubusercontent.com/esgarov/Daten-Import-in-Ocis/main/ocis-import.py

if [ "$OCIS_STORAGE" == sshfs ]; then
  ocis_data=/home/ocis/data
fi

export REVA_CLI_VERSION=2.19.3

if [ -z "$OCIS_VERSION" ]; then
  export OCIS_VERSION=daily
  export OCIS_VERSION=v7.0.0-rc.4
  echo "No OCIS_VERSION specified, using $OCIS_VERSION"
  sleep 2
fi
vers=$(echo "$OCIS_VERSION" | sed -e 's/^v//')

if [ -n "$OCIS_DNSNAME" ]; then
  dns_name=$(echo "$OCIS_DNSNAME" | sed -e "s/DATE/$(date +%Y%m%d)/")
else
  dns_name=ocis-$(echo $vers  | tr '[A-Z]' '[a-z]' | tr -d .=+ | sed -e 's/-\?alpha/a/g' -e 's/-\?beta/b/g' -e 's/-\?rc/rc/g')-$(date +%Y%m%d)
  echo "No OCIS_DNSNAME specified, using $dns_name"
  sleep 2
fi
export BASE_DOMAIN=$dns_name.jw-qa.owncloud.works
export WEB_UI_CONFIG_FILE=/etc/ocis/web/config.json

if [ "$vers" == "testing" -o "$vers" == "daily" ]; then
  # CAUTION: yes, everything in ocis/ocis/daily has *-testing-* in its name. Not *-daily-*
  #          in ocis/ocis/testing, nothing has *-testing-*, of course.
  ocis_url=https://download.owncloud.com/ocis/ocis/daily/ocis-testing-linux-amd64
else

  ocis_url=https://download.owncloud.com/ocis/ocis/stable/$vers/ocis-$vers-linux-amd64
  http_code=$(curl -s -L --head -w '%{http_code}\n' $ocis_url -o /dev/null)

  if [ "$http_code" != 200 ]; then
    echo "Version $vers not found in stable. Trying rolling ..."
    ocis_url=https://download.owncloud.com/ocis/ocis/rolling/$vers/ocis-$vers-linux-amd64
    http_code=$(curl -s -L --head -w '%{http_code}\n' $ocis_url -o /dev/null)
  fi

  if [ "$http_code" != 200 ]; then
    echo "Version $vers not found in rolling or stable. Trying testing ..."
    ocis_url=https://download.owncloud.com/ocis/ocis/testing/$vers/ocis-$vers-linux-amd64
    http_code=$(curl -s -L --head -w '%{http_code}\n' $ocis_url -o /dev/null)
  fi

  if [ "$http_code" != 200 ]; then
    echo "Version $vers not found: check https://download.owncloud.com/ocis/ocis/"
    exit 1
  fi
fi

echo "Download from $ocis_url"

admin_pass="admin$(date +%Y%m%d)"	# an unsecure default. To be overridden by env OC10_ADMIN_PASS
test -n "$OC10_ADMIN_PASS" && admin_pass="$OC10_ADMIN_PASS"
test -n "$OCIS_ADMIN_PASS" && admin_pass="$OCIS_ADMIN_PASS"

# It does not work with the ubuntu-20.04-preload server image.
export HCLOUD_SERVER_IMAGE=ubuntu-22.04

location=nbg1
location=fsn1	# fsn1, nbg1, hel1, to be used with -L
test -n "$HCLOUD_LOCATION" && location="$HCLOUD_LOCATION"

mydir="$(dirname -- "$(readlink -f -- "$0")")"   # find related scripts, even if called through a symlink.
# use a cpx31 -- we need more than 40GB disk space.
source $mydir/lib/make_machine.sh -t cpx31 -u ocis-${OCIS_VERSION} -p git,vim,screen,tree,telnet,gdb,xattr,file,jq,docker.io,binutils,ldap-utils,golang-go,python3-pip,sshfs "$@"
scp $mydir/bin/* root@$IPADDR:/usr/local/bin    # mpkq et al..

if [ -z "$IPADDR" ]; then
  echo "Error: make_machine.sh failed."
  exit 1;
fi
scp $mydir/bin/ocis/* root@$IPADDR:/usr/local/bin

version_file=this-is-ocis-$vers.txt
user_portrait_url=https://upload.wikimedia.org/wikipedia/commons/3/32/Max_Liebermann_Portrait_Albert_Einstein_1925.jpg
# user_speech_url=https://upload.wikimedia.org/wikipedia/commons/4/46/03_ALBERT_EINSTEIN.ogg
user_speech_url=https://www.einstein-website.de/z_biography/einstein1930.mp3

INIT_SCRIPT <<EOF

# https://doc.owncloud.com/ocis/next/depl-examples/bare-metal.html#install-and-configure-the-infinite-scale-binary

export DEBIAN_FRONTEND=noninteractive    # try prevent ssh install to block wit whiptail
export EDITOR=vim
echo >> .bashrc "export EDITOR=vim"
export LC_ALL=C LANGUAGE=C
apt -y install apache2
apt -y install certbot python3-certbot-apache	# ubuntu 22.04 has certbot 1.21.0 - DEPRECATED. use pip install certbot

# Needed on debian 12 to avoid "error: externally-managed-environment"
export PIP_BREAK_SYSTEM_PACKAGES=1
# apt -y install augeas-tools	# dependency of pip install certbot
# pip install certbot		# version 2.6.0 seen 2023-05-23
pip install yq       		# yaml frontend for jq.
pip install msgpack  		# for mpkq
pip install boltdb

go install go.etcd.io/bbolt/cmd/bbolt@latest   # cli-tool to inspect boltdb files.
export PATH="$PATH:/root/go/bin"
echo 'PATH="$PATH:/root/go/bin"' >> ~/.bashrc

chmod a+rx /root	# we want to access our test files, when we are user ocis.

# Check if this is an arm64 device. E.g. raspberry
test "$(uname -m)" = aarch64 && ocis_url=$(echo "$ocis_url" | sed -e 's/-amd64/-arm64/')
wget -O /usr/local/bin/ocis $ocis_url
wget -O /usr/local/bin/ocis-import.py $ocis_import
chmod +x /usr/local/bin/ocis*

# Create a service user
useradd --system --create-home --shell=/sbin/nologin ocis
test -f /home/ocis/.ssh/id_rsa.pub || sudo -u ocis ssh-keygen -t rsa -f /home/ocis/.ssh/id_rsa -P ''

# Infinite Scale Data Directory
mkdir -p $ocis_data
chown ocis:ocis $ocis_data

## prepare an sshfs mount as an alternative to native local file system.
ftppass=ftp${RANDOM}data
deluser ftpdata 2>&1 >/dev/null	# just in case
echo -e "\$ftppass\\n\$ftppass" | adduser ftpdata --gecos ""
mkdir -p /home/ftpdata/.ssh /home/ftpdata/data
### allow user ocis to ssh into localhost as user ftpdata
cp /home/ocis/.ssh/id_rsa.pub /home/ftpdata/.ssh/authorized_keys
chown -R ftpdata. /home/ftpdata
chmod 700 /home/ftpdata/.ssh

echo user_allow_other >>  /etc/fuse.conf	# so that we can use sshfs -o allow_other (a strange dependency, but that is what it is)
mkdir -p /var/lib/ocis-sshfs
chown ftpdata /var/lib/ocis-sshfs
sudo -u ocis sshfs -o StrictHostKeyChecking=no -o transform_symlinks -o idmap=user -o allow_other ftpdata@localhost:/var/lib/ocis-sshfs  /home/ocis/data
sudo -u ocis touch /home/ocis/data/foobar
# this should show first as owner ftpdata and second as user ocis:
(set -x; ls -la /var/lib/ocis-sshfs /home/ocis/data)

# Infinite Scale Configuration File
mkdir -p /etc/ocis/web
touch /etc/ocis/ocis.env
chown -R ocis:ocis /etc/ocis
chown -R ocis:ocis /etc/ocis/web

# ocis_fqdn is used by cf_dns ...
cat <<EOT>> /etc/ocis/ocis.env
OCIS_URL=https://$BASE_DOMAIN
ocis_fqdn=$BASE_DOMAIN
OCIS_VERSION_STRING=\$(ocis version | grep -i version | sed -e 's/^version:\s*//i')
PROXY_HTTP_ADDR=0.0.0.0:9200
PROXY_TLS=false
OCIS_INSECURE=false
# FIXME: much nicer would be:
OCIS_SECURE=true

ADMIN_PASSWORD=$admin_pass
IDM_ADMIN_PASSWORD=$admin_pass
# OCIS_LOG_LEVEL=warn
OCIS_LOG_LEVEL=debug

# FIXME: next four should not be hardcoded here. They should come from tasks/ocis/ocm.sh
OCIS_ENABLE_OCM=true
#FRONTEND_OCS_INCLUDE_OCM_SHAREES=true
#FRONTEND_OCS_ENABLE_DENIALS=true
#FRONTEND_OCS_LIST_OCM_SHARES=true
#
PROXY_ENABLE_BASIC_AUTH=true
OCIS_SHOW_USER_EMAIL_IN_RESULTS=true

## To go back to 3.0.0-rc3 behavior: https://github.com/owncloud/ocis/issues/6403#issuecomment-1567924356
# PROXY_USER_OIDC_CLAIM=preferred_username
# PROXY_USER_CS3_CLAIM=username

OCIS_CONFIG_DIR=/etc/ocis
OCIS_BASE_DATA_PATH=$ocis_data

# used by ocis init
IDM_CREATE_DEMO_USERS=true

WEB_UI_CONFIG_FILE=$WEB_UI_CONFIG_FILE
EOT

cat <<EOT >$WEB_UI_CONFIG_FILE
{
  "server": "https://$BASE_DOMAIN",
  "theme": "https://$BASE_DOMAIN/themes/owncloud/theme.json",
  "openIdConnect": {
    "metadata_url": "https://$BASE_DOMAIN/.well-known/openid-configuration",
    "authority": "https://$BASE_DOMAIN",
    "client_id": "web",
    "response_type": "code",
    "scope": "openid profile email"
  },
  "options": {
    "contextHelpersReadMore": true
  },
  "apps": [
    "files",
    "search",
    "text-editor",
    "pdf-viewer",
    "external",
    "admin-settings",
    "epub-reader",
    "preview",
    "app-store",
    "webfinger",
    "ocm"
  ],
  "external_apps": [
    {
      "id": "preview",
      "path": "web-app-preview",
      "config": {
        "mimeTypes": ["image/tiff", "image/bmp", "image/x-ms-bmp"]
      }
    },
    {
      "id": "importer",
      "path": "web-app-importer",
      "config": {
        "companionUrl": "https://localhost:9200/companion"
      }
    }
  ]
}
EOT

ln -s /etc/ocis/ocis.env env.sh
ln -s $ocis_data ~/o

source /etc/ocis/ocis.env # no container for this env. Just get everything into this shell.

echo >> ~/.bashrc "export OCIS_CONFIG_DIR=/etc/ocis"
echo >> ~/.bashrc "export OCIS_BASE_DATA_PATH=$ocis_data"
echo >> ~/.bashrc 'export OCIS_TOPDIR=/var/lib/ocis'	# for ocis-import.py

# DEPRECATED: use $WEB_UI_CONFIG_FILE instead of web.yaml
cat <<EOT>> /etc/ocis/web.yaml
extra:
  config:
    apps:
      - files
      - search
      - text-editor
      - pdf-viewer
      - external
      - admin-settings
      - epub-reader
      - preview
      - app-store
      - draw-io
      - ocm
EOT

# put env.sh in the current environment, so that started processes see that.
# (ignore comments, trailing whitespace and empty lines)
# (we already have it in the current shell as simple shell variables due to the source /etc/ocis.ocis.env above.)
sed -e 's@#.*$@@' -e 's@\s*$@@' < env.sh  | while read line; do if [ "$line" != "" ]; then export $line; fi; done

# service ocis stop
rm -f /etc/ocis/ocis.yaml	# BUG: --force-overwrite does not work.
rm -rf $ocis_data/*		# needed for init to also re-init ldap credentials
# we don't seem to need sudo -E, the contents of env.sh is available to the ocis binaryis
# --insecure is needed to allow the internal communication between proxy and ocis without certificates.
sudo -u ocis ocis init --insecure --force-overwrite --config-path /etc/ocis
admin_pass="$admin_pass"
admin_pass_idm="\$(yq -r .idm.service_user_passwords.admin_password /etc/ocis/ocis.yaml)"
##
# import yaml
# o = yaml.load(open('/etc/ocis/ocis.yaml'))
# o['idm']['service_user_passwords']['admin_password']
##

cat <<EOT>> /etc/systemd/system/ocis.service
[Unit]
Description=OCIS server

[Service]
Type=simple
User=ocis
Group=ocis
EnvironmentFile=/etc/ocis/ocis.env
ExecStart=/usr/local/bin/ocis server
## Is this 9200 http or https? The endless confusion...
## and it fails anyway: Can't start JetStream: storage directory is not a directory
# ExecStart=/usr/local/bin/ociswrapper serve --admin-username=admin --admin-password=$admin_pass --url=https://localhost:9200 --bin=/usr/local/bin/ocis
Restart=always

[Install]
WantedBy=multi-user.target
EOT


# https://doc.owncloud.com/ocis/next/depl-examples/bare-metal.html#apache-as-reverse-proxy
apachectl configtest

for mod in ssl headers env dir mime unique_id rewrite setenvif proxy_http; do
  a2enmod \$mod
done
a2ensite default-ssl

cat <<EOT>> /etc/apache2/sites-available/ocis.conf
<IfModule mod_rewrite.c>
  <VirtualHost *:80>
    ServerName $BASE_DOMAIN

    # redirect all http urls to https
    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=302,L,QSA]

  </VirtualHost>
</IfModule>

<IfModule mod_ssl.c>
  <VirtualHost *:443>
    ServerName $BASE_DOMAIN

    # disable all security checks on the ssl connection to localhost:9200
    # FIXME: docs do not mention 'SSLProxyProtocol all', does not help..
    # We must use http:// protocol with port 9200, not https!
    SSLProxyEngine on
    SSLProxyVerify none
    SSLProxyCheckPeerCN off
    SSLProxyCheckPeerName off
    SSLProxyCheckPeerExpire off
    SSLProxyProtocol all

    ProxyPass / http://localhost:9200/
    ProxyPassReverse / http://localhost:9200/

    #important, otherwise 400 errors from idp
    ProxyPreserveHost on

  </VirtualHost>
</IfModule>
EOT

a2ensite ocis
systemctl reload apache2

systemctl daemon-reload
systemctl enable --now ocis

## CHECK: we must not enable site ocis, before certbot was here.
## when proxing everything, letsencrypt fails with
## or maybe not??
#
for i in \$(seq 1 10); do
  if [ -f ~/CF_DNS.msg ]; then
    echo "########################### CF_DNS.msg ###########################"
    cat ~/CF_DNS.msg
    echo "########################### ---------- ###########################"
    sleep 5	# give DNS some time to get in syn...
    break
  fi
  sleep 10
  echo "CF_DNS.msg not yet there. Retrying \$i ..."
  test "\$i" == 10 && echo " gving up."
done

### We run cf_dns locally, which sshs into the deplyment and does it. Check CF_DNS.msg
# certbot --apache -d $BASE_DOMAIN

#   # make some files appear within the owncloud
#   echo '\`\`\`' > ~/INIT.bashrc.md
#   cat ~/INIT.bashrc >>  ~/INIT.bashrc.md
#   wget $user_speech_url   -O speech.ogg
#   wget $user_portrait_url -O portrait.jpg
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
#   #   curl -k -u einstein:relativity -X PROPFIND         https://$BASE_DOMAIN/remote.php/webdav
#   #   # ... then prepopulating some files
#   #   curl -k -u einstein:relativity -X MKCOL            https://$BASE_DOMAIN/remote.php/webdav/init
#   #   curl -k -u einstein:relativity -T ./speech.ogg     https://$BASE_DOMAIN/remote.php/webdav/speech.ogg
#   #   curl -k -u einstein:relativity -T ./portrait.jpg   https://$BASE_DOMAIN/remote.php/webdav/portrait.jpg
#   #   curl -k -u einstein:relativity -T ./$version_file  https://$BASE_DOMAIN/remote.php/webdav/init/$version_file
#   #   curl -k -u einstein:relativity -T ~/INIT.bashrc.md https://$BASE_DOMAIN/remote.php/webdav/init/INIT.bashrc.md
# fi

git clone https://github.com/owncloud/ocis.git -b $OCIS_VERSION --depth 1
git clone https://github.com/owncloud/web.git -b master --depth 1
sleep 2

(cd ocis/tests/ociswrapper; make build; cp bin/ociswrapper /usr/local/bin)

# install and configure reva cli
wget https://github.com/cs3org/reva/releases/download/v${REVA_CLI_VERSION}/reva_v${REVA_CLI_VERSION}_linux_amd64 -O go/bin/reva
chmod a+x go/bin/reva
api_gw=\$(ocis version | grep com.owncloud.api.gateway | tr -d ' ' | cut -d '|' -f 3)
(echo admin; echo "\$admin_pass") | script -c "reva -insecure -host \$api_gw login basic"
# we now should have .reva.config and .reva-token
# we still must call it as 'reva -insecure'
echo 'alias reva="reva -insecure"' >> ~/.bash_aliases
reva -insecure whoami

uptime
sleep 3
ocis version

cat <<EOM >> ~/POSTINIT.msg

---------------------------------------------
# This shell is now connected to root@$IPADDR
# Connect your browser or client to

   URL:      https://$BASE_DOMAIN
   Login:    admin
   Password: \$admin_pass 	(autogenerated: \$admin_pass_idm)

# If that URL shows a default Ubuntu page, try to re-run:
  certbot

  or if 000-default-le-ssl.conf is present:
  vi -o /etc/apache2/sites-available/{000-default-le-ssl.conf,ocis.conf}
  ... and copy the ... /etc/letsencrypt/... lines maually.maually.
  a2dissite 000-default-le-ssl; systemctl reload apache2
---------------------------------------------
# Inspect some boltdb contents

  cp o/idm/ocis.boltdb /tmp/bolt.db; bbolt buckets /tmp/bolt.db; bbolt keys /tmp/bolt.db dn2id; rm /tmp/bolt.db

# Restart after editing /etc/ocis/ocis.env:  systemctl restart ocis
# View the ocis server logs:                 journalctl -f -u ocis
# Examine the ocis data folder:              tree -fF $ocis_data | sed -e 's@ [^ ]*\\(/../\\)\$@\\1@'

# example to reset admin password:
  sudo -u ocis bash
  source ~/env.sh
  export OCIS_BASE_DATA_PATH OCIS_CONFIG_DIR
  ocis idm resetpassword
    Resetting password for user 'uid=admin,ou=users,o=libregraph-idm'.
    Enter new password:

---------------------------------------------
EOM
EOF
