#! /bin/bash
#
# 2021-06-18, jw@owncloud.com

#----------------------------------------------------------------------------
# A php-smbclient package exists only for ubuntu-18.04, we can use ondrey's ppa or compile it from source.
#----------------------------------------------------------------------------
# tbro: Unfortunately, Ondrej took some very weird decisions in the past,
# like building his own libssl and openssl packages for Xenial (16.04)
# - see here https://launchpad.net/~ondrej/+archive/ubuntu/php/+build/15652889
# So I wouldn't recommend any customer to use this repo. Even not for
# host setups as it blocks updates of libssl / openssl from
# xenial-security (official repo) as the version was messed up and in
# the end this led to a security upgrade of ssl being considered as a
# "Downgrade" by apt, which than would not be installed.
#----------------------------------------------------------------------------
apt install -y php-pear php7.4-dev libsmbclient libsmbclient-dev make smbclient || exit -1
pecl install smbclient-stable || exit 1
echo 'extension="smbclient.so"' > /etc/php/7.4/mods-available/smbclient.ini
phpenmod -v ALL smbclient
service apache2 reload
#
mkdir -p /home/samba/{demo,user1}; chmod -R 777 /home/samba
#
# with docker-compose use: --network compose_default
# with docker-compose use: .[0].NetworkSettings.Networks.compose_default.IPAddress
# with docker-compose use: smbclient //samba/shared -U testy testy -c dir
#
docker run --rm -v /home/samba:/shared -d --name samba dperson/samba -u "admin;admin" -u "testy;testy" -u "demo;demo" -u "user1;user1" -s "shared;/shared;;no;;all" -s "demo;/shared/demo;;no;;demo,admin" -s "user1;/shared/user1;;no;;user1,testy " -n -p
smb_ip=$(docker inspect samba | jq .[0].NetworkSettings.IPAddress -r)
wget https://secure.eicar.org/eicar.com
smbclient //$smb_ip/shared -U testy testy -c 'put eicar.com; dir'
occ app:enable windows_network_drive	# CAUTION: triggers license grace period!
occ config:app:set core enable_external_storage --value yes
occ files_external:create /WND windows_network_drive password::password -c host=$smb_ip -c share="/shared" -c user=testy -c password=testy
sleep 2
screen -d -m -S wnd_listen -Logfile screenlog-wnd_listen -L occ wnd:listen -vvv $smb_ip shared testy testy 	# from https://github.com/owncloud/windows_network_drive/pull/148/files

