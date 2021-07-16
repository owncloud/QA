#! /bin/bash
#
# prepare a test setup for files_antrivirus with icap & Kaspersky
#

# av_app=files_antrivirus=1.0.0-beta2
av_app=files_antivirus 			## Without url or version: Grab the latest tag from github.

test -n "$1" && KASKPERSKY_KSE_RELEASE_URL="$1"
test -n "$2" && KASKPERSKY_KSE_LICENSE="$2"

if [ -z "$KASKPERSKY_KSE_RELEASE_URL" ]; then
  echo "Env var KASKPERSKY_KSE_RELEASE_URL not set. Please specify a fresh(!) file download url as used when clicking on the share website. (Or a local filename)"
fi
if [ -z "$KASKPERSKY_KSE_LICENSE" ]; then
  echo "Env var KASKPERSKY_KSE_LICENSE not set. Scanning current directory for a Kaspersky *.key file ..."
  for cand in ./*.key; do
    if [ -n "$(strings "$cand" | grep Kaspersky)" ]; then
      KASKPERSKY_KSE_LICENSE=$cand
    fi
  done
  test -n "$KASKPERSKY_KSE_LICENSE" && echo "... found $KASKPERSKY_KSE_LICENSE"
fi
if [ -z "$KASKPERSKY_KSE_LICENSE" -o -z "$KASKPERSKY_KSE_RELEASE_URL" ]; then exit 1; fi

set -x
bash ./make_oc10_apps.sh $av_app $KASKPERSKY_KSE_RELEASE_URL $KASKPERSKY_KSE_LICENSE

