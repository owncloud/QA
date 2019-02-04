#### Select All & Select Inverse in Upload Picker

#### Pr: https://github.com/owncloud/android/pull/2404

Server: 10.0.10<br>
Device: Nexus 9 v7

---

 
| Test n | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**View**||||||
| 1 | Select all | Open three dot button  | Select all appears<br>Select inverse appears | P t7|  |
| 2 | Select all items | Select all items manually | Select all does not appear<br>Select inverse appears | P t7 |  |
| 3 | Empty folder | 1. Enter on a empty folder<br>2. Tap on three-dot-button| Select all does not appear<br>Select inverse does not appear | P t7 |  |
|**Action**||||||
| 4 | Select All | 1. Long press to enter multiselection mode<br>2. Tap on "Select all" | All items selected | P t7|  |
| 5 | Select inverse | 1. In a folder with several items, select some items, but not all of them<br>3. Tap on "Select inverse" | All items selected, but the one selected in step 1. | F t7 | List is sorted |
| 6 | Select inverse recursive | 1. In a folder with several items, select some items, but not all of them<br>3. Tap on "Select inverse", then "all" and "inverse" again | No items selected | F t7 | Only items selected in 1. are selected |




