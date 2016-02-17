###  Federated Sharing 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server:


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| **Correct view** ||||||
| 1 |  "remote" is shown |  1. Swipe to share a file or folder with users<br>2. Type a username and then an '@'   | Within the results, there is one like 'username'@(remote) 
| **Federated Sharing** ||||||
| 2 |  Shared file (http) |  1. Swipe to share a file with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared file appears in files view |||
| 3 |  Shared folder (http) |  1. Swipe to share a folder with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared folder appears in files view and can be browsed |||
| 4 |  Shared file (https trusted) |  1. Swipe to share a file with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared file appears in files view |||
| 5 |  Shared folder (https trusted) |  1. Swipe to share a folder with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared folder appears in files view and can be browsed |||
| 6 |  Shared with groups |  1. Swipe to share a file/folder with a group<br>2. Type a groupname and then an '@' and a correct server URL<br>3. Login in web with all the group members and accept the federated share<br>4. Login in app with the sharees  | The shared appears in files view and can be browsed |||
| 7 |  Reject federated |  1. Swipe to share a file with users<br>2. Type a username and then an '@' and a correct server URL<br>3. Login in web with the sharee and reject the federated share<br>4. Login in app with the sharee  | The shared file does not appear in files view. The share does not show the file as shared |||
| 8 |  Special characters |  1. Repeat the test cases 2. or 3. with file/folder which contains special characters  | The shared file/folder appears in files view |||
| 9 |  User with '@' |  1. Repeat the test cases 2. or 3. using a username which contains '@', for example 'M@ri@'  | The search view is correct, showing the option M@ri@@(remote). The file/folder can be federated shared |||
| 10 |  User called '@' |  1. Repeat the test cases 2. or 3. using a username '@' | The search view is correct, showing the option @@(remote). The file/folder can be federated shared |||
| 11 |  Multiple federated |  1. Swipe to share a folder with users<br>2. Type different federated URLs (different servers and users)<br>3. Login in web with the sharees and accept the federated share<br>4. Login in app with the sharees  | All sharees can view the file/folder |||
| 12 |  Unsharing | 1. Share (federated) a file/folder<br> 2. Accept it in the web<br>3.  In the sharing user, unshare the file | 2. The sharee can view the file<br>3. The sharee can not view the file||
| **Errors** ||||||
| 13 |  Inexistent User |  1. Repeat the test cases 2. or 3. using a username which does not exist in remote server  | The file can not be shared, an error appears |||
| 14 |  Inexistent Server |  1. Repeat the test cases 2. or 3. using an inexistent remote URL | The file can not be shared, an error appears |||
| 15 |  Share twice fed |  1. Share federated twice with the same user | First time the file is shared, second time, an error is received |||
| 16 |  Deleted account |  1. Repeat the test cases 2. or 3.<br> 2. From admin in web, delete the account ot the sharing user | The sharee can not view the shared file or folder |||
| 17 |  Without connection |  1. Switch the wifi connection off<br>2. Try to share with a federated user | An error appears |||
| 18 |  Without server connection |  1. Switch the server off<br>2. Try to share with a federated user | An error appears |||
| 19 | Server under maintenance mode | 1. Repeat the test cases 2. or 3. using a server under maitenance mode | The file can not be shared, an error appears |||
| **Server Capabilities** ||||||
| 20 |  Federated Sharing disabled |  1. In server side, disable the capability to share with federation<br>2. In app, try to share with federation<br> | The share is not accepted and an error is raised |||
| 21 |  Receive Federated disabled |  1. In server side, disable the capability to receive federated shares<br>2. In app, try to share form a other server's user with the current server<br> | The share is not accepted and an error is raised |||
| **Edit Privilege** ||||||
| 22 | Edit granted file|  1. Swipe to share a file with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the file  | The shared file appears in files view and can be edited |||
| 23 | Edit granted folder|  1. Swipe to share a folder with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the folder  | The shared folder appears in files view and can be edited (upload/update/delete) |||
| 24 | Edit not granted file |  1. Swipe to share a file with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the file  | The shared file appears in files view and can not be edited |||
| 25 | Edit not granted folder |  1. Swipe to share a folder with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in app with the sharee and try to edit the folder  | The shared file appears in files view and can not be edited (upload/update/delete)|||
| **Reshare Privilege** |**ATTENTION!**<br>Check cross v8-v9|||||
| 26 | Reshare v8 → v8 |  1. Swipe to share a file in v8 with an federated user in v8 granting him to share <br>2. Login with the sharee<br>3. Try to reshare with other users in the same server<br>4. Login with the 2nd sharee| 3. The share privilege is enabled<br>4. The 2nd sharee can view the file |||
| 27 | Reshare v8 → v9 |  1. Swipe to share a file in v8 with an federated user in v9 granting him to share<br>2. Login with the sharee<br>3. Try to reshare with other users in the same server| Resharing is not allowed |||
| 28 | Reshare v9 → v8 |  1. Swipe to share a file in v9 with an federated user in v8 granting him to share <br>2. Login with the sharee<br>3. Try to reshare with other users in the same server<br>4. Login with the 2nd sharee| 3. The share privilege is enabled<br>4. The 2nd sharee can view the file |||
| 29 | Reshare v9 → v9 |  1. Swipe to share a file in v9 with an federated user in v9 granting him to share<br>2. Login with the sharee<br>3. Try to reshare with other users in the same server| Resharing is not allowed |||
| 30 | Reshare initial user |  1. Swipe to share a file with an federated user granting him to share<br>2. Login with the sharee<br>3. Try to reshare with the initial share| The file can not be reshared with the initial share |||
| 31 | Reshare initial server |  1. Swipe to share a file with an federated user granting him to share<br>2. Login with the sharee<br>3. Try to reshare with an user of the initial server| The user can see the file|||
| **Special Servers** ||||||
| 32 | Shibboleth sharee |  1. Swipe to share a file with an federated user in a shibboleth server <br>2. Login with the sharee<br>| The sharee in shibboleth server can view the file|||
| 33 | Shibboleth share |  1. In a shibboleth server, swipe to share a file with an federated user <br>2. Login with the sharee<br>| The sharee can view the file|||
| 34 | LDAP |  1. Swipe to share a file with an federated user in a LDAP server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 35 | Redirect sharee |  1. Swipe to share a file with an federated user in a redirect server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 34 | No self signed |  1. Swipe to share a file with an federated user in a no self signed server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 36 | Self signed not trusted|  1. Swipe to share a file with an federated user in a self signed server with an untrusted certificate <br>2. Login with the sharee<br>| The file can not be shared federated and the sharee can neither accept nor view it|||