#### File sync 


Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Actions with 1 file**||||
|**No modifications list view**||||||
| File not downloaded  | 1. Select a non downloaded file to sync<br>2. Click on Download | 1. Download icon (down arrow) displayed on the top<br>2. File downloaded, and marked with blue badge while syncing and green after syncing. Preview available without connection |   |  |
| File downloaded | 1. Select a downloaded file to sync<br>2. Click on Sync | 1. Sync icon (circle arrow) displayed on the top<br>2. File stays downloaded, and marked with green badge. Preview available without connection<br>3. Snackbar notification about sync  |   |  |
| File removed server | 1. Select a downloaded file to sync<br>2. Remove the file from server.<br>3. Click on sync | File removed locally|   |  |
|**Modifications list view**||||||
| Remote modification | 1. In app, download a file<br>2. In server or other client, modify the file<br>3. In app, select the file to sync | Sync icon (circle arrow) displayed on the top.<br> File stays downloaded, and marked with blue badge while syncing and green after syncing. Preview available without connection, showing the changes. |   |  |
| Local modification | 1. In app, download a file<br>2. Open the file with document provider or open with, to modify it locally<br>3. Save modification<br>4. Click on sync | 1. Sync icon (circle arrow) displayed on the top.<br>4. Modification pushed to the server. Upload in uploads view. Notification created about the upload. File correctly saved in server |   |  |
| Both local and remote modification | 1. In app, download a file<br>2. Open the file with document provider or open with, to modify it locally and save<br>3. In server, modify the file<br>4. Click on sync | Conflict detected and shown to the user in a dialog. File marked with red cross |   |  |
|**No modifications details view**||||||
| File not downloaded | 1. Select a non downloaded file to see the Details view<br>2. Click on Download | 1. Download icon (down arrow) displayed on the top<br>2. Progress bar displayed. Preview available without connection after downloading |  |   |
| File downloaded | 1. Select a downloaded file to see the Details view<br>2. Click on Sync on the top | 1. Sync icon (circle arrow) displayed on the top<br>2. File stays downloaded. Preview available without connection. Snackbar notification about sync |  |  |
| File removed server | 1. Select a downloaded file to see the Details<br>2. Remove the file from server.<br>3. Click on sync | Go back to the list of files |   |  |
|**Modifications details view**||||||
| Remote modification | 1. In app, download a file from Details view<br>2. In server or other client, modify the file<br>3. In Details view, select the file to sync | File stays downloaded. Preview available without connection, showing the changes. |   |  |
| Local modification | 1. In app, download a file from Details view<br>2. Open the file with document provider or open with, to modify it locally<br>3. Save modification<br>4. Click on sync | 1. Sync icon (circle arrow) displayed on the top.<br>4. Modification pushed to the server. Upload in uploads view. Notification created about the upload. File correctly saved in server |   |  |
| Both local and remote modification | 1. In app, download a file from Details view<br>2. Open the file with document provider or open with, to modify it locally and save<br>3. In server, modify the file<br>4. Click on sync | Conflict detected and shown to the user in a dialog |   |  |
|**Actions with many files**||||
| All files no downloaded | 1. In list of files, select several files, all of them not downloaded<br>2. click on Download | 1. Download icon (down arrow) displayed on the top.<br> 2. Files downloaded, and marked with blue badge while syncing and green after syncing. Preview available without connection  |  |  |
| Files no downloaded and downloaded | 1. In list of files, select several files, some of them not downloaded and other downloaded<br>2. Click on Sync | 1. Sync icon (circle arrow) displayed on the top.<br> 2. All files downloaded, and marked with blue badge while syncing and green after syncing. Preview available without connection |
| All Files downloaded |  1. In list of files, select several downloaded files<br>2. Click on Sync | 1. Sync icon (circle arrow) displayed on the top<br>2. Files stay downloaded, and marked with green badge. Preview available without connection  |   |  |
| Files with modifications |  1. In list of files, select several downloaded files<br>2. In server, modify those files<br>3. Click on Sync | 1. Sync icon (circle arrow) displayed on the top<br>3. Files are downloaded, marked with blue badge while syncing and marked with green badge after. Preview available without connection, showing the changes  |   |  |
| One file conflicting | 1. In list of files, select several downloaded files<br>2. Modify one of the downloaded files, both locally and remotely<br>3. Click on Sync | 1. Sync icon (circle arrow) displayed on the top<br>3. Files keep downloaded, marked with blue badge while syncing and marked with green badge after. Preview available without connection, showing the changes<br>Conflicting file is marked with red badge. By clicking on it, conflict dialog displayed | 
| More than one file conflicting | 1. In list of files, select several downloaded files<br>2. Modify all downloaded files, both locally and remotely<br>3. Click on Sync | 1. Sync icon (circle arrow) displayed on the top<br>3. All conflicting files are marked with red badge. By clicking on it, conflict dialog displayed |  |  |  |  |
|**Errors**||||||
| No internet connection | 1. Remove device connection<br>2. Select a file to sync | |  | 
| No server connection | 1. Remove server connection<br>2. Select a file to sync | |  | | Maintenance mode | 1. Set server in maintenance mode<br>2. Select a file to sync | |   | 
