#! /bin/bash
#
# 2022-02-17, jw@owncloud.com

# source ./env.sh	# probably not needed.

# Avoid "RuntimeException","Message":"You need to install the imagick extension to use this back end"
# https://github.com/owncloud/twofactor_totp/issues/260

case "$(lsb_release -d -s)" in
  "Ubuntu 22"* | "Ubuntu 21.10" )
    apt install -y php7.4-imagick
    ;;
  * )
    apt install -y php-imagick
    ;;
esac

occ app:enable twofactor_totp

