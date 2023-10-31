###  Sorting

#### Pr: https://github.com/owncloud/ios-app/pull/55

Devices: iPhone 6S Plus v11<br>
Server: 10.0.8

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait  | Open File List | Sort menu correctly displayed | P m11 t11|  |  |
| Landscape | Open File List | Sort menu correctly displayed | P m11 t11 |  |  |
|**Actions**||||||
| Sort by A-Z | Set a file list with many items<br>Sort by A-Z the file list<br>Rename some files | List of files correctly sorted | P m11 t11| FIXED: crash in iPad |
| Sort by Z-A | Set a file list with many items<br>Sort by Z-A the file list<br>Rename some files | List of files correctly sorted | P m11 t11| |
| Sort by date | Set a file list with many items<br>Sort by date the file list<br>Update some files | List of files correctly sorted | P m11 t11| |
| Sort by type | Set a file list with many items<br>Sort by type the file list | List of files correctly sorted | P m11 t11 | 
| Sort by size | Set a file list with many items<br>Sort by size the file list<br>Upload or remove content to some folder | List of files correctly sorted | P m11 t11 | 
|**Empty List**||||||
| Sort by all types | Browse through an empty folder<br>Select all kind of sorting | Nothing happens | NA | Not posible, if there is no content, no sorting | |  