#! /usr/bin/python3
#
# idm_user_dump.py - a dirty hack, to dump uid records from an ocis boltdb.
#
# (c) 2023 - jw@owncloud.com, distribute under GPLv2
#
# 2023-06-21 - v0.1 initial draught
#            - v0.2 refactored as module
#            - v0.3 default to all keys lowercase, the LDAP specification (RFC 4512) 
#                   states that attribute names are not case-sensitive in the DIT.
# 2023-06-22 - v0.4 crude option parser added, --help, redirect via stdin added.
#
# Usage:
#
#   import json
#   from idm_user_dump import Dumper
#   print(json.dumps(Dumper())
#

__version__ = '0.4'

def Dumper(file="/var/lib/ocis/idm/ocis.boltdb", uidfilter='ou=users', ignorecase=True):
    """
    Loads the ocis.boltdb file as flat binary file and searches for 'uid='
    markers. At these markers user records are decoded.

    A dictionary with ldap style uid keys is returned, values in the dictionary
    are the attributes found in the database.  Single valued attributes are
    strings, multi-valued attributes are returnd as a list of strings.  The
    list of values is repeated twice in the boltdb database.  If these values
    differ, a (two element) list of lists is returned.

    uidfilter can be used to limit the amount of records included in the dictionary.
    If the filter contains a name, but no prefix with '=', then 'uid=' is assumed.

    When ignorecase is True, keys are returned all lowercase. This is good for
    the typical ocis.boltdb, as they sometimes store 'ownCloudUUID' and
    sometimes 'owncloudUUID'. When ignorecase is False, keys are returned as is.
    """

    text = open(file, 'rb').read()

    if uidfilter is not None and '=' not in uidfilter:
        uidfilter = 'uid='+uidfilter

    starts = [-1]
    while True:
        start = text.find(b'uid=', starts[-1]+1)
        if start < 0:
            break
        starts.append(start)

    starts.pop(0)
    # print(starts)

    users = {}
    for s in starts:
        uid_len = text[s-1]               # the one byte before the uid string has the length of the string
        if uid_len == 0:
            break                         # end marker..
        uid = text[s:s+uid_len].decode()  # decode() converts from raw bytes to UTF-8
        if ignorecase: uid = uid.lower()

        # print(uid)

        if uidfilter == None or ','+uidfilter+',' in ','+uid+',':
            users[uid] = {}
            # b'uid=admin,ou=users,o=libregraph-idm
            #   \x01\n
            #   \x01\x02cn\x01\x01 \x05admin\x01\x01 \x05admin\x00
            #   \x01\x0bdescription\x01\x01 An admin for this oCIS instance.\x01\x01 An admin for this oCIS instance.\x00
            #   \x01\x0bdisplayName\x01\x01\x05Admin\x01\x01\x05Admin\x00
            #   \x01\tgivenName\x01\x01\x05Admin\x01\x01\x05Admin\x00
            #   \x01\x04mail\x01\x01\x11admin@example.org\x01\x01\x11admin@example.org\x00
            #   \x01\x0bobjectClass\x01\x06 \rinetOrgPerson \x14organizationalPerson \x0cownCloudUser \x08ownCloud \x06person \x03top
            #                      \x01\x06 \rinetOrgPerson \x14organizationalPerson \x0cownCloudUser \x08ownCloud \x06person \x03top\x00
            #   \x01\x0cownCloudUUID\x01\x01 $d9325a37-705b-4955-ae05-ad5e65eb2a0d
            #                       \x01\x01 $d9325a37-705b-4955-ae05-ad5e65eb2a0d\x00
            # b'uid=testy,ou=users,o=libregraph-idm\x01\t\x01\x02cn\x01\x01\x05testy\x01\x01\x05testy\x00\x01\x0bdisplayName\x01\x01\tTest User\x01\x01\tTest User\x00\x01\x04mail\x01\x01\x11testy@example.com\x01\x01\x11testy@example.com\x00\x01\x0bobjectClass\x01\x05\rinetOrgPerson\x14organizationalPerson\x06person\x03top\x0cownCloudUser\x01\x05\rinetOrgPerson\x14organizationalPerson\x06person\x03top\x0cownCloudUser\x00\x01\x10ownCloudUserType\x01\x01\x06Member\x01\x01\x06Member\x00\x01\x0cowncloudUUID\x01\x01$ec8759e5-9e93-4da2-8116-8ca3e9322c2d\x01\x01$ec8759e5-9e93-4da2-8116-8ca3'

            s += uid_len;
            n_keys = text[s+1]
            s += 2;                 # skip \x01\n   (where n_keys = 10)
            for i in range(n_keys):
                s += 1              # skip '\x01'
                k_len = text[s]
                s += 1
                k = text[s:s+k_len].decode()
                if ignorecase: k = k.lower()
                s += k_len
                n_vals = text[s+1]
                s += 2
                vals1 = []
                for j in range(n_vals):
                    v_len = text[s]
                    s += 1
                    v = text[s:s+v_len].decode()
                    vals1.append(v)
                    s += v_len

                # values are always repeated. strange...
                n_vals = text[s+1]
                s += 2
                vals2 = []
                for j in range(n_vals):
                    v_len = text[s]
                    s += 1
                    v = text[s:s+v_len].decode()
                    vals2.append(v)
                    s += v_len
                s += 1                  # skip '0x00'
                if vals1 == vals2:      # array element by element compare
                    if len(vals1) == 1:
                        users[uid][k] = vals1[0]
                    else:
                        users[uid][k] = vals1
                else:
                    users[uid][k] = [ vals1, vals2 ]
    return users


if __name__ == '__main__':
    import json, sys, os
    filter = 'ou=users'
    file = Dumper.__defaults__[0]

    if len(sys.argv) > 1:
        if sys.argv[1] == '-h' or sys.argv[1] == '--help':
            print("""
idm_user_dump.py Version %s

Usage:
        %s [filter]
        %s --all
        %s ... < /tmp/ocis.boltdb
        bbolt get --parse-format  hex ~/ocis.boltdb id2entry 0900000000000000 | %s | jq

The default filter is '%s'.
The database file is taken from stdin, when stdin is not connected to a terminal.
Otherwise the database file defaults to '%s'.

""" % (__version__, sys.argv[0], sys.argv[0], sys.argv[0], sys.argv[0], filter, file))
            sys.exit(0)

        filter = sys.argv[1]
        if filter == '-a' or filter == '--all':
            filter = None

    if not sys.stdin.isatty():
        file = '/dev/stdin'             # allow piping

    env_file = os.environ.get('IDM_BOLTDB_FILE')
    if env_file: file = env_file

    print(json.dumps(Dumper(file=file, uidfilter=filter)))

