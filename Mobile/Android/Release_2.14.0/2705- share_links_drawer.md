### Shared link shortcut

#### PR: https://github.com/owncloud/android/pull/2705

Devices: Samsung Galaxy S9 v9<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| File | Create a link over a file<br>Open Shared links shortcut | Path, size and date are there | P m9 |  |
| Folder | Create a link over a folder<br>Open Shared links shortcut | Path, size and date are there | P m9 |  |
| Orientation | After 1. and 2. change device orientation | Check that everything is correct in both orientations | P m9 |  |
|**Sorting**||||
| Sort name asc | Create several links<br>Open shared by link shortcut<br>Sort by name asc | Correctly sorted |  |  |
| Sort name desc | Create several links<br>Open shared by link shortcut<br>Sot by name desc | Correctly sorted |  |  |
| Sort date asc | Create several links<br>Open shared by link shortcut<br>Sort by date asc | Correctly sorted |  |  |
| Sort date desc | Create several links<br>Open shared by link shortcut<br>Sort by date desc | Correctly sorted |  |  |
| Sort size asc | Create several links<br>Open shared by link shortcut<br>Sort by size asc | Correctly sorted |  |  |
| Sort size desc | Create several links<br>Open shared by link shortcut<br>Sort by size desc | Correctly sorted |  |  |