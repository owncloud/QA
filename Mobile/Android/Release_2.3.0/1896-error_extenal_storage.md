###  Error when no access granted to external storage 

#### Pr: https://github.com/owncloud/android/pull/1896 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**ownCloud**|||||
| 1 | Upload |  1. In an exteral storage with another oC server, change the password.<br>2. try to upload content to the external storage | Content can not be updloaded. Error in notification and uploads view |  |  |
| 2 | Download |  1. In an exteral storage with another oC server, change the password.<br>2. Try to download content| Content can not be updloaded. Error in notification |  |  |
| 3 | File actions |  1. In an exteral storage with another oC server, change the password.<br>2. Perform some actions: rename, move, remove| Action can not be performed and |  |  |
|**Google Drive**|||||
| 4 | Upload |  1. In an exteral storage with another oC server, change the password.<br>2. try to upload content to the external storage | Content can not be updloaded. Error in notification and uploads view |  |  |
| 5 | Download |  1. In an exteral storage with another oC server, change the password.<br>2. Try to download content| Content can not be updloaded. Error in notification |  |  |
| 6 | File actions |  1. In an exteral storage with another oC server, change the password.<br>2. Perform some actions: rename, move, remove| Action can not be performed and |  |  |
|**Dropbox**|||||
| 7 | Upload |  1. In an exteral storage with another oC server, change the password.<br>2. try to upload content to the external storage | Content can not be updloaded. Error in notification and uploads view |  |  |
| 8 | Download |  1. In an exteral storage with another oC server, change the password.<br>2. Try to download content| Content can not be updloaded. Error in notification |  |  |
| 9 | File actions |  1. In an exteral storage with another oC server, change the password.<br>2. Perform some actions: rename, move, remove| Action can not be performed and |  |  |