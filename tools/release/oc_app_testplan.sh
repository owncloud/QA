#! /bin/sh
# oc_app_testplan.sh - generate a testplan issue at github
#
# (C) 2021 jw@owncloud.com, distribute under GPLv2
#
# References:
#	- https://github.com/cli/cli/releases/
#	- https://github.com/owncloud/QA/blob/master/Server

appname=$1
appvers=$2

# where to create the issue:
orga=owncloud
test -n "$GITHUB_ORGA" && orga=$GITHUB_ORGA
repo=$appname
test -n "$GITHUB_REPO" && repo=$GITHUB_REPO

if [ -z "$1" ]; then
  echo "Usage:"
  echo "	$0 APPNAME [APPVERSION [RELEASE_TICKET_URL]]"
  echo ""
  echo "Create a testplan ticket for an owncloud app. Please check 'oc_release app:status ...' first."
  echo "If APPVERSION is not specified, app:status -r is checked to find version and ticket."
  echo "If a release ticket url is known, it is mentioned in the final instructions."
  exit 1
fi

if [ -z "$(which gh)" ]; then
  echo "gh command line client not found. Please install from https://github.com/cli/cli/releases/"
  exit 1
fi

tp_url="https://raw.githubusercontent.com/owncloud/QA/master/Server/Test_Plan_"
tp_url2="https://raw.githubusercontent.com/owncloud/QA/master/Server/Test_plan_"
tp_url_ee="https://raw.githubusercontent.com/owncloud/qa-enterprise/master/Core/Test_Plan_"
tp_url_ee2="https://raw.githubusercontent.com/owncloud/qa-enterprise/master/Core/Test_plan_"

tp=$(echo $appname | sed -e 's/./\U&/' -e 's/_./\U&/g')	# files_antivirus -> Files_Antivirus
## it is an n:m mapping
test $appname = files_external_gdrive   && tp="Files_External Files_external_CLI"
test $appname = files_external_ftp      && tp="Files_External Files_external_CLI"
test $appname = files_external_s3       && tp="Files_External Files_external_CLI"
test $appname = files_external_dropbox  && tp="Files_External Files_external_CLI"
test $appname = search_elastic          && tp="Full_search"
test $appname = guests                  && tp="Guest"
test $appname = oauth2                  && tp="OAuth2"
# test $appname = web                     && tp="web"
test $appname = files_pdfviewer		&& tp="files_pdfviewer"
test $appname = twofactor_totp		&& tp="twofactor_totp"
test $appname = files_primary_s3	&& tp="files_primary_s3"

plan=
## tp may hold multiple names. Try them all and concatenate into plan.
## We try both repos: QA and qa-enterprise
## and each one with two diffeent urls, saying Test_Plan_... and Test_plan_...
## and as a fallback also with the appname (for each of the URLs. (that is a total of 8 cases now..)
for name in $tp; do
  using=${tp_url}$name.md
  t=$(curl -L -l -s $using)
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url}$appname.md
    t=$(curl -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url2}$name.md
    t=$(curl -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url2}$appname.md
    t=$(curl -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url_ee}$name.md
    t=$(curl -u "$GITHUB_USER:$GITHUB_TOKEN" -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url_ee}$appname.md
    t=$(curl -u "$GITHUB_USER:$GITHUB_TOKEN" -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url_ee2}$name.md
    t=$(curl -u "$GITHUB_USER:$GITHUB_TOKEN" -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=${tp_url_ee2}$appname.md
    t=$(curl -u "$GITHUB_USER:$GITHUB_TOKEN" -L -l -s $using)
  fi
  if [ "$(echo "$t" | wc -l)" -lt 3 ]; then
    using=
    t="$t
## '$name' Test Plan

TBD: Nothing useful found in https://github.com/owncloud/QA/tree/master/Server
TBD: Here is a dummy testplan template. Please edit!
TBD: Please also doublecheck https://github.com/owncloud/qa-enterprise/tree/master/Core

## Setup
<details><summary>Setup details (click to view)</summary>

  \`oc_release.sh app:get $appname\`
</details>

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
Improve testplan | More tests | :construction: | TBD
"
  fi
  if [ -n "$using" ]; then echo "Using template $using"; else echo "No matching template found."; fi
  plan="$plan$t
----
"
done

if [ -z "$appvers" ]; then
  vers_url=$($(dirname "$0")/oc_app_status.sh $appname -r)
  appvers=$(echo $vers_url | cut -d' ' -f1)
  rel_url=$(echo $vers_url | cut -d' ' -f2)
  if [ -z "$appvers" ]; then
    echo "app:testplan $appname failed. Please specify the app version"
    exit 0
  fi
fi

if [ "$appname" != "$repo" ]; then
  appvers="$appname $appvers"
fi

echo "$plan" | grep 'dummy testplan'
if gh issue create -R $orga/$repo -t "[QA] $appvers Testplan" -b "$plan"; then
  if [ -n "$rel_url" ]; then
    echo ""
    echo "(Please add the above testplan url to the release ticket $rel_url )"
  fi
  exit 0
fi

echo "Command failed: gh issue create -R $orga/$repo -t '[QA] $appvers Testplan' ...."
echo ""
echo "Here is the testplan for the github issue:"
echo "$plan"
