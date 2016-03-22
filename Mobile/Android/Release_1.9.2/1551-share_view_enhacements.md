###  Share view enhacements 

#### Pr: https://github.com/owncloud/android/pull/1551

Devices: Nexus 5 v5.0.1, Nexus 7 v4.0.3

Server:
OC 9.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Share view | Open the share view |  All components are correct: share with users/groups, share by link in both orientations | P T4, M5 |  |
| 2 | Search view | Open the share view and share a file/folder with users and gruops|  Material design is correctly shown for both users and groups in search view  | P T4, M5 |  |
| 3 | User/groups icon | Open the share view and share a file/folder with users and gruops|  Material design is correctly shown for both users and groups.  |  |  |
| 4 | Privileges view file | Open the share view and share a file with users or groups. Tap on '>'| The options "Can edit" and "Can share" are shown correctly in both orientations  |  |  |
| 5 | Privileges view folder | 1. Open the share view and share a folder with users or groups. Tap on '>'<br>2. Enable "Can Edit"| The options "Can edit" and "Can share" are shown correctly in both orientations.<br>2. The three suboptions "create", "change" and "delete" are displayed correctly in both orientations.   |  |  |
| 6 | Share by link | Open the share view and share a file by link. Tap on '>'| The options "Expiration date", "Password secure" are shown correctly in both orientations, as the views for choosing the date and the password. |  |  |
|**Smoke test**||||||
| 1 | Share users | Share a file and a folder with users | Share correct. Check that sharees can see the content |  |  |
| 2 | Share groups | Share a file and a folder with groups | Share correct. Check that sharees can see the content |  |  |
| 3 | Share by link with passw | Share a file and a folder by link | Share correct. Check that the link is available |  |  |
| 4 | Share by link with date | Share a file and a folder by link | Share correct. Check that the link is available |  |  |
| 5 | Share with privileges | Share a file and a folder with privileges | Share correct. Check that sharees can see the content with the granted privileges. |  |  |
