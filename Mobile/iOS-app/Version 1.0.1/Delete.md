#### Delete 

#### PRs: https://github.com/owncloud/ios-app/pull/91

Device/s: iPhoneX v11.4, iPadAir2 v11
Server: 10.0.8

Number of tests: 7<br>
Number of automated tests: 7 <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Delete option portrait| Delete option in item menu by swiping | Correct view of the option in portrait | P m11 t11 | | |
| Delete option landscape| Delete option in landscape by swiping | Correct view of the option in landscape | P m11 t11| | |
|**Actions**||||||
| Delete file | 1. Swipe over a file to delete<br>2. Accept the operation | File deleted (check in server side) | P m11 t11 |  |
| Delete folder | 1. Swipe over a folder to delete<br>2. Accept the operation | Folder deleted (check in server side) | P m11 t11 |  |
| Cancel | 1. Swipe over an item to delete<br>2. Cancel the operation | Item not deleted | P m11 t11 |  |
|**Issues**||||||
| No connection - one item | Try to delete one item with no connection | Issue is displayed | | Offlne mode delayed | |
| Item does not exist | 1. In webUI, delete one item<br>2. Delete the item in the app | Issue is displayed | P m11 t11 | Maybe the warning message can be improved. | |