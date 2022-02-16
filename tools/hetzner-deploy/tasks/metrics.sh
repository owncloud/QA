#! /bin/bash
#
# 2021-06-18, jw@owncloud.com

# source ./env.sh	# probably not needed.

occ app:enable metrics	# CAUTION: triggers license grace period!
occ config:system:set "metrics_shared_secret" --value 123456

