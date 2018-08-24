#### Move 

#### PRs: https://github.com/owncloud/ios-app/pull/110

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Move option portrait| Rename option in item menu by swiping | Correct view of the option in portrait |  | | |
| Move option landscape| Rename option in landscape by swiping | Correct view of the option in landscape |  | | |
|**Actions with move option**||||||
| Move file  | 1. Swipe over a file to move<br>2. Select a location | File moved |  |  |
| Move folder | 1. Swipe over a folder to move<br>2. Select a location | Folder moved |  |  |
| Move folder to itself | 1. Swipe over a folder to rename<br>2. Select as location the folder itself | Not allowed | |  |
| Move to same location | 1. Swipe over an item to rename<br>2. Select as location the current location | Nothing happens |  |  |
|**Drag & Drop**||||||
| Move file  | 1. Drag file to move<br>2. Drop into a folder | File moved |  |  |
| Move folder | 1. Drag folder to move<br>2. Drop into a folder | Folder moved |  |  |
| Move folder to itself | 1. Drag folder to move<br>2. Drop itself | Not allowed | |  |
| Move to same location | 1. Drag an item<br>2. Drop in the same location | Nothing happens |  |  |
| Multiselection | 1. Drag several items<br>2. Drop them in other location| All items moved |  |  |
| Multiselection to same folder | 1. Drag several items<br>2. Drop them in same location| Nothing happens |  |  |