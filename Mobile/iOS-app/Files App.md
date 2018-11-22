#### Files App integration

#### PRs: https://github.com/owncloud/ios-app/pull/67<br>


Device/s: iPhoneX v12, iPadAir v12<br>
Server: 10.0.10

Number of tests: <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------: |
|**Files App**||||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m12 t12 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m12 t12 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P t12 m12|  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P t12 m12|  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m12 t12 | FIXED: Fails with zip. A bit inestable. |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m12 t12 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m12 t12 |  |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app | P m12 t12 |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | P m12 t12 | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m12 t12 |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m12 t12|  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m12 t12 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m12 t12 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m12 t12 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | F m12 t12 | Fails for folders |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | F m12 t12 | Failed for folders |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 t12 | |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 t12 | |
| Item info | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 t12| |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P t12 m12 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P t12 m12 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P t12 m12 | with an docx file |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | F t12 m12 | File is empty. Only in root folder |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | F m12 t12 | File is empty.  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m12 t12 |  |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC | F m12 |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted |  |  |
|**Remote actions**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P t12 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | P t12 |  |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | P t12 |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app | P t12 |  |
|**Error handling**||||||
| Lack of connection | Operations to perform in Files app with no connection: rename, duplicate,  move, delete, download | Correct error | F m12 | Will be handled in offline SDK |
| Lack of server connection | Operations to perform in Files app with no server connection: rename, move, delete, download | Correct error | P m12 | Correctly recovered |
| Maintenance mode | Operations to perform in Files app with maintenance mode: rename, move, delete, download | Correct error | NA | To be handled in maintenance issue |
| Target folder deleted | Operations to perform in Files app after deleting target folder: create folder, move, copy | Correct error | P m12 | Difficult to reproduce, inmmediatly deleted |