#### Available offline in drawer

#### Pr: https://github.com/owncloud/android/pull/2469

Devices: Nexus 5X v8, Nexus 6P v7

Server: 10.0.10


---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**View**|||||
| 1 | View portrait | Open drawer | Option correctly displayed | P m8 m7|
| 2 | View landscape | Open drawer | Option correctly displayed | P m8 m7 |
|**Actions files**|||||
| 3 | No av offline in account | 1. Open an account with no av. offline content<br>2. Open drawer and available offline  | Empty view | P m8 m7|
| 4 | Options for one file | 1. Set a file as av. offline <br>2. Select the file |Options available are: unset as av. offline, open in, details, select all and select inverse. | P m8 m7|
| 5 | Options for several file | 1. Set several file as av. offline <br>2. Select all files |Options available are: unset as av. offline, select all and select inverse. | P m8 m7|
| 6 | Av offline file root | 1. Set a file as av. offline in root folder and open av. offline view.<br>2. Tap on file | 1. File is in the list with the correct path<br>2. File opened | P m8 m7|
| 7 | Av offline file non-root | 1. Set a file as av. offline in non-root folder and open av. offline view.<br> 2. Tap on file| 1. File is in the list with the correct path<br>2. File opened  | P m8 m7 |
| 8 | Av offline file non-root very deep | 1. Set a file as av. offline in non-root very deep folder and open av. offline view.<br>2. Tap on file | 1. File is in the list with the correct path<br>2. File opened  | P m8 m7| FIXED: Path ellipsized at the end
| 9 | Unset as av. offline | 1. Set a file as av. offline and open av. offline view.<br>2. Select the file and unset it as av. offline | 1. File is in the list with the correct path<br>2. File is removed from the list and unset as av. offline in the files view  | P m8 m7|
| 10 | Unset as av. offline multi | 1. Set several file as av. offline and open av. offline view.<br>2. Select all the files and unset them as av. offline | 1. Files are in the list with the correct path<br>2. Files are removed from the list and unset as av. offline in the files view  | P m8  m7|
| 11 | Details | 1. Set a file as av. offline and open av. offline view.<br>2. Select the file and the option Details | 1. File is in the list with the correct path<br>2. Details are listed  | P m8 m7 |
| 12 | Open In | 1. Set a file as av. offline and open av. offline view.<br>2. Select the file and the option Open In | 1. File is in the list with the correct path<br>2.File is opened with the selected app  | P m8 m7|
| 13 | Select all | 1. Set two files as av. offline and open av. offline view.<br>2. Select the option "Select all" | Both are selected  | P m8 m7|
| 14 | Select inverse | 1. Set two files as av. offline and open av. offline view.<br>2. Select one of them<br>3. Select the option "Select inverse" | The other one is selected | P m8 m7|
|**Actions folders**|||||
| 15 | Options for folders | 1. Set a folder as av. offline in root folder and open av. offline view.<br>2. Select the folder |Options available are: unset as av. offline, select all and select inverse. | P m8 m7|
| 16 | Av offline folder root | 1. Set a folder as av. offline in root folder and open av. offline view.<br>2. Tap on folder | 1. Folder is in the list with the correct path<br>2. Folder browsed | P m8 m7|
| 17 | Av offline folder non-root | 1. Set a folder as av. offline in non-root folder and open av. offline view.<br> 2. Tap on folder| 1. Folder is in the list with the correct path<br>2. Folder browsed  | P m8 m7|
| 18 | Av offline folder with other folders inside | 1. Set a folder with subfolders in different deepth levels as av. offline and open av. offline view.<br> 2. Tap on folder| 1. Folder is in the list with the correct path<br>2. Subfolders are not in the list  | P m8 m7|
| 19 | Av offline folder with other folders inside browse | 1. Set a folder with subfolders in different deepth levels as av. offline and open av. offline view.<br> 2. Tap on folder and subfolders | 1. Folder is in the list with the correct path<br>2. Subfolders are browsed front and back | P m8 m7 |
| 20 | Unset as av. offline | 1. Set a folder as av. offline and open av. offline view.<br>2. Select the folder and unset it as av. offline | 1. Folder is in the list with the correct path<br>2. Folder is removed from the list and unset as av. offline in the files view  | P m8 m7|
| 21 | Unset as av. offline multi | 1. Set several folders as av. offline and open av. offline view.<br>2. Select all the folders and unset them as av. offline | 1. Folders are in the list with the correct path<br>2. Folders are removed from the list and unset as av. offline in the files view  | P m8 m7|
| 22 | Select all | 1. Set two folders as av. offline and open av. offline view.<br>2. Select the option "Select all" | Both are selected  | P m8 m7|
| 23 | Select inverse | 1. Set two folders as av. offline and open av. offline view.<br>2. Select one of them<br>3. Select the option "Select inverse" | The other one is selected | P m8 m7 c |
|**Other**|||||
| 24 | Filter | 1. Set two items as av. offline and open av. offline view.<br>2. Open filter and type a pattern that matches one of them | Only that one is selected | P m8 m7|
| 25 | Sort | 1. Set several items as av. offline and open av. offline view.<br>2. Sort the list using different criteria | Correctly sorted | P m8 m7|
| 26 | List & Grid | 1. Set several items as av. offline and open av. offline view.<br>2. Switch grid and list view | Correctly displayed | P m8 m7|
| 27 | Multiaccount | 1. Set several items as av. offline in several different accounts<br>2. Switch accounts| Every account shows its own availble offline content. | P m8 m7 |