#### Version 1.0.0

#### PRs: https://github.com/owncloud/ios-app/pull/<br>


Device/s: <br>
Server: 

Number of tests: <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------: |
|**Settings**||||||
| Certificate | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  |  |  |
| Logging disabled | Disable Logging| All options hidden  |  |  |
| Logging debug | 1. Enable Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging info | 1. Enable Logging with info level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging warning | 1. Enable Logging with warning level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Share file | Log is filled up |  |  |
| Logging standard error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Check standard error output | Standard output with errors |  |  |
| Reset log file | After any of the actions before, reset file  | File is empty|  |  |
| Mask private data | Enable the option Mask private data  | Log does not contain info about servers, users...|  |  |
| Help | Open Help Section  | Help web is opened |  |  |
| Send feedback | Open Send feedback section | feedback mail is opened|  |  |
| Recommend | Open Recommend section | recommend mail is opened|  |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened|  |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement y is opened|  |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent |  |  |
| Copy file | Copy a file to another location | Correctly copied |  |  |
| Copy folder| Copy a folder to another location | Correctly copied |  |  |
| Move file | Move a file to another location | Correctly moved |  |  |
| Move folder| Move a folder to another location | Correctly moved |  |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated |  |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated |  |  |
| Rename file | Rename a file | Correctly renamed |  |  |
| Rename folder| Rename a folder  | Correctly renamed |  |  |
| Delete file | Delete a file | Correctly deleted |  |  |
| Delete folder| Delete a folder  | Correctly deleted |  |  |
| Sort Date | Sort the file list by date  | Newest on the top |  |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top |  |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top |  |  |
| Sort Type | Sort the file list by type  | grouped by type |  |  |
| Sort Size | Sort the file list by size  | Biggest on the top |  |  |
|**Upload & Download**||||||
|**Multiaccount**||||||
|**No connection**||||||
|**Files App**||||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there |  |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached |  |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed |  |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed |  |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | |  |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app |  |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app |  | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app |  |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app |  |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app |  |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  |  | |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  |  | |
| Item info | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app |  |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud |  |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded |  |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | |   |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |  |  |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | |  |
|**Remote actions**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app |  |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | 
 |  |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app |  |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app |  |  |
|**Error handling**||||||
| Lack of connection | Operations to perform in Files app with no connection: rename, duplicate,  move, delete, download | Correct error |  |  |
| Lack of server connection | Operations to perform in Files app with no server connection: rename, move, delete, download | Correct error |  |  |
| Maintenance mode | Operations to perform in Files app with maintenance mode: rename, move, delete, download | Correct error |  |  |
| Target folder deleted | Operations to perform in Files app after deleting target folder: create folder, move, copy | Correct error |  | |