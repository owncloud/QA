#! /bin/bash
#
# This is a dirty hack. It finds files in spaces in the filesystem.
# CAUTION: This will explode when you have linebreaks in your file names.
#	(needs a rewrite in a proper programming language)
#
# (C) 2023-06-27, jw@owncloud.com
#
# 2023-06-30, v0.2 	- Try xattr, if not mpk found.
# 2023-06-30, v0.3 	- Survive whitespace in filenames.
#
# References:
# 	https://github.com/cs3org/reva/tree/master/pkg/storage/fs/ocis
# 	https://github.com/cs3org/reva/tree/master/pkg/storage/utils/decomposedfs
#
# Requires:
#	mpkq		when using ocis3
#	xattr		when using ocis2


top="$1" # parent folder of storages/
test -z "$top" && top=$HOME/o

mpkq="/mnt/owncloud/data/carlos/files/mpkq"
mpkq="mpkq"

function ocis_getattr()
{
  attr=$1	# e.g. user.ocis.blobid
  emptyfile=$2	# path without .mpk suffix.
  if [ -f "$emptyfile.mpk" ]; then
    # this is ocis 3
    $mpkq "$attr" -r "$emptyfile.mpk"
  else
    xattr -p 2>/dev/null "$attr" "$emptyfile"
  fi
}

function fourslashes()
{
  # separate 4 pairs of two-letter prefixes with a '/' each.
  echo "$1" | sed -e 's@\(..\)\(..\)\(..\)\(..\)@\1/\2/\3/\4/@'
}

outtop=/tmp/ocis-dump-$(date +%Y%m%d%H%M%S)
echo "Copying files to $outtop ..."

filecount=0

sprefix=storage/users/spaces
cd "$top/$sprefix"
for space_nodes_dir in $(find * -type d -name nodes); do
  spaceid=$(echo $space_nodes_dir | sed -e 's@/nodes$@@' -e 's@^\./@@' -e 's@/@@g')
  root="$space_nodes_dir/$(fourslashes $spaceid)"
  space_type="$( ocis_getattr user.ocis.space.type  "$root")"
  space_alias="$(ocis_getattr user.ocis.space.alias "$root")"
  treesize="$(   ocis_getattr user.ocis.treesize    "$root")"
  subtitle=
  quota=
  echo "[$space_alias]"
  echo -e "\troot = $sprefix/$root"
  echo -e "\ttreesize = $treesize bytes"
  if [ "$space_type" == 'project' ]; then
    subtitle="$(ocis_getattr user.ocis.space.description "$root")"
    quota="$(   ocis_getattr user.ocis.quota             "$root")"
    echo -e "\tsubtitle = $subtitle"
    echo -e "\tquota = $quota bytes"
  fi
  mkdir -p "$outtop/$space_alias/.space"
  cat<<EOM>"$outtop/$space_alias/.space/dump_meta"
alias = $space_alias
root = $sprefix/$root
treesize = $treesize bytes
quota = $quota
subtitle = $subtitle
EOM

  echo -e "\tsymlink_tree ="
  # (cd $root; find -L * | xargs -n1 ls -Ld --classify | sed -e 's@^@\t\t@')
  # for link in $(find -L $root); do
  blobroot=$(echo "$root" | sed -e 's@/nodes/.*@/blobs@')
  ###
  # for link in $(cd $root; find -L .); do	# this break apart with whitespace in folders ...
  ### Here is the same line in more ugly, but a bit more robust...
  (cd $root; find -L . -print0) | xargs -0 -n1 echo | while read link; do
    target="$(cd $root; readlink "$link")"
    if [ "$target" != "" ]; then
      blobid="$(ocis_getattr user.ocis.blobid "$root/$target")"
      if [ "$blobid" != "null" -a "$blobid" != "" ]; then
	filecount=$(expr $filecount + 1)
        echo -e "\t$filecount\t$link -> blobid=$blobid"
	blob="$blobroot/$(fourslashes $blobid)"
	# ls -l $blob
	mkdir -p "$outtop/$space_alias/$(dirname "$link")"
	cp "$blob" "$outtop/$space_alias/$link"
      fi
    fi
  done
done

echo ""
echo "Dump finished."
du -sh $outtop
