###  Local search

#### Pr: https://github.com/owncloud/ios-app/pull/64

Devices: iPhone 6SPlus v11, iPadAir v11<br>
Server: 10.0.8

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait  | Open File List | Search bar correctly displayed | P m11 t11 |  |  |
| Landscape | Open File List | Search bar correctly displayed | P m11 t11 |  |  |
|**Actions**||||||
| No matches | Search with a pattern that not matches in the file list | No matches | P m11 t11 |
| One character | Type one character | Only displayed files names with this character | P m11 t11| |
| Special character | Type one special character | Only displayed files names with this character | P m11 t11| |
| Blank | Type one blank | Only displayed files names with blanks | P m11 t11| |
| Item name | Type the exact name of a item | Only this item displayed | P m11 t11| |
| Browse | Perform a first search<br>Browse into a folder | Searching bar is reset | P m11 t11 | |
