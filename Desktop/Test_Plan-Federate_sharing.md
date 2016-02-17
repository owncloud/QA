###  Federate Sharing 


Desktop: windows + mac

Server: oc 8.2.2. and oc9


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| **Correct view** ||||||
| 1 |  "remote" is shown |  1. Share a file or folder with users<br>2. Type a username and then an '@'   | Within the results, there is one like 'username'@(remote) 
| **Federated Sharing** ||||||
| 2 |  Shared file (http) |  1. Share a file with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in desktop with the sharee  | The shared file desktopears in files view |||
| 3 |  Shared folder (http) |  1. Share a folder with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in desktop with the sharee  | The shared folder desktopears in files view and can be browsed |||
| 4 |  Shared file (https trusted) |  1. Share a file with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in the desktop with the sharee  | The shared file desktopears in files view |||
| 5 |  Shared folder (https trusted) |  1. Share a folder with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in desktop with the sharee  | The shared folder desktopears in files view and can be browsed |||
| 6 |  Shared with groups |  1. Share a file/folder with a group<br>2. Type a groupname and then an '@' and a correct server URL<br>3. Login in web with all the group members and accept the federated share<br>4. Login in desktop with the sharees  | The shared desktopears in files view and can be browsed |||
| 7 |  Reject federated |  1. Share a file with users<br>2. Type a username and then an '@' and a correct server URL<br>3. Login in web with the sharee and reject the federated share<br>4. Login in desktop with the sharee  | The shared file does not desktopear in files view. The share does not show the file as shared |||
| 8 |  Special characters |  1. Repeat the test cases 2. or 3. with file/folder which contains special characters  | The shared file/folder desktopears in files view |||
| 9 |  User with '@' |  1. Repeat the test cases 2. or 3. using a username which contains '@', for example 'M@ri@'  | The search view is correct, showing the option M@ri@@(remote). The file/folder can be federate shared |||
| 10 |  User called '@' |  1. Repeat the test cases 2. or 3. using a username '@' | The search view is correct, showing the option @@(remote). The file/folder can be federate shared |||
| 11 |  Multiple federated |  1. Share a folder with users<br>2. Type different federated URLs (different servers and users)<br>3. Login in web with the sharees and accept the federated share<br>4. Login in desktop with the sharees  | All sharees can view the file/folder |||
| 12 |  Unsharing | 1. Federate share of a file/folder<br> 2. Accept it in the web<br>3.  In the sharing user, unshare the file | 2. The sharee can view the file<br>3. The sharee can not view the file||
| **Errors** ||||||
| 13 |  Inexistent User |  1. Repeat the test cases 2. or 3. using a username which does not exist in remote server  | The file can not be shared, an error desktopears |||
| 14 |  Inexistent Server |  1. Repeat the test cases 2. or 3. using an inexistent remote URL | The file can not be shared, an error desktopears |||
| 15 |  Share twice fed |  1. Share federated twice with the same user | First time the file is shared, second time, an error is received |||
| 16 |  Deleted account |  1. Repeat the test cases 2. or 3.<br> 2. From admin in web, delete the account ot the sharing user | The sharee can not view the shared file or folder |||
| 17 |  Without connection |  1. Switch the wifi connection off<br>2. Try to share with a federated user | An error desktopears |||
| 18 |  Without server connection |  1. Switch the server off<br>2. Try to share with a federated user | An error desktopears |||
| 19 |  Server under maintenance mode |  1. Repeat the test cases 2. or 3. using a server under maitenance mode | The file can not be shared, an error desktopears |||
| **Server Capabilities** ||||||
| 20 |  Federated Sharing disabled |  1. In server side, disable the capability to share with federation<br>2. In desktop, try to share with federation<br> | The share is not accepted and an error is raised |||
| 21 |  Receive Federated disabled |  1. In server side, disable the capability to receive federated data on server1 <br>2. In desktop, try to share with a user from server2 with a user from server1<br> | The share is not accepted and an error is raised |||
| **Edit Privilege** ||||||
| 22 | Edit granted file|  1. Share a file with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in desktop with the sharee and try to edit the file  | The shared file appears in files view and can be edited |||
| 23 | Edit granted folder|  1. Share a folder with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in desktop with the sharee and try to edit the folder  | The shared folder desktopears in files view and can be edited (upload/update/delete) |||
| 24 | Edit not granted file |  1. Share a file with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in desktop with the sharee and try to edit the file  | The shared file appears in files view and can not be edited |||
| 25 | Edit not granted folder |  1. Share a folder with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and accept the federated share<br>5. Login in desktop with the sharee and try to edit the folder  | The shared file desktopears in files view and can not be edited (upload/update/delete)|||
| **Reshare Privilege** pending to define ||||||
| 26 | Reshare in the server |  1. Share a file with an federated user granting him to share (defect)<br>2. Login with the sharee<br>3. Try to reshare with other users in the same server<br>4. Login with the 2nd sharee| 3. The share privilege is enabled<br>4. The 2nd sharee can view the file |||
| 27 | Reshare federated |  1. Share a file with an federated user granting him to share<br>2. Login with the sharee<br>3. Try to reshare with other federated user<br>4. Login with the 2nd sharee| 3. The share privilege is enabled and can not be disabled<br>4. The 2nd sharee can view the file |||
| 28 | Reshare initial user |  1. Share a file with an federated user granting him to share<br>2. Login with the sharee<br>3. Try to reshare with the initial share| The file can not be reshared with the initial share |||
| 29 | Reshare initial server |  1. Share a file with an federated user granting him to share<br>2. Login with the sharee<br>3. Try to reshare with an user of the initial server| The user can see the file|||
| **Special Servers** ||||||
| 30 | Shibboleth sharee |  1. Share a file with an federated user in a shibboleth server <br>2. Login with the sharee<br>| The sharee in shibboleth server can view the file|||
| 31 | Shibboleth share |  1. In a shibboleth server, share a file with an federated user <br>2. Login with the sharee<br>| The sharee can view the file|||
| 32 | LDAP |  1. Share a file with an federated user in a LDAP server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 33 | Redirect sharee |  1. Share a file with an federated user in a redirect server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 34 | No self signed |  1. Share a file with an federated user in a no self signed server <br>2. Login with the sharee<br>| The sharee can view the file|||
| 35 | Self signed not trusted|  1. Share a file with an federated user in a self signed server with an untrusted certificate <br>2. Login with the sharee<br>| The file can not be federate shared and the sharee can neither accept nor view it|||