#! /bin/sh
#
# occopy - an owncloud-friendly command line client, based on cadaver
# 
# Why are all modern command line tools so non-scriptable?
# - dave cannot take stdin or parameters at all.
# - wdc -- from https://pypi.org/project/webdavclient/ is broken. Maybe windows only?
# - cadaver wants credentials in a stinking .netrc and takes commands from a file. well.
#
# (C) 2021 jw@owncloud.com Distribute under GPLv2
# 
# 2021-12-21, v0.1	jw, initial draught.
#

if [ -z "$OC_USER" ]; then
  echo "Env variable OC_USER is not set"
  exit 1
fi

if [ -z "$OC_PASS" ]; then
  echo "Env variable OC_PASS is not set. You may want to get yourself an apptoken from the server for this."
  exit 1
fi


url="$1"
cmd="$2"

if [ -z "$cmd" ]; then
cat <<EOF 
Usage:
  $0 URL COMMAND [ ARGS... ]
  
  Credentials for the URL can be passed in via the environment variables OC_PASS and OC_USER.
  ownCloud webdav URLs should contain /remote.php/webdav or /remote.php/dav/user/files
  if a status.php can be found at the server, then "/remote.php/webdav" is automatically inserted if missing.
  The working directory can be appeded to the URL

  Valid commands are:
	get file [localname]	- download a file. Optionally speciying a different local file name.
	mget fileglob ...	- download multiple files (with globbing) into the curent directory.
	put file [remotename]   - upload a file. Optionally specfiying a different remote name.
	mget file ...		- upload multiple files.
	mkdir dirname		- create a new directory (mkcol)
	rmdir dirname		- delete a directory 
	move old new		- rename a file or directory
	dir [dirname]		- list contents of the directory or subdirectory  (ls)
	shell			- open an interactie shell (try 'help' there)

Example
  env OC_USER=demo OC_PASS=demo $0 https://demo.owncloud.org/Photos mget Portu*

EOF
  exit 0
fi

# split at first / after the \w*:// protocol thing.
path="$(echo "$url" | sed -e 's@^\w*://[^/]*@@')"
server="$(echo "$url" | sed -e 's@\(^\w*://[^/]*\).*@\1@')"
machine="$(echo "$server" | sed -e 's@^\w*://@@')"

if ! echo "$url" | grep -q '/remote.php/'; then
  if curl -s https://demo.owncloud.org/status.php | grep -q '"ownCloud"'; then
     path="/remote.php/webdav$path"
  fi
fi

path="$(echo "$path" | sed -e 's@ @%20@g')"	# need url encoded path here.

# echo $machine $server $path

tmpdir=/tmp/occopy-$$

mkdir -p $tmpdir
:> $tmpdir/.netrc
chmod 600 $tmpdir/.netrc
cat << EOF >> $tmpdir/.netrc
machine $machine
login $OC_USER
password $OC_PASS
EOF

shift	# get rid of the url
shift	# and cmd to support aliases.

test "$cmd" = "dir" 	&& cmd=ls
test "$cmd" = "del" 	&& cmd=delete
test "$cmd" = "rm" 	&& cmd=delete
test "$cmd" = "mkdir" 	&& cmd=mkcol
test "$cmd" = "rmdir" 	&& cmd=rmcol
test "$cmd" = "mv" 	&& cmd=move
test "$cmd" = "ren" 	&& cmd=move


cat << EOF >> $tmpdir/script
$cmd $@
quit
EOF

if [ "$cmd" = "shell" ]; then
  env HOME=$tmpdir cadaver -r /dev/null "$server$path"
else
  env HOME=$tmpdir cadaver -r $tmpdir/script "$server$path" </dev/null
fi

rm -rf $tmpdir/.netrc $tmpdir/*
rmdir $tmpdir
