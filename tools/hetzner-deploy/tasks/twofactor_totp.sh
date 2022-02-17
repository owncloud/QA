#! /bin/bash
#
# 2022-02-17, jw@owncloud.com

# source ./env.sh	# probably not needed.

# Avoid "RuntimeException","Message":"You need to install the imagick extension to use this back end"
# https://github.com/owncloud/twofactor_totp/issues/260
apt install -y php-imagick

occ app:enable twofactor_totp

