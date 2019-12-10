#### Version 

#### PRs: <br>


Device/s: <br>
Server: 

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
- Multiaccount

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------- |
|**Settings**||||||
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  |  |  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked  |   |  |
| Logging disabled | Disable Logging| All options hidden  |  |  |
| Logging debug | 1. Eble Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging info | 1. Eble Logging with info level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging warning | 1. Eble Logging with warning level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging error | 1. Eble Logging with error level <br>2. Perform some error actions<br>3. Share file | Log is filled up |  |  |
| Logging standard error | 1. Eble Logging with error level <br>2. Perform some error actions<br>3. Check standard error output | Standard output with errors |  |  |
| Reset log file | After any of the actions before, reset file  | File is empty|   |  |
| Mask private data | Eble the option Mask private data  | Log does not contain info about servers, users...|  |  |
| Help | Open Help Section  | Help web is opened |  |  |
| Send feedback | Open Send feedback section | feedback mail is opened|  |  |
| Recommend | Open Recommend section | recommend mail is opened|  |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened|  |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement y is opened|  |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent |   |  |
| Copy file | Copy a file to another location | Correctly copied |  | |
| Copy folder| Copy a folder to another location | Correctly copied |  |  |
| Move file | Move a file to another location | Correctly moved |  |  |
| Move folder| Move a folder to another location | Correctly moved |  |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated |  |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated |  |  |
| Reme file | Reme a file | Correctly remed |  |  |
| Reme folder| Reme a folder  | Correctly remed |  |  |
| Delete file | Delete a file | Correctly deleted |  |  |
| Delete folder| Delete a folder  | Correctly deleted |  |  |
| Sort Date | Sort the file list by date  | Newest on the top |  |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top |  |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top |  |  |
| Sort Type | Sort the file list by type  | grouped by type |  |  |
| Sort Size | Sort the file list by size  | Biggest on the top |  |  |
|**Multiselection**||||||
| Open In files | Open several files in a 3rd party app | Correctly downloaded and sent |  |  |
| Open In folder | Open several folders in a 3rd party app | Not posible |   |  |
| Copy file | Copy several files to another location | Correctly copied |   |  |
| Copy folder| Copy several folders to another location | Correctly copied |   |  |
| Move file | Move several files to another location | Correctly moved |   |  |
| Move folder| Move several folders to another location | Correctly moved |   |  |
| Duplicate file | Duplicate several files to another location | Correctly duplicated |   |  |
| Duplicate folder| Duplicate several folders to another location | Correctly duplicated |   |  |
| Delete file | Delete several files | Correctly deleted |   |  |
| Delete folder| Delete several folders  | Correctly deleted |   |  |
|**Upload & Download**| **2 auth methods**|||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder |  |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder|  |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder |  | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder|  | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge amount of files| All files are uplaoded |  | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears|  | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears| | |
| Download several files | Tap on several files | all are enqueued and filly downloaded |  | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and filly downloaded. Last one is displayed | | |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing |  | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded |  | |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded |  |  |
|**Files preview**||||||
| PDF | Download an open a PDF file | Correctly displayed |  |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search | |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | |  |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbils/list| Correct displayed |  |  |
| Doc | Download an open a Doc file | Correctly displayed | |  |
| Excel | Download an open a excel file | Correctly displayed | |  |
| Ppt | Download an open a ppt file | Correctly displayed | |  |
| Txt | Download an open a txt file | Correctly displayed | |  |
| Image | Download an open a png, jpg files | Correctly displayed | |  |
| GIF | Download an open a GIF file | Correctly displayed | |  |
| Video | Download an open a video file. Go back and the video stops | Correctly played |  |  |
| Audio | Download an open a video file. Go back and the music stops | Correctly played |  |  |
| Media backgorund | Download an open a video file. Switch the screen off | Video plays in background |  |  |
| Non opeble | Download an open a non opeble file | Placeholder displayed with date and size| |  |
| Damaged | Download an open a damaged file | Placeholder displayed | |  |
|**Offline**||||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection |  |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection |  | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection |  |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection |  |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection |  |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.|  |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection|  |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection| |  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK|  |   |
| Maintence mode | Actions under maintence mode: create folder, delete, remove, move, duplicate, upload | Actions are done after recovering connection| |  |
|**Error handling**||||||
| Create folder | Create folder with existing me | Correct error |  |  |
| Reme | Reme item with existing me in target | Correct error |  |  |
| Copy | Copy item with existing me in target | Correct error |  |  |
| Move | Move item with existing me in target | Correct error |  |  |
| Non existing | Delete/Reme/Duplicate/Copy/Move an item just removed in other client or server | Correct error |  |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error |  |   |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there |  |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached |  |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Browse offline | Open an ownCloud Files app location and remove connection| Content is correctly displayed even offline (if discovered before| |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed |  |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed |  |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app |  | |
| Reme downloaded item (file and folder)| Open an ownCloud Files app location<br>Reme an downloaded item | Item is remed correctly in oC app |  |  |
| Reme non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Reme an non-downloaded item | Item is remed correctly in oC app |  | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app |  |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app |  |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app |  |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app |  |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |   |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app |   |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  |  |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |   |   |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  |  | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app |  |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app |  |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud |  |  |
| Upload exterl| Open an exterl app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded |  |  |
| Upload non-root| Open an exterl app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |   |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted |  |  |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved |  |  |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved |  |  |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied |  |  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied |  |  |
|**Remote actions (Files App)**||||||
| Reme remote| Reme a file or folder in web UI | File is automatically remed in Files app |  |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app |  |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app |  |  |
|**Error handling (Files App)**||||||
| Colliding me | Move, copy or reme a folder, so the target collides with an existing item | Correct error |  | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error |  | |
|**Other**||||||
| Thumbils | Open a folder which contains images | thumbils are correctly displayed for downloaded and non downloaded images, in portrait and landscape |   | |
| Searching | Input a pattern to filter in the current folder | Results correct filtered |   | 
| Quota correct | Open the root folder | Quota is correctly displayed |  | |
|**HEIC to JPG**||||||
| View | Open settings view | Option to select heic/jpg is correctly displayed |  | |
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header |  | |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header|  | |
|**iOS13**||||||
| Keyboard commands | Check in different views that cmd key triggers menu | Menu displayed |  | |
| Multiple Window | Check in iPad that files can be moved from one window to other | Files moved (same account) or copied (different acocunt) |  | |