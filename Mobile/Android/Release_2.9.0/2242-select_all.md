#### Select All & Select Inverse

#### Pr: https://github.com/owncloud/android/pull/2242

Server: 10.0.9<br>
Device: Nexus 5X v8, Nexus 9 v7

---

 
| Test n | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**View**||||||
| 1 | No multiselection mode | With no multiselection mode, tap on three-dot-button (check both orientations) | Select all appears<br>Select inverse does not appear | P m8 t7 |  |
| 2 | Select items (not all) | 1. Long press on an item to enable multiselection mode<br>2. Tap on three-dot-button | Select all appears<br>Select inverse appears | P m8 t7|  |
| 3 | Select all items | 1. Long press on an item to enable multiselection mode<br>2. Select all items manually | Select all does not appear<br>Select inverse appears | P m8 t7 |  |
| 4 | Empty folder | 1. Enter on a empty folder<br>2. Tap on three-dot-button| Select all does not appear<br>Select inverse does not appear | P m8 t7 | FIXED: Select all appears |
|**Action**||||||
| 5 | Select All No multiselection | 1. Tap on three-dot-button with no multiselection<br>2. Tap on "Select all" | All items selected | P m8 t7 |  |
| 6 | Select All multiselection | 1. Long press to enter multiselection mode<br>2. Tap on "Select all" | All items selected | P m8 t7|  |
| 7 | Select inverse I | 1. In a folder with several items, long press to enter multiselection mode<br>2. Select some items, but not all of them<br>3. Tap on "Select inverse" | All items selected, but the one selected in step 1. | P m8 t7 |  |
| 8 | Select inverse II | 1. In a folder with several items, long press to enter multiselection mode<br>2. Select all items manually<br>3. Tap on "Select inverse" | Out of multiselection mode | P m8 t7|  |

