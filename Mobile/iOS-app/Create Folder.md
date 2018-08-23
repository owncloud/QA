#### Create Folder 

#### PRs: https://github.com/owncloud/ios-app/pull/107

Device/s: iPhone 6SPlus v11.4, iPadAir v11
Server: 10.0.9

Number of tests: 11<br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait | Create folder option in sortbar | Correct view of the option in portrait | P m11 t11| | 
| Landscape | Create folder option in sortbar | Correct view of the option in landscape | P m11 t11| | 
|**Actions**||||||
| Create folder | Create folder with regular name | Folder created | P m11 t11 | |
| Create folder special characters | Create folder with special characters | Folder created | P m11 t11 | |
| Create folder forbidden characters | Create folder with forbidden characters (\ /) | Folder not created | P m11 t11 | |
| Create folder very long name | Create folder with long name | Folder created |P m11 t11 | If exceeds the limit, non clear error|
| Create folder empty name | Create folder with empty name | Folder not created | P m11 t11 | |
| Create folder duplicated name | Create folder with existing name | Folder not created | F m11 t11 | Bad error |
| Cancel Create folder | Cancel the creation of a folder | Folder not created | P m11 | |
|**Issues**||||||
| No connection - one item | Try to create a folder with no connection | When online is recovered, item is created | P 11 t11 | Offline mode deferred |
