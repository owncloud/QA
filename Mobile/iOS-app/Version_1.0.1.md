#### Version 1.0.1

#### PRs: https://github.com/owncloud/ios-app/pull/402<br>


Device/s: iPhone6Plus v12.2, iPhoneX v12.3.1 <br>iPadAir v12
Server: 10.2

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
|**Settings**| 2 device |||||
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  | P m12 t12|  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked  | P m12 t12 |  |
| Logging disabled | Disable Logging| All options hidden  | P m12 t12 |  |
| Logging debug | 1. Enable Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up | P m12 t12 |  |
| Logging info | 1. Enable Logging with info level<br>2. Perform some actions<br>3. Share file | Log is filled up | P m12 t12|  |
| Logging warning | 1. Enable Logging with warning level<br>2. Perform some actions<br>3. Share file | Log is filled up | P m12 t12|  |
| Logging error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Share file | Log is filled up | P m12 t12 |  |
| Reset log file | After any of the actions before, reset file  | File is empty| P m12 t12 |  |
| Log Rotation | Change device date and generate some logs  |  New log file is created | P m12 t12 |  |
| Hide files enabled | Enable hide files option and open an account with some file that starts with . | File is visible in the list | P m12 t12 |  |
| Hide files disabled | Disable hide files option and open an account with some file that starts with . | File is not visible in the list | P m12 |  |
| Help | Open Help Section  | Help web is opened | P m12 t12|  |
| Send feedback | Open Send feedback section | feedback mail is opened| P m12 t12 |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened| P m12 t12 |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement y is opened| P m12 t12 |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent |  P m12 t12| FIXED: app stucked |
| Copy file | Copy a file to another location | Correctly copied | P m12 t12 |  |
| Copy folder| Copy a folder to another location | Correctly copied | P m12 t12 |  |
| Move file | Move a file to another location | Correctly moved | P m12 t12 |  |
| Move folder| Move a folder to another location | Correctly moved | P m12 t12 |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated | P m12 t12 |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated | P m12 t12 |  |
| Rename file | Rename a file | Correctly renamed | P m12 t12 |  |
| Rename folder| Rename a folder  | Correctly renamed | P m12 t12 |  |
| Delete file | Delete a file | Correctly deleted | P m12 t12 |  |
| Delete folder| Delete a folder  | Correctly deleted | P m12 t12 |  |
| Sort Date | Sort the file list by date  | Newest on the top | P m12 t12 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top | P m12 t12 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m12 t12 |  |
| Sort Type | Sort the file list by type  | grouped by type | P m12 t12 |  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m12 t12 |  |
| Sort Shared | Sort the file list by sharing  | Shared on the top | P m12 t12 |  |
|**Multiselection**| 1 device |||||
| Open In files | Open several files in a 3rd party app | Correctly downloaded and sent | P m12  | |
| Open In folder | Open several folders in a 3rd party app | Not posible | P m12  |  |
| Copy file | Copy several files to another location | Correctly copied | P m12  |  |
| Copy folder| Copy several folders to another location | Correctly copied | P m12  |  |
| Move file | Move several files to another location | Correctly moved | P m12  |  |
| Move folder| Move several folders to another location | Correctly moved | P m12  |  |
| Duplicate file | Duplicate several files to another location | Correctly duplicated | P m12  |  |
| Duplicate folder| Duplicate several folders to another location | Correctly duplicated | P m12  |  |
| Delete file | Delete several files | Correctly deleted | P m12  |  |
| Delete folder| Delete several folders  | Correctly deleted | P m12  |  |
|**Upload & Download**| **2 auth methods**|||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m12 t12 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder | P m12 t12|  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m12 t12 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P m12 t12| |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge a,ount of files| All files are uplaoded | F m12 t12 | Many alerts if the connection is lost|
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears| P m12 t12 | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears| P m12 t12 | |
| Download several files | Tap on several files | all are enqueued and finally downloaded | P m12 t12| |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and finally downloaded. Last one is displayed | P m12 t12| |
| Cancel download | Tap on a huge  file<br>Cancel it before it finishes | File is not downloaded | P m12 t12| FIXED: Correct, but notification keeps
| Cancel uploads | Upload a huge file<br>Cancel it before it finishes | File is not uploaded| P m12 t12 |
| Clear storage | Tap on a huge number of files<br>Go to bookmark and manage space to remove | Everything is cleaned up | P m12 t12| |
|**Concurrency**| **2 auth methods**|||||
|**Transfers (6 as budget, 3 + 3)**|
| Upload 3 | Upload 3 items to oC | Correctly uploaded, concurrently. Check in status view | P m12 t12 |  |  |
| Download 3 | Download 3 items from oC | Correctly downloadded, concurrently. Check in status view | P m12 t12|  |  |
| Upload 7 | Upload 7 items to oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view | P m12 t12|  |  |
| Download 7 | Download 7 items from oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view |  P m12 t12|  |  |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m12 t12 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m12 t12 |  |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m12 t12 |  |
|**Files preview**| 1 device |||||
| PDF | Download an open a PDF file | Correctly displayed | P m12 t12 |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search | P m12 t12 |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | P m12 t12 | FIXED: Where is it? |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed | P m12 t12 |  |
| Doc | Download an open a Doc file | Correctly displayed | P m12 t12 |  |
| Excel | Download an open a excel file | Correctly displayed | P m12 t12 |  |
| Ppt | Download an open a ppt file | Correctly displayed | P m12 t12 |  |
| Txt | Download an open a txt file | Correctly displayed | P m12 t12 |  |
| Image | Download an open a png, jpg files | Correctly displayed | P m12 t12|  |
| Image Gallery | Download an open a png, jpg files and swipe in gallery mode | Correctly displayed | P m12 t12 | FIXED: Number of downloads incorrect |
| GIF | Download an open a GIF file | Correctly displayed | P m12 t12 | To improve |
| Video | Download an open a video file. Go back and the video stops | Correctly played | P m12 t12 | To improve |
| Audio | Download an open a video file. Go back and the music stops | Correctly played | P m12 t12 |   |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| P m12 t12|  |
| Damaged | Download an open a damaged file | Placeholder displayed | P m12 t12|  |
|**Offline**| 2 devices |||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection | P m12 t12 |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection |  P m12 t12 | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection |  P m12 t12 |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection |  P m12 t12 |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection |  P m12 t12 |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.|  P m12 t12 |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection| P m12 t12 |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection| P m12 t12 |  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK | P m12 t12 |   |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error | P m12  |  |
| Rename | Rename item with existing name in target | Correct error | P m12 |  |
| Copy | Copy item with existing name in target | Correct error | P m12 |  |
| Move | Move item with existing name in target | Correct error | P m12 |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error | P m12 |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error | P m12 t12 |  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m12 t12 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m12 t12 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P t12 |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P m12 |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m12 t12|  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m12 t12 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m12 t12 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app | P m12 t12|  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | P m12 t12| |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m12 t12|  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m12 t12 |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m12 t12 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m12 t12 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m12 t12 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | P m12 t12 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | P m12 t12 |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 t12 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |  P m12 t12 |  Only files -> OK |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P m12 t12 | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m12 t12 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P m12 t12 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m12 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m12 | With MSWord |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | P m12 | With MSWord |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m12 t12  |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC | P m12 t12 |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | NA | Apple issue |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | NA | Apple issue, check future |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved | NA | Apple unexpected behaviour. Check to improve. |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied | F m12  | In the same account |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | F m12  | In the same account |
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | F m12 | not displayed |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P m12 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | P m12 t12|  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | P m12 t12|  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app | P m12 t12|  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | P m12 t12| |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error | P m12 t12 | |
|**Other**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m12 t12 | |
| Searching | Input a pattern to filter in the current folder | Results correct filtered | P m12 t12| 
| Quota correct | Open the root folder | Quota is correctly displayed | P m12 t12| |
|**HEIC/HEIV to other formats**||||||
| View | Open settings view | Option to select heic/jpg is correctly displayed | P m12 t12 | |
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header | P m12 t12| |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header| P m12 t12 | |
| Heiv selected | Select the option heiv in settings<br>Upload videos in heiv | Heiv format in uploaded videos, check in mime header | P m12 t12 | |
| MP4 selected | Select the option MP4 in settings<br>Upload videos in heic | MP4 format in uploaded videos , check in mime header| P m12 t12| |