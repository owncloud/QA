#!/bin/bash
#
# 2021-05-12, jw@owncloud.com
#
# - files_antivirus with a local clamav
# - files_antivirus with dockerized clamav-c-icap
# - files_antivirus with (if tar and key are present) Kaspersky Scan Engine

# FIXME: this is needed to avoid an upgrade scenario during start: rm -rf /var/www/owncloud/apps/files_antivirus
occ app:check files_antivirus         	# https://github.com/owncloud/files_antivirus/issues/394
occ app:enable files_antivirus

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
echo -e "\r\n\r" | netcat "$cicap_addr" 1344 | grep Server

### If socket version
occ config:app:set files_antivirus av_socket          --value="/var/run/clamav/clamd.ctl"
# occ config:app:set files_antivirus av_mode          --value="socket"

### Else Config for icap
occ config:app:set files_antivirus av_host            --value="$cicap_addr"
occ config:app:set files_antivirus av_port 	      --value="1344"
occ config:app:set files_antivirus av_mode            --value="icap"			# 'icap' Triggers Grace Period
# c-icap clamav: 'avscan', Kaspersky: 'req', MacAfee: 'wwreqmod'
occ config:app:set files_antivirus av_request_service --value="avscan"
# c-icap clamav: 'X-Infection-Found', Kaspersky: 'X-Virus-ID', MacAfee: not applicable
occ config:app:set files_antivirus av_response_header --value="X-Infection-Found"
occ config:app:set files_antivirus av_infected_action --value="delete"			# 'delete', 'only_log'

# second: Kaspersky Scanengine
echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf        # we don't know the IP yet.
grep '^port' /etc/postgresql/12/main/postgresql.conf                            # default 5432
su - postgres sh -c "psql -c \"alter user postgres with password 'ps4kas';\""
su - postgres sh -c "psql -c \"drop database kavebase;\""	2>/dev/null
su - postgres sh -c "psql -c \"drop user icap;\""		2>/dev/null
echo >> /etc/postgresql/12/main/pg_hba.conf     "host    all   all      172.17.0.1/16  md5"
echo >> /etc/postgresql/12/main/pg_hba.conf     "local   all   postgres                md5"
service postgresql restart

rm -rf /opt/kaspersky
tarname="$(ls Kaspersky_ScanEngine*.tar.gz | head -n 1)"
if [ ! -f "$tarname" ]; then
  echo "Kaspersky_ScanEngine not initialized: No match for Kaspersky_ScanEngine*.tar.gz"
else
  tar xf "$tarname"
  tartop="$(tar tf "$tarname" | head -n 1 | sed -e 's@^/@@' -e 's@^./@@' -e 's@/.*@@')"
  ( cd "$tartop"; screen -d -m -Logfile screenlog-kasinstall -L -S kasinstall ./install )
  for a in "" q Yes Yes Yes No 127.0.0.1:5432 postgres ps4kas icap Ps4_kasp Ps4_kasp 2 11344 No No /tmp 1 /root/ Yes; do
    screen -S kasinstall -X stuff "$a\\n" || echo "failed to stuff $a"
    sleep 1
    cat screenlog-kasinstall
    sleep 1
  done
  for i in 1 2 3 4; do sleep 3; cat screenlog-kasinstall; done
  ## Per default Kaspersky does not send the virus name in a header, the sed below should not be needed.
  # sed -i -e 's@<VirusNameICAPHeader.*@<VirusNameICAPHeader>X-Infection-Found</VirusNameICAPHeader> <SentVirusNameICAPHeader>X-Infection-Found</SentVirusNameICAPHeader>@' /opt/kaspersky/ScanEngine/etc/kavicapd.xml
  /opt/kaspersky/ScanEngine/etc/init.d/kavicapd restart

  echo ""
  echo "Make the Kaspersky ScanEngine Web GUI locally as https://localhost:11443 via ssh-tunnel:"
  echo "  ssh -v -L 11443:127.0.0.1:1443 root@$IPADDR"
  echo ""
  echo "To review icap settings, use:"
  echo "  occ config:list --output=plain | grep files-antivirus.icap"
  echo "To switch icap from from clamav-icap to kaspersky run these commands:"
  echo "  occ config:app:set files_antivirus av_host             --value=127.0.0.1"
  echo "  occ config:app:set files_antivirus av_port 	         --value=11344"
  echo "  occ config:app:set files_antivirus av_mode             --value=icap"
  echo "  occ config:app:set files_antivirus av_request_service  --value=req"
  echo "  occ config:app:set files_antivirus av_response_header --value='X-Virus-ID'"
  echo ""
  echo "To switch off icap:"
  echo "  occ config:app:set files_antivirus av_mode             --value=socket"
  echo ""
fi
