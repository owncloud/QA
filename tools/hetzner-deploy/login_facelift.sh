#! /bin/bash
# test run the facelift discussed in https://github.com/owncloud/enterprise/issues/5653
#
cd /var/www/owncloud/
wget https://patch-diff.githubusercontent.com/raw/owncloud/core/pull/40708.diff
patch -b -p1 < 40708.diff

