#! /bin/sh
#
# Add or remove a DNS record at cloudflare
# References: https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records
#
# (C) 2021 - jw@owncloud.com
# 2024-05-23, jw - Minimal Support for CLOUDFLARE_DNS_WILDCARD=true added

cf_zone_default=owncloud.works
env_sh_bot="bot:qa@owncloud.com"

if [ "$1" = "-l" ]; then
  cf_dns_list "$2"
  exit 0
fi

if [ -z "$1" -o "$1$2" = '-' -o "$1$2" = '--' ]; then
  cat <<EOF
Usage:
	$0 IPADDR [FQDN] [BOT:mailaddr]
	$0 IPADDR --poll
	$0 -l [-c]

A cloudflare DNS record for the fully qualified domain name FQDN is created pointing to IPADDR.
If an entry for FQDN already exists, it is first removed, then re-created with the new IPADDR.
To delete an entry, you can pass '-' instead of a valid IPADDR.
To list all entries for an IPADDR, do not pass an FQDN.
To delete all entries for an IPADDR, you can pass '-' instead of a valid FQDN.

The form cf_dns IPADDR --poll tries to log into the machine as root and read ~/env.sh for *fqdn=... setting.
If found, a line CERTBOT=none will suppress running the certbot in the target system.
If found, a line DNS_WILDCARD=true mail will create a '*.' wildcard entry too.

The form cf_dns -l is an alias for cf_dns_list.

The zone used is controlled by the environment variable CLOUDFLARE_DNS_ZONE, which defaults to $cf_zone_default.
(With CLOUDFLARE_DNS_API the URL for a zone API can be directly given. This overrides CLOUDFLARE_DNS_ZONE.)

The environment variable CLOUDFLARE_DNS_WILDCARD can be set to true to also create a '*.' wildcard entry.
(certbot currently ignores this variable)

EOF
  exit 0
fi

if [ "$(echo "$2" | wc -c)" -gt 64 ]; then
  echo "ERROR: '$2' is longer than 63 characters."
  echo "ERROR: This may work with cloudflare dns, but would certainly fail with letsencrypt."
  exit 1
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
  cf_zone_id="$(cf_curl GET "https://api.cloudflare.com/client/v4/zones" | jq ".result[] | select(.name == \"$CLOUDFLARE_DNS_ZONE\") | .id " -r)"
  if [ -z "$cf_zone_id" ]; then
    echo "ERROR: could not find CLOUDFLARE_DNS_ZONE '$CLOUDFLARE_DNS_ZONE'"
    exit 1
  fi
  export CLOUDFLARE_DNS_API=https://api.cloudflare.com/client/v4/zones/$cf_zone_id/dns_records
fi

if [ "$2" = '-' -o "$2" = '' ]; then
  json="$(cf_curl GET "$CLOUDFLARE_DNS_API?content=$1" | jq '.result')"
  if [ -z "$json" -o "$json" = "[]" ]; then
    echo "$CLOUDFLARE_DNS_ZONE: No DNS-records found for $1"
    exit 0
  fi
  for fqdn in $(echo "$json"  | jq ".[] | .name" -r); do
    echo "\t$1 <- $fqdn"
  done
  if [ "$2" = '-' ]; then
    for id in $(echo "$json"  | jq ".[] | .id" -r); do
      fqdn="$(echo "$json" | jq ".[] | select(.id == \"$id\") | .name" -r)"
      echo "DELETE $id: $1 <- $fqdn ? (y/n)"
      read a
      if [ "$a" = 'y' -o "$a" = 'Y' -o "$a" = 'z' -o "$a" = 'Z' ]; then
        cf_curl DELETE $CLOUDFLARE_DNS_API/$id | jq '"Success: " + (.success|tostring) +  " " + .errors[0].message'
      fi
    done
  fi
  exit 0
fi

if [ "$2" = '--poll' ]; then
  # Try max 10 min
  for try in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29; do
    # extract the string that follows after fqdn= and strip quotes.
    fqdn=$(timeout 10 ssh root@$1 grep fqdn= env.sh | sed -e 's/^.*fqdn=//' -e "s/[\"']//g")
    if [ -n "$fqdn" ]; then
      certbot=$(timeout 10 ssh root@$1 grep CERTBOT= env.sh | sed -e 's/^CERTBOT=//' -e "s/[\"']//g")
      wildcard=$(timeout 10 ssh root@$1 grep DNS_WILDCARD= env.sh | sed -e 's/^DNS_WILDCARD=//' -e "s/[\"']//g")
      break
    fi
    echo "$0: retry $try ssh root@$1 ..."
    sleep 10
  done
  test "$certbot" = 'none' && env_sh_bot=
  echo "$0: Poll result: FQDN = '$fqdn' CERTBOT = '$env_sh_bot'"

  test "$wildcard" = 'true' && export CLOUDFLARE_DNS_WILDCARD=true
  set $1 "$fqdn" "$env_sh_bot"
  ## Fallthrough...
fi

record_id="$(cf_curl GET "$CLOUDFLARE_DNS_API?name=$2" | jq '.result[0].id' -r)"
echo $record_id
if [ "$record_id" != null -a -n "$record_id" ]; then
  old_ip="$(cf_curl GET "$CLOUDFLARE_DNS_API/$record_id" | jq '.result.content' -r)"
  if [ "$old_ip" = "$1" ]; then
    echo "Identical DNS-Record for $1 already exists."
  else
    echo "Press ENTER to remove existing record: $2 -> $old_ip"
    read a
    test -n "$record_id" && cf_curl DELETE $CLOUDFLARE_DNS_API/$record_id | jq '"Success: " + (.success|tostring) +  " " + .errors[0].message'
  fi
fi

# something like: 65-108-58-64.jw-qa.owncloud.works
short_fqdn=
if [ -n "$3" -a $(expr length "$2") -gt 63 ]; then
  # CN in DNS must be max 63 char. SAN (alternate names) can be longer - we need to fit certbot two names with -d in this case.
  short_fqdn="$(echo "$1" | sed -e 's/\./-/g').$(echo "$2" | sed -e 's/^[^\.]*\.//')"
fi

test -z "$CLOUDFLARE_USER" && CLOUDFLARE_USER=$LOGNAME

if [ "$1" != '-' -a -n "$1" ]; then
  cf_curl POST $CLOUDFLARE_DNS_API --data '{"type":"A","name":"'"$2"'","content":"'"$1"'","proxied":false,"comment":"owner: '$CLOUDFLARE_USER'"}' | jq
  short_record_id="$(cf_curl GET "$CLOUDFLARE_DNS_API?name=$short_fqdn" | jq '.result[0].id' -r)"
  if [ -n "$short_fqdn" ]; then
    test -n "$short_record_id" && cf_curl DELETE $CLOUDFLARE_DNS_API/$record_id >/dev/null 2>&1
    cf_curl POST $CLOUDFLARE_DNS_API --data '{"type":"A","name":"'"$short_fqdn"'","content":"'"$1"'","proxied":false,"comment":"owner: '$CLOUDFLARE_USER'"}' | jq
  fi
  if [ "$CLOUDFLARE_DNS_WILDCARD" = 'true' ]; then
    cf_curl POST $CLOUDFLARE_DNS_API --data '{"type":"A","name":"'"*.$2"'","content":"'"$1"'","proxied":false,"comment":"owner: '$CLOUDFLARE_USER'"}' | jq
  fi
fi

if [ -n "$3" ]; then			# we shall run certbot there.
  email=$(echo "$3" | cut -d: -f2)	# the part after BOT: or bot:
  set -x
  sleep 6; sleep 4; sleep 2	# 3;2;1 often results in: DNS problem: NXDOMAIN looking up A for 95-216-155-231.jw-qa.owncloud.works
  if [ -n "$short_fqdn" ]; then
    # when the $2 fqdn is longer than 63 char, we must call certbot with a second, shorter -d parameter.
    # FIXME: /etc/apache2/sites-available/000-default-le-ssl.conf
    #        is only created with one ServerName, even when we specify two here. It fails then.
    ssh root@$1 certbot -m "$email" --no-eff-email --agree-tos --redirect --apache -n -d "$2" -d "$short_fqdn"
  else
    ssh root@$1 certbot -m "$email" --no-eff-email --agree-tos --redirect -d "$2"
  fi
  if [ "$CLOUDFLARE_DNS_WILDCARD" = 'true' ]; then
     # letsencrypt recommends to either add TXT DNS record manually when prompted, 
     # or have a certbot plugin with full cloudflare api token. None appears sane to me.
     echo "WARNING: cannot generate a wildcard certificate for *.$2"
     echo "         via certbot without human assistance."
     echo "Please check letsencrypt documentation on how to add that manually."
  fi
fi
