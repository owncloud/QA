#### iOS13



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
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked  | P m13 |  |
|**Item Actions**||||||
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent | P m13 |  |
| Copy file | Copy a file to another location | Correctly copied | P m13 |  |
| Copy folder| Copy a folder to another location | Correctly copied | P m13 |  |
| Move file | Move a file to another location | Correctly moved | P m13 |  |
| Move folder| Move a folder to another location | Correctly moved | P m13 |  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated | P m13 |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated |  P m13|  |
| Rename file | Rename a file | Correctly renamed | P m13 |  |
| Rename folder| Rename a folder  | Correctly renamed |  P m13|  |
| Delete file | Delete a file | Correctly deleted | P m13 |  |
| Delete folder| Delete a folder  | Correctly deleted |  P m13|  |
| Sort Date | Sort the file list by date  | Newest on the top | P m13 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top | P m13 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m13 |  |
| Sort Type | Sort the file list by type  | grouped by type |  P m13|  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m13 |  |
| Sort Shared | Sort the file list by sharing  | Shared on the top | P m13 |  |
|**Upload & Download**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m13 |  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder | P m13|  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m13 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder|P m13 | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge a,ount of files| All files are uplaoded | P m13 | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears|  P m13| |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears|  P m13| |
| Download several files | Tap on several files | all are enqueued and finally downloaded |P m13 | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and finally downloaded. Last one is displayed | P m13| |
| Cancel download | Tap on a huge  file<br>Cancel it before it finishes | File is not downloaded | P m13 | 
| Cancel uploads | Upload a huge file<br>Cancel it before it finishes | File is not uploaded| P m13 |
| Clear storage | Tap on a huge number of files<br>Go to bookmark and manage space to remove | Everything is cleaned up | P m13| |
|**Av. offline**| **2 auth methods**|||||
|**File**|||||
| Set | Set a file as av. offline | File is downloaded (check in Manage options). Icon is correctly set (check in both orientations) | P m13 |  |  |
| Unset | 1. Unset a file as av. offline<br>2. Wipe all the files in Manage options | File is not downloaded. Icon is removed (check in both orientations) | P m13 |  |  |
|**Folder** |  |  |
| Set a folder as av. offline in card | 1. Swipe over a folder<br>2. Set as av. offline | All the content of the folder is downloaded. Correct icon on everything |  P m13
| Set the content of a folder as av. offline | 1. Browse a folder<br>2. Set as av. offline using the three dt button| All the content of the folder is downloaded. Correct icon on everything |  P m13 |  
| Set a folder with subfolders as av. offline | 1. Swipe over a folder which contains a deep structure of subfolders with special characters<br>2. Set as av. offline | All the content of the folder and subfolders is downloaded  and marked| P m13  |  
| Unset as av. offline a folder into an av. offline folder | 1. Swipe over a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | P m13
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |  P m13 |  
| Add into av. offline | Add some content into an av. offline folder | Content is downloaded and sync |  P m13 |  
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is not av.offine |  P m13
| Av. offline inside av. offline | Create a folder inside an av. offline folder<br>Upload content inside the folder | Folder and its content are av. offline | P m13  | 
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m13 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m13 |  |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m13 |  |
|**Files preview**| 1 device |||||
| PDF | Download an open a PDF file | Correctly displayed | P m13 |  |
| PDF search | Download an open a PDF file and search by a pattern | Correct search |  P m13|  |
| PDF Go To Page | Download an open a PDF file and go to a page | Correct jump | P m13 | |
| PDF List of Contents | Download an open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed | P m13 |  |
| Doc | Download an open a Doc file | Correctly displayed | P m13 |  |
| Excel | Download an open a excel file | Correctly displayed | P m13 |  |
| Ppt | Download an open a ppt file | Correctly displayed | P m13 |  |
| Txt | Download an open a txt file | Correctly displayed | P m13 |  |
| Image | Download an open a png, jpg files | Correctly displayed | P m13|  |
| Image Gallery | Download an open a png, jpg files and swipe in gallery mode | Correctly displayed | P m13 |  |
| Image Gallery actions | Download an open a png, jpg files and swipe in gallery mode <br> Perform a rename, delete, move, copy and duplicate while gallery is running| Gallery is not dismissed | P m13 |  |
| GIF | Download an open a GIF file | Correctly displayed | P m13 | To improve |
| Video | Download an open a video file. Go back and the video stops | Correctly played | P m13 | To improve |
| Audio | Download an open a video file. Go back and the music stops | Correctly played | P m13 |   |
| Non openable | Download an open a non openable file | Placeholder displayed with date and size| P m13 |  |
| Damaged | Download an open a damaged file | Placeholder displayed |P m13|  |
|**Streaming on**|||||||
| Stream video | Click on a non-downloaded video | Video streamed| P m13 |   |  |  |
| Stream audio | Click on a non-downloaded video | Audio streamed| P m13  |   |  |  |
|**Streaming off**|||||||
| Downloaded video | Click on a non-downloaded video | Video is downloaded and played in both orientations| P m13  | 
| Downloaded audio | Click on a non-downloaded video | Audio is downloaded and played in both orientations | P m13  | 
|**Offline**| 2 devices |||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection |  P m13|  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection | P m13  | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection | P m13  |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection |  P m13 |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection |  P m13 |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.|  P m13 |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection| P m13 |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection| P m13 |  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK | P m13 |   |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error |   |  |
| Rename | Rename item with existing name in target | Correct error |  |  |
| Copy | Copy item with existing name in target | Correct error |  |  |
| Move | Move item with existing name in target | Correct error |  |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error |  |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error |  |  |
|**Files App**||||||
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
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | | |
| Target folder deleted | Operations to perform in Files app after deleting target folder: move, copy | Correct error |  | |
|**Private Share**||||||
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user |  |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file |   |  |
| Share with a non existing user | Open Share<br>Type a user name that does not exist | No matches|  |  |
| Share with an already shared | Open Share<br>Type a user name which already has the file | Correct error|  |   |
| Share permission OK | Open Share<br>Share with another user with share permission<br>Try to reshare | Recipient can reshare |  |    |
| Share permission denied | Open Share<br>Share with another user with no share permission<br>Try to reshare |  Not posible |   |  |
| Edit permission OK | Open Share<br>Share with another user with edit permission<br>Recipient tries to edit<br>Try the same with Files App | Recipient can edit |   |  |
| Delete one recipient | Open Share<br>Share with several users<br>Delete one recipient | Recpient deleted, but in files view file is still marked as shared (private) |   |    |
| Delete all recipients | Open Share<br>Share with serveral users<br>Delete all recipients | Recipients deleted, in files view file is not marked as shared (private) |   |  |
| Recipient deletes | Share with a user<br>Recipient deletes the file in the file list | File is not shared, check in original user |   |  
| Remote share | In web UI create a share with different options | Correctly shown in the app |   |  |
| No edit granted | Share a file with a user, revoking editing and granting sharing | Recipient does not see edit option when resharing |  |   |  |
| Edit granted| Share a file with a user, granting editing and sharing | Recipient sees edit option when resharing |   |  |  |
| Folder no edit | Share a folder with a user, revoking whole edit permission and granting sharing | Recipient does not see edit option when resharing |  |  |  |
|**Federated Share**||||||
| Share with a user in other server | Open Share<br>Type a correct user name with remote URL<br>Recipient accepts | Sharees list updated with the user after accepting in web 
|**Public Share**||||||
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)|  |  | | 
| Create without name | Select to create a public link with no name  | Correct creation with  default name (check in web UI)|   |   | | 
| Create with password| Select to create a public link with password  | Correct creation with password. Paste the link in browser to be asked the password|   |  | | 
| Create with expiration date| Select to create a public link with expiration date  | Correct creation with expiration date. Check in web UI|   |   |  | 
| Create folder Download/View | Select to create a public link of a folder with Download/View permission  | Correct creation. Check in web UI|   |  | | 
| Create folder Download/View/Upload | Select to create a public link of a folder with Download/View/Upload permission  | Correct creation. Check in web UI|   |  | | 
| Create folder Upload Only (File Drop) | Select to create a public link of a folder with Upload only permission  | Correct creation. Check in web UI|  |  | | 
| Edit name | On a created public link, edit the name  | Correct edition. Check in web UI|  |   | | 
| Edit password | On a created public link, edit the password  | Correct edition. Check in web UI|   |  | | 
| Edit expiration date | On a created public link, edit the expiration date  | Correct edition. Check in web UI|   |  | | 
| Edit folder permission | On a created public link on a folder, switch the permissions through every option | Correct edition. Check in web UI|  |  | | 
| Delete one | Delete an already create public link  |  Link not available anymore, check in file list |  |  | | 
| Delete all | Delete all public link of an item | Links not available anymore, check in file list |   |  | |  
|**Private link**||||||
| Get link View | Open Share view | Option correctly displayed |  |   | | 
| Copy link | Get copy link and paste in the browser | File correctly linked |   | | | 
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