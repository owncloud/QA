#### Propagation 

#### PRs: https://github.com/owncloud/ios-app/pull/132

Devices: iPadAit v12
Server: 10.0.10

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Files App -> app**||||||
| Create folder | Create folder in Files App | Folder is created in app | P t12 | Sometimes glitches | |
| Rename file | Rename file in Files App | File is renamed in app | P t12 | | |
| Rename folder | Rename folder in Files App | Folder is renamed in app | P t12 | | |
| Duplicate file | Duplicate file in Files App | File is duplicated in app | P t12 | | |
| Duplicate folder | Duplicate folder in Files App | Folder is duplicated in app | F t12 |  Do not finish | |
| CopyPaste file same folder | CopyPaste file in Files App to the same folder  | File is duplicated in app | P t12 | | |
| CopyPaste folder same folder | CopyPaste folder in Files App to the same folder | Folder is duplicated in app | P t12 | | |
| CopyPaste file other folder | CopyPaste file in Files App to other folder  | File is copied in app | P t12 | | |
| CopyPaste folder other folder | CopyPaste folder in Files App to other folder | Folder is copied in app | F m12 | Do not finish - iOS problem | |
| Move file other folder | Move file in Files App to other folder  | File is moved in app | P t12 | | |
| Move several files other folder | Move several file in Files App to other folder  | Files are moved in app | P t12 | | |
| Move folder other folder | Move folder in Files App to other folder | Folder is moved in app | P t12 | | |
| Delete file  | Delete file in Files App  | File is deleted in app | P t12 | | |
| Delete folder | Delete folder in Files App | Folder is deleted in app | P t12 | | |
|**App -> Files App**||||||
| Create folder | Create folder in app | Folder is created in Files App | P t12 | FIXED: No propagation always | |
| Rename file | Rename file in app | File is renamed in Files App | P t12 | | |
| Rename folder | Rename folder in app | Folder is renamed in Files App | P t12 | | |
| Duplicate file | Duplicate file in app | File is duplicated in Files App | P t12 | | |
| Duplicate folder | Duplicate folder in app | Folder is duplicated in Files App | P t12 | | |
| Move file other folder | Move file in app to other folder  | File is moved in Files App | P t12 | | |
| Move several files other folder | Move several file in app to other folder  | Files are moved in Files App | P t12 | | |
| Move folder other folder | Move folder in app to other folder | Folder is moved in Files App | P t12 | | |
| Delete file  | Delete file in app  | File is deleted in Files App | P t12 | | |
| Delete folder | Delete folder in app | Folder is deleted in Files App | P t12 | | |