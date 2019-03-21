#### Drag & Drop from other apps

#### Pr: https://github.com/owncloud/ios-app/pull/318

Device: iPhoneX v12, iPadAir v12

---

 
| Test Case| Steps | Expected Result | Result | Related Comment
| :------------- | :------------- | :-------------- | :-----: | :------
|**Actions in the app**|
| Move one file | Drag a file and move to another folder | Correctly moved (check both orientations) | F m12 t12 | Files not dragged |
| Move several files | Drag several files and move to another folder | Correctly moved (check both orientations)| F m12 t12 | Files not dragged |
| Move one folder | Drag a folder and move to another folder | Correctly moved (check both orientations)| |  |
| Move several folder | Drag several folders and move to another folder | Correctly moved (check both orientations)| |  |
| Delete one file | Drag a file and delete it | Correctly deleted (check both orientations)| F m12 t12 | Files not dragged |
| Delete several files | Drag several files and delete them | Correctly deleted (check both orientations)| F m12 t12| Files not dragged |
| Delete one folder | Drag a folder and delete it | Correctly deleted (check both orientations)| |  |
| Delete several folder | Drag several folders and delete them | Correctly deleted (check both orientations)| |  |
| Move several items | Drag several files and folders and move to another folder | Correctly moved (check both orientations)| F m12 t12 | Files not dragged |
| Delete several items | Drag several files and folders and delete them | Correctly deleted (check both orientations)| F m12 t12 | Files not dragged |
|**From other apps**|
| Move one file to root| Drag a file from another app and move to root | Correctly moved (check both orientations) | P t12 |  |
| Move one file to non-root| Drag a file from another app and move to non-root | Correctly moved (check both orientations) | P t12 |  |
| Move several files | Drag several file from another app and move to root | Correctly moved (check both orientations) | P t12 |  |
| Move one folder to root| Drag a folder from another app (Files App) and move to root | Correctly moved (check both orientations) | |  |
| Move one folder to non-root| Drag a folder from another app and move to non-root | Correctly moved (check both orientations) | |  |
| Move several folders | Drag several folders from another app and move to root | Correctly moved (check both orientations) | |  |