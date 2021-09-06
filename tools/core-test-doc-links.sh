#! /bin/bash
#
# test doc links of the server
# https://github.com/owncloud/core/pull/39026
# 
# Same as `make test-doc-links`, but does not need a server to be installed from source -- which we don't do during release QA.

git_branch=$SERVER_DOC_BRANCH
doc_branch=$SERVER_DOC_BRANCH
test -z "$git_branch" && git_branch=master
test -z "$doc_branch" && doc_branch=10.8		# FIXME: both should be the same???

links=$(curl -s -L https://github.com/owncloud/core/raw/$git_branch/lib/public/Constants.php | sed -e "s@';@@" | sed -n -e "s@.*\\sDOCS_.*\\s'@@p")

echo $links
err=

for link in $links; do
  for tld in com org; do
    url="https://doc.owncloud.$tld/server/$doc_branch/go.php?to=$link"
    http_code=$(curl -s -L -I $url -w '%{http_code}\n' -o /dev/null)
    echo "checking $url -> $http_code"
    if [ "$http_code" != 200 ]; then
      echo "	ERROR: return code should be 200"
      echo "	ERROR: Please compare lib/public/Constants.php and web server config"
      err="$err $http_code"
    fi
  done
done

if [ "$err" = "" ]; then
  echo "OK, all links are resolvable"
  exit 0
else
  echo "Errors seen: $err"
  exit 1
fi
