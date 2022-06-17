#! /usr/bin/python3
#
# Convert an ansible host_vars yml file into to a docker env file that can be converted back into a config.php by
# https://github.com/owncloud/owncloud-updater-server/blob/main/overlay/etc/templates/owncloud-updater-server.php.tmpl
#
# CAUTION:
# - For white space separated array values, we must not use any quoting. This is correct docker env-file syntax, (but illegal bash syntax)
#   Docker compose (~v1.28) promises, that it can parse .env files with single and double quotes.
#   But plain docker does not do that. Everything after the = is part of the value. literally.
#
# - 'LATEST' does not necessarily specify the latest patchlevel of a given minor version. It can be further in the future.
#   we have e.g.: OWNCLOUD_UPDATER_SERVER_BETA_10_8_LATEST=10.9.1
#   10.9.1 probably is the version number that we can update to, if we have 10.8.x
#
# (C) 2022 jw@owncloud.com 

import sys, os, yaml

yml = os.environ["HOME"] + "/src/gitea/devops/product/ansible/host_vars/sunny/owncloudupdater.yml"

if len(sys.argv) > 1:
  if sys.argv[1] == '-h' or sys.argv[1] == '--help':
    print("""
%s [infile.yml] > outfile.env

  infile default: %s

  Example usage: 
    cd ~/src/gitea/devops/product/
    %s ansible/host_vars/sunny/owncloudupdater.yml > updater.env
    docker run -e updater.env registry.owncloud.com/internal/server-updater
""" % (sys.argv[0], yml, sys.argv[0]), file=sys.stderr)
    sys.exit(1)
  else:
    yml = sys.argv[1]


pre = 'OWNCLOUD_UPDATER_SERVER_' # prefix for all env variables
all = yaml.safe_load(open(yml))
chs = all['owncloudupdater_channels']

print(pre + "CHANNELLIST=%s" % ' '.join(map(lambda x:x['name'], chs)))          # OWNCLOUD_UPDATER_SERVER_CHANNELLIST=production stable beta daily eol

for ch in chs:
  chpre = pre + ch['name'].replace('-', '_').upper() + '_'
  vers = ch['versions']
  print("")
  print(chpre + "VERSIONS=%s" % ' '.join(map(lambda x:x['name'], vers)))        # OWNCLOUD_UPDATER_SERVER_PRODUCITON_VERSIONS=10.9 10.8
  for ver in vers:
    verpre = chpre + ver['name'].replace('.', '_').upper() + '_'                # OWNCLOUD_UPDATER_SERVER_PRODUCITON_10_9_
    if 'latest' in ver:
      print(verpre + "LATEST=%s" % ver['latest'])
    if 'web' in ver:
      print(verpre + "WEB=%s" % ver['web'])
    if 'download_url' in ver:
      print(verpre + "DOWNLOAD_URL=%s" % ver['download_url'])
 
print("")
print(pre + "EOL_LATEST=%s" % all['owncloudupdater_eol_latest'])

