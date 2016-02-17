###  Marshmallow rebased & copy while renaming files 

#### Pr: https://github.com/owncloud/android/pull/1473 

Devices:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :-----:| :-------------- |
|**Menu**||||||
| 1 | Menu visible portrait  |  1. Select to rename a file/folder<br>2. Long press on the name | The edit menu (cut/paste...) is shown and all options can be tapped  |  |  |
| 2 | Menu visible landscape  |  1. Select to rename a file/folder<br>2. Long press on the name | The edit menu (cut/paste...) is shown and all options can be tapped  |  |  |
|**Accept Writing**||||||
| 3 | Portrait  |  1. Install the app from scratch and login<br>2. Accept the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can be performed |  |  |
| 4 | Landscape  |  1. Install the app from scratch and login<br>2. Accept the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can be performed |  |  |
|**Deny Writing**||||||
| 5 | Portrait  |  1. Install the app from scratch and login<br>2. Deny the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can not be performed |  |  |
| 6 | Landscape  |  1. Install the app from scratch and login<br>2. Deny the permission to write | 1. A pop up is raised up to ask for writing permissions<br>2. Writing actions (downloadings, updatings on files...) can not be performed |  |  |