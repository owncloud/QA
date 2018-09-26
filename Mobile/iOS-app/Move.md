#### Move 

#### PRs: https://github.com/owncloud/ios-app/pull/110

Devices: iPhone 6SPlus v11, iPadAir2 v11
Servwe: 10.0.10

Number of tests: 15<br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Move option portrait| Move option in item menu by swiping | Correct view of the option in portrait | P t11 m11 | | |
| Move option landscape| Move option in landscape by swiping | Correct view of the option in landscape | P t11 m11 | | |
|**Actions with move option**||||||
| Move file  | 1. Swipe over a file to move<br>2. Select a location | File moved | P t11 m11 | FIXED: If folder is empty, no option  |
| Move folder | 1. Swipe over a folder to move<br>2. Select a location | Folder moved | P m11 t11| |
| Move folder to itself | 1. Swipe over a folder to move<br>2. Select as location the folder itself | Not allowed | P m11 t11 | Error not appropiate |
| Move to same location | 1. Swipe over an item to move<br>2. Select as location the current location | Nothing happens | P m11 t11 | Name is the same, not allowed |
| Move to inexistent location | 1. Swipe over an item to move<br>2. Select a location<br>3. Befor confirming, remove the location in web UI | Error message | F m11 t11 | Wrong error message |
|**Drag & Drop**||||||
| Move file  | 1. Drag file to move<br>2. Drop into a folder | File moved | P m11 t11 |  |
| Move folder | 1. Drag folder to move<br>2. Drop into a folder | Folder moved | P m11 |  |
| Move folder to itself | 1. Drag folder to move<br>2. Drop itself | Not allowed | P m11 t11 |   |
| Move to same location | 1. Drag an item<br>2. Drop in the same location | Nothing happens | P m11 t11|  |
| Move to folder with no folders inside | 1. Drag content<br>2. Drop in a folder that does not contain folders| allowed to drop | P m11 t11 | FIXED: Drop not allowed |
| Multiselection | 1. Drag several items<br>2. Drop them in other location| All items moved | P m11 t11 |  |
| Multiselection to same folder | 1. Drag several items<br>2. Drop them in same location| Nothing happens | P m11 t11 |  |
| Huge amount of items | 1. Drag more than 100 items<br>2. Drop them in other location| All of the moved | P m11 t11 |  |