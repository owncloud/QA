###  Local search

#### Pr: https://github.com/owncloud/android/pull/2274
---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait  | Open File List | Search bar correctly displayed | |  |  |
| Landscape | Open File List | Search bar correctly displayed | |  |  |
| Pull down | Pull down in file list | Search bar correctly displayed | | |  |
|**Actions**||||||
| No matches | Search with a pattern that not matches in the file list | No matches |  |
| One character | Type one character | Only displayed files names with this character | | |
| Special character | Type one special character | Only displayed files names with this character | | |
| Blank | Type one blank | Only displayed files names with blanks | | |
| Item name | Type the exact name of a item | Only this item displayed | | |
| Browse | Perform a first search<br>Browse into a folder | Searching bar is reset | |  |
| Browse back | Perform a first search<br>Browse into a folder<br>Browse back | Searching bar is reset |  |  |
