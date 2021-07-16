#! /bin/bash
#
# (c) 2020 jw@owncloud.com, distribute under GPLv2 or ask.
#
# 2020-05-11, jw, added loop to allow multiple deletions
# 2020-05-12, jw, added globbing patterns, for I am lazy.
# 2020-05-19, jw, added support for hcloud_cli, to ease the terraform dependency
# 2020-05-20, jw, ported to mac

test -z "$HCLOUD_TOKEN" && export HCLOUD_TOKEN=$TF_VAR_hcloud_token
test -z "$TF_VAR_hcloud_token" && export TF_VAR_hcloud_token=$HCLOUD_TOKEN
if [ -z "$HCLOUD_TOKEN" ]; then
  echo "Environment variable HCLOUD_TOKEN not set."
  exit 1
fi
test -z "$TF_USER" && TF_USER=$USER
name=$1

if [ -f "$(dirname $0)/lib/hcloud_cli/bin/hcloud" ]; then
  "$(dirname $0)/lib/hcloud_cli/bin/hcloud" server delete "$name"
  exit 0
fi

cd $(dirname $0)/lib/hcloud_tf/terraform

if [ -z "$name" ]; then
  echo "Usage: $0 MACHINE_NAME_GLOB ..."
  echo ""
  echo "Example: $0 $TF_USER-*"
  echo ""
  echo "Known names are:"
  ls *.tfstate 2>/dev/null | grep -v 'terraform\.tfstate' | sed -e 's/\.tfstate//' -e 's/^/  /'
  exit 1
fi

while [ -n "$name" ]; do
  for tfstate in $name.tfstate; do
    autoapprove=
    bin/terraform refresh -state=$tfstate >/dev/null
    test -z "$(bin/terraform state list -state=$tfstate)" && autoapprove=-auto-approve
    bin/terraform destroy $autoapprove -state=$tfstate
  done
  shift
  name=$1
done

for st in *.tfstate; do
  bin/terraform refresh -state=$st >/dev/null
  address=$(bin/terraform state list -state=$st)
  if [ -z "$address" ]; then
    rm -f $st $st.backup
    echo "state-file $st removed."
  fi
done
