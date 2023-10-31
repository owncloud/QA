###  Bug: incorrect message when the session expires 

#### Pr: https://github.com/owncloud/ios/pull/559 


Devices: iPhone v9.2 (Shibb), iPad Air v8.4 (No-Shibb)

Server: 7.0.10 (Shibb), 8.2.2 (No-Shibb)


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Shibboleth Server**
| 1 | Session expires - create folder   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to create a folder |  A message about the expiration of the session is shown and redirection to credentials view | P m9
| 2 | Session expires - upload file   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to upload files |  A message about the expiration of the session is shown and redirection to credentials view | P m9
| 3 | Session expires - remove   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to remove files or folders |  A message about the expiration of the session is shown and redirection to credentials view | P m9
| 4 | Session expires - rename   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to rename files or folders |  A message about the expiration of the session is shown and redirection to credentials view | P m9
| 5 | Session expires - move   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to move files or folders |  A message about the expiration of the session is shown and redirection to credentials view | P m9
| 6 | Session expires - download  |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to download a file or a folder |  A message about the expiration of the session is shown and redirection to credentials view | P m9
| 7 | Session expires - favourite   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to favourite a file or folder |  A message about the expiration of the session is shown and redirection to credentials view | P m9
|**Non-Shibboleth Server (errors)**
| 8 | No internet connection | 1. Switch the internet connection off<br>2. Perform any action (create folder, update file...)| The message shows a non-connection error |P t8
| 9 | No server connection | 1. Switch the server off<br>2. Perform any action (create folder, update file...)| The message shows a non-connection error | P t8
| 10 | Credential error | 1. Login with a user in oC<br>2. On server, change the password of the user<br> 3. Perform any action (create folder, update file...) |  Redirection to login view | P t8
| 11 | Folder error | 1. Tap in upload and select a file, selecting a location folder<br> 2. On server, delete this folder<br> 3. Tap on the file| The message shows a non-existing folder | P t8
| 12 | File error | 1. Tap to move a file and not select it<br> 2. On server, delete the file<br> 3. Tap on the folder to move| The message shows a non-existing file | P t8
| 13 | Delete account | 1. Long press to share a file/folder with privileges, selecting an user<br>2. In server, delete the user to share with (version > 8)<br>3. Tap on "done"| The message shows a non-existing user | P t8
| 14 | Share  |  1. Swipe to share a file with users |  A error message about the unavailability of the share must be shown (version < 8)| P m9 t8
