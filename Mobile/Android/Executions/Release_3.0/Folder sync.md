#### Folder sync 


Devices: Samsung A51, Android 12 <br>
Server: 10.11.0, oCIS 2.0.0-rc.1


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- |
|**No modifications**||||||
| Folder not discovered  | 1. Select a non downloaded folder with subfolders that was not discovered yet<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection | P m12  |  |
| Folder not downloaded  | 1. Select a non downloaded folder with subfolders<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection | P m12  |  |
| Folder downloaded  | 1. Select a downloaded folder with subfolders<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |  P m12 |  |
| Folder with downloaded and not downloaded  | 1. Select folder with subfolders that contains both files downloaded and not downloaded<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |  P m12 |  |
| Empty folder | 1. Select an empty folder<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection | P m12  |  |
|**Modifications**||||||
| Files updated locally | 1. Update locally some files using the "Open with" option or document provider. After updating, kill oC app<br>2. Open app, select containing folder | Files modified are uploaded to the server automatically<br>All files in the folder are downloaded | P m12  |  |
| Files updated remotely | 1. Update remotely some files<br>2. In app, select folder<br>3. Click on Sync | Files modified are downloaded (check without connection)<br>All files in the folder are downloaded | P m12 |  |
| Files updated locally and remotely | 1. Update remotely some files<br>2. Update locally some files using the "Open with" option or document provider<br>3. In app, select folder<br>4. Click on Sync | Files modified marked with conflict badge<br>Other files in the folder are downloaded | P m12  |  |
|**Multiselection**||||
| Sync two folders not downloaded | 1. Select two folders <br>2. click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection | P m12 |  |
| Sync three folders downloaded | 1. Select three folders which content is already downloaded <br>2. click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection | P m12 |  |
| Sync three folders and three files | 1. Select three folders and three files which content is not downloaded <br>2. click on Sync | All files and files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection | P m12 |  |
| Sync with conflict | 1. Update remotely some files inside different folders<br>2. Update locally same files using the "Open with" option or document provider<br>3. In app, select containing folders<br>4. Click on Sync | Folders containing files modified are marked with conflict badge<br>Other files in the folder are downloaded | P m12  |  |
|**Errors**||
| Folder sync no connection | 1. Remove device connection<br>2. Select a folder to sync | Correct error message | P m12 |  |
| Folder sync no server connection | 1. Put server down<br>2. Select a folder to sync | Correct error message | P m12 |  |
| Maintenance mode | 1. Put server in maintenance mode<br>2. Select a folder yo sync| Correct error message | P m12 |  |