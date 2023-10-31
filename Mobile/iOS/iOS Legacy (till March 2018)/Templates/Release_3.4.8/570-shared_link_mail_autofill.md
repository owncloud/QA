###  Shared link mail autofill in subject 

#### Pr: https://github.com/owncloud/ios/pull/570

Devices:

Server: 


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:-------: | :------------- | :------------- | :-------------- | :----- | :------
| 1 | Subject mail file|  1. Swipe to share a file by link<br>2. Tap on the option "Mail" | The mail subject must be filled with ""[user] shared [filename] with you" |
| 2 | Subject mail folder|  1. Swipe to share a folder by link<br>2. Tap on the option "Mail" | The mail subject must be filled with ""[user] shared [folder name] with you" |
| 3 | Long user name|  1. Login with a user whose name is too long<br> 2. Swipe to share a file or folder by link<br>3. Tap on the option "Mail" | The mail subject must be filled with ""[user] shared [folder name] with you" |
| 4 | Long file name| 1. Swipe to share by link a file/folder which name is too long<br>2. Tap on the option "Mail" | The mail subject must be filled with ""[user] shared [file/folder name] with you" |
| 5 | Special characters| 1. Swipe to share by link a file/folder which name contains special characters<br>2. Tap on the option "Mail" | The mail subject must be filled with ""[user] shared [file/folder name] with you" |


