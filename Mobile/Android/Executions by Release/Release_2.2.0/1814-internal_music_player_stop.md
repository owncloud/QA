###  Internal music player does not stop playing when file is deleted

#### Pr: https://github.com/owncloud/android/pull/1814

Device: Nexus 5 v6, Nexus 10 v5, Nexus5 v5

Server: 9.1.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Delete locally file | 1. Play a music file<br>2. Delete locally the file while is played | File is deleted and stops playing | P m6 t5 m5|  |
| 2 | Delete file | 1. Play a music file<br>2. Delete the file while is played | File is deleted and stops playing | P m6 t5 m5|  |
| 3 | Delete other file | 1. Play a music file<br>2. Delete other file in the same folder | File keeps on being played | P m6 t5 m5|  |
| 4 | Delete folder | 1. Play a music file into a folder<br>2. Delete the containing folder | File is deleted and stops playing | P m6 t5 m5| SOLVED: Music does not stop |
| 5 | Delete account | 1. Play a music file<br>2. Delete the containing account | File is deleted and stops playing | P m6 t5 m5| SOLVED: Music does not stop |
| 6 | Uninstall the app | 1. Play a music file<br>2. Uninstall the app | File is deleted and stops playing | P m6 t5 m5|  |