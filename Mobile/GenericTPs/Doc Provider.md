###  Document Provider 

Devices: 

Server: 

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :----: | :-----
|**Copy File** |   |  | 
|**File**||||||
| Copy file to oC same account | From doc prov, copy a file inside the same account to different location in such account | Correctly copied | |  |
| Copy several files to oC same account| From doc prov, copy several file inside the same account to different location in such account | Correctly copied |  |  |
| Copy file to oC other oC account | From doc prov, copy a file to other oC account| Correct copied |  | 
| Copy several files to other oC account | From doc prov, copy several files to other oC account | Correct copied |  | 
| Copy a file to other location (no oC) | From doc prov, copy a files to other location | Nothing happened in oC  | |  |
| Copy several files to other location (no oC) | From doc prov, copy several files to other location | Nothing happened in oC  |  |  |
| Copy a file from other location (no oC) | From doc prov, copy files from other loation to oC| Files created in oC, in the correct path |  |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correctly copied |  |  |
| Folder with subfolders oC other account | From doc prov, copy a folder with subfolders to other account | Correctly copied | |   |
| Folder to other location (no oC) | From doc prov, copy a folder with subfolders to other location| Correctly copied |  | |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correctly copied |  |  |
| Copy a folder from other location | From doc prov, copy a folder with subfolders from other location to oC | Correctly copied |  |  |
|**Move File** |   |  |
|**File**||||||
| Move file to same oC account | From doc prov move a file to the same account, different location| Correctly moved | |  |
| Move several files to same oC account | From doc prov move several files to the same account, different location| Correctly moved | |  |
| Move file to other oC account | From doc prov move a file to the other oC account | Correctly moved | | |
| Move several files to other oC account | From doc prov move several files to other oC account | Correctly moved |  |  |
| Move file to other location (no oC) | From doc prov, move a file to other location| Correctly moved (removed from oC) |  |  |
| Move several file to other location (no oC) | From doc prov, move several files to other location| Correctly moved (removed from oC) | |  |
| Move from other location to oC (no oC) | From doc prov, move a bunch of files from other location to oC| Correctly created in oC | |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, move a folder with subfolders to the same account, different location| Correctly moved | |  |
| Folder with subfolders oC other account | From doc prov move a folder with subfolders to other oC account | Correctly copied |  |   |
| Folder to other location | From doc prov, move a folder with subfolders to other location| Correctly moved | |  |
| Move several folders to other location | From doc prov, copy several folders to other location| Correctly moved (removed from oC) | |  |
| Move a folder from other location | From doc prov, copy some folders with subfolders from other location to oC | Correctly moved (created in oC) |  | |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved |  |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  |  |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name |  |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  |  |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | |   |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly |  |  |  |
| Edit file | Open a file stored in oC using a proper app to edit the file (MS Word,f. ex)<br>Modify the file | File is saved in oC with the update |  |   |  |