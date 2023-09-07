###  BUG: Receiving files from external apps (Google Drive) fails

#### Pr: https://github.com/owncloud/android/pull/1643

Devices: Android 4.4, Samsung Galaxy Android 4.1.2, Nexus 10 v5, HTC v4.3 v4.3, Nexus 5 v5.0.1

Server: v9.0.2

---

## SECOND PERFORMANCE

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps with content (no text)**||||||
| 1 | Google Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select Drive<br>3. Select a file| File is correctly shared and stored in ownCloud| P m5 m4.1 t4.3 m4.4 | SOLVED: Content not uploaded |
| 2 | Dropbox | 1. Open FAB and tap on "content from other apps"<br> 2. Select Dropbox<br>3. Select a file|File is correctly shared and stored in ownCloud| P m5 m4.1 t4.3 m4.4| |
| 3 | One Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select One Drive<br>3. Select a file|File is correctly shared and stored in ownCloud| P m5 m4.1 t4.3 m4.4| |
| 4 | Downloads | 1. Open FAB and tap on "content from other apps"<br> 2. Select Downloads<br>3. Select a file|File is correctly shared and stored in ownCloud| P m5 | SOLVED: Content not uploaded|
| 5 | Videos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Videos<br>3. Select a file|File is correctly shared and stored in ownCloud| P m5 | SOLVED: Content not uploaded|
| 6 | Photos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Photos<br>3. Select a file|File is correctly shared and stored in ownCloud| P m5|SOLVED: Content not uploaded |
| 7 | FX File Chooser | 1. Open FAB and tap on "content from other apps"<br> 2. Select FX File Chooser<br>3. Select a file|File is correctly shared and stored in ownCloud| P m5 | SOLVED: Content not uploaded|


## FIRST PERFORMANCE
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**External apps with content (no text)**||||||
| 1 | Google Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select Drive<br>3. Select a file| File is correctly shared and stored in ownCloud| P m4.1 t5 m5 | SOLVED: Fails if file name contains a "/"  |
| 2 | Dropbox | 1. Open FAB and tap on "content from other apps"<br> 2. Select Dropbox<br>3. Select a file|File is correctly shared and stored in ownCloud| P m4.4 t5 m4.3 m4.1| |
| 3 | One Drive | 1. Open FAB and tap on "content from other apps"<br> 2. Select One Drive<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 m4.3 m5 m4.1| |
| 4 | Downloads | 1. Open FAB and tap on "content from other apps"<br> 2. Select Downloads<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 m5| |
| 5 | Videos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Videos<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 m5 | |
| 6 | Photos | 1. Open FAB and tap on "content from other apps"<br> 2. Select Photos<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 m4.4 m5 m4.1| |
| 7 | FX File Chooser | 1. Open FAB and tap on "content from other apps"<br> 2. Select FX File Chooser<br>3. Select a file|File is correctly shared and stored in ownCloud| P t5 m4.3 m5 m4.1 m4.4| |