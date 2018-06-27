#### Delete 

#### PRs: https://github.com/owncloud/ios-app/pull/

Device/s:
Server: 

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Delete option portrait| Delete option in item menu by swiping | Correct view of the option in portrait | | | |
| Delete option landscape| Delete option in landscape by swiping | Correct view of the option in landscape | | | |
|**One item**||||||
| Delete file | 1. Swipe over a file to delete<br>2. Accept the operation | File deleted (check in server side) |  |  |
| Delete folder | 1. Swipe over a folder to delete<br>2. Accept the operation | Folder deleted (check in server side) |  |  |
| Cancel | 1. Swipe over an item to delete<br>2. Cancel the operation | Item not deleted |  |  |
|**Multiselection**||||||
| One file | 1. Tap on Edit<br>2. Select one file<br>3. Delete and confirm | File deleted (check in server side) | | |
| One folder | 1. Tap on Edit<br>2. Select one folder<br>3. Delete and confirm | Folder deleted (check in server side) | | |
| Several files | 1. Tap on Edit<br>2. Select several files<br>3. Delete and confirm | Files deleted (check in server side) | | |
| Several folders | 1. Tap on Edit<br>2. Select several folders<br>3. Delete and confirm | Folders deleted (check in server side) | | |
| Several items | 1. Tap on Edit<br>2. Select several items, files and folders<br>3. Delete and confirm | Items deleted (check in server side) | | |
| All items | 1. Tap on Edit<br>2. Select all items<br>3. Delete and confirm | Items deleted (check in server side) | | |
|**Issues**||||||
| No connection - one item | Try to delete one item with no connection | Issue is displayed | | | |
| No connection - several items | Try to delete several items with no connection | Issue is displayed | | | |
| Item does not exist | 1. In webUI, delete one item<br>2. Delete the item in the app | Issue is displayed | | | |