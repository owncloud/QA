### Av. offline shortcut - extended info

#### PR: https://github.com/owncloud/android/pull/2654

Devices: Nexus 5X v8, Pixel2 v10<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| File |Set a file as av.offline<br>Open av. off shortcut | Path, size and date are there | P m8 m10 |  |
| Folder |Set a folder as av.offline<br>Open av. off shortcut | Path, size and date are there | P m8 m10|  |
| Orientation |Set a folder and file as av.offline<br>Open av. off shortcut | Check that everything is correct in both orientations | P m8 m10|  |
|**Sort (regression)**||||
| Sort name asc | Set a folder and file as av.offline<br>Open av. off shortcut<br>Sot by name asc | Correctly sorted | P m8 m10|  |
| Sort name desc | Set a folder and file as av.offline<br>Open av. off shortcut<br>Sot by name desc | Correctly sorted | P m8 m10|  |
| Sort date asc | Set a folder and file as av.offline<br>Open av. off shortcut<br>Sot by date asc | Correctly sorted | P m8 m10|  |
| Sort date desc | Set a folder and file as av.offline<br>Open av. off shortcut<br>Sot by date desc | Correctly sorted | P m8 m10|  |
| Sort size asc | Set a folder and file as av.offline<br>Open av. off shortcut<br>Sot by size asc | Correctly sorted | P m8 m10|  |
| Sort size desc | Set a folder and file as av.offline<br>Open av. off shortcut<br>Sot by size desc | Correctly sorted | P m8 m10|  |