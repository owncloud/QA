#### Version 1.1.0

#### PRs: https://github.com/owncloud/ios-app/pull/<br>


Device/s: <br>
Server: 

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
|**Settings**| 2 device |||||
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  | |  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked  |  |  |
| Logging disabled | Disable Logging| All options hidden  |  |  |
| Logging debug | 1. Enable Logging with debug level<br>2. Perform some actions<br>3. Share file | Log is filled up |  |  |
| Logging info | 1. Enable Logging with info level<br>2. Perform some actions<br>3. Share file | Log is filled up | |  |
| Logging warning | 1. Enable Logging with warning level<br>2. Perform some actions<br>3. Share file | Log is filled up | |  |
| Logging error | 1. Enable Logging with error level <br>2. Perform some error actions<br>3. Share file | Log is filled up |  |  |
| Reset log file | After any of the actions before, reset file  | File is empty|  |  |
| Log Rotation | Change device date and generate some logs  |  New log file is created |  |  |
| Hide files enabled | Enable hide files option and open an account with some file that starts with . | File is visible in the list |  |  |
| Hide files disabled | Disable hide files option and open an account with some file that starts with . | File is not visible in the list |  |  |
| Help | Open Help Section  | Help web is opened | |  |
| Send feedback | Open Send feedback section | feedback mail is opened|  |  |
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
| Sort Shared | Sort the file list by sharing  | Shared on the top |  |  |
|**Multiselection**| 1 device |||||
| Open In files | Open several files in a 3rd party app | Correctly downloaded and sent |   | |
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
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder | |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder |  | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge a,ount of files| All files are uplaoded |  | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears|  | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears|  | |
| Download several files | Tap on several files | all are enqueued and finally downloaded | | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and finally downloaded. Last one is displayed | | |
| Cancel download | Tap on a huge  file<br>Cancel it before it finishes | File is not downloaded | | 
| Cancel uploads | Upload a huge file<br>Cancel it before it finishes | File is not uploaded|  |
| Clear storage | Tap on a huge number of files<br>Go to bookmark and manage space to remove | Everything is cleaned up | | |
|**Concurrency**| **2 auth methods**|||||
|**Transfers (6 as budget, 3 + 3)**|
| Upload 3 | Upload 3 items to oC | Correctly uploaded, concurrently. Check in status view |  |  |  |
| Download 3 | Download 3 items from oC | Correctly downloadded, concurrently. Check in status view | |  |  |
| Upload 7 | Upload 7 items to oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view | |  |  |
| Download 7 | Download 7 items from oC | Only 3 are concurrent. At the end, action ends correctly. Check in status view |  |  |  |
|**Av. offline**| **2 auth methods**|||||
|**File**|||||
| Set | Set a file as av. offline | File is downloaded (check in Manage options). Icon is correctly set (check in both orientations) |  |  |  |
| Unset | 1. Unset a file as av. offline<br>2. Wipe all the files in Manage options | File is not downloaded. Icon is removed (check in both orientations) |  |  |  |
|**Folder** |  |  |
| Set a folder as av. offline in card | 1. Swipe over a folder<br>2. Set as av. offline | All the content of the folder is downloaded. Correct icon on everything |  
| Set the content of a folder as av. offline | 1. Browse a folder<br>2. Set as av. offline using the three dt button| All the content of the folder is downloaded. Correct icon on everything |   |  
| Set a folder with subfolders as av. offline | 1. Swipe over a folder which contains a deep structure of subfolders with special characters<br>2. Set as av. offline | All the content of the folder and subfolders is downloaded  and marked|   |  
| Unset as av. offline a folder into an av. offline folder | 1. Swipe over a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | 
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |   |  
| Add into av. offline | Add some content into an av. offline folder | Content is downloaded and sync |   |  
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is not av.offine |  
| Av. offline inside av. offline | Create a folder inside an av. offline folder<br>Upload content inside the folder | Folder and its content are av. offline |   | 
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing |  | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded |  |  |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded |  |  |
|**Files preview**| 1 device |||||
| PDF | Download an open a PDF file | Correctly displayed |  |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search |  |  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump |  | |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed |  |  |
| Doc | Download an open a Doc file | Correctly displayed |  |  |
| Excel | Download an open a excel file | Correctly displayed |  |  |
| Ppt | Download an open a ppt file | Correctly displayed |  |  |
| Txt | Download an open a txt file | Correctly displayed |  |  |
| Image | Download an open a png, jpg files | Correctly displayed | |  |
| Image Gallery | Download an open a png, jpg files and swipe in gallery mode | Correctly displayed |  |  |
| Image Gallery actions | Download an open a png, jpg files and swipe in gallery mode <br> Perform a rename, delete, move, copy and duplicate while gallery is running| Gallery is not dismissed |  |  |
| GIF | Download an open a GIF file | Correctly displayed |  | To improve |
| Video | Download an open a video file. Go back and the video stops | Correctly played |  | To improve |
| Audio | Download an open a video file. Go back and the music stops | Correctly played |  |   |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| |  |
| Damaged | Download an open a damaged file | Placeholder displayed | |  |
|**Streaming on**|||||||
| Stream video | Click on a non-downloaded video |  |   |  |  |
| Stream audio | Click on a non-downloaded video |   |   |  |  |
| Artwork | Click on a audio file  | Artwork is shown during streaming |   |  |  |
| Media controls | Check controls over streaming on both orientations | Correct working (depending on library, just to check) |   |  |  |
|**Streaming off**|||||||
| Downloaded video | Click on a non-downloaded video | Video is downloaded and played in both orientations|   | 
| Downloaded audio | Click on a non-downloaded video | Audio is downloaded and played in both orientations |   | 
|**Offline**| 2 devices |||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection |  |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection |   | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection |   |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection |   |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection |   |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.|   |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection|  |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection|  |  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK |  |   |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error |   |  |
| Rename | Rename item with existing name in target | Correct error |  |  |
| Copy | Copy item with existing name in target | Correct error |  |  |
| Move | Move item with existing name in target | Correct error |  |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error |  |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error |  |  |
|**Files App**| **2 auth methods** |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there |  |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached |  |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed |  |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed |  |  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed |  |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app |  | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is renamed correctly in oC app | |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app |  |  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app |  |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app |  |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app |  |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app |  |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  |  |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |   |  Only files -> OK |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  |  | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app |  |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app |  |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud |  |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded |  | With MSWord |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded |  | With MSWord |
| Modify file| Open an ownCloud Files app location<br>Modify it | File is correctly uploaded to oC |   |   |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted | NA | Apple issue |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved | NA | Apple issue, check future |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved | NA | Apple unexpected behaviour. Check to improve. |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied |   | FIXED: In the same account |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | NA  | Apple behaviour |
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape |  | not displayed |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app |  |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | |  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app | |  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error |  | |
|**Favorites**||||
| View | Open card of any item | View is correct |  | | | 
| Set fav File | in the app, set a file as favorite | Check in web UI that the file is favorite |  | | | 
| Set fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is favorite |  | | | 
| Unset fav File | in the app, unset a file as favorite | Check in web UI that the file is not favorite anymore|  | | | 
| Unset fav Folder | in the app, set a folder as favorite | Check in web UI that the folder is not favorite anymore |   | | | 
| Remote set fav | in web UI, set an item as favorite | Check in the app that the item is favorite |  | | | 
| Remote unset fav | in web UI, unset an item as favorite | Check in the app that the item is not favorite anymore |   | | | 
| Set fav offline| in the app, with no connection set a file as favorite<br>Recover connection | Check in web UI that the file is favorite |  | | | 
| Unset fav offline | in the app with no connection, unset a file as favorite<br>Recover connection | Check in web UI that the file is not favorite anymore|   | | | 
| Set fav remote offline| in the app, remove connection<br>In web set a file as favorite<br>Recover connection | Check in the app that the file is favorite |   | | | 
| Unset fav remote offline | in the app, remove connection<br>In web UI unset a file as favorite<br>Recover connection | Check in app that the file is not favorite anymore|   | | | 
|**Private Share**||||||
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user |  |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file |   |  |
| Share with a non existing user | Open Share<br>Type a user name that does not exist | No matches|  |  |
| Share with an already shared | Open Share<br>Type a user name which already has the file | Correct error|  |   |
| Share permission OK | Open Share<br>Share with another user with share permission<br>Try to reshare | Recipient can reshare |  |    |
| Share permission denied | Open Share<br>Share with another user with no share permission<br>Try to reshare |  Not posible |   |  |
| Permission inheritance | Open Share<br>Share with another user with no edit permission<br>Recipient tries to reshare with edit permission |  Not posible |  |   |
| Reshare reflected | Open Share<br>Share with another user<br>Recipient reshares |  First user sees both shares |  |  |
| Edit permission OK | Open Share<br>Share with another user with edit permission<br>Recipient tries to edit<br>Try the same with Files App | Recipient can edit |   |  |
| Edit permission denied | Open Share<br>Share with another user with no edit permission<br>Recipient tries to edit<br>Try the same with Files App |  It is posible |   |  |
| Edit permission folders view | Open Share<br>Share a folder with another user  |  Create, change, delete options are there. Information icon shows additional info |   |  |
| Edit permission folders vanished | Open Share<br>Share a folder with another user without change, create and delete | options vanished |  |   |
| Edit permission folders | Open Share<br>Share a folder with another user with all permissions<br>Remove two permissions (change and delete)  | Correctly updated in UI |  |   |
| Edit permission folders create | Open Share<br>Share a folder with another user with only create  | Recipient can upload content, but change and delete |  |  |
| Edit permission folders Change | Open Share<br>Share a folder with another user with only change  | Recipient can change content, but create and delete |  |  |
| Edit permission folders Delete | Open Share<br>Share a folder with another user with only Delete  | Recipient can delete content, but create and change |  |  |
| Delete one recipient | Open Share<br>Share with several users<br>Delete one recipient | Recpient deleted, but in files view file is still marked as shared (private) |   |    |
| Delete all recipients | Open Share<br>Share with serveral users<br>Delete all recipients | Recipients deleted, in files view file is not marked as shared (private) |   |  |
| Recipient deletes | Share with a user<br>Recipient deletes the file in the file list | File is not shared, check in original user |   |  
| Remote share | In web UI create a share with different options | Correctly shown in the app |   |  |
| No edit granted | Share a file with a user, revoking editing and granting sharing | Recipient does not see edit option when resharing |  |   |  |
| Edit granted| Share a file with a user, granting editing and sharing | Recipient sees edit option when resharing |   |  |  |
| Folder no edit | Share a folder with a user, revoking whole edit permission and granting sharing | Recipient does not see edit option when resharing |  |  |  |
| Folder edit | Share a folder with a user, granting editing and sharing | Recipient sees edit option when resharing |   |  |  |
| Folder create | Share a folder with a user, granting create and sharing | Recipient sees only create option, but change and delete |  |  |  |
|**Federated Share**||||||
| Share with a user in other server | Open Share<br>Type a correct user name with remote URL<br>Recipient accepts | Sharees list updated with the user after accepting in web 
|**Public Share**||||||
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)|  |  | | 
| Create without name | Select to create a public link with no name  | Correct creation with  default name (check in web UI)|   |   | | 
| Create with password| Select to create a public link with password  | Correct creation with password. Paste the link in browser to be asked the password|   |  | | 
| Create without password| Select to create a public link with no password  | Correct creation with no password. Paste the link in browser, password not asked|  |  | | 
| Create with expiration date| Select to create a public link with expiration date  | Correct creation with expiration date. Check in web UI|   |   |  | 
| Create without expiration date| Select to create a public link with no expiration date  | Correct creation with no expiration date. Check in web UI|  |  | | 
| Create folder Download/View | Select to create a public link of a folder with Download/View permission  | Correct creation. Check in web UI|   |  | | 
| Create folder Download/View/Upload | Select to create a public link of a folder with Download/View/Upload permission  | Correct creation. Check in web UI|   |  | | 
| Create folder Upload Only (File Drop) | Select to create a public link of a folder with Upload only permission  | Correct creation. Check in web UI|  |  | | 
| Edit name | On a created public link, edit the name  | Correct edition. Check in web UI|  |   | | 
| Edit password | On a created public link, edit the password  | Correct edition. Check in web UI|   |  | | 
| Edit removing password | On a created public link, remove the password  | Correct edition. Check in web UI|  |  | | 
| Edit expiration date | On a created public link, edit the expiration date  | Correct edition. Check in web UI|   |  | | 
| Edit removing expiration date | On a created public link, remove the expiration date  | Correct edition. Check in web UI|   |    | | 
| Edit folder permission | On a created public link on a folder, switch the permissions through every option | Correct edition. Check in web UI|  |  | | 
| Delete one | Delete an already create public link  |  Link not available anymore, check in file list |  |  | | 
| Delete all | Delete all public link of an item | Links not available anymore, check in file list |   |  | | 
| Send link | Create a link and use the open in option to send it | Options to send correctly displayed |   | | | 
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed |  |   | | 
| Copy link | Get copy link and paste in the browser | File correctly linked |   | | | 
|**Capabilities**||||||
| Share API disabled | Open file list | There is no option to share |  |  |
| Allow share via link disabled | Open file list | There is no option to share public, but there is for privates |   |  |
| Enforce password protection read only enabled | Create a public share with read only permission  and without password | Not posible |   |  |
| Enforce password protection read write enabled | Create a public share with read and write permission and without password | Not posible |   |  |
| Enforce password protection upload only enabled | Create a public share with upload only permission and without password | Not posible |   |  |
| Default expiration date | Create a public share and enable expiration date | Default date is there |   |  |
| Enforced expiration date | Create a public share and enforce expiration date | Default date is there and can not be removed|  |  |
| Allow resharing enabled | Share a file<br>Recipient tries to reshare  | Recipient can reshare|  |  |
| Allow resharing disabled | Share a file<br>Recipient tries to reshare  | There is no option to reshare |  |  |
| Allow sharing with groups disabled | Share a file with groups | Not posible |   |  |
| Default share permission | Set different options in web UI<br>Create a share in the app | Default options are the same |   |  |
| Allow send federated = false | Try to create a federated share | Not posible |   |  |
| Allow receive federated = false | Try to create a federated share | Not posible |  |  |
|**HEIC/HEIV to other formats**||||||
| View | Open settings view | Option to select heic/jpg is correctly displayed |  | |
| Heic selected | Select the option heic in settings<br>Upload pics in heic | Heic format in uploaded files, check in mime header | | |
| JPG selected | Select the option JPG in settings<br>Upload pics in heic | JPG format in uploaded files , check in mime header|  | |
| Heiv selected | Select the option heiv in settings<br>Upload videos in heiv | Heiv format in uploaded videos, check in mime header |  | |
| MP4 selected | Select the option MP4 in settings<br>Upload videos in heic | MP4 format in uploaded videos , check in mime header| | |
|**Share sheet**|||||
| Root | Save an external file in the root | File correctly saved |  |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | |  |  |
| Several files | Save several external files in oC | Files correctly saved |  |  |  |
| Several accounts | Add several accounts<br>Save several external files in oC | Files correctly 
|**Delete unused copies**||||
| View | Open Settings, and the "Delete unused local copies" section | Correct view in both orientations |  |  |
| 1 minute | Download several files<br>Set 1 minute<br>Wait 1 minute or close the app | Content deleted |   |  |
| Av. offline | Download several files<br>Set several files and folders as av. offline<br>Set 1 minute<br>Wait 1 minute or close the app | Download content deleted<br>Av. offline content keeps downloaded |   |  |
|**Other**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape |  | |
| Searching | Input a pattern to filter in the current folder | Results correct filtered | | 
| Quota correct | Open the root folder | Quota is correctly displayed | | |