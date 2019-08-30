###  Copy file from provider

#### PR: https://github.com/owncloud/android/pull/2640

Devices: Nexus 5X v8<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m8 |  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied | F m8 | Error to copy
| Copy file to other location | From doc prov, copy a file to other location| Correct copied | P m8 |  |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m8 |  |
| Same name | Copy twice| Error of conflict | NA |  Pending issue to solve name conflicts https://github.com/owncloud/android/issues/2623 |
| Special characters | Copy the file which contain special characters | Correct copied | P m8 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m8 |  |
| Folder to other oC account | From doc prov, copy a folder with subfolders to other account| Correct copied | F m8 | Error to copy |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | P m8 |  |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied | P m8 |  |
| Same name | Copy twice | Error of conflict | NA | Pending issue to solve name conflicts https://github.com/owncloud/android/issues/2623 |
|**Error**||||||
| No connection | Copy an item with no connection | Error of connectivity, item not copied |  |  |
| Source removed | Copy an item and before submitting, remove the source item from web UI | Error of item not found, item not copied | F m8 |  |
| Target removed | Copy an item and before submitting, remove the target folder from web UI | Error of folder, item not copied | F m8 |  |