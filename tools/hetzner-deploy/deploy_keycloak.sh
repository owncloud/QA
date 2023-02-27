#! /bin/bash
#
# deploy_keycloak.sh - sets up a hetzner machine with a standalone keycloak server.
# It has its own database, its own openldap behind, and its own nginx in fron.
#
#
# References:
#
# - https://www.keycloak.org/server/containers
# - https://www.keycloak.org/server/configuration-production
# - https://www.keycloak.org/server/hostname
# - https://www.nginx.com/resources/wiki/start/topics/examples/likeapache/

test -z "$HCLOUD_MACHINE_TYPE" && HCLOUD_MACHINE_TYPE=cx11
machine_type=$HCLOUD_MACHINE_TYPE

HTTPS_PORT=19443
test -z "$KEYCLOAK_DNSNAME" && KEYCLOAK_DNSNAME="keycloak-DATE.jw-qa.owncloud.works"
KEYCLOAK_DNSNAME=$(echo $KEYCLOAK_DNSNAME | sed -e "s/DATE/$(date +%Y%m%d)/")
d_name=$(echo $KEYCLOAK_DNSNAME  | sed -e "s/\..*//" | tr '[A-Z]' '[a-z]' | tr . -)

mydir="$(dirname -- "$(readlink -f -- "$0")")"	# find related scripts, even if called through a symlink.
source $mydir/lib/make_machine.sh -t $machine_type -u $d_name -p git,screen,curl,apache2,ssl-cert,docker.io,jq "${ARGV[@]}"

INIT_SCRIPT << EOF
set -x

# Let certbot come by as early as possible.
apt install -y certbot python3-certbot-apache python3-certbot-dns-cloudflare

echo >> ~/env.sh "IPADDR=$IPADDR"
echo >> ~/env.sh "oc10_fqdn=$KEYCLOAK_DNSNAME"	# queried by make_machine.sh from the outside, so that it can run certbot for us.


# Health check endpoints are available at https://localhost:8443/health,
# https://localhost:8443/health/ready and https://localhost:8443/health/live.
# - /health/ready is the same as /health, /health/live is a bit shorter, its 'checks' list is empty.
# Use with --health-enabled
#
# The published Keycloak containers have a directory /opt/keycloak/data/import.
# If you put one or more import files in that directory via a volume mount or
# other means and add the startup argument --import-realm, the Keycloak
# container will import that data on startup! This may only make sense to do in
# Dev mode.
#
# If enabled, metrics are available at the '/metrics' endpoint.
# -> it contains many details about cpu and memory usage, but nohting about realms or users.
#
# keycloak's docker container advertises port 8443, but there is nothing per default in development mode.
# It has a hostname and a portnumber option, but that does not enable ssl.
# --hostname=https://www.keycloak.org/server/hostname --hostname-port=19443
#
screen -d -m -S keycloak -Logfile screenlog-keycloak -L \
  docker run --rm --name keycloak -ti -e KEYCLOAK_ADMIN_PASSWORD=kadmin -e KEYCLOAK_ADMIN=kadmin -p 4488:8080 quay.io/keycloak/keycloak \
    start-dev --import-realm --metrics-enabled=false --health-enabled=true --hostname-url=https://$KEYCLOAK_DNSNAME:$HTTPS_PORT --hostname-admin-url=https://$KEYCLOAK_DNSNAME:$HTTPS_PORT/

# wait until keycloak is up:
for i in 10 9 8 7 6 5 4 3 2 1 last; do
  # TODO: maybe use one of the healcheck backends here??
  echo -e "HEAD / HTTP/1.1\r\n\r" | timeout 2 netcat localhost 4488 | grep '200 OK' && break
  echo " ... waiting for keycloak on port 4488 ... \$i"
  if [ "\$i" = last ]; then
    echo "ERROR: keycloak startup failed, check screenlog-keycloak"
    exit 1
  fi
  sleep 20
done

keycloak_ip=\$(docker inspect keycloak | jq '.[0].NetworkSettings.IPAddress' -r)
BACKEND_HTTP_SERVER="http://\$keycloak_ip:8080"
SSL_CERT_FILE=./fullcert.pem		# must contain a /
SSL_KEY_FILE=./privkey.pem




# https://www.nginx.com/resources/wiki/start/topics/examples/likeapache/
# Let’s say we want to establish simple proxy between myhost:80 and myapp:8080. The Apache rule is simple:
#  <VirtualHost myhost:80>
#     ServerName myhost
#     DocumentRoot /path/to/myapp/public
#     ProxyPass / http://myapp:8080/
#     ProxyPassReverse / http://myapp:8080/
# </VirtualHost>
#
# But NGINX does not have ProxyPassReverse… The solution is adding a few missing HTTP headers.
# server {
#     listen myhost:80;
#     server_name  myhost;
#     location / {
#         root /path/to/myapp/public;
#         proxy_set_header X-Forwarded-Host $host:$server_port;
#         proxy_set_header X-Forwarded-Server $host;
#         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#         proxy_pass http://myapp:8080;
#     }
# }
# These variables are meant to appear verbatim as variables. At some point the documention reveals e.g.:
# NGINX even provides a $proxy_add_x_forwarded_for variable to automatically append $remote_addr to any incoming X-Forwarded-For headers.
#
# CAUTION: keycloack behind proxy exposes internal addess in jwks_uri userinfo_endpoint token_endpoint, when the X-Forwarded-For headers are missing.
#          do not try to fix these URLs in keycloak, the proxy is responsible for getting them correct. (For whatever reason...)

mkdir -p proxy/conf.d
cat << CONF > proxy/conf.d/nginx.conf
server {
    listen              80;
    listen              443 ssl;
    server_name         nginx.proxy;
    ssl_certificate     /ssl-cert.crt;
    ssl_certificate_key /ssl-cert.key;
    # ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    # ssl_ciphers         HIGH:!aNULL:!MD5;
    location / {
        proxy_set_header        Host \\$host;
        proxy_set_header        X-Real-IP \\$remote_addr;
        proxy_set_header        X-Forwarded-Host \\$host:\\$server_port;
        proxy_set_header        X-Forwarded-Server \\$host;
        proxy_set_header        X-Forwarded-For \\$proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto \\$scheme;
        proxy_pass              \$BACKEND_HTTP_SERVER;
    }
}
CONF

curl https://ssl-config.mozilla.org/ffdhe2048.txt > proxy/dhparam.pem

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
cp \$certfile \$privkey proxy/


# CAUTION: keep in sync with bin/nginx_ssl_proxy
#   netwok_mode: bridge
# is supposed to be a shortcut for
#
#   network:
#     - host
# networks:
#   host:
#     name: bridge
#     external: true
#
# but that failes with one of:
#  networks.host value Additional properties are not allowed ('name' was unexpected)
#  network-scoped alias is supported only for containers in user defined networks
#

cat << REF_SH > refresh_cert.sh
certbot renew
cp \$certfile \$privkey proxy
cd proxy
docker-compose down
docker-compose up -d
REF_SH


cat << DC_YML > proxy/docker-compose.yml
version: "3.0"
services:
  nginx_ssl_proxy:
    image: "nginx:latest"
    command: "/usr/sbin/nginx -g 'daemon off;'"
    ports:
      - "\$HTTPS_PORT:443"
    volumes:
      - "./dhparam.pem:/usr/local/etc/ssl/dhparam.pem"
      - "./conf.d:/etc/nginx/conf.d"
      - "./fullchain.pem:/ssl-cert.crt"
      - "./privkey.pem:/ssl-cert.key"

    # The default 172.17.0.0/16 docker network is the "bridge".
    # We want to join there, so that we can proxy for standalone docker containers.
    network_mode: bridge

DC_YML

cd proxy;
docker-compose up


