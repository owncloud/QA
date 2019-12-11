#### Version 1.2

#### PRs: https://github.com/owncloud/ios-app/pull/549<br>


Device/s: iPhoneX v13, iPadPro v13 <br>
Server: 10.3.1 

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
12 -> iOS version<br>
 -> non applicable

P 12 -> Passed in an iPhone with iOS12<br>
F t12 -> Failed in an iPad with iOS12<br>
P m12 t12 -> Passed with an iPhone with iOS12 and an iPad with iOS12 <br>
P m12 F t12 -> Passed with an iPhone with iOS12 and failed with an iPad with iOS12 <br>

---

For the current version, the following sections has been removed, since there is not affections in terms of regressions:

- Certificate handling (Settings)
- Multiselection

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------- |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent | P m13  |  |
| Copy file | Copy a file to another location | Correctly copied |  P m13 | |
| Copy folder| Copy a folder to another location | Correctly copied |   P m13|  |
| Move file | Move a file to another location | Correctly moved | P m13 |  |
| Move folder| Move a folder to another location | Correctly moved | P m13 |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated |  P m13 |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated |   P m13|  |
| Rename file | Rename a file | Correctly remed |  F m13 | only at the end |
| Rename folder| Rename a folder  | Correctly remed |  F m13 | only at the end |
| Delete file | Delete a file | Correctly deleted | P m13 |  |
| Delete folder| Delete a folder  | Correctly deleted | P m13 |  |
| Sort Date | Sort the file list by date  | Newest on the top | P m13 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top | P m13 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m13 |  |
| Sort Type | Sort the file list by type  | grouped by type | P m13 |  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m13 |  |
|**Upload & Download**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m13 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder| P m13 |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m13 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder|  P m13| |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge amount of files| All files are uplaoded | F m13 | Check when app is killed -> errors|
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears| P m13 | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears|P m13 | |
| Download several files | Tap on several files | all are enqueued and filly downloaded | P m13 | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and fully downloaded. Last one is displayed |P m13 | 
| Download a big file | Tap to download a huge file (>1GB) and let the device| File donwloaded ofter some minutes |P m13 | |
|**Instant uploads**||||||
| Instant uploads pics | Enable instant uploads for pics with a correct target folder<br>Take some pics|Pics are uploaded after opening the app | P m13 |  |
| Instant uploads videos | Enable instant uploads for pics with a correct target folder<br>Take some pics|Pics are uploaded after opening the app | P m13 |  |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m13 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m13 | |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m13 |  |
|**Files preview**||||||
| PDF | Download an open a PDF file | Correctly displayed | P m13 |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search | P m13 |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | P m13 |  |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbils/list| Correct displayed | P m13 |  |
| Doc | Download an open a Doc file | Correctly displayed |P m13 |  |
| Excel | Download an open a excel file | Correctly displayed |P m13 |  |
| Ppt | Download an open a ppt file | Correctly displayed | P m13|  |
| Txt | Download an open a txt file | Correctly displayed | P m13 |  |
| Image | Download an open a png, jpg files | Correctly displayed | P m13 |  |
| GIF | Download an open a GIF file | Correctly displayed | P m13 |  |
| Video | Download an open a video file. Go back and the video stops | Correctly played | P m13 |  |
| Audio | Download an open a video file. Go back and the music stops | Correctly played | P m13 |  |
| Media backgorund | Download an open a video file. Switch the screen off | Video plays in background | P m13 |  |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| P m13 |  |
| Damaged | Download an open a damaged file | Placeholder displayed | P m13 |  |
|**Offline**||||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection | P m13 |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection |P m13  | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection | P m13 |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection | P m13 |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection | P m13 |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.| P m13 |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection| P m13 |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection|P m13 |  |
| Upload external | Open an external app to edit files<br>Create a file and upload to oC via Files App with no connection<br> Recover connection | Action is done after recovering connection | P m13 (retry)| FIXED: With word, eternal spinner |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK| P m13 |   |
| Maintenance mode | Actions under maintence mode: create folder, delete, remove, move, duplicate, upload | Actions are done after recovering connection| P m13 |  |
|**Error handling**||||||
| Create folder | Create folder with existing me | Correct error | F m13 |  Blocked for the create folder problme |
| Rename | Rename item with existing me in target | Correct error | P m13 |  |
| Copy | Copy item with existing me in target | Correct error | P m13 |  |
| Move | Move item with existing me in target | Correct error | P m13 |  |
| Non existing | Delete/Reme/Duplicate/Copy/Move an item just removed in other client or server | Correct error | P m13 |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error | P m13 | improve when some files uploaded  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m13 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m13 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P m13 |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P m13|  |
| Browse offline | Open an ownCloud Files app location and remove connection| Content is correctly displayed even offline (if discovered before| P m13 |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m13 |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m13 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m13 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is remed correctly in oC app | P m13 |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is remed correctly in oC app | P m13 | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m13 | not regression |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m13 |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m13 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m13 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m13 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  P m13 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | F m13  | Folders not duplicated |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m13 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  | P m13  |   |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P m13  | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m13 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P m13 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m13 | FIXED: not saved  |
| Upload external | Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m13 | FIXED: with word, not saved. Ugly error |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | P m13 |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m13  |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC | P m13 |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | P m13 |  |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | P m13 | it does a Copy, not move |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied | P m13 |  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | P m13 |  |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app |P m13  |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | P m13 |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app |  P m13| Sometimes delayed... check |
| Upload remote| Upload new content in web UI | New content refreshed in Files app | P m13 |  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | P m13 | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error | P m13 | |
|**HEIC to JPG**||||||
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header | P m13 | |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header| F m13 | Failes with instant uploads |
|**iOS13**||||||
| Keyboard commands | Check in different views that cmd key triggers menu | Menu displayed | P m13 | |
| Multiple Window | Check in iPad that files can be moved from one window to other | Files moved (same account) or copied (different acocunt) | P m13 | |