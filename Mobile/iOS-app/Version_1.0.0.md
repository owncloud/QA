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
| Certificate | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. RevP t12e the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  |  |  |
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
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P t12  |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached |  P t12|  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P t12|  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P t12 |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed |  |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P t12| Doesn't work with semicolon character inside the name |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app |  P t12|  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | P t12 | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app |  P t12|  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P t12|  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app |  P t12|  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app |  P t12|  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P t12|  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | P t12 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | P t12|  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P t12 | |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  |  P t12 | |
| Item info | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P t12|  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P t12 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P t12 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | ~= | It doesn't work for Apple's own formats like pages, you need to export it as pdf (or other formats) to be able to save it through the files app  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | ~= | It doesn't work for Apple's own formats like pages, you need to export it as pdf (or other formats) to be able to save it through the files app |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |  ~=|  It doesn't work for Apple's own formats like pages, you need to export it as pdf (or other formats) to be able to save it through the files app |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  ~=| if the item was downloaded previously it works, but if not, it doesn't work. The app rests in a stuck state. |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | P t12| |
|**Remote actions**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P t12 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | P t12
 |  |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | P t12 |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app |P t12  |  |
|**Error handling**||||||
| Lack of connection | Operations to perform in Files app with no connection: rename, duplicate,  move, delete, download | Correct error |  P t12| All the operation but download doesn't have error message, instead, all of them are preformed when the connection came back.|
| Lack of server connection | Operations to perform in Files app with no server connection: rename, move, delete, download | Correct error | P t12 | All the operations are done when the connection is back (some of them take a while but at the end are done)|
| Maintenance mode | Operations to perform in Files app with maintenance mode: rename, move, delete, download | Correct error | P t12 |  |
| Target folder deleted | Operations to perform in Files app after deleting target folder: create folder, move, copy | Correct error | P t12 |"Content Unavailable" error appears if you have files inside. |