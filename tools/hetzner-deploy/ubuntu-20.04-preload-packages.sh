echo "Install this on the smallest image possible: cx11 with 20GB disk."
echo "Designed for ubunutu-20.04 - press ENTER to continue."
uname -a
read a

apt update
apt install -y libapache2-mod-php php-imagick php-common php-curl php-gd php-imap php-intl
apt install -y php-ldap php-pgsql php-json php-mbstring php-mysql php-sqlite3 php-ssh2
apt install -y git screen wget apache2 ssl-cert docker.io jq
apt install -y vim screen docker.io docker-compose binutils ldap-utils
apt install -y php-xml php-zip php-apcu php-redis php-gmp
apt install -y git screen docker.io composer make libxml2-utils apache2 libapache2-mod-php openssl php-imagick php-common php-curl php-gd php-imap php-intl php-json php-mbstring php-mysql php-ssh2 php-xml php-zip php-apcu php-ldap php-gmp wget npm
apt install -y php-pear php7.4-dev libsmbclient libsmbclient-dev make
apt install -y ssh apache2 mariadb-server openssl redis-server wget bzip2 zip rsync curl jq inetutils-ping
apt install -y smbclient coreutils ldap-utils postgresql
apt install -y certbot python3-certbot-apache python3-certbot-dns-cloudflare

echo ""
echo "Now shutdown and save a snapshot named ubuntu-20.04-preload"
echo ""
