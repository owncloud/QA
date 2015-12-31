### Create a folder also creates another folder with duplicate name 

#### Pr: https://github.com/owncloud/ios/pull/530 

Device m9: iPhone iOS 9   

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
| 1 |Create folder     | Select create a new folder |   Folder is created and in the local file system only is created this folder.    | p(m9)
| 2 | Create folder from share in     | 1.Select to share a file from camera<br>2.Select destination folder<br>3.Create a new folder<br>4.Select to uplad file to this new folder |   4.Folder is created, in the local file system only is created this folder, and the photo is uploaded to this folder   |   p(m9)
| 3 | Create folder from share with     | 1.Drag&drop a file to simulator<br>2.Select change destination folder<br>3.Create new folder<br>4.Select to upload file to this new folder|   4.Folder is created, in the local file system only is created this folder, and the file is uploaded to this folder   | p(m8)
| 4 | Create folder when move     |  1.Select to move a file<br>2.Select create new folder<br>3.Select to move to this new folder |   3.Folder is created, in the local file system only is created this folder, and the file is moved to this folder  | p(m9) 
