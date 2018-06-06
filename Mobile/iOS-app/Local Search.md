###  Local search

#### Pr: https://github.com/owncloud/ios-app/pull/64

Devices:<br>
Server:

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait  | Open File List | Search bar correctly displayed |  |  |  |
| Landscape | Open File List | Search bar correctly displayed |  |  |  |
|**Actions**||||||
| No matches | Search with a pattern taht not matches in the file list |  |  |
| One character | Type one character | Only displayed files names with this character | | |
| Item name | Type the exact name of a item | Only this item displayed | | |
| Browse | Perform a first search<br>Browse into a folder | Searching bar is reset | | |
