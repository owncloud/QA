#!/bin/bash
#
# 2021-01-26, jw@owncloud.com
#

echo "Estimated setup time: 2 minutes ..."

vers=10.6.0
d_vers=$(echo $vers  | tr '[A-Z]' '[a-z]' | tr . -)-$(date +%Y%m%d)
source lib/make_machine.sh -u oc-$d_vers -p git,screen,docker.io,wget "$@"

HTTP_PORT=80

INIT_SCRIPT << EOF
  mkdir -p /root/ocmount
  docker run --name oc10 -d --rm -v /root/ocmount:/mnt/data -p $HTTP_PORT:8080 owncloud/server:$vers
  sleep 3 	# wait for owncloud to initialize
  chmod a+rx .	# so that www-data can enter here.
  install_app() { curl -L -s \$1 | su www-data -s /bin/sh -c 'tar zxvf - -C /root/ocmount/apps'; }
  # install_app file:///root/icap-0.1.0RC1.tar.gz
  
  echo "Try: docker logs -f oc-$d_vers"
  echo "Try: docker exec -ti oc-$d_vers bash"
  echo "Try: firefox http://$IPADDR:80"
  echo ""
  echo "You can find config, apps, and data folders under /root/ocmount"
EOF
