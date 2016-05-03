###  BUG: Receiving files from external apps (Google Drive) fails

#### Pr: https://github.com/owncloud/android/pull/1643

Devices: Android 4.4, Android 4.2

Server: 

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps with content (no text)**||||||
| 1 | Google Drive | Open the app and share with ownCloud| File is correctly shared and stored in ownCloud|  |  |
| 2 | Dropbox | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud| | |
| 3 | Moon Reader | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud | | |
| 4 | Gmail | Open the app and share an attached file with ownCloud|File is correctly shared and stored in ownCloud| | |
| 5 | Downloads | Open the app and share with ownCloud|File is correctly shared and stored in ownCloud| | |
