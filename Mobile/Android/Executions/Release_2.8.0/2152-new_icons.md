#### Download and av. offline icons

#### PR: https://github.com/owncloud/android/pull/2152

Devices: Nexus6P v7, Samsung Galaxy Tab S2 v6
Server: 10.0.8


---

 
| Test Case | Description | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: | :-------- |
|**Set**||||||
| 1 | Download file | Download a file | Green arrow with bar underneath over the file | P m7 t6|  |
| 2 | Av. offline file | Set a file as av. offline | Pink tick over the file | P m7 t6 |  |
| 3 | Download folder | Download a folder | Green arrow with bar underneath over all files into the folder | P m7 t6|  |
| 4 | Av. offline folder | Set a folder as av. offline | Pink tick over the folder icon and all its content | P m7 t6 | FIXED: Without mark |
| 5 | Syncing file | Download a file | While it is being downloaded, blue circle over the file | P m7 t6 |  |
| 6 | Syncing folder | Download a folder | While it is being downloaded, blue circle over the folder | P m7 t6 |  |
|**Unset**||||||
| 7 | Remove locally file | Download a file and then, remove it locally | Green arrow with bar underneath removed | P m7 t6 |  |
| 8 | Av. offline file | Set a file as av. offline and then, unset it | Pink tick over the file removed. Ggreen arrow instead | P m7 t6 |  |
| 9 | Download folder | Download a folder and then, remove it locally | Green arrow with bar underneath over all files into the folder removed | P m7 t6 |  |
| 10 | Av. offline folder | Set a folder as av. offline and then, unset it | Pink tick over the folder icon and all its content removed. Green arrow instead | P m7 t6 |  |
|**New version & Conflict**||||||
| 11 | New version file | 1. In web UI, upload a new version of a file<br>2. In app, pull down | File is marked with new version | NA |  |
| 12 | Conflict file | 1. Switch device connection off<br>2. In web UI, upload a new version of a file<br>3. In app, edit the same file<br>4. Switch device connection on | File is marked with conflict | P m7 t6 |  |
| 13 | Conflict folder | Same steps as 13. with a file into a folder | Folder is marked with conflict | P m7 t6 |  |
