#### Download 

#### PR: https://github.com/owncloud/android/pull/3891<br>


Device/s: Samsung A51, Android 12<br>
Server: oC 10.11, oCIS 2.0 


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Download**||||
| Download one single file | Click in a single file | File is downloaded after showing the progress. No notification | P m12 | |
| Download a big file | Click in a single file which size is > 300MB | File is downloaded after showing the progress | P m12| |
| Download several| 1. Select several single files<br>2. Select download icon | Files are downloaded after showing the progress | P m12| |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded | P m12| |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder. Notification with the progress of every file, when download finishes is gone|P m12 | |
| Huge number | 1. Select a folder which contains 1000 files (create it with LLNL utility)<br>2. Select to download| The content is downloaded. Notification with the progress of every file, when download finishes is gone. No bad performance | P m12| |
| Cancel picture | 1. Click in a big sized picture file<br>2. Cancel download before it finishes | File is not downloaded. No notification | P m12| |
| Cancel file | 1. Click in a big sized file<br>2. Cancel download before it finishes | File is not downloaded. No notification | P m12| |
|**Errors**||||
| Connection | 1. Click in a single file to download<br>2. Before it finishes, remove device connection | File is not downloaded. Error notification | P m12 | |
| Credentials before download| 1. In a OAuth2 server with a session active, revoke token from server<br>2. Click in a single big file to download| File does not start to download. Error notification | NA | No way to kill token in oCIS |
| Credentials during download| 1. In a OAuth2 server, click in a single big file to download<br>2. Before it finishes, revoke token from server | File is not downloaded. Error notification | NA |No way to kill token in OCIS |
| Folder | 1. Click in a single big file to download<br>2. Before it finishes, remove target folder from another client or web | File is not downloaded. Error notification | F m12 | Stucked forever |
| Renamed | 1. Click in a single big file to download<br>2. Before it finishes, rename the file from another client or web | File is not downloaded. Error message | F m12| Stucked forever |
| Removed | 1. Click in a single big file to download<br>2. Before it finishes, remove the file from another client or web | File is not downloaded. Error message | F m12 | Stucked forever 