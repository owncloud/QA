#!/bin/bash
#
# 2023-06-15, jw@owncloud.com
#
# - local clamav with dockerized clamav-c-icap
# - this is very slow to start... freshclam takes very long upon first update ...

# source ./env.sh	# probably not needed.

apt install -y clamav clamav-daemon
echo >> /etc/clamav/clamd.conf "TCPSocket 3310"
sed -i -e 's/LogVerbose false/LogVerbose true/' /etc/clamav/*.conf
/etc/init.d/clamav-daemon restart

sleep 20	# waiting for clamd to get ready...
set -x
wget https://secure.eicar.org/eicar.com.txt
clamscan eicar.com.txt
set +x
for i in 10 9 8 7 6 5 4 3 2 1; do
  test -e /var/run/clamav/clamd.ctl && break;
  echo " ... waiting for socket ... $i min"
  sleep 20
  test -e /var/run/clamav/clamd.ctl && break;
  sleep 20
  test -e /var/run/clamav/clamd.ctl && break;
  sleep 20
  /etc/init.d/clamav-daemon restart
done
netstat -a | grep clam

### and also icap option enabled. User has to choose in the end.
apt install -y jq p7zip-full postgresql docker.io
# first: ClamAV c-icap
apt install -y jq
screen -d -m -S c-icap -Logfile screenlog-c-icap -L docker run --rm --name c-icap -ti deepdiver/icap-clamav-service
for i in 10 9 8 7 6 5 4 3 2 1; do
  cicap_addr=$(docker inspect c-icap 2>/dev/null| jq .[0].NetworkSettings.IPAddress -r);
  test "$cicap_addr" != null -a "$cicap_addr" != "" && break;
  echo "waiting for c-icap: $i"; sleep 5;
done
echo "Testing $cicap_addr 1344 ..."
echo -e "\r\n\r" | timeout 20 netcat "$cicap_addr" 1344 | grep Server || echo "ERROR: no server reported"

