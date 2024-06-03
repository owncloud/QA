#! /bin/bash
#
# (c) 2020 jw@owncloud.com, distribute under GPLv2 or ask.
#
# 2020-05-11, jw, added loop to allow multiple deletions
# 2020-05-12, jw, added globbing patterns, for I am lazy.
# 2020-05-19, jw, added support for hcloud_cli, to ease the terraform dependency
# 2020-05-20, jw, ported to mac
# 2023-06-14, jw, fix race condition with dns removal and ssh.
# 2024-05-23, jw, timeout from 10 to 15 sec, it triggered needlessly.
# 2024-06-03, jw, also removing *.$name, ... - take care to not remove DNS entries from machines we don't own.

test -z "$HCLOUD_TOKEN" && export HCLOUD_TOKEN=$TF_VAR_hcloud_token
test -z "$TF_VAR_hcloud_token" && export TF_VAR_hcloud_token=$HCLOUD_TOKEN
if [ -z "$HCLOUD_TOKEN" ]; then
  echo "Environment variable HCLOUD_TOKEN not set."
  exit 1
fi
test -z "$TF_USER" && TF_USER=$USER

for name in "$@"; do

  if echo $name | grep -q '\.'; then
    echo "$name contains dots - removing cloudflare DNS entries ..."

    set -x
    ## Fetch IPADDR first. we cannot safely use the dnsname after we deleted it from cloudflare.
    # ipaddr=$(dig -t A $name | sed -n -e 's/.* IN A //p')
    ipaddr=$(host "$name" | sed -ne 's/.* has address //p')

    test -n "$ipaddr" && name=$ipaddr	# prefer the IP Address for ssh, now that we officially removed the DNS name

    echo "Retrieving hostname via ssh ..."
    hostname=$(set -x; timeout -s 9 15 ssh root@$name hostname)
    if [ -z "$hostname" ]; then
      echo "Oops, failed to get hostname. Retry $0 with the ip address?"
      exit 1
    fi
    # now that we verified, that we could log into the machine with ssh, it should be safe to remove DNS entries.
    # If $name was a DNS-name, that could be resolved into an ipaddr, then we assigned that ipaddr back to $name
    #  -> in this case, $name now holds the IP address.
    # Otherwise, we know that $name worked to log in via ssh, so if it is not a DNS name, then it is most likely an IP address.
    yes | cf_dns "$name" -		# this deletes all dns names pointing to the ip address.

    set +x
    echo "+ $0 $hostname"
    name=$hostname
  fi


  if [ -f "$(dirname $0)/lib/hcloud_cli/bin/hcloud" ]; then
    "$(dirname $0)/lib/hcloud_cli/bin/hcloud" server delete "$name"
    continue
  fi

  cd $(dirname $0)/lib/hcloud_tf/terraform

  if [ -z "$name" ]; then
    echo "Usage: $0 MACHINE_NAME_GLOB ..."
    echo ""
    echo "Example: $0 $TF_USER-*"
    echo ""
    echo "Known names are:"
    ls *.tfstate 2>/dev/null | grep -v 'terraform\.tfstate' | sed -e 's/\.tfstate//' -e 's/^/  /'
    exit 1
  fi

  while [ -n "$name" ]; do
    for tfstate in $name.tfstate; do
      autoapprove=
      bin/terraform refresh -state=$tfstate >/dev/null
      test -z "$(bin/terraform state list -state=$tfstate)" && autoapprove=-auto-approve
      bin/terraform destroy $autoapprove -state=$tfstate
    done
    shift
    name=$1
  done

  for st in *.tfstate; do
    bin/terraform refresh -state=$st >/dev/null
    address=$(bin/terraform state list -state=$st)
    if [ -z "$address" ]; then
      rm -f $st $st.backup
      echo "state-file $st removed."
    fi
  done

done
