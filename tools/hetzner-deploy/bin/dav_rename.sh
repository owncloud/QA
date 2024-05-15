#! /bin/bash
#
# simple script to exercise a rename though webdav
#


if [ -z "$3" ]; then
  cat << EOU
Usage:

	$0 https://\$USER:\$PASS@\$OC10_FQDN[/prefix] /path/to/file [/path/to/]newfile

Or locally:

	$0 \$USER:\$PASS /path/to/file [/path/to/]newfile

EOU
exit 0
fi

url="$1"
sourcename="$2"
targetname="$3"

set $(echo "$url" | sed -e 's#\(://\|:\|@\|/remote.php\)# #g')
proto="$1"
user="$2"
pass="$3"
host="$4"

if [ -z "$host" ]; then
  set $(echo "$url" | sed -e 's#:# #')
  user="$1"
  pass="$2"
  if [ -n "$pass" -a -z "$(echo "$url" | grep /)" ]; then
    proto="http"
    host="localhost"
  else
    echo "ERROR: first parameter must be of form PROTO://USER:PASS@HOST...."
    echo "    or first parameter must be of form USER:PASS"
    echo "       seen: $url"
    exit 1
  fi
fi

sourcename="$(readlink --canonicalize-missing "$sourcename")"	# resolve redundant path components
if [ -z "$(echo "$targetname" | grep '^/')" ]; then
  targetname="$(dirname "$sourcename")/$targetname"
fi
targetname="$(readlink --canonicalize-missing "$targetname")"	# resolve redundant path components

set -x
curl -X MOVE -u "$user:$pass" -H "Destination: /remote.php/dav/files/$user$targetname" "$proto://$host/remote.php/dav/files/$user/$sourcename"
