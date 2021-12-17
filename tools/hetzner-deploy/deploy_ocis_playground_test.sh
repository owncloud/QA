#!/bin/bash
#
# see also:
#  https://golang.org/doc/install
#  https://github.com/owncloud/ocis/
#  https://owncloud.github.io/
#
# This sets up an ocis dev environment in 2min 30sec.
# Building ocis again takes ca 3min.
#
# 2020-04-15, jw@owncloud.com
#

source lib/make_machine.sh -u ocis-test -p git,screen,build-essential,docker.io,docker-compose "$@"

INIT_SCRIPT << EOF
  # compose docker container
  git clone https://github.com/owncloud-docker/compose-playground.git
  sed -i -e 's/your-url/$IPADDR/g' compose-playground/compose/ocis/config/identifier-registration.yml

  # disable ipv6, to not confuse ocis server:
  echo >> /etc/sysctl.conf "net.ipv6.conf.all.disable_ipv6 = 1"
  echo >> /etc/sysctl.conf "net.ipv6.conf.default.disable_ipv6 = 1"
  echo >> /etc/sysctl.conf "net.ipv6.conf.lo.disable_ipv6 = 1"
  echo >> /etc/sysctl.conf "net.ipv6.conf.eth0.disable_ipv6 = 1"
  sysctl -p

  cd compose-playground/compose/ocis
  echo >> .env OCIS_BASE_URL=$IPADDR
  echo >> .env OCIS_HTTP_PORT=9200
  echo >> .env OCIS_DOCKER_TAG=1.0.0-beta4
  docker-compose -f ocis.yml -f ../cache/redis-ocis.yml up &

  cat <<EOM
---------------------------------------------
# machine prepared.
# connect from remote:
	curl -k https://$IPADDR:9200/status.php

# Follow the instructions at
	https://github.com/owncloud/ocis/#quickstart
	https://owncloud.github.io/ocis/getting-started/#docker-compose
	https://github.com/owncloud/ocis/blob/master/docs/basic-remote-setup.md#use-docker-compose
---------------------------------------------
EOM
EOF
