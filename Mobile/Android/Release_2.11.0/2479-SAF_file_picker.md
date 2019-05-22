#### SAF file picker 

#### Pr: https://github.com/owncloud/android/pull/2436

Devices: Nexus 6P v7, Nexus 5X v8 (oauth2)<br>
Server: 10.1


---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**View**|||||
| 1 | FAB option portrait | 1. Open Files/Downloads<br>2. Add one account to oC<br>3. Open again Files/Downloads | Account available in Files/Downloads  | P m7 m8 |
| 2 | FAB option landscape | 1. Open Files/Downloads<br>2. Add another account to oC<br>3. Open again Files/Downloads | Both accounts available in Files/Downloads  | P m7 m8 |
|**Actions**|||||
| 3 | Upload file other storage | 1. Select upload file<br>2. Select a file from other storage| File correctly uploaded  | P m7 m8 |
| 4 | Upload several files other storage | 1. Select upload file<br>2. Select several files  from other storage| Files correctly uploaded  | P m7 m8|
| 5 | Upload Photos | 1. Select upload file<br>2. Select one photo| Photo correctly uploaded  | P m7 |
| 6 | Upload several Photos | 1. Select upload file<br>2. Select several photos| Photos correctly uploaded  | P m7 |
| 7 | Upload file oC | 1. Select upload file<br>2. Select a file from oC (same or different account) | File correctly uploaded  | P m7 m8 |
| 8 | Upload several files oC| 1. Select upload file<br>2. Select several files from other storage| Files correctly uploaded  | P m7 m8 |
| 9 | Upload same file twice| 1. Select upload file<br>2. Select again the same file| Files correctly uploaded with a distinction number  | P m7 m8|
| 10 | Upload with no connection | 1. Select upload file with no connection in the device<br>2. Recover connection| After recovering the connection, the file is uploded  | P m7 m8|
| 11 | Upload with maintenance mode | 1. Select upload file with maintenance mode in the device<br>2. Disable maintenance mode| File is uploded  | P m7 m8|