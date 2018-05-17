#### Download and av. offline icons

#### PR: https://github.com/owncloud/android/pull/2152


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: |
|**Set**||||||
| 1 | Download file | Download a file | Green arrow with bar underneath over the file |  |  |
| 2 | Av. offline file | Set a file as av. offline | Pink tick over the file |  |  |
| 3 | Download folder | Download a folder | Green arrow with bar underneath over all files into the folder |  |  |
| 4 | Av. offline folder | Set a folder as av. offline | Pink tick over the folder icon and all its content |  |  |
| 5 | Syncing file | Download a file | While it is being downloaded, blue circle over the file |  |  |
| 6 | Syncing folder | Download a folder | While it is being downloaded, blue circle over the folder |  |  |
|**Unset**||||||
| 7 | Remove locally file | Download a file and then, remove it locally | Green arrow with bar underneath removed |  |  |
| 8 | Av. offline file | Set a file as av. offline and then, unset it | Pink tick over the file removed. Ggreen arrow instead |  |  |
| 9 | Download folder | Download a folder and then, remove it locally | Green arrow with bar underneath over all files into the folder removed |  |  |
| 10 | Av. offline folder | Set a folder as av. offline and then, unset it | Pink tick over the folder icon and all its content removed. Green arrow instead |  |  |
|**New version & Conflict**||||||
| 11 | New version file | 1. In web UI, upload a new version of a file<br>2. In app, pull down | File is marked with new version |  |  |
| 12 | Conflict file | 1. Switch device connection off<br>2. In web UI, upload a new version of a file<br>3. In app, edit the same file<br>4. Switch device connection on | File is marked with conflict |  |  |
| 13 | Conflict folder | Same steps as 13. with a file into a folder | Folder is marked with conflict |  |  |
