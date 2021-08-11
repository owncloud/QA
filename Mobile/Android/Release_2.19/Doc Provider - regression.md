###  Document Provider (regression)

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.8

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :----: | :-----
|**Copy File** |   |  | 
|**File**||||||
| Copy file to oC same account | From doc prov, copy a file inside the same account to different location in such account | Correctly copied | P m7 m11|  |
| Copy several files to oC same account| From doc prov, copy several file inside the same account to different location in such account | Correctly copied | P m7 m11 |  |
| Copy file to oC other oC account | From doc prov, copy a file to other oC account| Correct copied |  P m7 m11 | 
| Copy several files to other oC account | From doc prov, copy several files to other oC account | Correct copied | P m7 m11 | 
| Copy a file to other location (no oC) | From doc prov, copy a files to other location | Nothing happened in oC  | P m7 m11 |  |
| Copy several files to other location (no oC) | From doc prov, copy several files to other location | Nothing happened in oC  | P m7 m11 |  |
| Copy a file from other location (no oC) | From doc prov, copy files from other loation to oC| Files created in oC, in the correct path | P m7 m11 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correctly copied | P m7 m11 |  |
| Folder with subfolders oC other account | From doc prov, copy a folder with subfolders to other account | Correctly copied | F m7 m11 | Bad and irregular behaviour. https://github.com/owncloud/android/issues/2658  |
| Folder to other location (no oC) | From doc prov, copy a folder with subfolders to other location| Correctly copied | P m7 m11 | |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correctly copied | P m7 m11 |  |
| Copy a folder from other location | From doc prov, copy a folder with subfolders from other location to oC | Correctly copied | P m7 m11 |  |
|**Move File** |   |  |
|**File**||||||
| Move file to same oC account | From doc prov move a file to the same account, different location| Correctly moved | P m7 m11 |  |
| Move several files to same oC account | From doc prov move several files to the same account, different location| Correctly moved | P m7 m11 |  |
| Move file to other oC account | From doc prov move a file to the other oC account | Correctly moved | F m7 m11 | Irregular behaviour https://github.com/owncloud/android/issues/2659 |
| Move several files to other oC account | From doc prov move several files to other oC account | Correctly moved | F m7 m11 | Irregular behaviour https://github.com/owncloud/android/issues/2659 |
| Move file to other location (no oC) | From doc prov, move a file to other location| Correctly moved (removed from oC) | P m7 m11 |  |
| Move several file to other location (no oC) | From doc prov, move several files to other location| Correctly moved (removed from oC) | P m7 m11 |  |
| Move from other location to oC (no oC) | From doc prov, move a bunch of files from other location to oC| Correctly created in oC | P m7 m11 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, move a folder with subfolders to the same account, different location| Correctly moved | P m7 m11|  |
| Folder with subfolders oC other account | From doc prov move a folder with subfolders to other oC account | Correctly copied | F m7 | It does not seem to work. Not everything copied: https://github.com/owncloud/android/issues/2658  |
| Folder to other location | From doc prov, move a folder with subfolders to other location| Correctly moved | P m7 m11|  |
| Move several folders to other location | From doc prov, copy several folders to other location| Correctly moved (removed from oC) | P m7 m11|  |
| Move a folder from other location | From doc prov, copy some folders with subfolders from other location to oC | Correctly moved (created in oC) | P m7 m11 | |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | P m7 m11 |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | P m7 m11 |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | P m7 m11  |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | P m7 m11 |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | P m7 m11 |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m7 m11|  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m7 m11 |   |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly | P m7 m11 |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m7 m11  |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m7 m11 |  |  |
| Edit file | Open a file stored in oC using a proper app to edit the file (MS Word,f. ex)<br>Modify the file | File is saved in oC with the update | P m7 m11 |   |  |