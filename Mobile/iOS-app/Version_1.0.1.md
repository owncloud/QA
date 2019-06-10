#### Version 1.0.1

#### PRs: https://github.com/owncloud/ios-app/pull/402<br>


Device/s:  <br>
Server: 

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
12 -> iOS version<br>
NA -> non applicable

 -> Passed in an iPhone with iOS12<br>
F t12 -> Failed in an iPad with iOS12<br>
 -> Passed with an iPhone with iOS12 and an iPad with iOS12 <br>
 F t12 -> Passed with an iPhone with iOS12 and failed with an iPad with iOS12 <br>

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------- |
|**Settings**||||||
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  |  |  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked  |  |  |
| Logging disabled | Disable Logging| All options hidden  |  |  |
| Logging debug | 1. Enable Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging info | 1. Enable Logging with info level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging warning | 1. Enable Logging with warning level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Share file | Log is filled up |  |  |
| Logging standard error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Check standard error output | Standard output with errors |  |  |
| Reset log file | After any of the actions before, reset file  | File is empty|   |  |
| Log Rotation | Change device date and generate some logs  |  New log file is created |   |  |
| Mask private data | Enable the option Mask private data  | Log does not contain info about servers, users...|  |  |
| Hide files enabled | Enable hide files option and open an account with some file that starts with . | File is visible in the list |  |  |
| Hide files disabled | Disable hide files option and open an account with some file that starts with . | File is not visible in the list |  |  |
| Help | Open Help Section  | Help web is opened |  |  |
| Send feedback | Open Send feedback section | feedback mail is opened|  |  |
| Recommend | Open Recommend section | recommend mail is opened|  |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened|  |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement y is opened|  |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent |   |  |
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
|**Multiselection**||||||
| Open In files | Open several files in a 3rd party app | Correctly downloaded and sent |   |  |
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
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge a,ount of files| All files are uplaoded |  | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears|  | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears| | |
| Download several files | Tap on several files | all are enqueued and finally downloaded |  | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and finally downloaded. Last one is displayed | | |
| Cancel download | Tap on a huge  file<br>Cancel it before it finishes | File is not downloaded | |
| Cancel uploads | Upload a huge file<br>Cancel it before it finishes | File is not uploaded| |
| Clear storage | Tap on a huge number of files<br>Go to bookmark and manage space to remove | Everything is cleaned up | | |
|**Concurrency**| **2 auth methods**|||||
|**Transfers (6 as budget, 3 + 3)**|
| Upload 3 | Upload 3 items to oC | Correctly uploaded, concurrently. Check in status view |  |  |  |
| Download 3 | Download 3 items from oC | Correctly downloadded, concurrently. Check in status view | |  |  |
| Upload 7 | Upload 7 items to oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view |  |  |  |
| Download 7 | Download 7 items from oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view |  |  |  |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing |  | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded |  |  |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded |  |  |
|**Files preview**| 1 device |||||
| PDF | Download an open a PDF file | Correctly displayed |  |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search | |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | |  |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed |  |  |
| Doc | Download an open a Doc file | Correctly displayed | |  |
| Excel | Download an open a excel file | Correctly displayed | |  |
| Ppt | Download an open a ppt file | Correctly displayed | |  |
| Txt | Download an open a txt file | Correctly displayed | |  |
| Image | Download an open a png, jpg files | Correctly displayed | |  |
| GIF | Download an open a GIF file | Correctly displayed | |  |
| Video | Download an open a video file. Go back and the video stops | Correctly played |  |  |
| Audio | Download an open a video file. Go back and the music stops | Correctly played |  |   |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| |  |
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
| Maintenance mode | Actions under maintenance mode: create folder, delete, remove, move, duplicate, upload | Actions are done after recovering connection| |  |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error |  |  |
| Rename | Rename item with existing name in target | Correct error |  |  |
| Copy | Copy item with existing name in target | Correct error |  |  |
| Move | Move item with existing name in target | Correct error |  |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error |  |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error |  |  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there |  |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached |  |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed |  |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed |  |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app |  | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app |  |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app |  | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app |  |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app |  |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app |  |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app |  |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app |   |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  |  |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |   |  Only files -> OK |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  |  | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app |  |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app |  | FIXED: Nor asked for confirmation |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud |  |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded |  |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  |  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |   |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | NA | Apple issue |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | NA | Apple issue, check future |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved | NA | Apple unexpected behaviour. Check to improve. |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied |  |  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied |  |  |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app |  |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app |  |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app |  |  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error |  | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error |  | |
|**Other**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape |   | |
| Searching | Input a pattern to filter in the current folder | Results correct filtered |   | 
| Quota correct | Open the root folder | Quota is correctly displayed |  | |
|**HEIC/HEIV to other formats**||||||
| View | Open settings view | Option to select heic/jpg is correctly displayed |  | |
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header |  | |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header|  | |
| Heiv selected | Select the option heiv in settings<br>Upload videos in heiv | Heiv format in uploaded videos, check in mime header |  | |
| MP4 selected | Select the option MP4 in settings<br>Upload videos in heic | MP4 format in uploaded videos , check in mime header|  | |