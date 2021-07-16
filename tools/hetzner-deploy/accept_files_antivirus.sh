# see also administration-internal/tools/release/oc_apps_drone_tests.py
set -x
version=v10.7.0
qa_tar=owncloud-complete-20210326-qa.tar.bz2
version_php=7.4

# pivot into docker
test -f /.dockerenv || exec docker run --rm -ti -v $PWD/$0:/root/.bashrc -v $PWD:/var/www/owncloud/apps-external/files-antivirus  owncloudci/php:$version_php  bash

cd /var/www/owncloud
echo wget $qa_tar ...
wget https://download.owncloud.org/community/testing/$qa_tar -O - | tar jxf - --strip 1
mkdir -p vendor-bin/behat
wget -O vendor-bin/behat/composer.json https://raw.githubusercontent.com/owncloud/core/$version/vendor-bin/behat/composer.json
( cd vendor-bin/behat/ && composer install )
chmod a+x tests/acceptance/run.sh

mkdir -p apps-external

php occ maintenance:install --admin-pass=admin
php occ market:install -v files_pdfviewer
php occ upgrade

wget https://github.com/owncloud/testing/releases/download/latest/testing.tar.gz -O - | tar zxf - -C apps-external
php occ app:enable testing

cd apps-external/files-antivirus
make test-acceptance-cli
# make test-acceptance-api
set +x

