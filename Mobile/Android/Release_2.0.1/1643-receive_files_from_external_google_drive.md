###  BUG: Receiving files from external apps (Google Drive) fails

#### Pr: https://github.com/owncloud/android/pull/1643

Devices: Android 4.4, Samsung Galaxy Android 4.2, Nexus 10 v5

Server: v9.0.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps with content (no text)**||||||
| 1 | Google Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select Drive<br>3. Select a file| File is correctly shared and stored in ownCloud| P m4.2 t5  |  |
| 2 | Dropbox | 1. Open FAB and tap on "content from other apps"<br> 2. Select Dropbox<br>3. Select a file|File is correctly shared and stored in ownCloud| | |
| 3 | One Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select One Drive<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5| |
| 4 | Downloads | 1. Open FAB and tap on "content from other apps"<br> 2. Select Downloads<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 | |
| 5 | Videos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Videos<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 | |
| 6 | Photos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Photos<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 | |
| 7 | FX File Chooser | 1. Open FAB and tap on "content from other apps"<br> 2. Select FX File Chooser<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 | |