###  Folders are not recognised in oC9 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices: iPhone9 v9.2.1

Server: 9 and 8.2.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :------: | :------------- | :------------- | :-------------- | :----- | :------ |
|**Folders detection**||||||
| 1 | Correct detection | 1. Login in a account with several files or folders |  The list is correctly displayed, and all files and folders are correctly recognised  | P m9 | |
| 2 | Deep browsing | 1. Create a deep file structure (4 o 5 levels) with files and folders |  All levels show correctly the files and folders  | P m9 | |
| 3 | New folder | 1. Create a new folder |  The folder is created and can be browsed  | P m9| |
| 4 | Special characters | 1. Create a new folder with special characters |  The folder is created and can be browsed  | P m9 | |
| 5 | Long name | 1. Create a new folder with long name |  The folder is created and can be browsed  | P m9| |
|**eTagging and info**||||||
| 6 | Files info | 1. Login in a account with several files |  Below the filename is displayed the creation date, and the filesize  | P m9 | |
| 7 | File new version web| 1. From web app, edit a text file<br>2. In app, refresh the files view<br>3. Tap on file to download it  | 2. File new version is detected <br> 3. The changes are visible and the time is updated| P m9| |
| 8 | Folder new version web| 1. From web app, upload content into a folder<br>2. In app, refresh the files view | Changes are detected, and the time is updated. Content is downloaded into| P m9| |
| 9 | File new version app| 1. From app, edit a text file by opening it with an external app | Check in web app or other clients that the file is correctly updated| | |
| 10 | Folder new version app| 1. From app, update the content of a folder | Check in web app or other clients that the folder is correctly updated| P m9| |
| 11 | Favourite file app| 1. In app, set as favourite a text file<br>2. Open the file with an external app and edit it  | 1. File is shown as favourite in app and synced in other clients <br> 2. The file is synced | | |
| 12 | Favourite folder app| 1. In app, set as favourite a folder<br>2. Edit the folder content by adding/updating/deleting content within  | The folder content is synced everywhere| P m9 | |
|**Multiaccount**||||||
| 13 | Multiaccount (oC8 & oC9) | 1. Login in oC8 and oC9 accounts|  Both lists are correctly displayed, and all files and folders are correctly recognised as usual | P m9 | |
|**Regression**||||||
| 14 | oC8 (regress) | 1. Login in a OC 8 account with files and folders|  The list is correctly displayed, and all files and folders are correctly recognised as usual | | |

