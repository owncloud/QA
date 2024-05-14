#! /bin/bash
#
# simple script to exercise a rename though webdav
#


if [ -z "$3" ]; then
  cat << EOU
Usage:

	$0 https://\$USER:\$PASS@\$OC10_FQDN[/prefix] /path/to/file [/path/to/]newfile

EOU
exit 0
fi
sourcename="$2"
targetname="$3"

set $(echo "$1" | sed -e 's#\(://\|:\|@\|/remote.php\)# #g')
proto="$1"
user="$2"
pass="$3"
host="$4"

if [ -z "$host" ]; then
  echo "ERROR: first parameter must be of form PROTO://USER:PASS@HOST...."
  echo "       seen: $host"
  exit 1
fi

sourcename="$(readlink --canonicalize-missing "$sourcename")"	# resolve redundant path components
if [ -z "$(echo "$targetname" | grep '^/')" ]; then
  targetname="$(dirname "$sourcename")/$targetname"
fi
targetname="$(readlink --canonicalize-missing "$targetname")"	# resolve redundant path components

set -x
curl -X MOVE -u "$user:$pass" -H "Destination: /remote.php/dav/files/$user$targetname" "$proto://$host/remote.php/dav/files/$user/$sourcename"
