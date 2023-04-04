#! /bin/bash
#
# drone_star_check.sh
# Run this before committing changes to a .drone.star file.
#
# (C) 2023 jw@owncloud.com

star=.drone.star
buildifier="docker run -v $(pwd)/$star:/$star owncloudci/bazel-buildifier buildifier"

if [ ! - f "$star" ]; then
  echo "ERROR: no $star file found here."
  exit -1
fi

$buildifier --mode=check $star || bad=true
test [ -n "$bad" ]; then
  echo "ERROR: buildifier --mode=check"
  cp $star $star.backup
  # --mode=diff exists, but does not work.
  $buildifier --mode=fix $star
  diff -u $star.backup $star
  mv $star.backup $star
  echo "Apply this fix? (ENTER to continue, CTRL-C to abort)"
  read a
  $buildifier --mode=fix $star
fi

drone starlark --source $star --target /dev/null && echo " drone starlark: test successful"



