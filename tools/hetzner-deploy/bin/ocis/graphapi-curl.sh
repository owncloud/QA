#! /bin/bash
# 
# References:
#  - https://owncloud.dev/libre-graph-api/#/users/ListUsers
#
# We can either use the external port 443 through traffic, e.g. via
#  wget -d -O - --user=$api_user --password=$api_pass "https://web.$base_fqdn/graph/v1.0/"
# or an internal port 9200 directly on the container. For the latter, we need to find the correct IPaddress
#
# v0.2, 20240723 - jw@owncloud.com - support both /graph/v1.0 and /v1.0 as an optional prefix for the query.

api_user=admin
api_pass=admin
test -n "$OCIS_API_USER" && api_user="$OCIS_API_USER"
test -n "$OCIS_API_PASS" && api_pass="$OCIS_API_PASS"

query="$1"

if [ "$query" = "" -o "$query" = "-h" -o "$query" = "--help" ]; then
	cat <<EOF
$0 [graph/v1.0/query]

Well known queries are:
	/v1.0/groups					# list all groups
	/v1.0/groups/GROUPNAME			# show only matching group
	/v1.0/users | jq '.value[].displayName' -r	# show all displayNames of all users.

See also: https://owncloud.dev/libre-graph-api

environment:
	OCIS_API_USER		# specify the username for the query. Default: $api_user
	OCIS_API_PASS		# specify the password for the query. Default: $api_pass

EOF
	exit 0
fi

# Find a container that is e.g. named 'o-ocis-1'
ocis_name=$(docker ps --format json | jq '[.] | [.[] | .Names] | .[0]' -r | grep -s -- '-ocis-')
# Sanity check: do we have port 9200 there?
docker inspect $ocis_name | jq '.[0].NetworkSettings.Ports' | grep -q 9200/ || { echo "ERROR: container '$ocis_name' does not exports port 9200"; exit 1; }
# Find the IPAddress of this container.
ocis_addr=$(docker inspect $ocis_name | jq '.[0].NetworkSettings.Networks[].IPAddress' -r)

echo "$ocis_name -> $ocis_addr" 1>&2

auths=$(curl -s -i  -k -u"$api_user:$api_pass" "http://$ocis_addr:9200/graph/v1.0" | grep -i -e '\( 401 \|www-Authenticate:\)')
if echo "$auths" | grep -q -i ' 401 '; then
  echo "ERROR: $auths"
  if echo "$auths" | grep -q -i "basic"; then
    cat <<EOF

Authentication with user $api_user failed. 
Try setting the env variables OCIS_API_USER and OCIS_API_PASS.
EOF
  else
    cat <<EOF

This ocis instance seems to require oauth2, which is not implemented in $0
Please enable PROXY_ENABLE_BASIC_AUTH=true in .env followed by docker compose down ocis; docker compose up -d ocis
EOF
  fi
  exit 1
fi

# add prefix /graph/v1.0 if missing in full or partly.
echo "$query" | grep '^/*v1\.0' && query="/graph/$query"
echo "$query" | grep '^/*graph//*v1\.0' || query="/graph/v1.0/$query"
# graph api responds with 404, when it sees dupicate slashes. Remove them.
query=$(echo "/$query" | sed -e 's@//*@/@g')

echo "+ curl -s -u$api_user:\$OCIS_API_PASS  http://$ocis_addr:9200$query" 1>&2
curl -s -u"$api_user:$api_pass" "http://$ocis_addr:9200$query"

