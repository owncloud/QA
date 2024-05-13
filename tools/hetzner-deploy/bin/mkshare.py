#! /usr/bin/python3
#
# mkshare.py - a tool to create mass sharings in ownCloud 10.
#
# type=0 file or folder with user
# type=1 folder with group, or file with group
# (type=2 folder with user???)
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
#
# v0.1    - 20240322, jw, initial draft
# v0.2    - 20240513, jw, ported to postgres, autodetect mysql/postgres


import os, sys, re

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
m = re.search("'dbtype'\s=>\s'([^']*)'", cfg)
dbtype = m.group(1)    # pgsql

if dbtype == 'pgsql':
    try:
        import psycopg2
    except:
        print("python module psycopg2 not found. Try 'apt install python3-psycopg2' or 'pip install psycopg2'\n")
        sys.exit(1)
else:
    try:
        import MySQLdb
    except:
        print("python module MySQLdb not found. Try 'apt install python3-mysqldb' or 'pip install mysqlclient'\n")
        sys.exit(1)

# print(dbuser, dbpass, dbhost, dbname, oc_)
# passwd, db is for mysql, password, dbname for pgsql
conn = psycopg2.connect( host=dbhost, user=dbuser, password=dbpass, dbname=dbname );
cur = conn.cursor()

cur.execute(f"SELECT user_id FROM {oc_}accounts WHERE user_id = %s OR lower_user_id = %s OR display_name = %s OR email = %s", ( sys.argv[1], sys.argv[1], sys.argv[1], sys.argv[1]))
rows = cur.fetchall()

if len(rows) < 1:
  cur.execute(f"SELECT * FROM {oc_}groups WHERE gid = %s OR LOWER(gid) = %s", ( sys.argv[1], sys.argv[1]))
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
            share_type = 0      # sometimes 2 ???
    else:
        permissions = 19
        item_type = 'file'
        if is_groupshare:
            share_type = 1
        else:
            share_type = 0

    cur.execute(f"SELECT numeric_id FROM {oc_}storages WHERE id = %s", ("home::"+from_user, ))
    rows = cur.fetchall()
    if len(rows) < 1:
        print(f"ERROR: 'home::{from_user}' not found in {oc_}storages.")
        sys.exit(1)
    storage = rows[0][0]
    cur.execute(f"SELECT fileid FROM {oc_}filecache WHERE storage=%s AND path = %s", (storage, path))
    rows = cur.fetchall()
    if len(rows) < 1:
        print(f"ERROR: path '{path}' storage {storage} not found in {oc_}filecache.")
        sys.exit(1)
    fileid = rows[0][0]
    # print(  storage, fileid)

    is_folder = os.path.isdir(datapath)

    file_target = os.path.basename(path)     # chop away 'files' and any directories...

    # FIXME: must check first, if that same share is already there.
    # FIXME: must check, if share_with equals from_user
    # FIXME: must check, share_with already has file_target
    # mysql uses INSERT INTO ... SET ... but pgsql needs INSERT INTO ... (field, field) VALUES (val, val, val)
    if dbtype == 'pgsql':
        sql = f"INSERT INTO {oc_}share (share_type, share_with, uid_owner, uid_initiator, item_type, item_source, file_source, file_target, permissions, stime) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, EXTRACT(EPOCH FROM now()))"
    else:
        sql = f"INSERT INTO {oc_}share SET share_type=%s, share_with=%s, uid_owner=%s, uid_initiator=%s, item_type=%s, item_source=%s, file_source=%s, file_target=%s, permissions=%s, stime=UNIX_TIMESTAMP();"
    data = ( share_type, share_with, from_user, from_user, item_type, fileid, fileid, file_target, permissions )
    cur.execute(sql, data)
    conn.commit()


if len(sys.argv) < 3:
    mkshare(share_with, is_groupshare, '.')
else:
    for i in range(2, len(sys.argv)):
        mkshare(share_with, is_groupshare, sys.argv[i])

