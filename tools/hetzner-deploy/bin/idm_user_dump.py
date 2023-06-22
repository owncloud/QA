#! /usr/bin/python3
#
# idm_user_dump.py - a dirty hack, to dump uid records from an ocis boltdb.
#
# 2023 - jw@owncloud.com
#

import json

boltdb_file = "/var/lib/ocis/idm/ocis.boltdb"

text = open(boltdb_file, 'rb').read()

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
    uid = text[s:s+uid_len].decode()  # decode() converts from raw bytes to UTF-8 
    # print(uid)
    if ',ou=users,' in uid:
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
            s += 1    # skip '0x00' 
            if vals1 == vals2:      # array element by element compare
                if len(vals1) == 1:
                    users[uid][k] = vals1[0]
                else:
                    users[uid][k] = vals1
            else:
                users[uid][k] = [ vals1, vals2 ]
            
print(json.dumps(users))
