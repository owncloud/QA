###  Jobs for av. offline

#### Pr: https://github.com/owncloud/android/pull/2306

Devices: Nexus 5X v8.1, Nexus 6P v7<br>
Server: 10.0.10

---
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- |
|**Background files**||||||
| File root | 1. Set a txt file as av.offline in root folder<br>2. Kill the app<br>3. Modify the file | After 15 mins, the file is updated in the server| P m8 m7 |  |  |
| File non-root | 1. Set a txt file as av.offline in non-root folder<br>2. Kill the app<br>3. Modify the file | After 15 mins, the file is updated in the server| P m8 m7 |  |  |
| Several av. offline files | 1. Set several files as av.offline in different accounts<br>2. Kill the app<br>3. Modify all the files | After 15 mins, files are updated in all the accounts| P m8 m7 |  |  |
| Several av. offline and not av. offline files | 1. Set several files as av.offline<br>2. Kill the app<br>3. Modify the files, and others that are not av. offline | After 15 mins, only the av. files are updated in the server| P m8 m7|  |  |
| Rename | 1. Set a file as av.offline and minimize the app<br>2. In web UI, rename the file | After 15 mins, the file is renamed| P m8 m7|  |  |
| Multiaccount | 1. Set files as av.offline in different accounts<br>2. Go out of the app<br>3. Modify files| After 15 mins, files are updated in all the accounts| P m8 m7|  |  
| No modification | 1. Set a txt file as av.offline in root folder<br>2. Kill the app| After 15 (or more) mins nothing happens| P m8 m7 |  |  |
| Conflict | 1. Set a txt file as av.offline<br>2. Kill the app<br>3. Modify the file in both app and webUI| After 15 mins, conflict is detected and shown n notification | P m8 | FIXED: Conflict with no changes in server |  |
| Conflicts in multiaccount | 1. Set two files with the same name but different accounts as av. offline<br>2. Modify both files in mobile and in web UI to cause a conflict| After 15 mins, both conflicts are  detected. Correctly shown in notification| P m8 m7|  |  |
| Job stopped | Unset all content as av. offline | Job stopped | P m8 m7 |  |  |
|**Background folders**||||||
| Folder | 1. Set folder that contains many files as av.offline<br>2. Kill the app<br>3. Modify some files into the folder | After 15 mins, folder is updated in the server| P m8 m7 |  |  |
| Subfolder into folder | 1. Set folder that contains other folders with many files as av. offline<br>2. Kill the app<br>3. Modify some files into the subfolders | After 15 mins, folder is updated in the server | P m8 m7 |  |  |
| Add files | 1. Set folder as av. offline<br>2. Kill the app<br>3. Add files into the folder | After 15 mins, folder is updated in the server | P m8 m7 |  |  |
| Remove files | 1. Set folder as av. offline<br>2. Kill the app<br>3. Delete some files from the folder| After 15 mins, folder is updated in the server | P m8 m7|  |  |
| Rename | 1. Set a folder as av.offline and minimize the app<br>2. In web UI, rename the folder | After 15 mins, the folder is renamed| P m8 m7|  |  |
| Multiaccount | 1. Set folder that contains many files as av.offline in different accounts<br>2. Kill the app<br>3. Modify some files into the folders | After 15 mins, folder is updated in  all the accounts| P m8 m7|  |  |
| No modification | 1. Set a folder as av.offline<br>2. Kill the app| After 15 (or more) mins nothing happens | P m8 m7|  |  |
| Conflict | 1. Set a folder as av.offline<br>2. Kill the app<br>3. Modify somes files inside in both app and webUI| After 15 mins, conflict is detected. Correctly shown in notification| P m8 m7| FIXED: Conflict with no changes in server  |  |
| Job stopped | Unset all content as av. offline | Job stopped | P m8 m7 |  |  |
| Remove account | 1.Add two accounts<br>2. Set av. offline items in one of them<br>3. Remove this one| Job does not sync anything| P m8 m7 | FIXED: Account deleted and files keepn on being synced |  |
|**Foreground (regression)**||||||
| File | 1. Set a file as av. offline<br>2. Modify the file | File is now available offline. Changes are automatically uploaded | P m8 |  |  |
| Folder | 1. Set a folder as av. offline<br>2. Add content to the folder<br>3. Delete content from the folder<br>4. Modify some files in the folder | Folder and all its content is now available offline. All actions are correctly and automatically performed | P m8 | FIXED: It is returning an error in the notification |  |  
| Unset file  | 1. Unset a file as av. offline<br>2. Modify the file | File is not available offline any more. Changes are uploaded only when file is opened | P m8 |  |  |
| Unset folder  | 1. Unset a folder as av. offline<br>2. Modify any file inside the folder | Folder is not available offline any more. Changes are uploaded only when file is opened |   P m8 |  |
| Conflicts file| 1. Set a file as av. offline<br>2. Switch device connection off<br>3. Modify the file in device and web UI<br>4. Switch device connection on| Conflict is detected. Correctly shown in notification | P m8 | FIXED: Conflict with no changes in server  |  |
| Conflicts folder| 1. Set a folder as av. offline<br>2. Switch device connection off<br>3. Modify any file inside the folder in device and web UI<br>4. Switch device connection on| Conflict is detected | P m8 | FIXED: Conflict with no changes in server  |  |