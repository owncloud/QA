#### Duplicate 

#### PRs: https://github.com/owncloud/ios-app/pull/119

Devices: iPhone6S Plus v11, iPadAir2 v11<br> 
Server: 10.0.9

Number of tests: 5<br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Duplicate option portrait| Duplicate option in item menu by swiping | Correct view of the option in portrait | P m11 t11 | | |
| Duplicate option landscape| Duplicate option in landscape by swiping | Correct view of the option in landscape | P m11 t11 | | |
|**Actions with duplicate option**||||||
| Duplicate file  | 1. Open options sheet in a file<br>2. Select Duplicate | File duplicated with "copy" | P m11 t11 |  |
| Duplicate folder | 1. Open options sheet in a folder<br>2. Select Duplicate  | Folder duplicated with copy in name. Content also duplicated | P m11 t11 | |
| Duplicate inexistent item | 1. Open options sheet in a folder<br>2. In web UI, remove the item<br>3. Confirm the action| Error message | P m11 t11 | |