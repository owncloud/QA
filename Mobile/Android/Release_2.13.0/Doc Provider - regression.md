###  Document Provider (regression)

#### Pr: https://github.com/owncloud/android/pull/

Devices: Samsung S9 v9

Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :----: | :-----
|**Copy File** |   |  | 
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m9 m7 |  |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied | P m9 m7 |  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied |  NA |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m9 m7 |  |
| Copy a file to other location  in the same oC account| From doc prov, copy a files to other location in the same account | Correct copied | P m9 m7 |  |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied | P m9 m7 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m9 t7 | With no subfolders works OK |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | F m9 | Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied | P m9 |  |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied | P m9 m7|  |
|**Move File** |   |  |
|**File**||||||
| Move file to same oC account | From doc prov, move a file to the same account, different location| Correct copied | P m9 m7 |  |
| Move file to other location | From doc prov, move a file to other location| Correct moved | P m9 m7|  |
| Move several file to other location | From doc prov, move several files to other location| Correct moved | P m9 m7|  |
| Move from other location to oC | From doc prov, move a bunch of files from other location to oC| Correct copied | P m9 m7 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, move a folder with subfolders to the same account, different location| Correct moved | P m9 m7 |  |
| Folders to other location | From doc prov, move some folder with subfolders to other location| Correct moved | F m9 | Not everything moved: https://github.com/owncloud/android/issues/2658 |
| Folders from other location | From doc prov, move some folder with subfolders form other location to oC | Correct moved | F m9  | Not everything moved: https://github.com/owncloud/android/issues/2658 |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | P m9 m7 |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | P m9 m7|   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | P m9 m7 |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name |  P m9 m7 |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | P m9 m7 |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m9 m7 |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m9 m7 |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly | P m9 m7 |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly |  P m9 m7 |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m9 m7 |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | P m9 m7 |   |  |