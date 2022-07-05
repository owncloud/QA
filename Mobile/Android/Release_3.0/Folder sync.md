#### Folder sync 


Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- |
|**No modifications**||||||
| Folder not downloaded  | 1. Select a non downloaded folder with subfolders<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |   |  |
| Folder downloaded  | 1. Select a downloaded folder with subfolders<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |   |  |
| Folder with downloaded and not downloaded  | 1. Select folder with subfolders that contains both files downloaded and not downloaded<br>2. Click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |   |  |
|**Modifications**||||||
| Files updated locally | 1. Update locally some files using the "Open with" option or document provider. After updating, kill oC app<br>2. Open app, select containing folder<br>3. Click on Sync | Files modified are uploaded to the server<br>All files in the folder are downloaded |   |  |
| Files updated remotely | 1. Update remotely some files<br>2. In app, select folder<br>3. Click on Sync | Files modified are downloaded (check without connection)<br>All files in the folder are downloaded |   |  |
| Files updated locally and remotely | 1. Update remotely some files<br>2. Update locally some files using the "Open with" option or document provider<br>3. In app, select folder<br>4. Click on Sync | Files modified marked with conflict badge<br>Other files in the folder are downloaded |   |  |
|**Multiselection**||||
| Sync two folders not downloaded | 1. Select two folders <br>2. click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |  |  |
| Sync three folders downloaded | 1. Select two folders which content is already downloaded <br>2. click on Sync | All files inside folders and subfolders are downloaded and marked with blue badge while syncing and green after syncing. Preview available without connection |  |  |
| Sync with conflict | 1. Update remotely some files inside different folders<br>2. Update locally same files using the "Open with" option or document provider<br>3. In app, select containing folders<br>4. Click on Sync | Folders containing files modified are marked with conflict badge<br>Other files in the folder are downloaded |   |  |