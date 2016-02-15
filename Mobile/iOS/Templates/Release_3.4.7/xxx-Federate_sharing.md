###  Federate Sharing 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server:


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| **Correct view** ||||||
| 1 |  Remote is shown |  1. Swipe to share a file or folder with users<br>2. Type a username and then an '@'   | Whitin the results, there is one like 'username'@(remote) 
| **Federated Sharing** ||||||
| 2 |  Shared file (http) |  1. Swipe to share a file with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and acept the federated share<br>4. Login in app with the sharee  | The shared file appears in files view |||
| 3 |  Shared folder (http) |  1. Swipe to share a folder with users<br>2. Type a username and then an '@' and a correct http server URL<br>3. Login in web with the sharee and acept the federated share<br>4. Login in app with the sharee  | The shared folder appears in files view and can be browsed |||
| 4 |  Shared file (https) |  1. Swipe to share a file with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and accept the federated share<br>4. Login in app with the sharee  | The shared file appears in files view |||
| 5 |  Shared folder (https) |  1. Swipe to share a folder with users<br>2. Type a username and then an '@' and a correct https server URL<br>3. Login in web with the sharee and acept the federated share<br>4. Login in app with the sharee  | The shared folder appears in files view and can be browsed |||
| 6 |  Reject federated |  1. Swipe to share a file with users<br>2. Type a username and then an '@' and a correct server URL<br>3. Login in web with the sharee and reject the federated share<br>4. Login in app with the sharee  | The shared file does not appear in files view. The share does not show the file as shared |||
| 7 |  Special characters |  1. Repeat the test cases 2. or 3. with file/folder which contains special characters  | The shared file/folder appears in files view |||
| 8 |  User with '@' |  1. Repeat the test cases 2. or 3. using a username which contains '@', for example 'M@ri@'  | The search view is correct, showing the option M@ri@@(remote). The file/folder can be federate shared |||
| 9 |  User called '@' |  1. Repeat the test cases 2. or 3. using a username '@' | The search view is correct, showing the option @@(remote). The file/folder can be federate shared |||
| 10 |  Multiple federated |  1. Swipe to share a folder with users<br>2. Type different federated URLs (different servers and users)<br>3. Login in web with the sharees and acept the federated share<br>4. Login in app with the sharees  | All sharees can view the file/folder |||
| 11 |  Inexistent User |  1. Repeat the test cases 2. or 3. using a username which does not exist in remote server  | The file can not be shared, an error appears |||
| 12 |  Inexistent Server |  1. Repeat the test cases 2. or 3. using an inexistent remote URL | The file can not be shared, an error appears |||
| 13 |  Deleted account |  1. Repeat the test cases 2. or 3.<br> 2. From admin in web, delete the account ot the sharing user | The sharee can not view the shared file or folder |||
| 14 |  Unsharing | 1. Federate share of a file/folder<br> 2. Accept it in the web<br>3.  In the sharing user, unshare the file | 2. The sharee can view the file<br>3. The sharee can not view the file||
| **Edit Privilege** ||||||
| 15 | Edit granted |  1. Swipe to share a file with users<br>2. Type a federated URL<br>3. Grant the federated user to edit<br> 4. Login in web with the sharee and acept the federated share<br>5. Login in app with the sharee and try to edit the file/folder  | The shared file appears in files view and can be edited |||
| 16 | Edit not granted |  1. Swipe to share a file with users<br>2. Type a federated URL<br>3. Do not grant the federated user to edit<br> 4. Login in web with the sharee and acept the federated share<br>5. Login in app with the sharee and try to edit the file/folder  | The shared file appears in files view and can not be edited |||
| **Reshare Privilege** ||||||