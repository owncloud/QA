#### Rename 

#### PRs: https://github.com/owncloud/ios-app/pull/102

Device/s:
Server: 

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Rename option portrait| Rename option in item menu by swiping | Correct view of the option in portrait | P m11 | | |
| Rename option landscape| Rename option in landscape by swiping | Correct view of the option in landscape | P m11 | | |
|**Actions**||||||
| Rename file to blank | 1. Swipe over a file to rename<br>2. Set a blank name | Not allowed | F m11 | Allowed |
| Rename file to other name | 1. Swipe over a file to rename<br>2. Set a long name with special characters | File correctly renamed (check in server side) | F m11 | Special characters \\ and / are not correctly handled  |
| Rename folder to blank | 1. Swipe over a folder to rename<br>2. Set a blank name | Not allowed | F m11 | Allowed |
| Rename folder to other name | 1. Swipe over a folder to rename<br>2. Set a long name with special characters | Folder correctly renamed (check in server side) | F m11  | Special characters \\ and / are not correctly handled  |
| Cancel | 1. Swipe over an item to rename<br>2. Cancel the operation | Item not renamed | P m11 |  |
|**Issues**||||||
| No connection - one item | Try to delete one item with no connection | Issue is displayed | | | Offline mode deferred |
| Item does not exist | 1. In webUI, delete one item<br>2. Rename the item in the app | Issue is displayed | P m11 | | |