#! /bin/bash
#
# References:
# - https://docs.hetzner.com/de/cloud/apps/list/nextcloud/
#

location=fsn1	#hel1		# hel1, fsn1, nbg1


test -z "$NC_DNSNAME" && NC_DNSNAME="nc-date"
h_name="$NC_DNSNAME"
d_name=$(echo $h_name  | sed -e "s/date/$(date +%Y%m%d)/i")

image=nextcloud
webroute=/		# what users expect

machine_type=$HCLOUD_MACHINE_TYPE
if [ -z "$HCLOUD_MACHINE_TYPE" ]; then
  machine_type=cx31
  # cx11: 20 GB, # cx21: 40 GB, # cpx21: 80 GB, # ccx11: 80 GB, 2 CPUs dedicated.
  # cpx31: 160 GB
  echo hcloud server create --name $name --type cx31 --image nextcloud
fi

mydir="$(dirname -- "$(readlink -f -- "$0")")"	# find related scripts, even if called through a symlink.
source $mydir/lib/make_machine.sh -L $location -t $machine_type -u $d_name -i $image -p git,screen,wget,jq "${ARGV[@]}"

INIT_SCRIPT << EOF
uptime
test -n "$NC_DNSNAME" && nc_fqdn="$(echo "$NC_DNSNAME" | sed -e "s/date/$(date +%Y%m%d)/i").jw-qa.owncloud.works"

cat << EOM

Please run locally:
	cf_dns 78.46.246.94 $nc_fqdn

Then paste the name below at the prompt 'Your Domain:' $nc_fqdn
and follow the remaining instructions.
You will be placed in a root shell at the server when all is set up.

From remote
	firefox https://$nc_fqdn$webroute
	firefox https://$IPADDR$webroute
		admin / ...
EOM
EOF
