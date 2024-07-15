#! /bin/bash
#
# script to enable the ocm service and web apps.
#
# FIXME: All this is currently unused, it is hardcoded in deploy_ocis_full.sh

. ~/env.sh	# our CWD is in ~/run/... somewehere....
echo "$0 starting..."

# env vars seen in https://github.com/owncloud/web/blob/c75d4048f409fbbc5062226823d8880844b4fbeb/docker-compose.yml#L26C5-L26C45
cat <<EOT>> .env
# from $0
FRONTEND_OCS_INCLUDE_OCM_SHAREES=true
FRONTEND_OCS_ENABLE_DENIALS=true
# --
EOT
## Use yq to parse web.yaml and add to the apps list.
# WORKAROUND: In yq 2.12.2 option -i / --in-place seems broken: Always produces an empty file.
yq -y '.web.config.apps += ["ocm"]' config/ocis/web.yaml > temp.yaml
mv temp.yaml config/ocis/web.yaml

## 
