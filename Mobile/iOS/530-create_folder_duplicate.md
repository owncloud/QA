### Create a folder also creates another folder with duplicate name 

#### Pr: https://github.com/owncloud/ios/pull/530 

Device m9: iPhone iOS 9   

---

 
| Test case     | Steps           | Expected behavior | Passed / failed |
|:------------- |:---------------:| -------------:|-------------:|
| Create folder     | Select create a new folder |   Folder is created and in the local file system only is created this folder.    | p(m9)
| Create folder from share in     | 1.Select to share a file from camera<br>2.Select create a new folder<br>3.Select this folder to uplad |   3.Folder is created, in the local file system only is created this folder, and the photo is uploaded to this folder   |   
| Create folder from share with     | 1.Select to share a file from camera with share with<br>2.Select create a new folder<br>3.Select this folder to uplad |   3.Folder is created, in the local file system only is created this folder, and the photo is uploaded to this folder   | 
| Create folder from document provider     |  |     | 
