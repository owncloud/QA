#! /usr/bin/python3
#
# cloudlink.py - produce a private cloud link from a local file name
#
# (C) 2023 jw@owncloud.com - distribute under GPLv2 or ask
# 
# v1.1 2023-10-01 -  also handle github checkouts by hackily parsing .git/config
# v1.2 2024-08-02 -  handle ddirectories directly, without ugly scrollto


import sys, os, re, glob
from urllib.parse import urlencode, quote_plus

if len(sys.argv) < 2 or sys.argv[1] == "-h" or sys.argv[1] == "--help":
  print(f"Usage:\n\t {sys.argv[0]} path-to-local-file-in-a-syncfolder")
  sys.exit(0)

fullpath = os.path.realpath(sys.argv[1])

#
# 0) find all possible sync root folders
syncmap = {}
for cfgfile in glob.glob("/home/testy/.config/*/*.cfg"):
  # print(cfgfile) 
  cfg = { }
  for line in open(cfgfile, 'r').readlines():
    m = re.match('^(\d+).user=(.*)', line);
    if m:
      if m.group(1) not in cfg: cfg[m.group(1)] = {}
      cfg[m.group(1)]['user'] = m.group(2)
      # print(f"  user=: {m.group(1)}, {m.group(2)}")
    m = re.match('^(\d+).url=(.*)', line);
    if m:
      if m.group(1) not in cfg: cfg[m.group(1)] = {}
      cfg[m.group(1)]['url'] = m.group(2)
      # print(f"   url=: {m.group(1)}, {m.group(2)}")
    # Accept both:
    # 1\Folders\2\localPath=/home/testy/ownCloud/
    # 2\Folders\4d03ed6e-daeb-4c7a-8aab-6e32d9f820e1\localPath=/home/testy/cloud.fablab-nuernberg.de/
    m = re.match('^(\d+).Folders.([\da-f-]+).localPath=(.*)', line);
    if m:
      if m.group(1) not in cfg: cfg[m.group(1)] = {}
      cfg[m.group(1)]['localPathId'] = m.group(2)
      cfg[m.group(1)]['localPath'] = re.sub('/+$', '', m.group(3))      # strip trialing slashes
      # print(f"folder=: {m.group(1)}, {m.group(2)}, {m.group(3)}")
  # print(cfg) 
  for id in cfg:
    # Re-using the same path in different config files is allowed.
    # Unfortunately, we cannot easily discern, which is dead and which is active.
    if cfg[id]['localPath'] not in syncmap: syncmap[cfg[id]['localPath']] = []
    syncmap[cfg[id]['localPath']].append({ 
        'url':  cfg[id]['url'], 
        'user': cfg[id]['user'], 
        'id':   id,
        'id2':  cfg[id]['localPathId'], 
        'cfg':  cfgfile,
      })

#print(syncmap)
# syncmap = {
#   '/home/testy/testpilotcloud - guest@example.com@oc10130-oauth2-20230824.jw-qa.owncloud.works2/': [
#     {'url': 'https://oc10130.owncloud.works/', 'user': 'guest@example.com', 'id': '0', 'id2': '2aa11ece-63b5-45ec-95cc-99dda977c78e', 'cfg': '/home/testy/.config/testpilotcloud/testpilotcloud.cfg'},
#     {'url': 'https://oc10130.jw-qa.owncloud.works/', 'user': 'guest@example.com', 'id': '0', 'id2': '2aa11ece-63b5-45ec-95cc-99dda977c78e', 'cfg': '/home/testy/.config/ownCloud Testpilot Edition/testpilotcloud.cfg'}],
#   '/home/testy/damkenCloud/': [{'url': 'https://cloud.damken.com/', 'user': 'jw', 'id': '0', 'id2': '1', 'cfg': '/home/testy/.config/ownCloud/owncloud.cfg'}],
#   '/home/testy/ownCloud/': [{'url': 'https://cloud.owncloud.com/', 'user': 'jw', 'id': '1', 'id2': '2', 'cfg': '/home/testy/.config/ownCloud/owncloud.cfg'}],
#  '/home/testy/cloud.fablab-nuernberg.de/': [
#    {'url': 'https://cloud.fablab-nuernberg.de/', 'user': 'M0028', 'id': '2', 'id2': '4d03ed6e-daeb-4c7a-8aab-6e32d9f820e1', 'cfg': '/home/testy/.config/ownCloud/owncloud.cfg'}],
#  '/home/testy/damkencloud/': [
#    {'url': 'https://cloud.damken.com/', 'user': 'jw', 'id': '1', 'id2': '1', 'cfg': '/home/testy/.config/damkencloud/damkencloud.cfg'}]
# }


# 1) find our sync root folder in the syncmap
def find_syncconfig(path):
  fullpath = os.path.realpath(path)
  dir = os.path.dirname(fullpath)
  while dir != "/":
    if dir in syncmap:
      return ( dir, syncmap[dir] )
    dir = os.path.dirname(dir) 
  return ( dir, [] )     # nothing found.


def find_gitrepo(path):
  fullpath = os.path.realpath(path)
  dir = os.path.dirname(fullpath)
  while dir != "/":
    if os.path.isdir(dir + '/.git'):
      giturl = f"ERROR: No url = ... in {dir}/.git/config, orphan "
      for line in open(dir + '/.git/config', 'r').readlines():
        m = re.match('^\s*url\s*=\s*(.*)\.git\s*$', line);
        if m:
          giturl = m.group(1)
      giturl = re.sub("git@(.*):", "https://\\1/", giturl)
      return ( dir, [ { "url": giturl } ] )
    dir = os.path.dirname(dir) 
  return ( dir, [] )     # nothing found.


syncroot, cfgs = find_syncconfig(fullpath)
if not cfgs:
  # not in an owncloud sync root. Maybe in a git repo?
  syncroot, cfgs = find_gitrepo(fullpath)


if not cfgs:
  print(f"ERROR: {sys.argv[0]}: could not find a sync root connection for {fullpath}")
  sys.exit(1)

# print(syncroot, cfgs)
    
for cfg in cfgs:
  rest = fullpath[len(syncroot):]
  url = cfg['url']
  if 'user' not in cfg: # probably from github
    print(f"\t{url}/blob/master{rest}")
  else:
    m = re.match("^(\w+)://(.*)", url)
    if m:
      url = m.group(1) + "://" + cfg['user'] + "@" + m.group(2)
    else:
      url = "https://" + cfg['user'] + "@" + m.group(2)
    
    url = re.sub('/+$', '', url)      # strip trialing slashes

    if os.path.isdir(fullpath):
      payload = urlencode({'dir': rest}, quote_via=quote_plus)
    else:
      dir = os.path.dirname(rest)
      file = os.path.basename(rest)
      payload = urlencode({'dir': dir, 'scrollto': file}, quote_via=quote_plus)
    print(f"\t{url}/index.php/apps/files?{payload}")

print("")
  

