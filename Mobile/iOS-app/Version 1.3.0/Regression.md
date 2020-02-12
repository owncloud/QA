#### Version 1.3

#### PR: https://github.com/owncloud/ios-app/pull/567<br>


Device/s: iPhoneX v13, iPadPro v13<br>
Server: 10.3.2

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
12 -> iOS version<br>
NA -> non applicable

P 12 -> Passed in an iPhone with iOS12<br>
F t12 -> Failed in an iPad with iOS12<br>
P m12 t12 -> Passed with an iPhone with iOS12 and an iPad with iOS12 <br>
P m12 F t12 -> Passed with an iPhone with iOS12 and failed with an iPad with iOS12 <br>

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :------------- |
|**Auth**||||||
| Basic auth http | 1. Type an correct URL to the app with http and basic auth | 2. Host certificate is there. Credentials are asked  | P m13 t13 |  |
| Basic auth https | 1. Type an correct URL to the app with https and basic auth | 2. Host certificate is there, asked from approval. Credentials are asked  | P m13 t13 |  |
| OAuth2 http | 1. Type an correct URL to the app with OAuth2 and http | 2. Host certificate is there. Switch to web View  | P m13 t13 |  |
| OAuth2 https | 1. Type an correct URL to the app with OAuth2 and https | 2. Host certificate is there, asked from approval. Switch to web View  | P m13 t13 |  |
| Basic auth right credentials | 1. Type an correct URL to the app with basic auth<br>Type correct credentials | File list accesible | P m13 t13 |  |
| OAuth2 right credentials | 1. Type an correct URL to the app with O2uth3<br>Type correct credentials in web view and authorize | File list accesible | P m13 t13 |  |
| Basic auth wrong credentials | 1. Type an correct URL to the app with basic auth<br>Type wrong credentials | Error | P m13 t13 |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent |   |  |
| Copy file | Copy a file to another location | Correctly copied | P m13 t13 | |
| Copy folder| Copy a folder to another location | Correctly copied | P m13 t13 |  |
| Move file | Move a file to another location | Correctly moved | P m13 t13 |  |
| Move folder| Move a folder to another location | Correctly moved | P m13 t13 |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated | P m13 t13 |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated |  P m13 t13|  |
| Rename file | Reme a file | Correctly renamed | P m13 t13 |  |
| Rename folder| Reme a folder  | Correctly renamed | P m13 t13 |  |
| Delete file | Delete a file | Correctly deleted | P m13 t13 |  |
| Delete folder| Delete a folder  | Correctly deleted |  P m13 t13|  |
| Sort Date | Sort the file list by date  | Newest on the top | P m13 t13 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top | P m13 t13 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m13 t13 |  |
| Sort Type | Sort the file list by type  | grouped by type | P m13 t13 |  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m13 t13 |  |
|**Upload & Download**| |||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m13 t13 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder| P m13 t13 |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m13 t13 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P m13 t13 | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge amount of files| All files are uplaoded | P m13 t13  | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears| P m13 t13 | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears| P m13 t13 | |
| Download several files | Tap on several files | all are enqueued and filly downloaded |P m13 t13 | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and filly downloaded. Last one is displayed | P m13 t13 | |
|**Camera uploads**||||||
| Instant uploads pics | Enable instant uploads for pics with a correct target folder<br>Take some pics|Pics are uploaded after opening the app | P m13 t13| FIXED: uploads stucked with archived ipa |
| Instant uploads videos | Enable instant uploads for pics with a correct target folder<br>Take some pics|Pics are uploaded after opening the app | P m13 t13| FIXED: uploads stucked with archived ipa |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m13 t13 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m13 t13 | |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m13 t13 |  |
|**Files preview**||||||
| PDF | Download an open a PDF file | Correctly displayed | P m13 t13 |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search |P m13 t13 |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump |P m13 t13 |  |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbils/list| Correct displayed | P m13 t13 |  |
| Doc | Download an open a Doc file | Correctly displayed | P m13 t13 |  |
| Excel | Download an open a excel file | Correctly displayed | P m13 t13 |  |
| Ppt | Download an open a ppt file | Correctly displayed | P m13 t13 |  |
| Txt | Download an open a txt file | Correctly displayed | P m13 t13 |  |
| Image | Download an open a png, jpg files | Correctly displayed | P m13 t13 |  |
| GIF | Download an open a GIF file | Correctly displayed |P m13 t13 | Pending to improve |
| Video | Download an open a video file. Go back and the video stops | Correctly played | P m13 t13 |  |
| Audio | Download an open a video file. Go back and the music stops | Correctly played | P m13 t13 |  |
| Media backgorund | Download an open a video file. Switch the screen off | Video plays in background | P m13 t13 |  |
| Non opeble | Download an open a non opeble file | Placeholder displayed with date and size|P m13 t13 |  |
| Damaged | Download an open a damaged file | Placeholder displayed |P m13 t13 |  |
|**Files App**| |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m13 t13 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m13 t13 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P m13 t13|  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P m13 t13 |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m13 t13 |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m13 t13 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app |  P m13 t13| |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Reme an downloaded item | Item is remed correctly in oC app | P m13 t13 |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Reme an non-downloaded item | Item is remed correctly in oC app | P m13 t13 | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m13 t13 |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m13 t13|  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m13 t13 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app |  P m13 t13|  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | P m13 t13  |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app |  P m13 t13 |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m13 t13 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |  P m13 t13 |   |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  |P m13 t13  | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m13 t13 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P m13 t13 |  |
| Create files app root | Open MSOffice or an app with Files App support which allows to create content<br>Create a file it<br>Save changes in oC account (root folder) | File is correctly uploaded to ownCloud | P m13 t13 | zero bytes file -> Word problem |
| Create files app non-root| Open MSOffice or an app with Files App support which allows to create content<br>Create a file it<br>Save changes in oC account (non root folder) | File is correctly uploaded to ownCloud | P m13 t13 | zero bytes file -> Word problem |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m13 t13 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m13 t13 |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  P m13 t13|  |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m13 t13  |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  P m13 t13|  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted |  P m13 t13|  |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | P m13 t13 |  |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved |  P m13 t13|  |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied | P m13 t13 |  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | P m13 t13 |  |
|**Private Share**||||||
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user | P m13 t13 |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file | P m13 t13  |  |
|**Public Share**||||||
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)| P m13 t13 |  | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed | P m13 t13 | https -> check   | | 
| Copy link | Get copy link and paste in the browser | File correctly linked |  P m13 t13 | | | 
|**HEIC to JPG**||||||
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header | P m13 t13 | |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header| P m13 t13 | |
|**IAP**||||||
| Scanner | 1. Purchase scanner feature<br>2. Scan a document | 1. Feature unlocked (check also in Settings > Pro Features)<br>2. Feature works<br>2. Check in Settings > Purchases the correct date, quantity, product and type (purchase) | P m13 t13 |
| Shortcuts | 1. Purchase the shortcuts feature<br>2. Create a shortcut | 1. Feature unlocked (check also in Settings > Pro Features)<br>2. Feature works<br>2. Check in Settings > Purchases the correct date, quantity, product and type (purchase). | P m13 t13 |
| Markup | 1. Purchase the markup feature<br>2. Mark a file up | 1. Feature unlocked (check also in Settings > Pro Features)<br>2. Feature works<br>2. Check in Settings > Purchases the correct date, quantity, product and type (purchase). | P m13 t13 |
| Subscription | 1. In AppStoreConnect, set the pro subscription as 1 year<br>2. Purchase the pro subscription  | 2. Scanner, Markup and Shortcuts unlocked (check also in Settings > Pro Features)<br>2. Features work<br>2. Check in Settings > Purchases the correct start date, quantity, product, type (suscription) and end date (1 hour later) | P m13 t13|
| Restore purchases | 1. Switch to a new user in device settings (no purchases)<br>In app, restore purchases<br>3. Switch again to a user who purchased the features<br>In app, restore purchases| 2. Features are locked (check Settings > Pro Features)<br>4. Features are unlocked and work | P m13 t13|
|**Upgrade**||||||
| From latest version | Install previous version<br>Enable all Settings<br>Add an OAuth2 and a basic auth account<br>Set a file as av. offline, download some files, set some favorites, and share two items<br>Upgrade to the new version | What's new is displayed<br>All Settings are enabled<br>Files have the same setup (av. offline, downloaded, favorites, shared...) | P m13 t13| FIXED: light theme with no icons in what's new|