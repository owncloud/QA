#! /bin/bash
#
# This finds spaces in the filesystem.
# TODO: 
#	Check that all spaces with type personal have an owner in the boltdb. If missing, this is an error.
#	Check that all users in the boltdb have space with type personal. If missing, the user has never logged in.

top="$1" # parent folder of storages/

test -z "$top" && top=$HOME/o

cd $top/storage/users/spaces
for space_nodes_dir in $(find * -type d -name nodes); do
	spaceid=$(echo $space_nodes_dir | sed -e 's@/nodes$@@' -e 's@^\./@@' -e 's@/@@g')
	root="$space_nodes_dir/$(echo $spaceid | sed -e 's@\(..\)\(..\)\(..\)\(..\)@\1/\2/\3/\4/@')"
	space_type=$(mpkq user.ocis.space.type -r $root.mpk)
	space_alias=$(mpkq user.ocis.space.alias -r $root.mpk)
	treesize=$(mpkq user.ocis.treesize -r $root.mpk)
	echo "[$space_alias]"
	echo -e "\troot = storage/users/spaces/$root"
	echo -e "\ttreesize = $treesize bytes"
	if [ "$space_type" == 'project' ]; then
	  subtitle=$(mpkq user.ocis.space.description -r $root.mpk)
	  quota=$(mpkq user.ocis.quota -r $root.mpk)
	  echo -e "\tsubtitle = $subtitle"
	  echo -e "\tquota = $quota bytes"
	fi
	echo -e "\tsymlink_tree ="
	# (cd $root; find -L * | xargs -n1 ls -Ld --classify | sed -e 's@^@\t\t@')
	(cd $root; tree -l | grep ' -> ' | sed -e 's@^@\t\t@' -e 's@$@.mpk@')
done

