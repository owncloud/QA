#!/bin/bash
#
# 2024-02-05, jw@owncloud.com
#
# 
# 

echo "Estimated setup time: 5 minutes ..."

vers=$(date +%Y%m%d)
export HCLOUD_SERVER_IMAGE=ubuntu-22.04
source lib/make_machine.sh -t cx21 -u ceph-$vers -p git,screen,docker.io,composer,openssl,wget,ceph-common,cephadm "$@"
admin_pass="admin$vers"

CEPH_NET=10.100.0.0/16
# ceph_vers=16.2
#ceph_rel=pacific
ceph_vers=18.2.1
ceph_rel=reef
IMAGE_NAME=quay.io/ceph/ceph:v$cepv_vers

test -n "$OC10_ADMIN_PASS" && admin_pass="$OC10_ADMIN_PASS"

INIT_SCRIPT << EOF
  export LC_ALL=C		# prevent perl for complaining about de_DE.utf-8
  export IPADDR=$IPADDR		# output of lib/make_machine.sh
  echo > ~/env.sh "IPADDR=$IPADDR"
  echo >> ~/env.sh "ADMIN_PASS=$admin_pass"

  # https://tracker.ceph.com/issues/59103: need the pacific release here. The newer quincy does not work on ubuntu 22.04
  # (cd /usr/local/bin; curl --silent --remote-name --location https://github.com/ceph/ceph/raw/$ceph_rel/src/cephadm/cephadm ) 
  # chmod a+x /usr/local/bin/cephadm 
  cephadm version
  cephadm add-repo --release $ceph_rel
  cephadm install
  cephadm version

  cephadm bootstrap --mon-ip $IPADDR --initial-dashboard-password $admin_pass

  cat <<EOM
---------------------------------------------
Check that $ceph_rel $cepv_vers is the latest release:
https://docs.ceph.com/en/latest/releases/#active-releases

Attach:
  - network "ceph.jw" 10.100.0.0/16
  - volume "volume-ceph-hel1-1" as /dev/sdb (but umount)

cephadm --create-daemon mon.a -i a

cephadm --create-daemon mgr.x -i x

cephadm --create-daemon osd.0 -i 0




---------------------------------------------
EOM
EOF
