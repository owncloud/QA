#! /bin/bash
#
# deploy_collabora.sh - sets up a hetzner machine with a colloabora online server
# with nginx in front.
#
#
# References:
#
# - https://www.linode.com/docs/guides/how-to-install-collabora-code/
# - https://www.nginx.com/resources/wiki/start/topics/examples/likeapache/

test -z "$HCLOUD_MACHINE_TYPE" && HCLOUD_MACHINE_TYPE=cx11
machine_type=$HCLOUD_MACHINE_TYPE
export HCLOUD_SERVER_IMAGE=ubuntu-22.04		# the collabora server repo is for ubuntu 22.04

HTTPS_PORT=99443
test -z "$COLLABORA_DNSNAME" && COLLABORA_DNSNAME="collabora-DATE.jw-qa.owncloud.works"
COLLABORA_DNSNAME=$(echo $COLLABORA_DNSNAME | sed -e "s/DATE/$(date +%Y%m%d)/")
d_name=$(echo $COLLABORA_DNSNAME  | sed -e "s/\..*//" | tr '[A-Z]' '[a-z]' | tr . -)

mydir="$(dirname -- "$(readlink -f -- "$0")")"	# find related scripts, even if called through a symlink.
source $mydir/lib/make_machine.sh -t $machine_type -u $d_name -p git,screen,curl,apache2,ssl-cert,docker.io,jq "${ARGV[@]}"

INIT_SCRIPT << EOF
set -x

# Let certbot come by as early as possible.
apt install -y certbot python3-certbot-apache python3-certbot-dns-cloudflare

echo >> ~/env.sh "IPADDR=$IPADDR"
echo >> ~/env.sh "oc10_fqdn=$COLLABORA_DNSNAME"	# queried by make_machine.sh from the outside, so that it can run certbot for us.


cadmin_pass=admin2023root
test -n "$COLLABORA_ADMIN_PASS" && cadmin_pass="$COLLABORA_ADMIN_PASS"

cd /usr/share/keyrings
wget https://collaboraoffice.com/downloads/gpg/collaboraonline-release-keyring.gpg
cd $HOME

cat <<REPO > /etc/apt/sources.list.d/collaboraonline.sources
Types: deb
URIs: https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-ubuntu2204
Suites: ./
Signed-By: /usr/share/keyrings/collaboraonline-release-keyring.gpg
REPO

apt update -y
apt install -y coolwsd code-brand 

# With the current configuration, the coolwsd service continues to fail and restart.
# This happens because Collabora cannot establish an HTTPS connection with the local host.
# Use the coolconfig tool to disable HTTPS on the connection.
# The following ssl.* settings affect the hosting/discovery xml, especially check https vs. http and port numbers.
coolconfig set ssl.enable false
coolconfig set ssl.termination true

# host to allow (specify nothing here, to allow any host... (?)
coolconfig set storage.wopi.host $COLLABORA_DNSNAME
# storage.host.alias can have a regexp too, they say. Let's try this:
coolconfig set storage.wopi.alias '.*\.owncloud\.works'

(echo cadmin; echo $cadmin_pass; echo $cadmin_pass; ) | coolconfig set-admin-password

systemctl restart coolwsd
systemctl status coolwsd

# wait until collabora is up:
for i in 10 9 8 7 6 5 4 3 2 1 last; do
  echo -e "HEAD / HTTP/1.1\r\n\r" | timeout 2 netcat localhost 9980 | grep 'COOLWSD HTTP Server' && break
  echo " ... waiting for collabora on port 9980 ... \$i"
  if [ "\$i" = last ]; then
    echo "ERROR: collabora startup failed, check screenlog-collabora"
    exit 1
  fi
  sleep 20
done

for i in 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 last; do
  privkey=\$(find /etc/letsencrypt/live/ -name privkey.pem)
  test -f "\$privkey" && break
  echo "... waiting for privkey.pem to appear in /etc/letsencrypt/live/ ... \$i"
  if [ "\$i" = last ]; then
    echo "ERROR: letsencrypt did not deliver a cert? Try manually later."
  fi
  sleep 20
done
# derive certfile name from privkey name. Compare output in CF_DNS.msg
certfile=\$(echo "\$privkey" | sed -e 's/privkey\.pem/fullchain.pem/')

nginx_ssl_proxy 9943 http://localhost:9980 $certfile $privkey

