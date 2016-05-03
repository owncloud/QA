###  BUG: Receiving files from external apps (Google Drive) fails

#### Pr: https://github.com/owncloud/android/pull/1643

Devices: Android 4.4, Android 4.2

Server: 

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps with content (no text)**||||||
| 1 | Google Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select Drive<br>3. Select a file| File is correctly shared and stored in ownCloud|  |  |
| 2 | Dropbox | 1. Open FAB and tap on "content from other apps"<br> 2. Select Dropbox<br>3. Select a file|File is correctly shared and stored in ownCloud| | |
| 3 | One Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select One Drive<br>3. Select a file|File is correctly shared and stored in ownCloud| | |
| 4 | Downloads | 1. Open FAB and tap on "content from other apps"<br> 2. Select Downloads<br>3. Select a file|File is correctly shared and stored in ownCloud| | |
| 5 | Photos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Photos<br>3. Select a file|File is correctly shared and stored in ownCloud| | |
| 6 | FX File Chooser | 1. Open FAB and tap on "content from other apps"<br> 2. Select FX File Chooser<br>3. Select a file|File is correctly shared and stored in ownCloud| | |