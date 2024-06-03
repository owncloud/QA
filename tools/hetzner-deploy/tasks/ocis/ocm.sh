#! /bin/bash
#
# script to enable the ocm service and web apps.
#
# FIXME: All this is currently hardcoded in deploy_ocis_traefik.sh

. ~/env.sh	# our CWD is in ~/run/... somewehere....
echo "$0 starting..."

# env vars seen in https://github.com/owncloud/web/blob/c75d4048f409fbbc5062226823d8880844b4fbeb/docker-compose.yml#L26C5-L26C45
cat <<EOT>> ocis_env.sh
# ocm
FRONTEND_OCS_INCLUDE_OCM_SHAREES=true
FRONTEND_OCS_ENABLE_DENIALS=true
# --
EOT
## CAUTION: we assume that web.yaml ends in web.config.apps: at indentation level 6.
echo >> web.yaml "      - ocm"
