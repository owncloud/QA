#! /usr/bin/python3
#
# mkshare.py - a tool to create mass sharings in ownCloud 10.
#
# type=0 file with user
# type=1 folder with group, or file with group
# type=2 folder with user
# 
# item_type=file        # or folder
#
# permissions=31, everyting for folders.
# permissions=19, everyting for files.
#
# insert into oc_share set share_type=1, share_with='carol-g', uid_owner='bob', uid_initiator='bob', item_type='folder', item_source=22816, file_source=22816, file_target='/Photos from bob', permissions=31, stime=UNIX_TIMESTAMP();
#
# the share show up immediately, no file:scan needed.

# Algorithm
# First parameter: username or groupname to share with.
# second (or more) optional parameters: path names to share, relative to current working directory.
#  (no path name implies .)


import os, sys, re
try:
    import MySQLdb
except:
    print("python module MySQLdb not found. Try 'apt install python3-mysqldb' or 'pip install mysqlclient'\n")
    sys.exit(1)

if len(sys.argv) < 2:
  print("\nUsage: {sys.argv[0]} SHARE_RECEIVER [files ...]", file=sys.stderr);
  print("", file=sys.stderr);
  print(" SHARE_RECEIVER is a user or group in ownCloud", file=sys.stderr);
  print(" files          is one or multiple paths of files or folders to share (default: '.')", file=sys.stderr);
  print("                paths are expected to be inside a users data folder in the filesystem\n", file=sys.stderr)
  sys.exit(1)

if len(sys.argv) > 2:
    ocdir = os.path.realpath(sys.argv[2])
else:
    ocdir = os.path.realpath('.')


def datapatsplit(path):
    try:
        idx = path.index('/files/')
    except:
        print(f"Argument '{path}' does not contain .../files/...\n");
        sys.exit(1)

    suffix = path[idx+1:]
    path = path[:idx]
    ocdir, username = path.rsplit('/', 1)
    return (ocdir, username, suffix)


ocdir,user,path = datapatsplit(ocdir)

if not os.path.exists(ocdir + '/config/config.php'):
  ocdir='/var/www/owncloud'
if not os.path.exists(ocdir + '/config/config.php'):
  print("could not find config.php, neither via sys.argv[2], nor in /var/www/owncloud")
  sys.exit(1)
# print(ocdir)

cfg = open(ocdir + '/config/config.php').read()
m = re.search("'dbpassword'\s=>\s'([^']*)'", cfg)
dbpass = m.group(1)
m = re.search("'dbuser'\s=>\s'([^']*)'", cfg)
dbuser = m.group(1)
m = re.search("'dbhost'\s=>\s'([^']*)'", cfg)
dbhost = m.group(1)
m = re.search("'dbname'\s=>\s'([^']*)'", cfg)
dbname = m.group(1)
m = re.search("'dbtableprefix'\s=>\s'([^']*)'", cfg)
oc_ = m.group(1)       # 'oc_'

# print(dbuser, dbpass, dbhost, dbname, oc_)

conn = MySQLdb.connect( host=dbhost, user=dbuser, passwd=dbpass, db=dbname );
cur = conn.cursor()

cur.execute(f"select user_id from {oc_}accounts where user_id = %s or lower_user_id = %s or display_name = %s or email = %s", ( sys.argv[1], sys.argv[1], sys.argv[1], sys.argv[1]))
rows = cur.fetchall()

if len(rows) < 1:
  cur.execute(f"select * from {oc_}groups where gid = %s or lower(gid) = %s", ( sys.argv[1], sys.argv[1]))
  rows = cur.fetchall()
  if len(rows) < 1:
    print(f"ERROR: {sys.argv[1]} is neither user, email, fullname nor group")
    sys.exit(1)
  else:
    share_with = rows[0][0]
    is_groupshare = True
else:
  share_with = rows[0][0]
  is_groupshare = False

# cur.execute(f"SELECT * FROM {oc_}share")
# rows = cur.fetchall()
# res = [list(row) for row in rows]
# print(res)

def mkshare(share_with, with_group, path):
    datapath=os.path.realpath(path)
    if not os.path.exists(path):
        print(f"ERROR: {path} not found here in the filesytem.")
        sys.exit(1)
    is_folder = os.path.isdir(datapath)
    _, from_user, path = datapatsplit(datapath)

    ## Alice-g True bob files/Photos/Teotihuacan.jpg False
    print(  share_with, with_group, from_user, path, is_folder)

    if is_folder:
        permissions = 31
        item_type = 'folder'
        if is_groupshare:
            share_type = 1
        else:
            share_type = 2
    else:
        permissions = 19
        item_type = 'file'
        if is_groupshare:
            share_type = 1
        else:
            share_type = 0

    cur.execute(f"select numeric_id from {oc_}storages where id = %s", ("home::"+from_user, ))
    rows = cur.fetchall()
    if len(rows) < 1:
        print(f"ERROR: 'home::{from_user}' not found in {oc_}storages.")
        sys.exit(1)
    storage = rows[0][0]
    cur.execute(f"select fileid from {oc_}filecache where storage=%s and path = %s", (storage, path))
    rows = cur.fetchall()
    if len(rows) < 1:
        print(f"ERROR: path '{path}' storage {storage} not found in {oc_}filecache.")
        sys.exit(1)
    fileid = rows[0][0]
    # print(  storage, fileid)

    is_folder = os.path.isdir(datapath)

    file_target = path[5:]     # chop away 'files'

    # FIXME: must check first, if that same share is already there.
    # FIXME: must check, if share_with equals from_user
    # FIXME: must check, share_with already has file_target
    sql = f"insert into {oc_}share set share_type=%s, share_with=%s, uid_owner=%s, uid_initiator=%s, item_type=%s, item_source=%s, file_source=%s, file_target=%s, permissions=%s, stime=UNIX_TIMESTAMP();"
    data = ( share_type, share_with, from_user, from_user, item_type, fileid, fileid, file_target, permissions )
    cur.execute(sql, data)
    conn.commit()


if len(sys.argv) < 3:
    mkshare(share_with, is_groupshare, '.')
else:
    for i in range(2, len(sys.argv)):
        mkshare(share_with, is_groupshare, sys.argv[i])

