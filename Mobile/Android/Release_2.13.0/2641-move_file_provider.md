###  Move file from provider

#### PR: https://github.com/owncloud/android/pull/2641

Devices: Nexus 5X v8<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**File**||||||
| Move file to oC | From doc prov, move a file to the same account, different location| Correct copied | P m8  |  |
| Move file to oC other account | From doc prov, move a file to other account| Correct copied | P m8 m9| FIXED: Error to copy
| Move file to other location | From doc prov, move a file to other location| Correct copied | P m8 m9|  |
| Move several file to other location | From doc prov, move several files to other location| Correct copied | P m8 m9|  |
| Move many file to other location | From doc prov, move a bunch of files to other location| Correct copied | P m8 m9|  |
| Move a file to other location  in the same oC account| From doc prov, move a files to other location in the same account | Correct copied | P m8 m9|  |
| Special characters | Move the file which contain special characters | Correct copied | P m8 m9|  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, move a folder with subfolders to the same account, different location| Correct copied | P m8 m9|  |
| Folder with subfolders to other oC account | From doc prov, move a folder with subfolders to other account| Correct copied | P m8 m9| FIXED: Crash to copy. |
| Folder to other location | From doc prov, move a folder with subfolders to other location| Correct copied | P m8 m9|  |
| Copy several folders to other location | From doc prov, move several folders to other location| Correct copied | P m8 m9|  |
|**Error**||||||
| No connection | Move an item with no connection | Error of connectivity, item not copied | P m8 m9|  |
| Source removed | Move an item and before submitting, remove the source item from web UI | Error of item not found, item not copied | P m8 m9|  |
| Target removed | Move an item and before submitting, remove the target folder from web UI | Error of folder, item not copied | P m8 m9|  |