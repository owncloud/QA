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


if len(sys.argv) > 1:
    ocdir = os.path.realpath(sys.argv[2])
    try:
        idx = ocdir.index('/files/')
    except:
        print("argument '{sys.argv[2]}' does not contain .../files/...\n");
        sys.exit(1)
    path = ocdir[idx:]
    ocdir = ocdir[:idx]
    ocdir, username = ocdir.rsplit('/', 1)
    print(ocdir, username, path)

if not os.path.exists(ocdir + '/config/config.php'):
  ocdir='/var/www/owncloud'
if not os.path.exists(ocdir + '/config/config.php'):
  print("could not find config.php, neither via sys.argv[2], nor in /var/www/owncloud")
  sys.exit(1)


print(ocdir)

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

print(dbuser, dbpass, dbhost, dbname, oc_)

conn = MySQLdb.connect( host=dbhost, user=dbuser, passwd=dbpass, db=dbname );
cur = conn.cursor()

cur.execute(f"SELECT * FROM {oc_}share")
rows = cur.fetchall()
res = [list(row) for row in rows]
print(res)

