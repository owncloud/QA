#! /bin/bash
#
# 2022-07-27, jw@owncloud.com
# 
# References:
# - https://github.com/owncloud/user_shibboleth/blob/master/docs/installation_on_debian.md#adding-shibboleth

# source ./env.sh	# probably not needed.


sed -i "s_https://sp.example.org/shibboleth_${UUID}_" /etc/shibboleth/shibboleth2.xml
# shibboleth comes as an apache module:
apt-get install -y libapache2-mod-shib2 uuidgen
shib-keygen
# the configuration can be found in /etc/shibboleth/shibboleth2.xml
# we will now follow the steps in testshib.org:
# Installation, to keep time in sync
# apt-get install ntp # commented because we install in a vm
# Registration
# generate a uniqe id for our SP
UUID=$(uuidgen)
# use the uuid in the shibboleth config
sed -i "s_https://sp.example.org/shibboleth_${UUID}_" /etc/shibboleth/shibboleth2.xml
# restart shibd and download metadata
service shibd restart
# now we need to construct a multipart/form-data file
# let's do that in the shibboleth dir
cd /etc/shibboleth

a2dissite owncloud
systemctl reload apache2
wget https://localhost/Shibboleth.sso/Metadata -O Metadata-$UUID.xml --no-check-certificate
a2ensite owncloud
systemctl reload apache2

echo -ne "--FILEUPLOAD\r\nContent-Disposition: form-data; name=\"userfile\"; filename=\"Metadata-${UUID}.xml\"\r\nContent-Type: text/xml\r\n\r\n" > postfile
cat Metadata-${UUID}.xml >> postfile
echo -ne "\r\n--FILEUPLOAD--\r\n" >> postfile
# which we use to register at testshib.org
# 

cat <<EOM
------------------------------------------------------------
https://www.testshib.org/procupload.php is n longer active. Cannot continue the configuation.

Please monitor any results from https://github.com/owncloud/user_shibboleth/issues/349

------------------------------------------------------------
EOM
# # wget --header="Content-type: multipart/form-data boundary=FILEUPLOAD" --post-file postfile https://www.testshib.org/procupload.php
# wget --header="Content-type: multipart/form-data boundary=FILEUPLOAD" --post-file postfile https://samltest.id/upload.php
# # make a backup of the default config
# cp shibboleth2.xml shibboleth2.xml.bak
# # download the testshib sample shibboleth2.xml
# wget "https://www.testshib.org/cgi-bin/sp2config.cgi?dist=Others&hostname=octestshib" -O shibboleth2.xml
# # testshib generates a new entity id which we have to overwrite again
# sed -i "s_https://octestshib/shibboleth_${UUID}_" /etc/shibboleth/shibboleth2.xml
# service shibd restart
# # Now we need to actually protect owncloud with shibboleth
# sed -i 's|</VirtualHost>|\t<Location "/">\n\t\t\tAuthType shibboleth\n\t\t\tShibRequestSetting requireSession 1\n\t\t\tRequire shib-session\n\t\t</Location>\n\t</VirtualHost>|' /etc/apache2/sites-enabled/default-ssl.conf
# service apache2 restart
# # visiting https://octestshib should now redirect you to the login page at testshib.org
# # login with myself:myself
# # you will be redirected to https://octestshib, but likely still as admin


occ app:enable shibboleth

