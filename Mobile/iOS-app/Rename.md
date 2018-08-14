#### Rename 

#### PRs: https://github.com/owncloud/ios-app/pull/102

Device/s: iPhone6SPlus v11.4, iPadAir v11.4
Server: 10.0.8

Number of tests: 11<br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Rename option portrait| Rename option in item menu by swiping | Correct view of the option in portrait | P m11 t11 | | |
| Rename option landscape| Rename option in landscape by swiping | Correct view of the option in landscape | P m11 t11 | | |
|**Actions**||||||
| Rename file to blank | 1. Swipe over a file to rename<br>2. Set a blank name | Not allowed | P m11 t11 | Fixed: Allowed |
| Rename file to other name | 1. Swipe over a file to rename<br>2. Set a long name with special characters | File correctly renamed (check in server side) | P m11 t11 | FIXED: Special characters \\ and / are not correctly handled  |
| Rename folder to blank | 1. Swipe over a folder to rename<br>2. Set a blank name | Not allowed | P m11 t11 | FIXED: Allowed. Name to blank |
| Rename folder to other name | 1. Swipe over a folder to rename<br>2. Set a long name with special characters | Folder correctly renamed (check in server side) | P m11 t11 | FIXED Special characters \\ and / are not correctly handled  |
| Rename to an existing name | 1. Swipe over a folder to rename<br>2. Set an existing name | Error shown | P m11  |  |
| Cancel | 1. Swipe over an item to rename<br>2. Cancel the operation | Item not renamed | P m11 |  |
|**Issues**||||||
| No connection - one item | Try to delete one item with no connection | Issue is displayed | | | Offline mode deferred |
| Item does not exist | 1. In webUI, delete one item<br>2. Rename the item in the app | Issue is displayed | P m11 | | |