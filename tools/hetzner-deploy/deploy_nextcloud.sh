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
admin_pass="admin$(date +%Y%m%d)"	# an unsecure default. To be overridden by env OC10_ADMIN_PASS
test -n "$OC10_ADMIN_PASS" && admin_pass="$OC10_ADMIN_PASS"

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

# prepare env.sh so cf_dns can generate us a DNS entry.
echo >  ~/env.sh "IPADDR=$IPADDR"
echo >> ~/env.sh "nc_fqdn=\$nc_fqdn"
echo >> ~/env.sh "CERTBOT=none"		# DNS only, no cert service for this one, the nextcloud_setup.sh does it locally.

# wait until CF_DNS.sh
for i in \$(seq 1 10); do
  if [ -f ~/CF_DNS.msg ]; then
    echo "########################### CF_DNS.msg ###########################"
    cat ~/CF_DNS.msg
    echo "########################### ---------- ###########################"
    sleep 5	# give DNS some time to get in syn...
    break
  fi
  sleep 10
  echo "CF_DNS.msg not yet there. Retrying \$i ..."
  test "\$i" == 10 && echo " gving up."
done

# preload values for /opt/hcloud/nextcloud_setup.sh
export domain=\$nc_fqdn
export username=admin
export email=jw@owncloud.com
export password=$admin_pass
export password2=$admin_pass

# HACK: replace all the read -p or read -s -p lines with simple echo, to make it non-interactive...
sed -i.orig 's/\bread\b/echo \\\\# read/' /opt/hcloud/nextcloud_setup.sh

(set -x; ls -la /var/www/*/config)

echo "NOTE: If there is an error message below about removing /var/www/html/config/CAN_INSTALL, then everything is well..."

cat << EOM

Please run locally:
	cf_dns 78.46.246.94 \$nc_fqdn

Then paste the name below at the prompt 'Your Domain:' $nc_fqdn
and follow the remaining instructions.
You will be placed in a root shell at the server when all is set up.

From remote
	firefox https://\$nc_fqdn$webroute
	firefox https://$IPADDR$webroute
		admin / $admin_pass
EOM
EOF
