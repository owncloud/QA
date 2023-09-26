###  Permalink 

#### Pr: https://github.com/owncloud/android/pull/1978 

Devices: Samsung Galaxy S7 Edge v7, Galaxy Tab S2 v5

Server: v10, v9


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | File | 1. Copy a permalink of a shared file (portrait)<br>2. Share it   | Correct access to the link | P m7 t5 |  |
| 2 | Folder | 1. Copy a permalink of a shared file<br>2. Share it   | Correct access to the link | P m7 t5 |  |
| 3 | Hint | Long tap on the permalink (both orientations) | Hint is correctly displayed | P m7 t5 |  |
| 4 | Landscape | Set the device in landscape  | Permalink is correctly displayed | P m7 t5 |  |
| 5 | Long filename | Set a long file name  | Permalink is correctly displayed | P m7 t5 |  |
| 6 | Delete file | 1. Open Share view<br>2. In server, delete the file<br>3. Tap on permalink | Link does not exist | P m7 t5 |  |
