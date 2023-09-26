###  Copy file from provider

#### PR: https://github.com/owncloud/android/pull/2640

Devices: Nexus 5X v8<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m8 m9 |  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied | P m8 m9| FIXED: Error to copy
| Copy file to other location | From doc prov, copy a file to other location| Correct copied | P m8 m9|  |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m8 m9|  |
| Copy many file to other location | From doc prov, copy a bunch of files to other location| Correct copied | P m8 m9|  |
| Copy a file to other location  in the same oC account| From doc prov, copy a files to other location in the same account | Correct copied | P m8 m9|  |
| Same name | Copy twice| Error of conflict | NA |  Pending issue to solve name conflicts https://github.com/owncloud/android/issues/2623 |
| Special characters | Copy the file which contain special characters | Correct copied | P m8 m9|  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m8 m9|  |
| Folder with subfolders to other oC account | From doc prov, copy a folder with subfolders to other account| Correct copied | P m8 m9| FIXED: Crash to copy. |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | P m8 m9|  |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied | P m8 m9|  |
| Same name | Copy twice | Error of conflict | NA | Pending issue to solve name conflicts https://github.com/owncloud/android/issues/2623 |
|**Error**||||||
| No connection | Copy an item with no connection | Error of connectivity, item not copied | P m8 m9|  |
| Source removed | Copy an item and before submitting, remove the source item from web UI | Error of item not found, item not copied | P m8 m9|  |
| Target removed | Copy an item and before submitting, remove the target folder from web UI | Error of folder, item not copied | P m8 m9|  |