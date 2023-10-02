#### Document provider - Rename

#### Pr: https://github.com/owncloud/android/pull/2506


Devices: Nexus 5X v8, Nexus 9 v7<br>
Server: 10.0.10


---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Rename file root | Using document provider, rename a file in root folder | Correct renamed, check in the app or web UI | P m8 t7|
| 2 | Rename file non-root | Using document provider, rename a file in non-root folder | Correct renamed, check in the app or web UI | P m8 t7|
| 3 | Rename folder root | Using document provider, rename a folder in root folder | Correct renamed, check in the app or web UI | P m8 t7 |
| 4 | Rename folder non-root | Using document provider, rename a folder in non-root folder | Correct renamed, check in the app or web UI | P m8 t7 |
| 5 | Rename item with an existing name | Using document provider, rename any to another existing name | Correct error | P m8 t7 |
| 6 | Rename item with special characters | Using document provider, rename any item using special characters like &%ä^ | Correct error | P m8 t7 |
| 7 | Rename item with forbidden characters | Using document provider, rename any item using forbidden characters like \ or / | Correct error | P m8 t7|
| 8 | Rename item with no permision | Using document provider, rename any shared item over which, there is no edit permission | Correct error | P m8 |
| 9 | Rename item with longer name as allowed | Using document provider, rename any item with a longer than 256 characters name | Correct error | P m8 t7|
| 10 | Rename removed item | Using document provider, rename any item that has just removed from web UI | Correct error | P m8 t7|
| 11 | Rename item with no internet connection | Using document provider, rename any item with no internet connection| Correct error | P m8 t7|
| 12 | Rename item with no server connection | Using document provider, rename any item with no server connection| Correct error | P m8 t7|
| 13 | Rename item with server in maintenance mode | Using document provider, rename any item with server in maintenance mode| Correct error | P m8 t7 |
| 14 | Select several to rename | Using document provider, select several items| Rename is disabled | P m8 t7|
| 15 | Rename to empty name | Using document provider, blank the item name| Not posible | P m8 t7 |
| 16 | Cancel rename | Using document provider, Open rename option and cancel without renaming | File is not renamed | P m8 t7 |