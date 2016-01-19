###  Bug: incorrect message when the session expires 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


Devices: v9.2

Server: 7.0.10


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
| 1 | Session expires - create folder   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to create a folder |  A message about the expiration of the session is shown and redirection to credentials view | 
| 2 | Session expires - upload file   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to upload files |  A message about the expiration of the session is shown and redirection to credentials view | 
| 3 | Session expires - remove   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to remove files or folders |  A message about the expiration of the session is shown and redirection to credentials view | 
| 4 | Session expires - rename   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to rename files or folders |  A message about the expiration of the session is shown and redirection to credentials view | 
| 5 | Session expires - move   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to move files or folders |  A message about the expiration of the session is shown and redirection to credentials view | 
| 6 | Session expires - download  |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to download a file or a folder |  A message about the expiration of the session is shown and redirection to credentials view | 
| 7 | Session expires - favourite   |  1. Login in shibb server<br>2. Wait until the session expires<br> 3. Try to favourite a file or folder |  A message about the expiration of the session is shown and redirection to credentials view | 
