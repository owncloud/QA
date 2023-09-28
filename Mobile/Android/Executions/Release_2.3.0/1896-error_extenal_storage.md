###  Error when no access granted to external storage 

#### Pr: https://github.com/owncloud/android/pull/1896 

Devices: Huawei 6P v7, Galaxy Tab S2 v5.0

Server: 8.2, 10

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**ownCloud**|||||
| 1 | Upload |  1. In an exteral storage with another oC server, change the password.<br>2. try to upload content to the external storage | Content can not be updloaded. Error in notification and uploads view | P m7 t5 | SOLVED: Error incorrect in notif and uploads view |
| 2 | Download |  1. In an exteral storage with another oC server, change the password.<br>2. Try to download content| Content can not be updloaded. Error in notification | P m7 t5 | SOLVED: Error incorrect in notif |
| 3 | File actions |  1. In an exteral storage with another oC server, change the password.<br>2. Perform some actions: rename, move, remove| Action can not be performed and | P m7 t5|  |
|**Google Drive**|||||
| 4 | Upload |  1. In an exteral storage with another oC server, change the password.<br>2. try to upload content to the external storage | Content can not be updloaded. Error in notification and uploads view | - |  |
| 5 | Download |  1. In an exteral storage with another oC server, change the password.<br>2. Try to download content| Content can not be updloaded. Error in notification | - |  |
| 6 | File actions |  1. In an exteral storage with another oC server, change the password.<br>2. Perform some actions: rename, move, remove| Action can not be performed and | -  |  |
|**Dropbox**|||||
| 7 | Upload |  1. In an exteral storage with another oC server, change the password.<br>2. try to upload content to the external storage | Content can not be updloaded. Error in notification and uploads view | - |  |
| 8 | Download |  1. In an exteral storage with another oC server, change the password.<br>2. Try to download content| Content can not be updloaded. Error in notification | - |  |
| 9 | File actions |  1. In an exteral storage with another oC server, change the password.<br>2. Perform some actions: rename, move, remove| Action can not be performed and | - |  |