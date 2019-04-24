#### Version 1.0.0

#### PRs: https://github.com/owncloud/ios-app/pull/352<br>


Device/s: iPhoneX v12, iPadAir v12 <br>
Server: 10.1, 10.0.9

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
12 -> iOS version<br>
NA -> non applicable

P m12 -> Passed in an iPhone with iOS12<br>
F t12 -> Failed in an iPad with iOS12<br>
P m12 t12 -> Passed with an iPhone with iOS12 and an iPad with iOS12 <br>
P m12 F t12 -> Passed with an iPhone with iOS12 and failed with an iPad with iOS12 <br>

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------- |
|**Settings**||||||
| Certificate | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Reve the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  | P m12 t12 | FIXED: Non readable error. After other account approval, contents from cache |
| Logging disabled | Disable Logging| All options hidden  | P t12 m12 |  |
| Logging debug | 1. Enable Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up |  P m12|  |
| Logging info | 1. Enable Logging with info level<br>2. Perform some actions<br>3. Share file | Log is filled up | P m12 |  |
| Logging warning | 1. Enable Logging with warning level<br>2. Perform some actions<br>3. Share file | Log is filled up | P m12 |  |
| Logging error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Share file | Log is filled up | P m12 |  |
| Logging standard error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Check standard error output | Standard output with errors | P m12 |  |
| Reset log file | After any of the actions before, reset file  | File is empty| P m12  |  |
| Mask private data | Enable the option Mask private data  | Log does not contain info about servers, users...| P m12 | «private» added in the logs |
| Help | Open Help Section  | Help web is opened | P m12 t12 |  |
| Send feedback | Open Send feedback section | feedback mail is opened| P m12 t12 |  |
| Recommend | Open Recommend section | recommend mail is opened| P m12 t12 |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened| P m12 t12 |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement y is opened| P m12 t12 |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent | F m12 t12 | Go back to the file list |
| Copy file | Copy a file to another location | Correctly copied | P m12 t12| FIXED: Browsing in picker not dismissed |
| Copy folder| Copy a folder to another location | Correctly copied | P m12 t12 | FIXED: Options sould not be available in the picker |
| Move file | Move a file to another location | Correctly moved | P m12 t12| FIXED: Browsing in picker not dismissed |
| Move folder| Move a folder to another location | Correctly moved | P m12 t12| FIXED: Options sould not be available in the picker |
| Duplicate file | Duplicate a file to another location | Correctly duplicated | P m12 t12|  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated | P m12 t12|  |
| Rename file | Rename a file | Correctly renamed | P m12 t12|  |
| Rename folder| Rename a folder  | Correctly renamed | P m12 t12|  |
| Delete file | Delete a file | Correctly deleted | P m12 t12|  |
| Delete folder| Delete a folder  | Correctly deleted | P m12 t12|  |
| Sort Date | Sort the file list by date  | Newest on the top | P m12 t12 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top | P m12 t12 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m12 t12 |  |
| Sort Type | Sort the file list by type  | grouped by type | P m12 t12 |  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m12 t12 |  |
|**Multiselection**||||||
| Open In files | Open several files in a 3rd party app | Correctly downloaded and sent | P m12 t12 |  |
| Open In folder | Open several folders in a 3rd party app | Not posible | P m12 t12 |  |
| Copy file | Copy several files to another location | Correctly copied | P m12 t12 |  |
| Copy folder| Copy several folders to another location | Correctly copied | P m12 t12 |  |
| Move file | Move several files to another location | Correctly moved | P m12 t12|  |
| Move folder| Move several folders to another location | Correctly moved | P m12 t12|  |
| Duplicate file | Duplicate several files to another location | Correctly duplicated | F m12 t12| Not all are duplicated if you have many |
| Duplicate folder| Duplicate several folders to another location | Correctly duplicated | F m12 t12| Not all are duplicated if you have many |
| Delete file | Delete several files | Correctly deleted | P m12 t12|  |
| Delete folder| Delete several folders  | Correctly deleted | P m12 t12 |  |
|**Upload & Download**| **2 auth methods**|||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m12 t12 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder| P m12 t12 |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m12 t12 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P m12 t12 | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge a,ount of files| All files are uplaoded | P t12 m12 | Checked with different amounts: ~50, ~100, 300 files|
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears| P m12 t12 | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears| P m12 t12| |
| Download several files | Tap on several files | all are enqueued and finally downloaded | P m12 t12 | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and finally downloaded. Last one is displayed |P m12 t12 | |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m12 t12 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m12 t12 | FIXED: Fail when go back|
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m12 t12 | FIXED: Fails with multiaccount |
|**Files preview**||||||
| PDF | Download an open a PDF file | Correctly displayed | P m12 t12|  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search | P m12 t12|  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | P m12 t12|  |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed | F p12 m12 | Margin on the top |
| Doc | Download an open a Doc file | Correctly displayed | P m12 t12|  |
| Excel | Download an open a excel file | Correctly displayed | P m12 t12|  |
| Ppt | Download an open a ppt file | Correctly displayed | P m12 t12|  |
| Txt | Download an open a txt file | Correctly displayed | P m12 t12|  |
| Image | Download an open a png, jpg files | Correctly displayed | P m12 t12|  |
| GIF | Download an open a GIF file | Correctly displayed | P m12 t12| https://github.com/owncloud/ios-app/issues/323 |
| Video | Download an open a video file. Go back and the video stops | Correctly played | P m12 t12 | FIXED: going back, it dos not stop |
| Audio | Download an open a video file. Go back and the music stops | Correctly played | P m12 t12 | FIXED: going back, it dos not stop  |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| P m12 t12|  |
| Damaged | Download an open a damaged file | Placeholder displayed | P m12 t12| FIXED: crash  |
|**Offline**||||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection | P m12 |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection | P m12 t12 | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection | P m12 t12 |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection | P m12 t12 | FIXED: Not in status view |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection |  P m12 t12|  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.| P m12 t12 |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection| P m12 t12 |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection| P m12 t12|  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK|  |   |
| Maintenance mode | Actions under maintenance mode: create folder, delete, remove, move, duplicate, upload | Actions are done after recovering connection| F m12 t12| Double deletion causes error |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error | P m12 t12 |  |
| Rename | Rename item with existing name in target | Correct error | P m12 t12 |  |
| Copy | Copy item with existing name in target | Correct error | P m12 t12 |  |
| Move | Move item with existing name in target | Correct error | P m12 t12 |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error | F m12 t12 | Rename a deleted does not work |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error | P m12 t12 | FIXED: non readable error  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m12 t12 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m12 t12 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P m12 t12|  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed |P m12 t12 |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m12 t12 |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m12 t12 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m12 t12 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app | P m12 t12 |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | P m12 t12 | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m12 t12 |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app |P m12 t12 |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m12 t12 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m12 t12 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m12 t12 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | P m12 p12 | Only for files. Folders -> Apple issue |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | P m12 p12 | Only for files. Folders -> Apple issue |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 t12 | Only files -> OK |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  | P m12 t12  |  Only files -> OK |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P m12 t12 | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m12 t12 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P m12 t12 | FIXED: Nor asked for confirmation |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m12 t12 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m12 t12 |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | P m12 t12 |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m12 t12  |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC | P m12 t12 |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | NA | Apple issue |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | F m12 t12 | Copied, not moved |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved | F m12 t12 | Returns an error |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied | P m12 t12 |  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | P m12 t12 |  |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P m12 t12 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app |P m12 t12 |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | P m12 t12 |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app |  P m12 t12|  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | P m12 t12 | FIXED: Collisions with bad errors|
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error | P m12 t12 | |
|**Other**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m12 t12  | FIXED: thumbnails overplace the cell|
| Searching | Input a pattern to filter in the current folder | Results correct filtered | P m12 t12  | 
| Quota correct | Open the root folder | Quota is correctly displayed | P m12 t12 | |
