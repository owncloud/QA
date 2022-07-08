#! /bin/bash
#
# check_url.sh - test one (or mutiple) URL against 404 or very small.


version=0.1
short_body_len=2048
test -n "$CHECK_URL_SHORT_BODY_LEN" && short_body_len="$CHECK_URL_SHORT_BODY_LEN"

if [ "$1" = '-h' ]; then
  cat <<EOF
check_url $version

Usage example:
	env CHECK_URL_SHORT_BODY_LEN=100 $0 https://doc.owncloud.com/server/admin_manual/configuration/search/index.html

EOF
fi

ret=0

for url in "$@"; do
  code=$(curl -s -S --max-time 10 -w '%{http_code}\n' -L -I "$url" -o /dev/null)
  if [ "X$code" = "X404" ]; then
    echo "ERROR 404: $url"
    ret=1
  else
    len=$(curl -s -S --max-time 10 -w '%{size_download}\n' -L "$url" -o /dev/null)
    if [ "$len" -le "$short_body_len" ]; then
      echo "ERROR: short body $len: $url"
      ret=1
    else
      echo "OK: $url"
    fi
  fi
done
exit $ret
