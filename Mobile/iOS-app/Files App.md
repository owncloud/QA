#### Files App - Download & Upload

#### PRs: https://github.com/owncloud/ios-app/pull/67<br>


Device/s: <br>
Server: 

Number of tests: <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: |
|**Files App**||||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P t12 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P t12 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P t12 |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P t12 |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | F t12 | Fails with zip. A bit inestable. |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P t12 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P t12 |  |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m12 |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m12 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m12 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m12 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | F m12 | Disconnection |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | F m12 | Disconnection |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 | |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 | |
| Item info | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P t12 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m12 | with an docx file |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | F t12 | File is empty. Only in root folder |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |  |  |
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P t12 |  |
|**Error handling**||||||
| Lack of connection | Operations to perform in Files app with no connection: rename, duplicate,  move, delete, download | Correct error |  |  |
| Lack of server connection | Operations to perform in Files app with no server connection: rename, move, delete, download | Correct error |  |  |
| Maintenance mode | Operations to perform in Files app with maintenance mode: rename, move, delete, download | Correct error |  |  |
| Target folder deleted | Operations to perform in Files app after deleting target folder: create folder, move, copy | Correct error |  |  |