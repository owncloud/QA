###  Overwritten files when copy

#### Pr: https://github.com/owncloud/android/pull/2734

Devices:  Xiaomi MiA2 v9, Nexus 6P v7<br>
Server: 10.3

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| Copy file twice | Copy a file to the same target folder, twice | Both versions in the folder, not overwritten | P m9 m7 | FIXED: Bad file name.  |
| Copy + move file | Copy a file to the same target folder, then move | Both versions in the folder, not overwritten | P m9 m7 |  |
| Copy folder twice | Copy a folder to the same target folder, twice | Both versions in the targetfolder, not overwritten | P m9 m7 |  |
| Copy + move folder | Copy a folder to the same target folder, then move | Both versions in the target folder, not overwritten | P m9 m7 |  |
| Copy a shared item | Copy a shared file to the same target folder, then move | Moved file keeps shared, copied one doesn't | P m9 m7|  |
| Copy an av. offline item | Copy an av. offline file to the same target folder, then move | Moved file keeps av. offline, copied doesn't | P m9 m7 |
