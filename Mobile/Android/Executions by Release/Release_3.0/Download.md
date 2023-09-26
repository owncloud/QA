#### Download 

#### PR: <br>


Device/s: Samsung A51, Android 12<br>
Server: 10.11.0, oCIS 2.0.0-rc.1


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Download**||||
| Download one single file | Click in a single file | File is downloaded after showing the progress. No notification | P m12 | |
| Download a big file | Click in a single file which size is > 300MB | File is downloaded after showing the progress. No notification? |P m12 | |
| Download several| 1. Select several single files<br>2. Select download icon | Files are downloaded after showing the progress. Notification shown |P m12 | |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded. Notification with the progress of every file, when download finishes is gone |P m12 | |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder. Notification with the progress of every file, when download finishes is gone| P m12 | |
| Huge number | 1. Select a folder which contains 1000 files (create it with LLNL utility)<br>2. Select to download| The content is downloaded. Notification with the progress of every file, when download finishes is gone. No bad performance | P m12 | |
| Cancel picture | 1. Click in a big sized picture file<br>2. Cancel download before it finishes | File is not downloaded. No notification | F m12 | Progress bar not working|
| Cancel file | 1. Click in a big sized file<br>2. Cancel download before it finishes | File is not downloaded. No notification | P m12 | |
|**Errors**||||
| Connection | 1. Click in a single file to download<br>2. Before it finishes, remove device connection | File is not downloaded. Error notification | | |
| Credentials before download| 1. In a OAuth2 server with a session active, revoke token from server<br>2. Click in a single big file to download| File does not start to download. Error notification | | |
| Credentials during download| 1. In a OAuth2 server, click in a single big file to download<br>2. Before it finishes, revoke token from server | File is not downloaded. Error notification | | |
| Folder | 1. Click in a single big file to download<br>2. Before it finishes, remove target folder from another client or web | File is not downloaded. Error notification | | |