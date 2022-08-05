#### Folder refresh


Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Straight cases**|||||
| Nothing changes  | 1. Pull to refresh in a folder with no remote or local changes | List does not change | P m12 |
| New file  | 1. In server, create new file in a folder<br>2. In app, pull down to refresh | New file listed in correct place depending on the sorting method, check by browsing forth and back | P m12 | FIXED: Browsing back to root, does not refresh till p2u
| New folder  | 1. In server, create new folder inside any folder<br>2. In app, pull down to refresh | New folder listed in correct place depending on the sorting method, check by browsing forth and back | P m12 |
| Rename non-downlaoded file | 1. In server, rename an existing file<br>2. In app, pull down to refresh | Renamed file listed in correct place depending on the sorting method, check by browsing forth and back | P m12 |
| Rename downlaoded file | 1. In app, download a file<br>2. In server, rename the file<br>3. In app, pull down to refresh | Renamed file listed in correct place depending on the sorting method, check by browsing forth and back<br>File is still downloaded  | F m12 | Not renamed in ScSt
| Rename non-downlaoded folder | 1. In server, rename an existing folder inside any folder<br>2. In app, pull down to refresh | Renamed folder listed in correct place depending on the sorting method, check by browsing forth and back | P m12 |
| Rename downlaoded folder | 1. In app, download a folder (all content inside)<br>2. In server, rename the folder<br>3. In app, pull down to refresh | Renamed folder listed in correct place depending on the sorting method, check by browsing forth and back<br>Files inside are still downloaded  | F m12 |  Not renamed in ScSt
| Remove file  | 1. In server, remote an existing file inside any folder<br>2. In app, pull down to refresh | File is not listed anymore, check by browsing forth and back | P m12 |
| Remove folder  | 1. In server, remote an existing folder inside any other folder<br>2. In app, pull down to refresh | Folder is not listed anymore, check by browsing forth and back | P m12 |
| Change remote file | 1. In server, edit an existing file to make its size to change<br>2. In app, pull down to refresh | File is listed with new size and date | P m12 |
| Change remote folder | 1. In server, edit an existing folder to make its size to change by adding or removing content inside<br>2. In app, pull down to refresh | Folder is listed with new size and date | P m12 |
|**Corner cases**|||||
| Rename file-folder | 1. In server, remove a folder and rename a file with the name of the renamed folder<br>2. In app, pull down to refresh | Initial folder not listed<br>File renamed to the initial folder's name | P m12  | FIXED: File is removed in Android
| Rename file-file non-downloaded | 1. In server, remove a file and create another different file with same name<br>2. In app, pull down to refresh | File name is listed with proper new size, date and content (download it) | P m12  | 
| Rename file-file downloaded | 1. In app, download a file<br>2. In server, remove the file and rename another different file with same name<br>3. In app, pull down to refresh | File name is listed with proper new size and date. Not downloaded. | P m12 | FIXED: File is removed in Android
| Rename folder-folder non-downloaded | 1. In server, remove a folder and rename another folder with the name of the initial folder<br>2. In app, pull down to refresh | Folder name is listed with size, date and content of the new one (browse) | P m12 |
| Rename folder-folder downloaded| 1. In app, sync a folder<br>2. In server, remove the folder and rename another folder with the name of the initial folder<br>3. In app, pull down to refresh | Folder name is listed with size, date and content of the previous one | P m12 | FIXED: File is removed in Android
| Switching file names not downloaded | 1. In server, rename file1.txt to file2.txt and file2.txt to file1.txt<br>2. In app, pull down to refresh | Both names listed but switching sizes | P m12 |
| Switching file names downloaded | 1. In app, download file1.txt and file2.txt<br>2. In server, rename file1.txt to file2.txt and file2.txt to file1.txt<br>2. In app, pull down to refresh | Both names listed but switching sizes<br>Contents are correct | F m12 | Files not switched in Scoped Storage
| Switching folder names not downloaded | 1. In server, rename folderA to folderB and folderB to folderA<br>2. In app, pull down to refresh | Both names listed but switching sizes and contents|  |
| Switching folder names downloaded | 1. In app, download folderA and folderB (not empty folders)<br>2. In server, rename folderA to folderB and folderB to folderA<br>3. In app, pull down to refresh | Both names listed but switching sizes<br>Contents are correct and keeps downloaded | F m12 | Files not switched in Scoped Storage
|**Errors**||
| Refresh no connection | 1. Remove device connection<br>2. Refresh | Correct error message | P m12 | No error |
| Refresh no server connection | 1. Put server down<br>2. Refresh | Correct error message | P m12 | No error  |
| Maintenance mode | 1. Put server in maintenance mode<br>2. Select a folder to refresh | Correct error message | P m12 | No error  |