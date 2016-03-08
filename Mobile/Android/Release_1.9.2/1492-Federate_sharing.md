
###  Federated Sharing 

#### Pr: https://github.com/owncloud/android/pull/1492 

Devices: Morotola v4.4.4

Server: 9


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| **Correct view** ||||||
| 1 |  "Can share" not displayed | 1. Long press to share a file or folder with federated users<br>2. Tap on (i) to manage privileges| "Can share" option is not displayed. Only "Can edit" without suboptions| F m4 | Suboptions displayed if can edit is switched|
| 2 |  "remote" is shown |  1. Long press to share a file or folder with users<br>2. Type a username and then an '@'   | Within the results, there is one like 'username'@(remote). |P m4 ||
| **Federated Sharing** ||||||
| 3 |  Shared file (http) |  1. Long press to share a file with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared file appears in files view |P m4||
| 4 |  Shared folder (http) |  1. Long press to share a folder with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared folder appears in files view and can be browsed | P m4 ||
| 5 |  Shared file (https trusted) |  1. Long press to share a file with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared file appears in files view | P m4||
| 6 |  Shared folder (https trusted) |  1. Long press to share a folder with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared folder appears in files view and can be browsed |P m4||
| 7 |  Shared with groups |  1. Long press to share a file/folder with a group<br>2. Type a groupname and then an '@' and a correct server URL | Federated share with groups is not allowed | P m4||
| 8 |  Reject federated |  1. Long press to share a file with users<br>2. Type a username and then an '@' and a correct server URL<br>3. Login in web with the sharee and reject the federated share<br>4. Login in app with the sharee  | The shared file does not appear in files view. The share does not show the file as shared | P m4||
| 9 |  Special characters |  1. Repeat the test cases 3. or 4. with file/folder which contains special characters  | The shared file/folder appears in files view |P m4||
| 10 |  User with '@' |  1. Repeat the test cases 3. or 4. using a username which contains '@', for example 'M@ri@'  | The search view is correct, showing the option M@ri@@(remote). The file/folder can be federated shared | P m4| Review when deleting share|
| 11 |  User called '@' |  1. Repeat the test cases 3. or 4. using a username '@' | The search view is correct, showing the option @@(remote). The file/folder can be federated shared | P m4||
| 12 |  Multiple federated |  1. Long press to share a folder with users<br>2. Type different federated URLs (different servers and users)<br>3. Login in web with the sharees and accept the federated share<br>4. Login in app with the sharees  | All sharees can view the file/folder | P m4||
| 13 |  Unsharing | 1. Share (federated) a file/folder<br> 2. Accept it in the web<br>3.  In the sharing user, unshare the file | 2. The sharee can view the file<br>3. The sharee can not view the file|P m4||
| **Errors** ||||||
| 14 |  Inexistent User |  1. Repeat the test cases 3. or 4. using a username which does not exist in remote server  | The file can not be shared, an error appears |||
| 15 |  Inexistent Server |  1. Repeat the test cases 3. or 4. using an inexistent remote URL | The file can not be shared, an error appears |||
| 16 |  Share twice fed |  1. Share federated twice with the same user | First time the file is shared, second time, an error is received |||
| 17 |  Deleted account |  1. Repeat the test cases 3. or 4.<br> 2. From admin in web, delete the account ot the sharing user | The sharee can not view the shared file or folder |||
| 18 |  Without connection |  1. Switch the wifi connection off<br>2. Try to share with a federated user | An error appears |||
| 19 |  Without server connection |  1. Switch the server off<br>2. Try to share with a federated user | An error appears |||
| 20 | Server under maintenance mode | 1. Repeat the test cases 2. or 3. using a server under maitenance mode | The file can not be shared, an error appears |||
| **Server Capabilities** ||||||
| 21 |  Federated Sharing disabled |  1. In server side, disable the capability to share with federation<br>2. In app, try to share with federation<br> | Can not be share |||
| 22 |  Receive Federated disabled |  1. In server side, disable the capability to receive federated shares<br>2. In app, try to share form a other server's user with the current server<br> | The share is not accepted and an error is raised |||
| **Edit Privilege** ||||||
| 23 | Edit granted file|  1. Long press to share a file with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the file  | The shared file appears in files view and can be edited |||
| 24 | Edit granted folder|  1. Long press to share a folder with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the folder  | The shared folder appears in files view and can be edited (upload/update/delete) |||
| 25 | Edit not granted file |  1. Long press to share a file with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the file  | The shared file appears in files view and can not be edited |||
| 26 | Edit not granted folder |  1. Long press to share a folder with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the folder  | The shared file appears in files view and can not be edited (upload/update/delete)|||
| **Reshare Privilege** ||||||
| 27 | Share with edit |  1. Long press to share a file with an federated user granting him to edit <br>2. Login with the sharee<br>3. Try to reshare with other users in the same server granting them to edit and share<br>4. Login with the 2nd sharee| 3. The edit and share privileges are enabled and the file can be reshared<br>4. The 2nd sharee can edit and share the file|||
| 28 | Share without edit |  1. Long press to share a file with an federated user without granting him to edit <br>2. Login with the sharee<br>3. Try to reshare with other users in the same server granting them to edit<br>4. Try to reshare with other users in the same server without granting them to edit| 3. The file can not be reshared because the permission exceeds<br>4. The file can be reshared and the 2nd sharee can not edit the file|||
| 29 | Reshare federated |  1. Long press to share a file with an federated user<br>2. Login with the sharee<br>3. Try to reshare with another federated in a different server| The file is reshared correctly |||
| 30 | Reshare initial user |  1. Long press to share a file with an federated user<br>2. Login with the sharee<br>3. Try to reshare with the initial share| The file can not be reshared with the initial share |||
| 31 | Reshare initial server |  1. Long press to share a file with an federated user <br>2. Login with the sharee<br>3. Try to reshare with an user of the initial server| The user can see the file|||w
| **Autocomplete** |Set two servers with Autocompletion|||||
| 32 | User in other server (whith autoc.)|  1. Share a file/folder with a user of a trusted typing only his name| The autocompletion shows the complete federated URL and not the (remote)|||
| 33 | User in other server (without autoc.) |  1. Share a file/folder with a user of a trusted typing only his name| When the @ is written is shown as 'remote'|||
| 34 | Two users with same name  (with autoc.) |  1. Share a file/folder with a user of a trusted typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, the remote including whole URL|||
| 35 | Two users with same name  (without autoc.) |  1. Share a file/folder with a user of a trusted typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, the remote including @remote|||
| **Special Servers** |Only one device|||||
| 36 | Shibboleth sharee |  1. Long press to share a file with an federated user in a shibboleth server <br>2. Login with the sharee<br>| The sharee in shibboleth server can view the file|||
| 37 | Shibboleth share |  1. In a shibboleth server, long press to share a file with an federated user <br>2. Login with the sharee<br>| The sharee can view the file|||
| 38 | LDAP |  1. Swipe to share a file with an federated user in a LDAP server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 39 | Redirect sharee |  1. Long press to share a file with an federated user in a redirect server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 40 | No self signed |  1. Long press to share a file with an federated user in a no self signed server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 41 | Self signed not trusted|  1. Long press to share a file with an federated user in a self signed server with an untrusted certificate <br>2. Login with the sharee<br>| The file can not be shared federated and the sharee can neither accept nor view it|||