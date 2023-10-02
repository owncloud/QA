### Shared link shortcut

#### PR: https://github.com/owncloud/android/pull/2705

Devices: Samsung Galaxy S9 v9, Nexus 6P v7<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| File | Create a link over a file<br>Open Shared links shortcut | Path, size and date are there | P m9 m7|  |
| Folder | Create a link over a folder<br>Open Shared links shortcut | Path, size and date are there | P m9 m7|  |
| Orientation | After 1. and 2. change device orientation | Check that everything is correct in both orientations | P m9 m7|  |
|**Sorting**||||
| Sort name asc | Create several links<br>Open shared by link shortcut<br>Sort by name asc | Correctly sorted | P m9 m7|  |
| Sort name desc | Create several links<br>Open shared by link shortcut<br>Sort by name desc | Correctly sorted | P m9 m7|  |
| Sort date asc | Create several links<br>Open shared by link shortcut<br>Sort by date asc | Correctly sorted | P m9 m7|  |
| Sort date desc | Create several links<br>Open shared by link shortcut<br>Sort by date desc | Correctly sorted | P m9 m7|  |
| Sort size asc | Create several links<br>Open shared by link shortcut<br>Sort by size asc | Correctly sorted | P m9 m7 | FIXED: With 0B files, sorting is not correct |
| Sort size desc | Create several links<br>Open shared by link shortcut<br>Sort by size desc | Correctly sorted | P m9 m7 | FIXED: With 0B files, sorting is not correct |