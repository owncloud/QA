#!/bin/bash
#
# See also:
#  https://github.com/owncloud-docker/compose-playground/issues/6
#  https://github.com/owncloud-docker/compose-playground/pull/51 	pmaier-fixes
#  https://github.com/owncloud-docker/compose-playground/blob/master/compose/kopano/konnect/README.md
#  https://doc.owncloud.com/server/10.10/admin_manual/configuration/user/oidc/
#
# CAUTION: https://github.com/owncloud/openidconnect/#readme
#  - some concepts there are correct, e.g. index.php/apps/openidconnect/config rewrite
#  - some other parts may need verification.
#
# 2020-10-16, jw@owncloud.com
# 2020-11-30, jw@owncloud.com
#

echo "Estimated setup time: 8 minutes ..."

#vers=2.1.0-rc1	# triggers https://github.com/owncloud/openidconnect/issues/181
# vers=2.1.1-rc1
# vers=2.1.0
vers=2.2.0-rc.3
oauth2_vers=0.5.3
# oc10_vers=10.10		# found on https://hub.docker.com/r/owncloud/server/tags/
oc10_vers=10.9.1	# found on https://hub.docker.com/r/owncloud/server/tags/

openidconnect_url=https://github.com/owncloud/openidconnect/releases/download/v$vers/openidconnect-$vers.tar.gz
oauth2_url=https://github.com/owncloud/oauth2/releases/download/v$oauth2_vers/oauth2-$oauth2_vers.tar.gz

for url in $oauth2_url $openidconnect_url; do
  code=$(curl -s -I -L -w "%{http_code}\n" $url -o /dev/null)
  if [ "$code" != 200 ]; then
    echo "ERROR: Download URL $url"
    echo "       HTTP_CODE=$code	-- please check that URL"
    exit 0
  fi
  echo "OK: $url"
done

test -z "$HOSTNAME_SUFFIX" && HOSTNAME_SUFFIX=test

d_vers=$(echo $vers  | tr '[A-Z]' '[a-z]' | tr -d .-)-$(date +%Y%m%d)
source lib/make_machine.sh -t cx21 -u oidc-$d_vers-$HOSTNAME_SUFFIX -p git,screen,docker.io,docker-compose "$@"

comp_yml=kopano/konnect/docker-compose.yml
reg_yml=kopano/konnect/konnectd-identifier-registration.yaml

test -z "$OWNCLOUD_RELEASE_DOCKER_TAG" && OWNCLOUD_RELEASE_DOCKER_TAG=$oc10_vers
d_tag=$(echo $OWNCLOUD_RELEASE_DOCKER_TAG  | tr '[A-Z]' '[a-z]' | tr -d .-)

## choose with or without version numbers and timestamps, in case we want multiple systems.
KOPANO_KONNECT_DOMAIN=konnect-oidc-$d_vers.jw-qa.owncloud.works
OWNCLOUD_DOMAIN=oc$d_tag-oidc-$d_vers.jw-qa.owncloud.works
# KOPANO_KONNECT_DOMAIN=konnect.oidc-jw-qa.owncloud.works
# OWNCLOUD_DOMAIN=owncloud.oidc-jw-qa.owncloud.works

## if you cannot work with cloudflare, you may try an /etc/hosts setup using:
# KOPANO_KONNECT_DOMAIN=konnect.docker-playground.local
# OWNCLOUD_DOMAIN=owncloud.docker-playground.local

INIT_SCRIPT << EOF
  #
  # Deployed via https://github.com/owncloud/QA/blob/master/tools/hetzner-deploy/make_openidconnect_test.sh
  # (C) 2020, jw@owncloud.com
  #
  git clone https://github.com/owncloud-docker/compose-playground.git
  cd compose-playground/compose
  # git checkout pmaier-fixes || true
  git branch -a

  # preload images may come up with a running apache...
  systemctl apache2 disable
  service apache2 stop

  # allow switch back and forth
  sed -i -e 's@OWNCLOUD_APPS_INSTALL=.*@OWNCLOUD_APPS_INSTALL=$openidconnect_url $oauth2_url@g' $comp_yml
  grep OWNCLOUD_APPS_ $comp_yml

  # cleanup orphaned volumes!
  docker system prune -f
  docker volume prune -f

  export KOPANO_KONNECT_DOMAIN=$KOPANO_KONNECT_DOMAIN
  export OWNCLOUD_DOMAIN=$OWNCLOUD_DOMAIN
  echo >> /etc/hosts 127.0.0.1 $KOPANO_KONNECT_DOMAIN
  echo >> /etc/hosts 127.0.0.1 $OWNCLOUD_DOMAIN

  export OWNCLOUD_RELEASE_DOCKER_TAG=$OWNCLOUD_RELEASE_DOCKER_TAG
  docker-compose \
    -f owncloud-base.yml \
    -f owncloud-official.yml \
    -f cache/redis.yml \
    -f database/mariadb.yml \
    -f ldap/openldap.yml \
    -f ldap/openldap-mount-ldif.yml \
    -f owncloud-exported-ports.yml \
    -f ldap/openldap-autoconfig-base.yml \
    -f kopano/konnect/docker-compose.yml \
    config > merged.yml
  docker-compose -f merged.yml up -d

  sleep 5
  while ! docker exec compose_owncloud_1 occ status 2>/dev/null| grep 'installed: true'; do
     echo "Waiting for ownCloud to become ready ..."
     sleep 5
  done
  docker exec compose_owncloud_1 occ app:list 'openidconnect|oauth2'
  sleep 3
  docker exec compose_owncloud_1 occ upgrade	# just in case one of the apps has a minor number jump.
  sleep 2

  # echo 'starting a temp shell. type exit to continue'
  # bash

  sleep 5
  # workaround for https://github.com/owncloud-docker/base/pull/140
  # 140 got superceeded by pull/178 which works only with knowledge about major or not major upgrade.
  docker-compose -f merged.yml exec owncloud occ market:uninstall openidconnect
  docker-compose -f merged.yml exec owncloud occ upgrade	# just in case one of the apps has a minor number jump.
  docker-compose -f merged.yml exec owncloud wget $openidconnect_url -O /tmp/o.tar.gz
  docker-compose -f merged.yml exec owncloud occ market:install -n -l /tmp/o.tar.gz
  docker-compose -f merged.yml exec owncloud occ market:upgrade -n --major openidconnect
  docker-compose -f merged.yml exec owncloud occ upgrade	# just in case one of the apps has a minor number jump.
  docker-compose -f merged.yml exec owncloud occ app:enable openidconnect
  docker-compose -f merged.yml exec owncloud occ app:list 'openidconnect|oauth2' && echo OWNCLOUD IS READY
 
  while ! docker exec compose_owncloud_1 occ user:sync -l 2>/dev/null | grep 'User_LDAP'; do
    echo "Waiting for user_ldap to become ready ..."
    sleep 5;
  done
  docker exec compose_owncloud_1 occ user:sync --missing-account-action=disable 'OCA\User_LDAP\User_Proxy' || echo "user:sync failed"

  cat <<EOM
---------------------------------------------
# start a screen session, watch the logs with
	docker-compose -f merged.yml logs -f

# you may now first need to add the DNS entries at https://dash.cloudflare.com
	cf_dns $IPADDR $KOPANO_KONNECT_DOMAIN
	cf_dns $IPADDR $OWNCLOUD_DOMAIN

# wait 10 min or restart caddy (as often as needed)
	docker-compose -f merged.yml restart caddy

# until you see log messages like
	caddy_1           | 2020/10/07 00:22:01 [INFO] [konnect-1-0-0rc4.oidc-jw-qa.owncloud.works] Server responded with a certificate.
	caddy_1           | 2020/10/07 00:22:04 [INFO] [owncloud-1-0-0rc4.oidc-jw-qa.owncloud.works] Server responded with a certificate.

# to start a migration from oauth to openidconnect:
	a) docker exec compose_owncloud_1 occ app:enable oauth2
	b) docker exec compose_owncloud_1 occ app:disable openidconnect

# then connect from remote (certs must be good!):
	curl https://$OWNCLOUD_DOMAIN/.well-known/openid-configuration	# if oauht2: 302 to /login page. if openidconnect: json config
	curl http://$IPADDR:9680/status.php
	firefox https://$OWNCLOUD_DOMAIN

# login via 'Kopano' with user: aaliyah_abernathy pass: secret

# you may first need to add the DNS entries to cloudflare:
	cf_dns $IPADDR $KOPANO_KONNECT_DOMAIN
  	cf_dns $IPADDR $OWNCLOUD_DOMAIN
# CAUTION:
#       kopano_konnect 0.33 suffers from token refresh problems with mobile and desktop
#       https://github.com/owncloud/client/issues/9056#issuecomment-922363069
---------------------------------------------
EOM
EOF

