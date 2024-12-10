#! /bin/bash
#
# This is a dirty hack. It finds files in spaces in the filesystem.
# CAUTION: This will explode when you have linebreaks in your file names.
#	(needs a rewrite in a proper programming language)
#
# (C) 2024-07-23, jw@owncloud.com
#
# 2024-07-22, v0.1 	- mpkq from symlinks.
# 2023-07-23, v0.2	- take logic for finding OCIS_DATADIR from ocmproviders.sh
#                       - speedup and conveniance: filename parameter with globbing added.
#
# References:
# 	https://github.com/cs3org/reva/tree/master/pkg/storage/fs/ocis
# 	https://github.com/cs3org/reva/tree/master/pkg/storage/utils/decomposedfs
#
# Requires:
#	mpkq
#	pip install msgpack
#
# FIXME: calling mpkq so many times is slow. This needs a rewrite in python, and a cache for parent lookups.

name=$1
sprefix=storage/users/spaces

if [ "$name" = '-h' -o "$cmd" = '--help' -o "$cmd" = 'help' ]; then
	cat << EOT
Usage:
	$0 [filename]
	
	List files and folders found in an ocis decomposed fs.
	The objects are listed a table of <space_id>:<object_id> and full path name, as if they would appear in a logical posix filesystem
	Note that the first two path components form a space name or space alias, usually starting with personal/... or project/...

	If a file name (or folder name) is given on the command line, only matching entries are listed.
	Filename globbing (e.g. '*substr*') applies. Such names should be quoted, to avoid prematue globbing expansion by the shell.

Environment:
	OCIS_DATADIR	// contains the 'storage/users/spaces' subdirectories

EOT
	exit 0
fi


if [ -z "$OCIS_DATADIR" ]; then
	for dir in /var/lib/docker/volumes/*ocis-data/_data \
			$HOME/data \
			$HOME/.ocis \
			/var/lib/ocis; do
		test -d $dir/storage && OCIS_DATADIR=$dir
	done
	# test -d $HOME/data/storage && OCIS_DATADIR=$HOME/data
	# test -d $HOME/.ocis/storage && OCIS_DATADIR=$HOME/.ocis
	# test -d /var/lib/ocis/storage && OCIS_DATADIR=/var/lib/ocis

	test -n "$OCIS_DATADIR" && echo "Choosing OCIS_DATADIR=$OCIS_DATADIR" 1>&2
fi
if [ -z "$OCIS_DATADIR" ]; then
	echo 1>&2 "ERROR: environment variable OCIS_DATADIR is undefined and the ocis storage was not found in a well known location."
	exit 1
fi
if [ ! -d "$OCIS_DATADIR/$sprefix" ]; then
	echo 1>&2 "ERROR: sudbdirectory $sprefix does not exist in OCIS_DATADIR=$OCIS_DATADIR, try somthing else."
	exit 1
fi
top="$OCIS_DATADIR"

mpkq="mpkq"

function ocis_getattr()
{
  attr=$1	# e.g. user.ocis.blobid
  emptyfile=$2	# path without .mpk suffix.
  if [ -f "$emptyfile.mpk" ]; then
    # this is ocis 3
    $mpkq "$attr" -r "$emptyfile.mpk"
  else
    echo 1>&2 "ERROR: ocis_getattr $attr: $emptyfile.mpk not found. Do we need old xattr here?"
    exit 1
  fi
}

function fourslashes()
{
  # separate 4 pairs of two-letter prefixes with a '/' each.
  echo "$1" | sed -e 's@\(..\)\(..\)\(..\)\(..\)@\1/\2/\3/\4/@'
}

function nodeid_by_path()
{
  # find 4 pairs of two-letter prefixes with a '/' each and construct an id
  echo "$1" | sed -e 's@.*/\(..\)/\(..\)/\(..\)/\(..\)/@\1\2\3\4@' -e 's/\.mpk$//'
}

cd "$top/$sprefix" || { echo 1>&2 "ERROR: storage not found: $top/$sprefix"; exit 1; }

namefilter=
test -n "$name" && namefilter="-name $name"

# asuming: all objects, files and directories have a symlink
find . -type l $namefilter -print0 | xargs -0 -n 1 echo | while read link ; do
	test -z "$link" && { echo 1>&2 "ERROR: $name not found in $top/$sprefix"; exit 1; }
	target="$(readlink "$link")"
	filename="$(basename "$link")"
	nodespath="$(echo "$link" | sed -e 's@nodes/.*$@nodes@')"
	# echo "symlink seen: $link -> $target"
	empty="$(dirname "$link")/$target"
	## user.ocis.id only exists for files, not for folders. grrr.
	# item_id=$(ocis_getattr user.ocis.id "$empty")
	item_id=$(nodeid_by_path $target)
	parent_id=$(ocis_getattr user.ocis.parentid "$empty")
	while [ "$parent_id" != null ]; do
		empty="$nodespath/$(fourslashes $parent_id)"
		parent_id="$(ocis_getattr user.ocis.parentid "$empty")"
		parentname="$(ocis_getattr user.ocis.name "$empty")"
		test "$parent_id" = null && parentname="$(ocis_getattr user.ocis.space.alias "$empty")"
		filename="$parentname/$filename"
	done
	# we come here, when there is no more parent_id, thus, this must be the space.
	space_id="$(ocis_getattr user.ocis.space.id "$empty")"
	echo "$space_id:$item_id $filename"
done

exit 0
