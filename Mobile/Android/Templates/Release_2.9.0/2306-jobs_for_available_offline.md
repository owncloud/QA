###  Jobs for av. offline

#### Pr: https://github.com/owncloud/android/pull/2306

---
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- |
|**Background files**||||||
| File root | 1. Set a txt file as av.offline in root folder<br>2. Kill the app<br>3. Modify the file | After 15 mins, the file is updated in the server|  |  |  |
| File non-root | 1. Set a txt file as av.offline in non-root folder<br>2. Kill the app<br>3. Modify the file | After 15 mins, the file is updated in the server|  |  |  |
| Several av. offline files | 1. Set several files as av.offline in different accounts<br>2. Kill the app<br>3. Modify all the files | After 15 mins, files are updated in all the accounts|  |  |  |
| Several av. offline and not av. offline files | 1. Set several files as av.offline<br>2. Kill the app<br>3. Modify the files, and others that are not av. offline | After 15 mins, only the av. files are updated in the server|  |  |  |
| No modification | 1. Set a txt file as av.offline in root folder<br>2. Kill the app| After 15 (or more) mins nothing happens|  |  |  |
|**Background folders**||||||
| Folder | 1. Set folder that contains many files as av.offline<br>2. Kill the app<br>3. Modify some files into the folder | After 15 mins, folder is updated in the server|  |  |  |
| Subfolder into folder | 1. Set folder that contains other folders with many files as av. offline<br>2. Kill the app<br>3. Modify some files into the subfolders | After 15 mins, folder is updated in the server |  |  |  |
| Multiaccount | 1. Set folder that contains many files as av.offline in different accounts<br>2. Kill the app<br>3. Modify some files into the folders | After 15 mins, folder is updated in  all the accounts|  |  |  |
| No modification | 1. Set a folder as av.offline<br>2. Kill the app| After 15 (or more) mins nothing happens |  |  |  |
|**Foreground (regression)**||||||
| File | 1. Set a file as av. offline<br>2. Modify the file | File is now available offline. Changes are automatically uploaded |  |  |  |
| Folder | 1. Set a folder as av. offline<br>2. Add content to the folder<br>3. Delete content from the folder<br>4. Modify some files in the folder | Folder and all its content is now available offline. All actions are correctly and automatically performed |  |  |  |
| Unset file  | 1. Unset a file as av. offline<br>2. Modify the file | File is not available offline any more. Changes are uploaded only when file is opened |  |  |  |
| Unset folder  | 1. Unset a folder as av. offline<br>2. Modify any file inside the folder | Folder is not available offline any more. Changes are uploaded only when file is opened |  |  |  |
| Conflicts file| 1. Set a file as av. offline<br>2. Switch device connection off<br>3. Modify the file in device and web UI<br>4. Switch device connection on| Conflict is detected |  |  |  |
| Conflicts folder| 1. Set a folder as av. offline<br>2. Switch device connection off<br>3. Modify any file inside the folder in device and web UI<br>4. Switch device connection on| Conflict is detected |  |  |  |