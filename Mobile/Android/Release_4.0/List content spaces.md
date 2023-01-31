### List content of Spaces + Some operations


#### PR: 

**Devices**: Samsung A51 Android12<br>
**Server**: 10.11


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Personal**||||
| Root empty | 1. Enter in personal space of oCIS account, with no content inside<br>2. Set grid mode | 1. Empty view placeholder displayed in both orientations.<br>2. Empty view placeholder displayed in both orientations.| P m12 |  |
| Root non empty | 1. Enter in personal space of oCIS account, with content inside<br>2. Set grid mode | 1. Content displayed in both orientations. Compare with server<br>2. Content displayed in both orientations. Compare with server | P m12 |  |
| Non-root empty | 1. Enter in personal space of oCIS account.<br>2. In web, create new folder<br>3. In app, browse to the folder | Empty view placeholder displayed in both orientations | P m12 |  |
| Non-root non empty | 1. Enter in personal space of oCIS account.<br>2. In web, create new folder and add some content inside<br>3. In app, browse to the folder | Content displayed in both orientations. Compare with server | P m12 |  |
| Deep structure | 1. Enter in personal space of oCIS account.<br>2. In web, create new folder structure A/B/C/D/E/F and add files and folders inside every depth-level<br>3. In app, browse through the folder structure | Content displayed in both orientations. Compare with server | P m12 |  |
| Footer root | 1. Enter in personal space of oCIS account.<br>2. In web, add two files and two folders to root | App shows correct footer: `2 files, 2 folders` | P m12 |  |
| Footer non-root | 1. Enter in personal space of oCIS account.<br>2. In web, create a new folder and add two files and two folders inside | App shows correct footer inside the folder: `2 files, 2 folders` | P m12 |  |
| Refresh root | 1. Enter in custom space of OCIS account<br>2. In web, add new content to root folder<br>3. In app, pull to refresh in root<br>4. In web remove content from root folder<br>5. In app, pull to refresh in root | 3. New items displayed in root<br>5. Items removed from root |P m12
| Refresh non-root | 1. Enter in custom space of OCIS account<br>2. In web, add new content to non-root folder<br>3. In app, pull to refresh in non-root<br>4. In web remove content from non-root folder<br>5. In app, pull to refresh in non-root | 3. New items displayed in non-root<br>5. Items removed from non-root |P m12
| Create folder root | In personal space, create a folder with correct name in root folder | Folder created, check in server |P m12 | | 
| Create folder non-root | In personal space, create a folder with correct name in non-root folder | Folder created in correct place, check in server |P m12 | | 
| Rename item | In a custom space, rename any item with a correct name |Item renamed, check in server | P m12| | 
| Rename item used name | In personal space, rename any item with a name already used |Correct error |P m12 | | 
| Remove item | 1. In personal space, remove any item from root folder<br>2. Remove another item from non-root folder  | 1. Item removed, check in server<br>2. Item removed, check in server | P m12 | | 
|**Custom space**||||
| Root empty | 1. Enter in custom space of oCIS account, with no content inside<br>2. Set grid mode | 1. Empty view placeholder displayed in both orientations. Image space and title displayed above the list. Space name on the top bar<br>2. Empty view placeholder displayed in both orientations.| P m12 |  |
| Root non empty | 1. Enter in custom space of oCIS account, with content inside.<br>2. Set grid mode | 1. Content displayed in both orientations. Space image and title dislayed above the list. Compare content with server<br>2. Content displayed in both orientations. Compare with server |  P m12 |  |
| Non-root empty | 1. Enter in custom space of oCIS account.<br>2. In web, create new folder<br>3. In app, browse to the folder | Empty view placeholder displayed in both orientations |  P m12 |  |
| Non-root non empty | 1. Enter in custom space of oCIS account.<br>2. In web, create new folder and add some content inside<br>3. In app, browse to the folder | Content displayed in both orientations. Compare with server |  P m12 |  |
| Long name and description | 1. Using the web, set a very long title and subtitle for a space<br>2. Open the space in the app | Long title and subtitle displayed on the top of the root in a proper way (...)|  P m12 |  |
| Deep structure | 1. Enter in custom space of oCIS account.<br>2. In web, create new folder structure A/B/C/D/E/F and add files and folders inside every depth-level<br>3. In app, browse through the folder structure | Content displayed in both orientations. Compare with server   |  P m12 | |
| Footer root | 1. Enter in custom space of oCIS account.<br>2. In web, add two files and two folders to root | App shows correct footer: `2 files, 2 folders` |  P m12 |  |
| Footer non-root | 1. Enter in personal space of oCIS account.<br>2. In web, create a new folder and add two files and two folders inside | App shows correct footer inside the folder: `2 files, 2 folders` |   P m12|  |
| Refresh root | 1. Enter in custom space of OCIS account<br>2. In web, add new content to root folder<br>3. In app, pull to refresh in root<br>4. In web remove content from root folder<br>5. In app, pull to refresh in root | 3. New items displayed in root<br>5. Items removed from root | P m12
| Refresh non-root | 1. Enter in custom space of OCIS account<br>2. In web, add new content to non-root folder<br>3. In app, pull to refresh in non-root<br>4. In web remove content from non-root folder<br>5. In app, pull to refresh in non-root | 3. New items displayed in non-root<br>5. Items removed from non-root | P m12
| Switch space | 1. Enter in a custom space of oCIS account, with content inside.<br>2. Click on Spaces tab on the bottom bar<br>3. Select another space<br>4. Switch to personal | 1. Content of the space displayed<br>2. List of spaces displayed<br>3. Content of the space displayed<br>4. Content of personal displayed| P m12 |  |
| Create folder root | In a custom space, create a folder with correct name in root folder | Folder created, check in server | P m12| | 
| Create folder non-root | In a custom space, create a folder with correct name in non-root folder | Folder created in correct place, check in server | P m12| | 
| Rename item | In a custom space, rename any item with a correct name |Item renamed, check in server | P m12| | 
| Rename item used name | In a custom space, rename any item with a name already used |Correct error | P m12 | FIXED: Allowed when not| 
| Remove item | 1. In a custom space, remove any item from root folder<br>2. Remove another item from non-root folder  | 1. Item removed, check in server<br>2. Item removed, check in server | P m12 | | 
|**oC10**| Regression |||
| Root empty | 1. Enter in oC10 account, with no content inside<br>2. Set grid mode | 1. Empty view placeholder displayed in both orientations.<br>2. Empty view placeholder displayed in both orientations.| P m12 |  |
| Root non empty | 1. Enter in oC10 account, with content inside<br>2. Set grid mode | 1. Content displayed in both orientations. Compare with server<br>2. Content displayed in both orientations. Compare with server | P m12 |  |
| Non-root empty | 1. Enter in oC10 account<br>2. In web, create new folder<br>3. In app, browse to the folder | Empty view placeholder displayed in both orientations | P m12 |  |
| Non-root non empty | 1. Enter in oC10 account<br>2. In web, create new folder and add some content inside<br>3. In app, browse to the folder | Content displayed in both orientations. Compare with server | P m12 |  |
| Deep structure | 1. Enter in oC10 account<br>2. In web, create new folder structure A/B/C/D/E/F and add files and folders inside every depth-level<br>3. In app, browse through the folder structure | Content displayed in both orientations. Compare with server | P m12 |  |
| Footer root | 1. Enter in oC10 account<br>2. In web, add two files and two folders to root | App shows correct footer: `2 files, 2 folders` | P m12 |  |
| Footer non-root | 1. Enter in oC10 account<br>2. In web, create a new folder and add two files and two folders inside | App shows correct footer inside the folder: `2 files, 2 folders` | P m12 |  |
