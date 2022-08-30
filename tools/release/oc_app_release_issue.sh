#! /bin/sh
# oc_app_release_issue.sh - generate a release checklist issue at github
#
# (C) 2021 jw@owncloud.com, distribute under GPLv2
#
# References: 
#	- https://github.com/cli/cli/releases/
#	- https://github.com/owncloud/QA/blob/master/Server

appname=$1
appvers=$2
stdout_only=$3

# where to create the issue:
orga=owncloud
test -n "$GITHUB_ORGA" && orga=$GITHUB_ORGA
repo=$appname
test -n "$GITHUB_REPO" && repo=$GITHUB_REPO

if [ -z "$2" ]; then
  echo "Usage:"
  echo "	$0 APPNAME APPVERSION"
  echo "	$0 APPNAME APPVERSION -"
  echo ""
  echo "Creates a release ticket for an owncloud app."
  echo "A testplan ticket can be linked-to automatically. If none exists yet, first try: 'oc_release app:testplan ...'"
  echo "If no testplan can be found, you will be prompted how to continue."
  echo ""
  echo "The second form with the appended '-' only outputs the release checklist template. No issues are created or modified."
  exit 1
fi

if [ -z "$(which gh)" ]; then
  echo "gh command line client not found. Please install from https://github.com/cli/cli/releases/"
  exit 1
fi

tmpl=server_app_release_template.md
tmpl_paths=". $(dirname $0)/templates $HOME/src/github/owncloud/QA/tools/release/templates"

tmpl_path=$OC_APP_RELEASE_TEMPLATE
if [ -z "$tmpl_path" ]; then
  for path in $tmpl_paths; do
    if [ -f $path/$tmpl ]; then
      tmpl_path=$path/$tmpl
      echo "Using issue template from $tmpl_path"
      break
    fi
  done
fi

if [ -z "$tmpl_path" ]; then
  echo "ERROR: Issue template not found."
  echo "Try to cd into a git checkout of https://github.com/owncloud/QA/tools/release"
  echo "or set the environment vairable OC_APP_RELEASE_TEMPLATE to the location of the file"
  echo "or download the file '$tmpl' to your current working directory."
fi

if [ -n "$stdout_only" ]; then
  cat $tmpl_path
  exit 0
fi

tp_issue=$(gh issue list -R $orga/$repo -s open -L 100 | grep -i "$appvers Testplan" | head -n 1)
if [ -z "$tp_issue" ]; then
  echo "github.com/$orga/$repo: could not find an issue with '$appvers Testplan' in the title."
  echo "Enter an issue number, c for create, or just press ENTER to continue without."
  read a
  if [ -n "$a" ]; then
    if [ "$a" = "c" -o "$a" = "C" ]; then
      $(dirname $0)/oc_app_testplan.sh $appname $appvers
      tp_issue=$(gh issue list -R $orga/$repo -s open -L 100 | grep -i "$appvers Testplan" | head -n 1)
    else
      tp_issue=$a
    fi
  fi
fi

if [ -n "$tp_issue" ]; then
  # 1234	OPEN	[QA] files_mediaviewer 10.7.0 Testplan		2021-01-28 18:13:41 +0000 UTC
  echo "Linking to $tp_issue"
  tp_issue=$(echo "$tp_issue" | sed -e 's/\s.*//')	# chop away everything after the number
  body="$(cat $tmpl_path | sed -e 's/\[ \] Create .* Testplan"*/[x] Create "'"$appvers Testplan\" --> #$tp_issue /")"
else
  body="$(cat $tmpl_path)"
fi

gh issue create -R $orga/$repo -t "$appname $appvers release" -b "$body"

echo "TODO: Create a QA milestone in https://github.com/$orga/$repo and add the new issue."

