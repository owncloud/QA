#! /bin/sh
#
# List dns entries and check for running machines
#
# References: https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records
#
# (C) 2021-11-10 - jw@owncloud.com
# (C) 2022-06-07 - jw@owncloud.com


cf_zone_default=owncloud.works
subdomain=jw-qa

if [ "$1" = '-h' -o "$1" = '--help' ]; then
  cat <<EOF
Usage: $0 [subdomain] [-c|-C]

Enumerate all DNS records in $subdomain.$CLOUDFLARE_DNS_ZONE .
Option -c checks for running machines with ping.
Option -C checks ssh root login via ssh-key with a timeout of 10 seconds.
with -c or -C you are also prompted if you wish to delete nonresponsive entries.

The DNS zone is defined by the environment variable CLOUDFLARE_DNS_ZONE,
which defaults to $cf_zone_default .

The first parameter is prepended to the zone as a subdomain. Default: $subdomain .
Use '.' as a subdomain to list really all.
(With CLOUDFLARE_DNS_API the URL for a zone API can be directly given. This overrides CLOUDFLARE_DNS_ZONE.)
The API access token is taken from CLOUDFLARE_TOKEN.
EOF
  exit 0
fi

purge=false
check=
if [ "$1" = '-c' -o "$2" = '-c' ]; then
  purge=true
  check=ping
fi

if [ "$1" = '-C' -o "$2" = '-C' ]; then
  purge=true
  check=ssl
fi


if [ "$1" != '' -a "$1" != '-c' -a "$1" != '-C' ]; then
  subdomain=$1
fi

if [ -z "$CLOUDFLARE_DNS_ZONE" ]; then
  export CLOUDFLARE_DNS_ZONE=$cf_zone_default
fi

if [ -n "$CLOUDFLARE_TOKEN" ]; then
  cf_curl () { curl -s -H "Authorization: Bearer $CLOUDFLARE_TOKEN" -H "Content-Type: application/json" -X "$@"; }
elif [ -n "$CLOUDFLARE_API_KEY" -a -n "$CLOUDFLARE_USER" ]; then
  cf_curl () { curl -s -H "X-Auth-Email: $CLOUDFLARE_USER" -H "X-Auth-Key: $CLOUDFLARE_API_KEY" -H "Content-Type: application/json" -X "$@"; }
else
  echo "ERROR: Neither CLOUDFLARE_TOKEN (prefered) nor CLOUDFLARE_API_KEY + CLOUDFLARE_USER are in the environment."
  exit 1
fi

if [ -z "$CLOUDFLARE_DNS_API" ]; then
  cf_zone_id="$(cf_curl GET "https://api.cloudflare.com/client/v4/zones?name=$CLOUDFLARE_DNS_ZONE" | jq ".result[].id" -r)"
  if [ -z "$cf_zone_id" ]; then
    echo "ERROR: could not find CLOUDFLARE_DNS_ZONE '$CLOUDFLARE_DNS_ZONE'"
    exit 1
  fi
  export CLOUDFLARE_DNS_API=https://api.cloudflare.com/client/v4/zones/$cf_zone_id/dns_records
fi

## CAUTION: this produces paged results. Default per_page=20.
## There is no documented filter for record names or subdomains. We have to pull all, and filter manually.
json=$(cf_curl GET "$CLOUDFLARE_DNS_API?type=A&per_page=1000")
if [ "$(echo $json | jq '.result_info.total_pages')" != "1" ]; then
  echo $json | jq '.result_info'
  echo
  echo "ERROR: total pages was not 1. Fix $0"
  exit 1
fi

# assert that the subdomain begins and ends with a '.' -- but if it is only a single '.', then do not add more dots.
echo $subdomain | grep -q '^\.' || subdomain=".$subdomain" 
echo $subdomain | grep -q '\.$' || subdomain="$subdomain." 

# {
#   "result": [
#     {
#      "id": "2fe79fee138cf27b5062f882527ca600",
#      "zone_id": "b13cfa5c807372fb6c868bfa102b6297",
#      "zone_name": "DOMAIN.TLD",
#      "name": "HOSTNAME.SUB.DOMAIN.TLD",
#      "type": "A",
#      "content": "88.43.23.66",
#      "proxiable": true,
#      "proxied": false,
#      "ttl": 1,
#      "locked": false,
#      "meta": {
#        "auto_added": false,
#        "managed_by_apps": false,
#        "managed_by_argo_tunnel": false,
#        "source": "primary"
#      },
#      "created_on": "2021-12-09T19:19:54.203843Z",
#      "modified_on": "2021-12-09T19:19:54.203843Z"
#    },
#  ...

for entry in $(echo "$json"  | jq '.result[] | .modified_on+"@"+.content+"@"+.name' -r | sort -r | grep --fixed-strings "$subdomain" ); do
  set $(IFS=@; echo $entry)
  ipaddr=$2
  fqdn=$3
  printf "%-16s %55s\n" $ipaddr $fqdn
  if [ "$purge" = true ]; then
    if echo "$fqdn" | grep -F '*'; then
      wildcard="$wildcard $fqdn"
    elif [ "$check" = ping ]; then
      if ! env LC_ALL=C timeout 1 ping -i 0.5 -c 3 "$fqdn" 2>&1 | grep -q 'bytes from'; then
        orphan="$orphan $fqdn"
      fi
    elif [ "$check" = ssl ]; then
      if ! timeout -s 9 10 ssh -v "root@$fqdn" /bin/true; then
        echo "-- please retry: ssh 'root@$fqdn' /bin/true && echo okay"
        orphan="$orphan $fqdn"
      fi
    fi
  fi
done

if [ "$purge" != true ]; then
#  echo
#  echo "Hint: use -c or -C to check (and optionally purge) nonresponsive entries"
  exit 0
fi

wc_count="$(echo $wildcard | wc -w)"

if [ "$wc_count" != "0" ]; then
  echo 
  echo "Cannot check $wc_count wildcard DNS entries:"
  for wc in $wildcard; do
    echo "  $wc"
  done
  echo 
fi

if [ -z "$orphan" ]; then
  echo
  echo "All checked entries respond to $check. Great!"
  exit 0
fi

echo
echo Nonresponsive entries:
echo $orphan | tr ' ' '\n' | LC_ALL=C sort
echo
echo "Type DELETE to delete them, just hit Enter to abort."
read a; if [ "$a" != "DELETE" ]; then
  exit 0
fi

for fqdn in $orphan; do
  id=$(cf_curl GET "$CLOUDFLARE_DNS_API?name=$fqdn" |  jq '.result[].id' -r)
  echo "delete id=$id $fqdn"
  cf_curl DELETE $CLOUDFLARE_DNS_API/$id | jq '"Success: " + (.success|tostring) +  " " + .errors[0].message'
done
