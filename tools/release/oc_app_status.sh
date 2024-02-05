#! /bin/sh
#
# (C) 2021 jw@owncloud.com, distribute under GPLv2
#
# 2021-01-18, v0.1 jw -- initial draught
# 2021-01-20, v0.2 jw -- survive empty changelog at github, try top entry at CHANGELOG.md instead
#
# Reference: https://stackoverflow.com/questions/16950657/getting-the-issues-from-a-certain-milestone-in-github/65779475#65779475

orga=owncloud
test -n "$GITHUB_ORGA" && orga=$GITHUB_ORGA

appname=$1

if [ -z "$1" ]; then
  echo "Usage:"
  echo "	$0 APPNAME [-r]"
  echo "Find if a release is pending for the named app."
  echo "Report progress and suggest next steps."
  echo ""
  echo "With option -b, only the version number and [if found] the release ticket url are printed"
  exit 1
fi

releaseticket_batchmode=false
if [ "$2" = '-r' ]; then
  releaseticket_batchmode=true
fi

export LC_ALL=C

if [ -z "$CURL_OPTS" -a -n "$GITHUB_TOKEN" -a -n "$GITHUB_USER" ]; then
  echo 1>&2 '+ export CURL_OPTS="-u $GITHUB_USER:$GITHUB_TOKEN"'
  export CURL_OPTS="-u $GITHUB_USER:$GITHUB_TOKEN"
fi

curl=curl
test -n "$CURL_OPTS" && curl="curl $CURL_OPTS"

api_url="https://api.github.com/repos/$orga/$appname"
MS=$($curl -s "$api_url/milestones")
MS_message=$(echo "$MS" | jq -r '.message' 2>/dev/null )	# suppress Cannot index array with string "message"

if [ "$MS_message" != 'null' -a "$MS_message" != '' ]; then
  echo 1>&2 "ERROR: Cannot fetch $api_url/milestones"
  echo 1>&2 "       $MS_message"
  echo 1>&2 'Retry with: env CURL_OPTS="-u $GITHUB_USER:$GITHUB_TOKEN" ...'
  exit 1
fi

QA=$(echo "$MS"         | jq '.[] | select(.title == "QA")')
MS_number=$(echo "$QA"  | jq -r '.number')
MS_state=$(echo "$QA"   | jq -r '.state' )

if [ -z "$MS_number" -o "$MS_number" = "null" ]; then
  echo 1>&2 "WARNING: no QA milestone found"
else
  echo 1>&2 "Found QA milestone with state=$MS_state"
  if [ "$MS_state" != 'open' ]; then
    echo 1>&2 "WARNING: expected state 'open'"
  fi
fi

gh_issue_url=
app_version=
QA_issues=$($curl -s "$api_url/issues?milestone=$MS_number" | jq -r '.[].number' 2>/dev/null)
echo 1>&2 ""
if [ -n "$RELEASE_ISSUE" ]; then
  QA_issues="$RELEASE_ISSUE $QA_issues"
  echo 1>&2 "Parsing issue titles from env var RELEASE_ISSUE (and QA milestone, if any):"
else
  echo 1>&2 "Parsing issue titles from QA milestone:"
fi
for i in $QA_issues; do
  title=$($curl -s "$api_url/issues/$i"  | jq -r '.title' )
  url="https://github.com/$orga/$appname/issues/$i"
  ## sed sucks. isolate \d+\.\d+\.\d+
  # Return empty when title="Translations missed in Metrics view"
  # Return 1.0.0 when title="Metrics 1.0.0"
  vers=$(echo "$title" | sed -rne 's/.*[^0-9]([0-9]+\.[0-9]+\.[0-9]+).*/\1/p')
  $releaseticket_batchmode || echo "  $url - $title"
  if [ -z "$app_version" -a -n "$vers" ]; then
    $releaseticket_batchmode || echo "Version seen: $vers\n"
    gh_issue_url="$url"
    app_version=$vers
  fi
done

if [ -z "$app_version" ]; then
  echo 1>&2 "ERROR: No release ticket with a version number in QA milestone"
  if [ -z "$2" ]; then
    echo 1>&2 "Retry with: env RELEASE_ISSUE=nnnn ..."
    echo 1>&2 "        or: version number as additional parameter"
    exit 1
  else
    app_version="$2"
  fi
fi

if $releaseticket_batchmode; then
  echo      "$app_version $gh_issue_url"
  # repeat the result on stderr, if stdout was redirected
  test -t 1 || echo 1>&2 "$app_version $gh_issue_url"
  exit 0
fi

echo ""
gh_tag=v$app_version
test -n "$GITHUB_TAG" && gh_tag="$GITHUB_TAG"

gh_rel_file="/tmp/$$gh_rel.json"
$curl > $gh_rel_file -s "$api_url/releases/tags/$gh_tag"
gh_rel_message=$(cat "$gh_rel_file" | jq -r '.message')
if [ -n "$gh_rel_message" -a "$gh_rel_message" != 'null' ]; then
  echo "Failed to get github release for tag=$gh_tag:"
  echo "       $api_url/releases/tags/$gh_tag"
  echo "       $gh_rel_message"
  if [ "$gh_rel_message" = "Not Found" ]; then
    if [ "$gh_tag" = "v$app_version" ]; then
      gh_tag="v${app_version}-rc.1"
      $curl > $gh_rel_file -s "$api_url/releases/tags/$gh_tag"
      gh_rel_message=$(cat "$gh_rel_file" | jq -r '.message')
      if [ -n "$gh_rel_message" -a "$gh_rel_message" != 'null' ]; then
        echo "Failed to get github release for tag=$gh_tag:"
        echo "       $api_url/releases/tags/$gh_tag"
        echo "       $gh_rel_message"
        gh_tag="v${app_version}RC1"
        $curl > $gh_rel_file -s "$api_url/releases/tags/$gh_tag"
        gh_rel_message=$(cat "$gh_rel_file" | jq -r '.message')
        if [ -n "$gh_rel_message" -a "$gh_rel_message" != 'null' ]; then
          echo "       $api_url/releases/tags/$gh_tag"
          echo "ERROR: $gh_rel_message"
	  exit 0;
        else
          echo "OK: found tag=$gh_tag (third try)"
        fi
      else
        echo "OK: found tag=$gh_tag (second try)"
      fi
    else
      echo "hmm... maybe with: env GITHUB_TAG=v${app_version}RC2 ..."
      exit 0
    fi
  else
    echo 'Retry with: env CURL_OPTS="-u $GITHUB_USER:$GITHUB_TOKEN" ...'
    exit 0
  fi
else
  echo "OK: found tag=$gh_tag"
fi

gh_rel_prerel=$(cat  "$gh_rel_file" | jq -r .prerelease )
gh_rel_assets=$(cat  "$gh_rel_file" | jq -r .assets )
gh_rel_name=$(cat    "$gh_rel_file" | jq -r .name )
gh_rel_body=$(cat    "$gh_rel_file" | jq -r .body )
rm -f $gh_rel_file


gh_release_url="https://github.com/$orga/$appname/releases/tag/$gh_tag"
changelog_snippet=$(echo "$gh_rel_body" | grep -v '^[# ]*\[')

if [ "$gh_rel_prerel" = "true" ]; then
  if [ "$gh_tag" = "v$app_version" ]; then
    echo "WARNING: $gh_release_url is flagged a prerelease, but should become a final!"
    sleep 5
  else
    echo "OK: is a prerelease; tag differs from v$app_version"
  fi
else
  if [ "$gh_tag" != "v$app_version" ]; then
    echo "ERROR: $gh_release_url must be a prerelease, when but tag=$gh_tag is not v$app_version!"
    exit 0
  else
    echo "OK: not a prerelease; tag looks like a final release."
  fi
fi

gh_raw_url="https://raw.githubusercontent.com/$orga/$appname"

echo "Fetching changelog from github release ..."
if [ -z "$changelog_snippet" ]; then
  echo "ERROR: Empty changelog snippet in $gh_release_url"
  echo "... trying CHANGELOG.md file instead ..."
  ## chop off at the first line startring with 'Details' or the second line starting with 'Changelog' or '## [1.3.0] - 2020-01-08'
  changelog_snippet=$(curl -s "$gh_raw_url/v$app_version/CHANGELOG.md" | sed -e '10,$s/^changelog/Details/i' -e '/^Details/,$d')

  if [ -z "$changelog_snippet" ]; then
    echo "ERROR: failed to parse anything from $gh_raw_url/v$app_version/CHANGELOG.md"
  fi
fi


echo "Checking Marketplace ..."
market_url="https://marketplace.owncloud.com/apps/$appname"
market_api="https://marketplace.owncloud.com/ajax/apps/$appname"
market_file="/tmp/$$_market_app.json"
$curl > $market_file -s $market_api
market_title=$(cat    $market_file | jq -r '.title' )
market_state=$(cat    $market_file | jq -r '.state' )
market_relvers=$(cat  "$market_file" | jq -r '.releases[0].version' )
market_relstate=$(cat "$market_file" | jq -r '.releases[0].state' )

if [ "$market_state" != "published" ]; then
  echo "WARNING: $market_url is not published: state=$market_state"
  rm -f $market_file
  market_url=''
fi

if [ -n "$market_url" -a "$market_relvers" != "$app_version" ]; then
  echo "WARNING: latest version at $market_url"
  echo "         is $market_relvers (we need $app_version)."

  market_relvers=$(cat $market_file | jq ".releases | .[] | select(.version == \"$app_version\") | .version")
  market_relvers=$(cat $market_file | jq ".releases | .[] | select(.version == \"$app_version\") | .state")
  if [ "$market_relvers" != "$app_version" ]; then
    echo "ERROR: version $app_version not found"
    echo "       at $market_url"
  else
    # we don't exit when releases are out of sequence ...
    echo "         But we have an earlier entry with version $app_version (okayish)."
  fi
fi
rm -f $market_file

missing_market=true
if [ -n "$market_url" -a "$market_relvers" = "$app_version" ]; then
  if [ "$market_relstate" != "published" ]; then
    echo "ERROR: Version $app_version is not published: state=$market_state"
    echo "       at $market_url"
    exit 1
  fi
  echo "... $market_relvers is published."
  missing_market=false
fi

## FIXME: implment checks at portal.owncloud.com
## FIXME: implment checks at custormer.owncloud.com


if [ "$gh_tag" != "v$app_version" ]; then
  cat <<EOPRE

---------------------------------------------------------------
    Prerelease ready: $appname $gh_tag
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Ticket:      $gh_issue_url
Download:    $gh_release_url
Marketplace: $market_url
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

$changelog_snippet
---------------------------------------------------------------
EOPRE
  exit 0
fi

if $missing_market; then
  cat <<EOERR
---------------------------------------------------------------
    Release $appname $gh_tag unfinished
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Ticket:      $gh_issue_url
Download:    $gh_release_url
Marketplace: --- Not uploaded ---
Portals:     --- Not checked ---
	https://portal.owncloud.com/apps/files/?dir=/Portal+Data/All+Account+Data/ownCloud+Enterprise+Resources+Data/Server
	https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Enterprise%2FownCloud-10
	https://customer.owncloud.com/owncloud/index.php/apps/files/?dir=%2FownCloud-Server%2FownCloud-10.0

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
$changelog_snippet
---------------------------------------------------------------
EOERR

  exit 0
fi


# we massage URL's, so that mailers and chat programs don't autoexpand these url's that would be too spammy.
cat <<EOF # | sed -e 's@https://@https: //@g'

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
To: release-coordination@owncloud.com
Subject: New oc10 app release: $market_title $market_relvers

Hi all!
Today we released the long awaited version $app_version of the $appname app.

Ticket:      $gh_issue_url
Download:    $gh_release_url
Marketplace: $market_url

# Changelog
$changelog_snippet

Enjoy...
cheers, Jürgen
= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

For #updates channel, replace "https://"  with "https: //"

Post also as a new item to https://kiteworks.monday.com/boards -> "Marketing Requests"
 -> Please check if suitable for e.g. newsletter: ...


EOF
