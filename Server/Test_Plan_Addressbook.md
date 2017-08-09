### Addressbook test plan



| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| As admin user, create some users. Add them with an email and avatar. Connect to HOST/remote.php/dav/addressbooks/system/system/system using evolution in linux. | All users appear with their data correct. |        |                 |
| Using SSL: As admin user, create some users. Add them with an email and avatar. Connect to HOST/remote.php/dav/addressbooks/system/system/system using evolution in linux. | All users appear with their data correct. |        |                 |
| In evolution, with a server connected, try to modify any data of a user. | Server answers 403 forbidden and nothing is modified. |        |                 |
| Having a server with LDAP connected, run ./occ dav:sync-system-addressbook, connect evolution. | All LDAP users appear.                   |        |                 |
| Having a server with LDAP connected and some users having an avatar (add it if necessary). Open that user card in evolution. (run ./occ dav:sync-system-addressbook, connect evolution if needed at this point) | Avatar appears.                          |        |                 |
| Having a server with AD connected, run ./occ dav:sync-system-addressbook, connect evolution. | All AD users appear.                     |        |                 |
| Having a server which uses shibboleth autoprovisioning mode , connect evolution. | All shibboleth users appear.                     |        |                 |
| Having an addressbook connected to evolution. Change regular user display name, email and avatar. | Changes appear in evolution.             |        |                 |
| Having an addressbook connected to evolution. Change LDAP user display name, email and avatar. | Changes appear in evolution.             |        |                 |
| Having an addressbook connected to evolution. Change AD user display name, email and avatar. | Changes appear in evolution.             |        |                 |
| Having a previous major version of the server using contacts app and working, upgrade to latest major version. Run ./occ dav:sync-system-addressbook | Contacts app is disabled and contacts are still available when connecting to HOST/remote.php/dav/addressbooks/system/system/system. |        |                 |



