###  Local search

#### Pr: https://github.com/owncloud/android/pull/2274

Device: Samsung Galaxy Edge S7 v7, Samsung Galaxy Tab S2 v6, Nexus 6P v7<br>
Server: 10.0.9

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| Portrait  | Open File List | Search bar correctly displayed | P m7 t6|  FIXED: Message too long |
| Landscape | Open File List | Search bar correctly displayed | P m7 t6 |  |  |
|**Actions**||||||
| No matches | Search with a pattern that not matches in the file list | No matches | P m7 t6 |
| One character | Type one character | Only displayed files names with this character |  P m7 t6 | |
| Special character | Type one special character | Only displayed files names with this character | P m7 t6 | |
| Blank | Type one blank | Only displayed files names with blanks | P m7 t6 | |
| Item name | Type the exact name of a item | Only this item displayed | P m7 t6| |
| Browse | Perform a first search<br>Browse into a folder | Searching bar is reset | P m7 t6| FIXED: Keeps filter | |
| Browse back | Perform a first search<br>Browse into a folder<br>Browse back | Searching bar is reset | P m7 t6| FIXED: Keeps filter |
