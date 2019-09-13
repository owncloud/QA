#### Version 1.1.0

#### PRs: https://github.com/owncloud/ios-app/pull/499<br>


Device/s: iPhoneXR v12<br>
Server: 10.2.1

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
|**Auth**|  |||||
| Login basic | Basic credentials | Correct access | P m12
| Login basic wrong credentials | Basic credentiasl | Correct error  | P m12 |
| Login OAuth2  | Login with OAuth2 | Correct access  | P m12 |
| OAuth2 revoked token| Revoke the OAuth2 session from OAuth2 server dashboard | User must start a new session | P m12 |
|**Settings**| 2 device |||||
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  | P m12 |  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked  | P m12 |  |
| Logging disabled | Disable Logging| All options hidden  | P m12 |  |
| Logging debug | 1. Enable Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up | P m12 |  |
| Reset log file | After any of the actions before, reset file  | File is empty| P m12 |  |
| Log Rotation | Change device date and generate some logs  |  New log file is created |P m12  |  |
| Hide files enabled | Enable hide files option and open an account with some file that starts with . | File is visible in the list | P m12 |  |
| Hide files disabled | Disable hide files option and open an account with some file that starts with . | File is not visible in the list | P m12 |  |
| Help | Open Help Section  | Help web is opened | P m12 |  |
| Send feedback | Open Send feedback section | feedback mail is opened| P m12 |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened| P m12 |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement y is opened| P m12 |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent | P m12 |  |
| Copy file | Copy a file to another location | Correctly copied | P m12 |  |
| Copy folder| Copy a folder to another location | Correctly copied |  P m12|  |
| Move file | Move a file to another location | Correctly moved | P m12 |  |
| Move folder| Move a folder to another location | Correctly moved |  P m12|  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated | P m12 |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated | P m12 |  |
| Rename file | Rename a file | Correctly renamed | P m12 |  |
| Rename folder| Rename a folder  | Correctly renamed | P m12 |  |
| Delete file | Delete a file | Correctly deleted | P m12 |  |
| Delete folder| Delete a folder  | Correctly deleted | P m12 |  |
| Sort Date | Sort the file list by date  | Newest on the top |P m12  |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top |P m12  |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top |  P m12|  |
| Sort Type | Sort the file list by type  | grouped by type | P m12 |  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m12 |  |
| Sort Shared | Sort the file list by sharing  | Shared on the top | P m12 |  |
| Sort inverse | Sort the file list by everything, inverse  | Reverse order | P m12 |  |
|**Multiselection**| 1 device |||||
| Open In files | Open several files in a 3rd party app | Correctly downloaded and sent | P m12  | |
| Open In folder | Open several folders in a 3rd party app | Not posible | P m12  |  |
| Copy file | Copy several files to another location | Correctly copied |  P m12 |  |
| Copy folder| Copy several folders to another location | Correctly copied | P m12  |  |
| Move file | Move several files to another location | Correctly moved |  P m12 |  |
| Move folder| Move several folders to another location | Correctly moved |  P m12 |  |
| Duplicate file | Duplicate several files to another location | Correctly duplicated | P m12  |  |
| Duplicate folder| Duplicate several folders to another location | Correctly duplicated | P m12  |  |
| Delete file | Delete several files | Correctly deleted | P m12  |  |
| Delete folder| Delete several folders  | Correctly deleted | P m12  |  |
|**Upload & Download**| **2 auth methods**|||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m12 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder | P m12 |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m12 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P m12 | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge a,ount of files| All files are uplaoded | P m12 | |
| Upload a bunch of files backgr | Select to upload some large files in a non-root folder and leave the device<br>After some minutes, reopen the app| All files are uploaded | P m12 | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears| P m12 | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears| P m12 | FIXED: download broken |
| Download big file in backgr | Tap on a single large file and leave the device | File is downloaded in root folder.| P m12 | FIXED: download broken |
| Download several files | Tap on several files | all are enqueued and finally downloaded | P m12 | FIXED: download broken |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and finally downloaded. Last one is displayed | P m12 | FIXED: download broken |
| Cancel download | Tap on a huge  file<br>Cancel it before it finishes | File is not downloaded | P m12 | 
| Cancel uploads | Upload a huge file<br>Cancel it before it finishes | File is not uploaded| P m12 |
| Clear storage | Tap on a huge number of files<br>Go to bookmark and manage space to remove |Everything is cleaned up |  P m12 | | |
|**Concurrency**| **2 auth methods**|||||
|**Transfers (6 as budget, 3 + 3)**|
| Upload 3 | Upload 3 items to oC | Correctly uploaded, concurrently. Check in status view | P m12 |  |  |
| Download 3 | Download 3 items from oC | Correctly downloadded, concurrently. Check in status view | P m12 |  |  |
| Upload 7 | Upload 7 items to oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view | P m12 |  |  |
| Download 7 | Download 7 items from oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view | P m12 |  |  |
|**Instant Uploads**||||||
| Root folder | Select the root folder<br>Take two pics | Both pics are uploaded to the root folder | P m12|  |  |
| Non-Root folder | Select a non-root folder<br>Take two pics | Both pics are uploaded to the folder | P m12  |  |  |
| Switch to other | Select a new folder as before<br>Take two pics | Both pics are uploaded to the new target folder | P m12 |  |  |
| Rename target folder | In the app, rename the target folder<br>Take two pics | Both pics are uploaded to the new named folder | P m12 |  |  |
| Move target folder | In the app, move the target folder<br>Take two pics | Both pics are uploaded to the moved folder | P m12 |  |  |
| Remove target folder | In the app, remove the target folder<br>Take two pics | Both pics are not uploaded?  | P m12 |  |  |
| Disable | After enabling and taking some pics, disable the feature<br>Take some pics<br>Enable again the feature<br>Take more pics | Only the pictures that were taken with the feature enabled were uploaded, other ones were ignored | P m12 |  |  |
| App closed | With instant uplaods enabled and app closed, take videos and pics | Detected when the app comes to foreground (check status tab) | P m12 | |  |
| Large video | With instant uplaods enabled, take a long video<br>Once it is detected, minimize the app | Video is uploaded in background | P m12 |  |  |
| Large video and many pics | With instant uplaods enabled, take a long video and then, many pictures<br>Once it is detected, minimize the app | Everything is uploaded in background | P m12 | |  |
|**Av. offline**| **2 auth methods**|||||
|**File**|||||
| Set | Set a file as av. offline | File is downloaded (check in Manage options). Icon is correctly set (check in both orientations) | P m12 |  |  |
| Unset | 1. Unset a file as av. offline<br>2. Wipe all the files in Manage options | File is not downloaded. Icon is removed (check in both orientations) |  P m12|  |  |
|**Folder** |  |  |
| Set a folder as av. offline in card | 1. Swipe over a folder<br>2. Set as av. offline | All the content of the folder is downloaded. Correct icon on everything |  P m12 | FIXED: Some errors while downloading
| Set the content of a folder as av. offline | 1. Browse a folder<br>2. Set as av. offline using the three dt button| All the content of the folder is downloaded. Correct icon on everything |  P m12  |  
| Set a folder with subfolders as av. offline | 1. Swipe over a folder which contains a deep structure of subfolders with special characters<br>2. Set as av. offline | All the content of the folder and subfolders is downloaded  and marked|  P m12 |  
| Unset as av. offline a folder into an av. offline folder | 1. Swipe over a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | P m12
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | P m12  |  
| Add into av. offline | Add some content into an av. offline folder | Content is downloaded and sync | P m12  |  
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is not av.offine |  P m12
| Av. offline inside av. offline | Create a folder inside an av. offline folder<br>Upload content inside the folder | Folder and its content are av. offline |  P m12 | 
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m12 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m12  |  |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m12 |  |
|**Files preview**| 1 device |||||
| PDF | Download an open a PDF file | Correctly displayed | P m12 |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search | P m12 | FIXED: option no displayed when reopening |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | P m12 | FIXED: option no displayed when reopening |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed | P m12 | FIXED: option no displayed when reopening |
| Doc | Download an open a Doc file | Correctly displayed | P m12 |  |
| Excel | Download an open a excel file | Correctly displayed | P m12 |  |
| Ppt | Download an open a ppt file | Correctly displayed | P m12 |  |
| Txt | Download an open a txt file | Correctly displayed | P m12 |  |
| Image | Download an open a png, jpg files | Correctly displayed | P m12 |  |
| Image Gallery | Download an open a png, jpg files and swipe in gallery mode | Correctly displayed | P m12  |  |
| Image Gallery actions | Download an open a png, jpg files and swipe in gallery mode <br> Perform a rename, delete, move, copy and duplicate while gallery is running| Gallery is not dismissed | P m12 |  |
| GIF | Download an open a GIF file | Correctly displayed | P m12 | To improve |
| Video | Download an open a video file. Go back and the video stops | Correctly played |  | To improve |
| Audio | Download an open a video file. Go back and the music stops | Correctly played | P m12  |   |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| P m12 | FIXED: Not downloaded |
| Damaged | Download an open a damaged file | Placeholder displayed | P m12 |  |
|**Streaming on**|||||||
| Stream video | Click on a non-downloaded video | Video streamed, not downloaded | P m12 |   |  |  |
| Stream audio | Click on a non-downloaded video | Audio streamed, not downloaded | P m12  |   |  |  |
|**Streaming off**|||||||
| Downloaded video | Click on a non-downloaded video | Video is downloaded and played in both orientations| P m12  | 
| Downloaded audio | Click on a non-downloaded video | Audio is downloaded and played in both orientations | P m12  | 
|**Offline**| 2 devices |||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection | P m12 |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection | P m12  | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection |  P m12 |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection | P m12  |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection |  P m12 |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.|  P m12 |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection| P m12 |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection| P m12 |  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK | P m12 |   |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error | P m12  |  |
| Rename | Rename item with existing name in target | Correct error | P m12 |  |
| Copy | Copy item with existing name in target | Correct error | P m12 |  |
| Move | Move item with existing name in target | Correct error | P m12 |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error | P m12 |  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m12 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m12 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P m12 |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P m12 | Not regression: token renewal  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m12 |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m12 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m12 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app | P m12|  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | P m12| |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m12|  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app |  P m12|  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m12 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m12 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m12 |  |
| Copy Paste inside a shared folder with no edit permissions | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item inside a shred folder with no edit permission | No posible | P m12 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app | P m12 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app |P m12  |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m12 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |  P m12 |  Only files -> OK |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P m12 | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m12 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P m12 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m12 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m12 | With MSWord |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  P m12| With MSWord |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC | P m12  |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC | P m12 |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | NA | Apple issue |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | NA | Apple issue, check future |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved | NA | Apple unexpected behaviour. Check to improve. |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied |   | FIXED: In the same account |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | NA  | Apple behaviour |
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m12  | |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P m12 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | P m12 |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app |  P m12|  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app |  P m12 |  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | P m12 | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error | P m12 | |
|**Favorites**||||
| View | Open card of any item | View is correct | P m12 | | | 
| Set fav File | in the app, set a file as favorite | Check in web UI that the file is favorite | P m12 | | | 
| Set fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is favorite | P m12 | | | 
| Unset fav File | in the app, unset a file as favorite | Check in web UI that the file is not favorite anymore|  P m12| | | 
| Unset fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is not favorite anymore | P m12  | | | 
| Remote set fav | in web UI, set an item as favorite | Check in the app that the item is favorite |P m12  | | | 
| Remote unset fav | in web UI, unset an item as favorite | Check in the app that the item is not favorite anymore |  F m12 | https://github.com/owncloud/ios-app/issues/497 (no regression)| | 
| Set fav offline| in the app, with no connection set a file as favorite<br>Recover connection | Check in web UI that the file is favorite | P m12 | | | 
| Unset fav offline | in the app with no connection, unset a file as favorite<br>Recover connection | Check in web UI that the file is not favorite anymore| P m12  | | | 
| Set fav remote offline| in the app, remove connection<br>In web set a file as favorite<br>Recover connection | Check in the app that the file is favorite |  P m12 | | | 
| Unset fav remote offline | in the app, remove connection<br>In web UI unset a file as favorite<br>Recover connection | Check in app that the file is not favorite anymore| F m12  | https://github.com/owncloud/ios-app/issues/497 (no regression)| | 
|**Private Share**||||||
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user | P m12 |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file |  P m12 |  |
| Share with a non existing user | Open Share<br>Type a user name that does not exist | No matches| P m12 |  |
| Share with an already shared | Open Share<br>Type a user name which already has the file | Correct error| P m12 |   |
| Share permission OK | Open Share<br>Share with another user with share permission<br>Try to reshare | Recipient can reshare | P m12 |    |
| Share permission denied | Open Share<br>Share with another user with no share permission<br>Try to reshare |  Not posible |  P m12 |  |
| Permission inheritance | Open Share<br>Share with another user with no edit permission<br>Recipient tries to reshare with edit permission |  Not posible | P m12 |   |
| Reshare reflected | Open Share<br>Share with another user<br>Recipient reshares |  First user sees both shares | P m12 |  |
| Edit permission OK | Open Share<br>Share with another user with edit permission<br>Recipient tries to edit<br>Try the same with Files App | Recipient can edit | P m12  |  |
| Edit permission denied | Open Share<br>Share with another user with no edit permission<br>Recipient tries to edit<br>Try the same with Files App |  It is posible | P m12  |  |
| Edit permission folders view | Open Share<br>Share a folder with another user  |  Create, change, delete options are there. Information icon shows additional info |  P m12 |  |
| Edit permission folders vanished | Open Share<br>Share a folder with another user without change, create and delete | options vanished | P m12 |   |
| Edit permission folders | Open Share<br>Share a folder with another user with all permissions<br>Remove two permissions (change and delete)  | Correctly updated in UI | P m12 |   |
| Edit permission folders create | Open Share<br>Share a folder with another user with only create  | Recipient can upload content, but change and delete | P m12 |  |
| Edit permission folders Change | Open Share<br>Share a folder with another user with only change  | Recipient can change content, but create and delete | P m12 |  |
| Edit permission folders Delete | Open Share<br>Share a folder with another user with only Delete  | Recipient can delete content, but create and change | P m12 |  |
| Delete one recipient | Open Share<br>Share with several users<br>Delete one recipient | Recpient deleted, but in files view file is still marked as shared (private) | P m12  |    |
| Delete all recipients | Open Share<br>Share with serveral users<br>Delete all recipients | Recipients deleted, in files view file is not marked as shared (private) |  P m12 |  |
| Recipient deletes | Share with a user<br>Recipient deletes the file in the file list | File is not shared, check in original user |  P m12 |  
| Remote share | In web UI create a share with different options | Correctly shown in the app | P m12  |  |
| No edit granted | Share a file with a user, revoking editing and granting sharing | Recipient does not see edit option when resharing | P m12 |   |  |
| Edit granted| Share a file with a user, granting editing and sharing | Recipient sees edit option when resharing |  P m12 |  |  |
| Folder no edit | Share a folder with a user, revoking whole edit permission and granting sharing | Recipient does not see edit option when resharing | P m12 |  |  |
| Folder edit | Share a folder with a user, granting editing and sharing | Recipient sees edit option when resharing |  P m12 |  |  |
| Folder create | Share a folder with a user, granting create and sharing | Recipient sees only create option, but change and delete | P m12 |  |  |
|**Federated Share**||||||
| Share with a user in other server | Open Share<br>Type a correct user name with remote URL<br>Recipient accepts | Sharees list updated with the user after accepting in web | P m12
|**Public Share**||||||
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)| P m12 |  | | 
| Create without name | Select to create a public link with no name  | Correct creation with  default name (check in web UI)| P m12  |   | | 
| Create with password| Select to create a public link with password  | Correct creation with password. Paste the link in browser to be asked the password|  P m12 |  | | 
| Create without password| Select to create a public link with no password  | Correct creation with no password. Paste the link in browser, password not asked| P m12 |  | | 
| Create with expiration date| Select to create a public link with expiration date  | Correct creation with expiration date. Check in web UI| P m12  |   |  | 
| Create without expiration date| Select to create a public link with no expiration date  | Correct creation with no expiration date. Check in web UI| P m12 |  | | 
| Create folder Download/View | Select to create a public link of a folder with Download/View permission  | Correct creation. Check in web UI|  P m12 |  | | 
| Create folder Download/View/Upload | Select to create a public link of a folder with Download/View/Upload permission  | Correct creation. Check in web UI| P m12  |  | | 
| Create folder Upload Only (File Drop) | Select to create a public link of a folder with Upload only permission  | Correct creation. Check in web UI|P m12  |  | | 
| Edit name | On a created public link, edit the name  | Correct edition. Check in web UI| P m12 |   | | 
| Edit password | On a created public link, edit the password  | Correct edition. Check in web UI| P m12  |  | | 
| Edit removing password | On a created public link, remove the password  | Correct edition. Check in web UI| P m12 |  | | 
| Edit expiration date | On a created public link, edit the expiration date  | Correct edition. Check in web UI|  P m12 |  | | 
| Edit removing expiration date | On a created public link, remove the expiration date  | Correct edition. Check in web UI| P m12  |    | | 
| Edit folder permission | On a created public link on a folder, switch the permissions through every option | Correct edition. Check in web UI|P m12  |  | | 
| Delete one | Delete an already create public link  |  Link not available anymore, check in file list | P m12 |  | | 
| Delete all | Delete all public link of an item | Links not available anymore, check in file list | P m12 |  | | 
| Send link | Create a link and use the open in option to send it | Options to send correctly displayed | P m12  | | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed | P m12 |   | | 
| Copy link | Get copy link and paste in the browser | File correctly linked | P m12  | | | 
|**Capabilities**||||||
| Share API disabled | Open file list | There is no option to share | P m12 |  |
| Allow share via link disabled | Open file list | There is no option to share public, but there is for privates |  P m12 |  |
| Enforce password protection read only enabled | Create a public share with read only permission  and without password | Not posible |  P m12 |  |
| Enforce password protection read write enabled | Create a public share with read and write permission and without password | Not posible | P m12  |  |
| Enforce password protection upload only enabled | Create a public share with upload only permission and without password | Not posible |  P m12 |  |
| Default expiration date | Create a public share and enable expiration date | Default date is there | P m12   |  |
| Enforced expiration date | Create a public share and enforce expiration date | Default date is there and can not be removed| P m12 |  |
| Allow resharing enabled | Share a file<br>Recipient tries to reshare  | Recipient can reshare| P m12 |  |
| Allow resharing disabled | Share a file<br>Recipient tries to reshare  | There is no option to reshare | P m12 |  |
| Allow sharing with groups disabled | Share a file with groups | Not posible |  P m12 |  |
| Default share permission | Set different options in web UI<br>Create a share in the app | Default options are the same |  P m12 |  |
| Allow send federated = false | Try to create a federated share | Not posible | P m12  |  |
| Allow receive federated = false | Try to create a federated share | Not posible | P m12 |  |
|**HEIC/HEIV to other formats**||||||
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header | P m12 | |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header| P m12 | |
| Heiv selected | Select the option heiv in settings<br>Upload videos in heiv | Heiv format in uploaded videos, check in mime header | P m12 | |
| MP4 selected | Select the option MP4 in settings<br>Upload videos in heic | MP4 format in uploaded videos , check in mime header|P m12 | |
|**Share sheet**|||||
| Root | Save an external file in the root | File correctly saved | P m12 |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m12 |  |  |
| Several files | Save several external files in oC | Only one is saved | P m12 |  |  |
| Several accounts | Add several accounts<br>Save several external files selecting an oC account | File correctly saved in the correct account | P m12 
|**Delete unused copies**||||
| 1 minute | Download several files<br>Set 1 minute<br>Wait 1 minute or close the app | Content deleted |  P m12 |  |
| Av. offline | Download several files<br>Set several files and folders as av. offline<br>Set 1 minute<br>Wait 1 minute or close the app | Download content deleted<br>Av. offline content keeps downloaded | P m12  |  |
|**Other**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m12 | |
| Searching | Input a pattern to filter in the current folder | Results correct filtered | P m12 | 