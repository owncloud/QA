#!/bin/bash
#
# 2021-01-26, jw@owncloud.com
# 2024-04-04, jw@owncloud.com
#
# This is implemented with apache ProxyPass.
# Port 8080 exposes bare http of the docker container.
# Port 443 does ssl-ofloading for the docker container.
# (Not sure what port 80 actually does.)
#
# Alternative: an nginx reverse proxy here. Maybe just run bin/nginx_ssl_proxy with clever parameters...

echo "Estimated setup time: 2 minutes ..."

vers=10.14.0
d_vers=$(echo $vers  | tr '[A-Z]' '[a-z]' | tr -d .=+-)-$(date +%Y%m%d)

domain=jw-qa.owncloud.works
test -z "$OC10_DNSNAME" && OC10_DNSNAME="$(echo "oc$d_vers" | sed -e 's/-\?alpha/a/g' -e 's/-\?beta/b/g' -e 's/-\?rc/rc/g')"
OC10_FQDN="$(echo "$OC10_DNSNAME" | tr '[A-Z]_' '[a-z]-' | tr -d =+ | tr ._ -).$domain"

d_name=oc-$d_vers
mydir="$(dirname -- "$(readlink -f -- "$0")")"	# find related scripts, even if called through a symlink.
source $mydir/lib/make_machine.sh -u $d_name -p git,screen,docker.io,wget "$@"
scp $mydir/bin/* root@$IPADDR:/usr/local/bin

HOST_HTTP_PORT=8080
DOCKER_HTTP_PORT=8080

INIT_SCRIPT << EOF
export LC_ALL=C

# Let certbot come by as early as possible.
apt install -y certbot python3-certbot-apache python3-certbot-dns-cloudflare apache2
apachectl configtest

for mod in ssl headers env dir mime unique_id rewrite setenvif proxy_http; do
  a2enmod \$mod
done
a2ensite default-ssl

cat <<EOT>> /etc/apache2/sites-available/docker-proxy.conf
<VirtualHost *:443>
    ServerName $OC10_FQDN

    # disable all security checks on the ssl connection to localhost:9200
    # FIXME: docs do not mention 'SSLProxyProtocol all', does not help..
    # We must use http:// protocol with port 9200, not https!
    SSLProxyEngine on
    SSLProxyVerify none
    SSLProxyCheckPeerCN off
    SSLProxyCheckPeerName off
    SSLProxyCheckPeerExpire off
    SSLProxyProtocol all

    # repeat the CERT config from letsencrypt here.
    # It would be nicer to keep all letsencrypt stuff in 000-default-le-ssl.conf
    # but that does not work. Despite the 000-default prefix, the 000-default-le-ssl.conf
    # would take precedence over all other configs. We have to disable that.

    SSLCertificateFile /etc/letsencrypt/live/$OC10_FQDN/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/$OC10_FQDN/privkey.pem
    Include /etc/letsencrypt/options-ssl-apache.conf

    ProxyPass / http://localhost:$DOCKER_HTTP_PORT/
    ProxyPassReverse / http://localhost:$DOCKER_HTTP_PORT/

    # important, otherwise 400 errors from idp
    ProxyPreserveHost on
    # only needed for forward proxies.
    ProxyRequests Off

</VirtualHost>
EOT

echo >> ~/env.sh "IPADDR=$IPADDR"
echo >> ~/env.sh "oc10_fqdn=$OC10_FQDN"	# queried by make_machine.sh from the outside, so that it can run certbot for us.

## Wait for certbot. once it was here, we'll
#  a) disable its default config and
#  b) use it certs in our docker-proxy.conf
##
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

a2dissite 000-default-le-ssl	# prevents the proxy
a2dissite default-ssl.conf	# may insert a selfsigned cert.

a2ensite docker-proxy
systemctl restart apache2


mkdir -p /root/ocmount
docker run --name $d_name -d --rm -v /root/ocmount:/mnt/data -e OWNCLOUD_TRUSTED_DOMAINS=$OC10_FQDN,$IPADDR -p $HOST_HTTP_PORT:$DOCKER_HTTP_PORT owncloud/server:$vers
sleep 3 	# wait for owncloud to initialize
chmod a+rx .	# so that www-data can enter here.
install_app() { curl -L -s \$1 | su www-data -s /bin/sh -c 'tar zxvf - -C /root/ocmount/apps'; }
# install_app file:///root/icap-0.1.0RC1.tar.gz

cat <<EOM >> ~/POSTINIT.msg
--------------------------------------------------------------------
# This shell is now connected to root@$IPADDR
# Connect your browser or client to

   URL:      https://$OC10_FQDN
   Login:    admin
   Password: $docker_admin_pass

To inspect docker, try:
 docker logs -f $d_name
 docker exec -ti $d_name bash

For direct docker (wthout ssl), try:
 firefox http://$IPADDR:$HOST_HTTP_PORT

Normally, just do:
 firefox https://$OC10_FQDN

You can find config, apps, and data folders under /root/ocmount
--------------------------------------------------------------------
EOM
EOF
