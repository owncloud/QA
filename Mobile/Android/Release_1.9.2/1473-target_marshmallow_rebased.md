###  Marshmallow rebased & copy while renaming files 

#### Pr: https://github.com/owncloud/android/pull/1473 

Devices:  Samsung Galaxy S3 Android4 (m4a), HTC One Android4 (m4b) Motorola E v4.4.4 (m4c), Nexus7 v4, Nexus5 v5, Tablet Nexus 10 Android5, Tablet Nexus9 Android6

Server: v8.2.2, v9

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :-----:| :-------------- |
|**Menu**||||||
| 1 | Menu visible portrait  |  1. Select to rename a file/folder<br>2. Long press on the name | The edit menu (cut/paste...) is shown and all options can be tapped  | P m4a m4b m4c m5 t4 t5 |  |
| 2 | Menu visible landscape  |  1. Select to rename a file/folder<br>2. Long press on the name | The edit menu (cut/paste...) is shown and all options can be tapped  | P m4a m4b m4c m5 t4 t5 |  |
|**Accept Writing**| **v6**|||||
| 3 | Portrait  |  1. Install the app from scratch and login<br>2. Accept the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can be performed | P t6 |  |
| 4 | Landscape  |  1. Install the app from scratch and login<br>2. Accept the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can be performed | P t6 |  |
|**Deny Writing**| **v6**|||||
| 5 | Portrait  |  1. Install the app from scratch and login<br>2. Deny the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can not be performed | P t6 |  |
| 6 | Landscape  |  1. Install the app from scratch and login<br>2. Deny the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can not be performed | P t6 |  |