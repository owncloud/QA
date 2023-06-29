#! /bin/bash
#
# This is a dirty hack. It finds files in spaces in the filesystem.
#
# (C) 2023-06-27, jw@owncloud.com

top="$1" # parent folder of storages/

test -z "$top" && top=$HOME/o

function fourslashes()
{
  # separate 4 pairs of two-letter prefixes with a '/' each.
  echo $1 | sed -e 's@\(..\)\(..\)\(..\)\(..\)@\1/\2/\3/\4/@'
}

outtop=/tmp/ocis-dump-$(date +%Y%m%d%H%M%S)
echo "Copying files to $outtop ..."

filecount=0

sprefix=storage/users/spaces
cd $top/$sprefix
for space_nodes_dir in $(find * -type d -name nodes); do
  spaceid=$(echo $space_nodes_dir | sed -e 's@/nodes$@@' -e 's@^\./@@' -e 's@/@@g')
  root="$space_nodes_dir/$(fourslashes $spaceid)"
  space_type=$(mpkq user.ocis.space.type -r $root.mpk)
  space_alias=$(mpkq user.ocis.space.alias -r $root.mpk)
  treesize=$(mpkq user.ocis.treesize -r $root.mpk)
  echo "[$space_alias]"
  echo -e "\troot = $sprefix/$root"
  echo -e "\ttreesize = $treesize bytes"
  if [ "$space_type" == 'project' ]; then
    subtitle=$(mpkq user.ocis.space.description -r $root.mpk)
    quota=$(mpkq user.ocis.quota -r $root.mpk)
    echo -e "\tsubtitle = $subtitle"
    echo -e "\tquota = $quota bytes"
  fi
  echo -e "\tsymlink_tree ="
  # (cd $root; find -L * | xargs -n1 ls -Ld --classify | sed -e 's@^@\t\t@')
  # for link in $(find -L $root); do
  blobroot=$(echo "$root" | sed -e 's@/nodes/.*@/blobs@')
  for link in $(cd $root; find -L .); do
    target=$(cd $root; readlink $link)
    if [ "$target" != "" ]; then
      blobid=$(mpkq user.ocis.blobid -r $root/$target.mpk)
      if [ "$blobid" != "null" ]; then
	filecount=$(expr $filecount + 1)
        echo -e "\t$filecount\t$link -> blobid=$blobid"
	blob="$blobroot/$(fourslashes $blobid)"
	# ls -l $blob
	mkdir -p $outtop/$space_alias/$(dirname $link)
	cp $blob $outtop/$space_alias/$link
      fi
    fi
  done
done

echo ""
echo "Dump finished."
du -sh $outtop
