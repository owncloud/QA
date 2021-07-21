#! /bin/bash
#
# 2021-06-18, jw@owncloud.com
#
# - encryption with hsmdaemon & softHSM

if [ "$(echo hsmdaemon*.zip)" = 'hsmdaemon*.zip' ]; then
  echo "hsmdaemon-*.zip not deployed."
  echo "configuring encryption app without hsm support..."

  occ app:list encryption
  occ app:enable encryption
  occ encryption:enable
  occ encryption:select-encryption-type masterkey -y
  # occ encryption:encrypt-all -y

  occ app:list encryption
  occ encryption:status

  exit 0
fi

mkdir -p src/github/opendnssec
cd src/github/opendnssec
git clone https://github.com/opendnssec/SoftHSMv2.git
apt install -y build-essential automake autoconf libtool opensc unzip libssl-dev
cd SoftHSMv2
sh autogen.sh; ./configure; make; make install
cp src/lib/common/softhsm2.conf $HOME
export SOFTHSM2_CONF=$HOME/softhsm2.conf
grep -q SOFTHSM2_CONF ~/.bashrc || echo >> ~/.bashrc "export SOFTHSM2_CONF=$HOME/softhsm2.conf"

softhsm2-util --delete-token --slot 0 --token "My token 1" >/dev/null 2>&1 && true
softhsm2-util --init-token --slot 0 --label "My token 1" --pin 1234 --so-pin 123456
softhsm2-dump-file /var/lib/softhsm/tokens/*/token.object | head -7

libsofthsm2=/usr/lib/x86_64-linux-gnu/softhsm/libsofthsm2.so
test -f /usr/local/lib/softhsm/libsofthsm2.so && libsofthsm2=/usr/local/lib/softhsm/libsofthsm2.so
pkcs11-tool --module $libsofthsm2 -l -O --pin 1234

## CAUTION: Keep in sync with
# https://doc.owncloud.com/server/admin_manual/configuration/server/security/hsmdaemon/#copy-the-config-file
#


cd ~/src
rm -rf hsmdaemon-0.0.8
unzip $HOME/hsmdaemon-0.0.8.zip
cd hsmdaemon-0.0.8

## Collect data for the toml
hsm_jwt_secret=$(cat /proc/sys/kernel/random/uuid)
# FIXME: we need a temporary toml file with the correct module, otherwise hsmdaemon just segfaults.
mkdir -p /etc/hsmdaemon
cat << EO_TOML > /etc/hsmdaemon/hsmdaemon.toml
[pkcs11]
module = "$libsofthsm2"
EO_TOML
slot=$(./hsmdaemon listslots | grep Slot: | head -1 | tr -d 'Slot: ,')

mkdir -p /etc/hsmdaemon
cat << EO_TOML > /etc/hsmdaemon/hsmdaemon.toml
[logger]
level = "debug"    		# one of debug, info, warn, error, panic, fatal
path = "/var/log/hsm.log"	# stderr, stdoul, a path or a file:// uri
encoding = "json" 		# json or console

[server]
hostname = "localhost" 		# listen only on internal interface
#port = 8513

[jwt]
secret = "$hsm_jwt_secret"	# same as in config.php hsm.jwt.secret

[pkcs11]
module = "$libsofthsm2"
pin = "1234"
slot = $slot 			# The token has been initialized and is reassigned to slot 1188462905
EO_TOML

install -m 755 ./hsmdaemon /usr/local/bin/hsmdaemon
/usr/local/bin/hsmdaemon install
service hsmdaemon start

./hsmdaemon genkey test		# this does not get added to the slots
test_key=$(tail /var/log/hsm.log | grep 'generated keypair' | jq .tokenID -r)

if [ "$test_key" = null ]; then
  echo 1>&2 "ERROR: failed to produce a test key. Consult admin_manual -> hsmdaemon"
  exit 1
fi

# print the PUBLIC KEY again
./hsmdaemon showkey $test_key

# test encode something
hello="Hello, world!"
test_enc=$(./hsmdaemon encrypt $test_key $(echo "$hello" | base64) | tee /dev/stderr)
if [ -z "$test_enc" ]; then
  echo 1>&2 "ERROR: failed to encode '$hello'. Consult admin_manual -> hsmdaemon"
  exit 1
fi

# TODO: test decode a la https://github.com/owncloud/encryption/issues/263#issuecomment-864616432

occ config:app:set encryption hsm.jwt.secret --value $hsm_jwt_secret
occ config:app:set encryption hsm.url --value 'http://localhost:8513'
occ app:enable encryption
occ encryption:enable
occ encryption:select-encryption-type masterkey -y
# occ encryption:encrypt-all -y

occ encryption:status
occ app:list encryption
