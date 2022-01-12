#! /bin/sh
#
# oc_release.sh -- manage releases at owncloud
#
# (C) 2021, jw@ownlcould.com - distribute under GPLv2
#
# 2021-01-18, v0.1, jw	- initial draught, can create github tickets and report release status.
# 2021-06-06, v0.2, jw	- support for python scripts added. oc_app_drone_tests.py drafted.
# 2021-07-28, v0.3, jw	- added support for app:checklist output.
# 2021-08-16, v0.4, jw	- added support to build an app.

version=0.3

mydir=$(dirname $(readlink -f $0))
cmd=$1
self="$(basename $0)"

if [ -z "$cmd" -o "$cmd" = "-h" -o "$cmd" = "--help" ]; then
  cat <<EOF
oc_release version $version

Usage:
  $self app:run		  files_mediaviewer
	Download and unpack the latest release of the named app from github releases.
	Can be used multiple times with different apps to collect more apps before starting.
	To actually run the app(s), docker run commands are printed for copy/paste.

  $self app:status	  files_mediaviewer
	Check if a release is pending for the named app.
        Report progress and suggest next steps.

  $self app:testplan	  files_mediaviewer 1.2.3
	Create a testplan issue using a matching template from the QA repo.

  $self app:release:issue files_mediaviewer 1.2.3
	Create a release issue using a checklist template and
        if exists, link to a matching testplan.

  $self app:checklist
        Just output the release checklist template.

  $self app:build .
  $self app:build oauth2 v0.5.0-rc1
	Build a signed tar.gz archive. Needs a checkout copy of the appsigning scripts.

  $self app:drone:tests   files_mediaviewer 1.2.3
	Setup an owncloudci docker container to run the behat tests if this app as checked out from github.

EOF
  exit 1;
fi

shift

# abbreviations for the lazy:
test "$cmd" = ac        && cmd="app:check"
test "$cmd" = app:get   && cmd="app:run"
test "$cmd" = ag        && cmd="app:run"
test "$cmd" = ar        && cmd="app:run"
test "$cmd" = atp       && cmd="app:testplan"
test "$cmd" = ari       && cmd="app:release:issue"
test "$cmd" = ai        && cmd="app:release:issue"
test "$cmd" = app:issue && cmd="app:release:issue"
test "$cmd" = app:tests && cmd="app:drone:tests"
if [ "$cmd" = app:checklist ]; then
  cmd="app:release:issue"
  set name version -
fi

if [ "$1" = '.' ]; then
  # appname=$(sed -n -e 's@</.*>@@' -e 's@\s*<id>@@p' appinfo/info.xml)
  # tag=$(sed -n -e 's@</.*>@@' -e 's@\s*<version>@@p' appinfo/info.xml)
  # 
  # lazy github lookup of app name and tag
  appname=$(git remote -v | grep '(fetch)' | sed -e 's@.*/@@' -e 's/\s.*//')
  if [ -z "$2" ]; then
    tagname=$(git tag -l --sort -taggerdate | head -n 1)
  else
    tagname="$2"
  fi
  if [ -n "$tagname" -a -n "$appname" ]; then
    echo "epanding to: $0 $cmd $appname $tagname"
    set -- $appname $tagname
  else
    echo "ERROR: could not retrive github data from current working directory"
    echo "       found appname=$appname"
    echo "       found tagname=$tagname"
  fi
fi

script="$mydir/oc_$(echo "$cmd" | sed -e 's/:/_/g')"
if [ -x $script.sh ]; then
  # try bash scripts
  exec $script.sh "$@"
elif [ -e $script.py ]; then
  # try python scripts
  exec python3 $script.py "$@"
else
  echo ""
  echo "ERROR: $script.{sh,py} not found"
  echo "Unknown command: $cmd -- try: $0 --help"
  echo ""
  exit 1
fi
