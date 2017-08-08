

| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| As admin user, enable federation app.    | No problems.                             |        |                 |
| Having two servers called serverA and serverB. "Add server automatically once a federated share was created successfully" enabled. Share a file from userA in serverA to userB in serverB. Go to the admin page with admin user and check federation section. | serverB is added as trusted in federation. |        |                 |
| Having two servers called serverA and serverB. "Add server automatically once a federated share was created successfully" disabled. Share a file from userA in serverA to userB in serverB. Go to the admin page with admin user and check federation section. | serverB is not added as trusted in federation. |        |                 |
| Having two servers called serverA and serverB. "Add server automatically once a federated share was created successfully" disabled in serverA. Share a file from userA in serverA to userB in serverB. In serverB accept share. Open sharing dialog in serverB for a file. | Users from serverA do not appear.       |        |                 |
| Having one trusted server, called serverB, go to the sharing dialog and type first characters of a user from serverB. | Users from serverB appear and you can share with them. |        |                 |
| Having one trusted server which has LDAP users, called serverB, go to the sharing dialog and type first characters of a user id from serverB. | LDAP users from serverB appear and you can share with them |        |                 |
| Having one trusted server which has AD users, called serverB, go to the sharing dialog and type first characters of a user id from serverB. | AD users from serverB appear and you can share with them |        |                 |
| Having one trusted server, called serverB. Mount an external storage. On one of the files of the mount, go to the sharing dialog and type first characters of a user from serverB. | Users from serverB appear and you can share with them. |        |                 |
| Using SSL, Having two servers called serverA and serverB. "Add server automatically once a federated share was created successfully" enabled. Share a file from userA in serverA to userB in serverB. Go to the admin page with admin user and check federation section. | serverB is added as trusted in federation. |        |                 |
| Using SSL, Having one trusted server, called serverB, go to the sharing dialog and type first characters of a user from serverB. | Users from serverB appear and you can share with them. |        |                 |
| Check that the federation section in admin page can be used in chrome, firefox, safari and edge. |                                          |        |                 |
| Check that the sharing dropdown with remote users appears in chrome, firefox, safari and edge. |                                          |        |                 |
| In admin page, add an owncloud server which exists. | The server is added correctly                                         |        |                 |
| In admin page, add an owncloud server which doesn't exist. | A warning message appears                                         |        |                 |
| In admin page, add an owncloud server older than 9.0 | A warning message appears                                         |        |                 |

