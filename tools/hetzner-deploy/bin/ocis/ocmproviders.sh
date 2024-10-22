#! /bin/bash
#
# References:
# - https://github.com/owncloud/ocis/blob/master/services/ocm/README.md#trust-between-instances
# - https://owncloud.dev/services/ocm/#trust-between-instances
#
# ocmproviders.sh -- a simple shell script to list / add / remove ocm providers
#
# 20240716 jw@owncloud.com - initial draught.
# 20241021 jw@owncloud.com - updated json to include description.
#
# dependencies:
# 	apt install jq
#	optionally curl for 'try' command.
#
# 20240922 update according to https://doc.owncloud.com/ocis/next/deployment/services/s-list/ocm.html#trust-between-instances
# 1) it is no longer in $OCIS_DATADIR/storage/ocm/ocmproviders.json
#    it now lives in $OCIS_CONFIGDIR/ocmproviders.json
# 20240924 - fixed test command and allowed test -a


cmd=$1
url=$2
test -z "$cmd" && cmd=list	# default

if [ -n "$(ocis version 2>/dev/null | grep 'Version: 5')" ]; then
	# backwards compatibility...
	exec $(dirname $0)/ocmproviders_v5.sh "$@"
	exit 0
fi


if [ "$cmd" = '-h' -o "$cmd" = '--help' -o "$cmd" = 'help' ]; then
	cat << EOT
Usage:
	$0 [ list ]
	$0 [ add ] https://otherhost.example.com
	$0 del https://otherhost.example.com
	$0 test [ -a | https://otherhost.example.com ]

Environment:
	OCS_CONFIG_DIR		// contains the providers.json file

EOT
	exit 0
fi

if [ -z "$OCIS_CONFIG_DIR" ]; then
	for dir in /var/lib/docker/volumes/*ocis-config/_data \
			/etc/ocis; do
		test -f $dir/ocis.yaml && OCIS_CONFIG_DIR=$dir
	done
	test -n "$OCIS_CONFIGDIR" && echo "Choosing OCIS_CONFIG_DIR=$OCIS_CONFIG_DIR" 1>&2
fi
if [ -z "$OCIS_CONFIG_DIR" ]; then
	echo "ERROR: environment variable OCIS_CONFIG_DIR is undefdined and the ocis config was not found in a well known location."
	exit 1
fi
if [ ! -f "$OCIS_CONFIG_DIR/ocis.yaml" ]; then
	echo "ERROR: ocis.yaml does not exist in OCIS_CONFIG_DIR=$OCIS_CONFIG_DIR, try somthing else."
	exit 1
fi

if [ -z "$(which jq)" ]; then
	echo "ERROR: $0 requires jq. Not found. Try: sudo apt install jq"
	exit 1
fi

list () {
	jq '.[].domain' -r $1
}

domain () {
	# strip away leading protocol prefix, trailing path
	echo $1 | sed -e 's@.*://@@' -e 's@/.*@@'
}

delete () {
 	jq 'del(.[] | select(.domain == "'$2'"))' $1
}

lookup () {
	# returns 'null' if not existing.
	fqdn=$(domain $2)
	jq 'map(select(.domain == "'$fqdn'")) | first' $1
}

add () {
	# CAUTION: keep in sync with https://owncloud.dev/services/ocm/#trust-between-instances
	fqdn=$(domain $2)
	name=$(echo $fqdn | sed -e 's@^web\.@@' -e 's@^ocis.@ocis-@' -e 's@\..*@@')	# web / ocis alone are not good names.
	cat <<EOT | jq --slurpfile newprov /dev/stdin '. += $newprov' $1
{
    "name": "$name",
    "full_name": "$name provider",
    "organization": "oCIS",
    "domain": "$fqdn",
    "homepage": "$url",
    "description": "oCIS $fqdn cloud storage",
    "services": [
	{
	    "endpoint": {
		"type": {
		    "name": "OCM",
		    "description": "$fqdn Open Cloud Mesh API"
		},
		"name": "$name - OCM API",
		"path": "$url/ocm/",
		"is_monitored": true
	    },
	    "api_version": "0.0.1",
	    "host": "http://$fqdn"
	},
	{
	    "endpoint": {
		"type": {
		    "name": "Webdav",
		    "description": "$fqdn Webdav API"
		},
		"name": "$name - Webdav API",
		"path": "$url/dav/",
		"is_monitored": true
	    },
	    "api_version": "0.0.1",
	    "host": "https://$fqdn"
	}
    ]
}
EOT
}

try_chown_ocis() {
	chown ocis:ocis $1 >/dev/null 2>&1 || chown 1000:1000 $1 || true
	chmod 644 $1 || true
}

try_connect() {
	if [ -z "$1" -o "$1" = 'all' -o "$1" = '--all' -o "$1" = '-a' ]; then
		todo=$(list $ocmproviders_file)
		if [ -z "$todo" ]; then
			echo "ERROR: no URL specified - and nothing in $ocmproviders_file"
			exit 4
		fi
	else
		todo="$1"
	fi
	echo "Testing endpoint /ocm/invite-accepted ..."
	for url in $todo; do
		echo -n "$url	"
		endpoint=$url/ocm/invite-accepted
		# -L to allow 302 http->https forward.
		allowed=$(timeout 5 curl -L -v $endpoint 2>&1 | grep -i allow:)
		if [ -z "$allowed" ]; then
			echo "INFO: the endpoint $endpoint did not respond within 5 sec."
		elif [ -z "$(echo $allowed | grep POST)" ]; then
			echo "INFO: The Allow: response from $endpoint did not say POST: '$allowed'"
		else
			echo "OK: $allowed"
		fi
	done
}

restart_hint() {
        echo "" 1>&2
	echo "TODO: service ocis restart / docker compose restart ocis" 1>&2
}

ocmproviders_file=$OCIS_CONFIG_DIR/ocmproviders.json
if [ ! -f $ocmproviders_file ]; then
	echo "[]" > $ocmproviders_file
	# use the ocis user, if we have one, otherwise assume its 1000.
	echo "Creating $ocmproviders_file" 1>&2
	try_chown_ocis $ocmproviders_file
fi

if [ "$cmd" = "ls" -o "$cmd" = "-l"  -o "$cmd" = "list" ]; then
	echo "Registered domains in $ocmproviders_file are:" 1>&2
	list $ocmproviders_file
	exit 0
fi

tmpfile=/tmp/provtmp$$.json

# we are nice to our users: del accepts also domain name as url - that is what lookup prints out.
if [ "$cmd" = "del" -o "$cmd" = "-d"  -o "$cmd" = "delete" -o "$cmd" = "rm" ]; then
	# don't care, if already missing.
	delete $ocmproviders_file $(domain $url) > $tmpfile
	mv $tmpfile $ocmproviders_file
	try_chown_ocis $ocmproviders_file
	echo "Remaining domains in $ocmproviders_file:" 2>&1
	list $ocmproviders_file
	restart_hint
	exit 0
fi

if [ -n "$(echo "$cmd" | grep '://' )" -a -z "$url" ] ; then
	# This command looks like URL, and we don't have a URL
	# let's assume 'add'
	url="$cmd"
	cmd=add
fi

if [ "$cmd" = "try" -o "$cmd" = "test"  ]; then
	try_connect $url
	exit 0
fi

# now url needs to be really an url. Do some sanity checking ...
echo "$url" | grep -q '://' || { echo "URL needs a protocol, e.g. start with https://"; exit 1; }
echo "$url" | grep -q '\.'  || { echo "URL needs a fully qualified domain name, e.g. try append domain"; exit 1; }

if [ "$cmd" = "add" -o "$cmd" = "-a"  ]; then

	entry=$(lookup $ocmproviders_file $url)
	if [ "$entry" != 'null' ]; then
		fqdn=$(echo "$entry" | jq '.domain' -r)
		echo "A provider with domain $fqdn already exists. Nothing added:" 2>&1
		echo $entry 2>&1
		exit 2
	fi

	add $ocmproviders_file $url > $tmpfile
	mv $tmpfile $ocmproviders_file
	try_chown_ocis $ocmproviders_file

	echo "$ocmproviders_file updated with:" 2>&1
	lookup $ocmproviders_file $url
	echo "" 2>&1
	echo "The registered domains are now:" 2>&1
	list $ocmproviders_file
	restart_hint
	exit 0
else
	echo "ERROR: unknown command $cmd - try: $0 --help"
	exit 3
fi

