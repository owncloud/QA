#! /bin/bash
#
# 2022-08-25, jw@owncloud.com

source ./env.sh

occ app:enable graphapi	# CAUTION: triggers license grace period!

app=graphapi
cat << EOM | sed -e "s/^/$app: /g" >>  ~/POSTINIT.msg
Try:
  # exercise the web ui
  base=https://\$oc10_fqdn/index.php
  curl -s -u admin:admin \$base/apps/graphapi/v1.0/groups               | jq	# list groups
  curl -s -u admin:admin \$base/apps/graphapi/v1.0/groups/admin/members | jq	# list members of group admin
  curl -s -u admin:admin \$base/apps/graphapi/v1.0/groups/admin         | jq	# group details
  curl -s -u admin:admin \$base/apps/graphapi/v1.0/users                | jq	# list users
  curl -s -u admin:admin \$base/apps/graphapi/v1.0/users/admin          | jq	# user details 
EOM
