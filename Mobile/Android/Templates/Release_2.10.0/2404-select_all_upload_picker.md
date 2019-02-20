#### Select All & Select Inverse in Upload Picker

#### Pr: https://github.com/owncloud/android/pull/2404



---

 
| Test n | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**View**||||||
| 1 | Select all | Open three dot button  | Select all appears<br>Select inverse appears | |  |
| 2 | Select all items | Select all items manually | Select all does not appear<br>Select inverse appears | |  |
| 3 | Empty folder | 1. Enter on a empty folder<br>2. Tap on three-dot-button| Select all does not appear<br>Select inverse does not appear | |  |
|**Action**||||||
| 4 | Select All | Tap on "Select all" | All items selected | |  |
| 5 | Select inverse | 1. In a folder with several items, select some items, but not all of them<br>3. Tap on "Select inverse" | All items selected, but the one selected in step 1. |  |  |
| 6 | Select inverse recursive | 1. In a folder with several items, select some items, but not all of them<br>2. Tap on "Select inverse", then "all" and "inverse" again | No items selected | |  |




