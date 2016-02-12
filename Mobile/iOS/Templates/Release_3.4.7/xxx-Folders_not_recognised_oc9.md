###  Folders are not recognised in OC9 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server: 9 and 8.2.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :------: | :------------- | :------------- | :-------------- | :----- | :------ |
| 1 | Correct detection | 1. Login in a account with several files or folders |  The list is correctly displayed, and all files and folders are correctly recognised  | | |
| 2 | Files info | 1. Login in a account with several files |  Below the filename is displayed the creation date, and the filesize  | | |
| 3 | Deep browsing | 1. Create a deep file structure (4 o 5 levels) with files and folders |  All levels show correctly the files and folders  | | |
| 4 | New folder | 1. Create a new folder |  The folder is created and can be browsed  | | |
| 5 | Special charactes | 1. Create a new folder with special characters |  The folder is created and can be browsed  | | |
| 6 | Long name | 1. Create a new folder with long name |  The folder is created and can be browsed  | | |
| 7 | OC 8 (regress) | 1. Login in a OC 8 account with files and folders|  The list is correctly displayed, and all files and folders are correctly recognised as usual | | |

