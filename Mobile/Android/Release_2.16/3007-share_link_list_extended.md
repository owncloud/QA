###  Extend share link list

#### Pr: https://github.com/owncloud/android/pull/3007

Devices: Pixel2 v11<br>
Server: 10.5

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- | 
|**Root**|||||
| Folder & Files | Create public links only in root over files and folders<br>Open links shortcut| All the created links are there | P m11 |  |  |
| Link folder inside a folder| Create a public link in a folder in root, that contains another folder<br>Open folder, and create a link on the folder inside<br>Open links shortcut| Both are listed there | P m11 |  |  |
| Link several folders inside a folder| Create a public link in a folder in root, that contains several folders<br>Open folder, and create links on every folder inside<br>Open links shortcut| All are listed there | P m11 |  |  |
| Link file inside a folder| Create a public link in a folder in root, that contains a file<br>Open folder, and create a link on the file inside<br>Open links shortcut| Both are listed there | P m11 |  |  |
| Link several files inside a folder| Create a public link in a folder in root, that contains several files<br>Open folder, and create links on every file inside<br>Open links shortcut| All are listed there | P m11 |  |  |
|**Non Root**|||||
| Folder & Files | Create public links only in non-root folder over files and folders<br>Open links shortcut| All the created links are there | P m11 |  |  |
| Link folder inside a non-root folder| Create a public link in a folder in root, that contains another folder<br>Open folder, and create a link on the folder inside<br>Open links shortcut| Both are listed there | P m11 |  |  |
| Link several folders inside a non-root folder| Create a public link in a folder in root, that contains several folders<br>Open folder, and create links on every folder inside<br>Open links shortcut| All are listed there | P m11 |  |  |
| Link file inside a non-root folder| Create a public link in a folder in root, that contains a file<br>Open folder, and create a link on the file inside<br>Open links shortcut| Both are listed there | P m11 |  |  |
| Link several files inside a non-root folder| Create a public link in a folder in root, that contains several files<br>Open folder, and create links on every file inside<br>Open links shortcut| All are listed there | P m11 |  |  |
|**Actions**|||||
| Create new link | Create public link on any item<br>Open links shortcut<br>Select the item and create a new link| Item is in the list, and contains the new link | P m11 |  |  |
| Delete link root| Create public link on any item in root<br>Open links shortcut<br>Select the item and delete the link| Item is not in the list anymore | P m11 |  |  |
| Delete link non-root| Create public link on any item in non-root<br>Open links shortcut<br>Select the item and delete the link| Item is not in the list anymore | NA | TO DO: Item in the list till containing folder is browsed |  |
