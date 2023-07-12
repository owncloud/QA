#! /bin/bash
#
# 2022-02-17, jw@owncloud.com

# source ./env.sh	# probably not needed.

occ app:enable admin_audit

cat <<EOF>/var/www/owncloud/config/admin_audit.config.php
<?php
\$CONFIG = [
  'log.conditions' => [
     [
        'apps' => ['admin_audit'],
        'logfile' => '/var/www/owncloud/data/admin_audit.log'
     ]
  ]
];
EOF

