#### Regression 

#### PR: <br>


Device/s: iPhoneXR v15.1, iPadAir v14.<br>
Server: 10.8 <br>
Xcode version: 12.5.1 (12E507)<br>

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
13 -> iOS version<br>
NA -> non applicable

P 13 -> Passed in an iPhone with iOS13<br>
F t13 -> Failed in an iPad with iOS13<br>
P m13 t12 -> Passed with an iPhone with iOS13 and an iPad with iOS12 <br>
P m13 F t12 -> Passed with an iPhone with iOS13 and failed with an iPad with iOS12 <br>

Not tested: multiselection, files app, cellular transfers, local search

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :----: | :------------- |
|**Basic Auth**||||||
| Basic auth http | 1. Type an correct URL to the app with http and basic auth | 2. Host certificate is there. Credentials are asked  | P m15 t14  |  |
| Basic auth https | 1. Type an correct URL to the app with https and basic auth | 2. Host certificate is there, asked from approval. Credentials are asked  |   P m15 t14 |  |
| Basic auth right credentials | 1. Type an correct URL to the app with basic auth<br>Type correct credentials | File list accesible |  P m15 t14  |  |
| Basic auth wrong credentials | 1. Type an correct URL to the app with basic auth<br>Type wrong credentials | Error | P m15 t14   |  |
| Redirection 301 | 1. Type an correct URL to a sever with 301 redirection<br>Type correct credentials | File list accesible | P m15 t14   |  |
| Redirection 302 | 1. Type an correct URL to a sever with 302 redirection<br>Type correct credentials | File list accesible | P m15 t14   |  |
| LDAP | 1. Type an correct URL to the app agains LDAP server<br>Type correct credentials | File list accesible |  P m15 | AUTO |
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m15 t14
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded |P m15 t14
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m15 t14
| Remove token | 1. After being logged, remove token in server side | App detects inline the lack of authenthication and prompts the user to continue online or sign in again  | P m15 t14
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed |P m15 t14
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded |P m15 t14
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keep on using the app | NA
| Logout | Logout in a open and active OIDC session | Moved to login view| NA | |
| **Login view** |   |  |
| One account | Enter correct credentials of an account | Login correct. One account view displayed with all sections: Display name, access files, edit login, manage storage, log out, settings, add account | P m15 t14 | FIXED: Some options are missed, Glitch after connecting
| More than one account | Enter correct credentials of two accounts | Login correct. List view displayed with all accounts. Swiping: Edit login, manage storage, delete | P m15 t14
| Edit login | 1. Enter correct credentials of one account<br>2. In server, change password<br>3. Select Edit login<br>4. Enter new credentials | Login correct |P m15 t14
| Manage storage | 1. Enter correct credentials of one account<br>2. Download some files by clicking on them<br>3. In login view, select Manage Storage<br>4. Delete all offline files | All downloaded files are removed (download icon is again visible)|P m15 t14
|**Settings**|1 device|||||
| Passcode 4 digit | 1. Enable passcode<br>2. Select 4 digit<br>3. Set a code<br>2. Close app and open again| 4-digit passcode asked | P m15 |  |
| Passcode 6 digit | 1. Enable passcode<br>2. Select 6 digit<br>3. Set a code<br>2. Close app and open again| 6-digit passcode asked |  P m15|  |
| Passcode Files App| 1. Enable passcode and set a code<br>2. Close app and open Files App| Passcode asked (check with 4 and 6 digits) | P m15 |  |
| Passcode removed | 1. Disable passcode<br>2. Close app and open again| Passcode not asked | P m15 |  |
| Face ID | 1. Enable Face ID (it must be enrolled in device)<br>2. Close app and open again| Face ID asked | P m15 |  |
| Face ID removed | 1. Disable Face ID<br>2. Close app and open again| Face ID not asked. Passcode asked | P m15 |  |
| Lock | 1. Enable passcode lock<br>2. Set lock after 1 minute<br>3. Minimize the app and reopen before 1 minute<br>4. Minimize again and reopen after 1 minute| 3. Passcode not asked<br>4. Passcode asked | P m15 |  |
| Certificate different key | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. In Settings, open "Certificates"<br>3. Revoke the certificate<br>4. Add an account in the same server | 2. Host certificate is there.<br>4. Certificate Approval is asked and differences are displayed (they can be hidden)  | P m15 |  |
| Same key cert | 1. Attach one account to the app with non-secure https, accepting the certificate<br>2. Add another account with different certificate but signed wuith the same key | Certificate Approval is not asked. In Settings > Certificate, it appears as auto approved  | P m15  |  |
| Theme | 1. Select Dark<br>2. Select Classic<br>3. Select Light<br>4. Select System | All themes are correcly saved and displayed in file list | P m15 t14 | FIXED: Some colors are missed |
| Delete unused | 1. Set Delete unused copies to 1 minute<br>2. Download two files | After 1 minute, local copies are removed (download icon appears again the row on the file list) | F m15 | Not deleted. Moved to new release |
| Show hidden | 1. Enable setting "show hidden files"<br>2. In web, create a file of folder that stars with .<br>3. Disable the setting| 2. Item displayed in app<br>3. Item not displayed| P m15 |  |
| Show folders at the top | 1. Enable setting "show folders at the top"<br>2. Disable setting "show folders at the top"| 1. Folders placed at the top in list of files<br>2. Folders mixed with files depending of the sort method in list of files| P m15 |  |
| Prevent gestures enabled | 1. Enable setting "Prevent gestures"<br>2. Try to drag an drop<br>3. Try to do a multiselection with two fingers| Actions work | P m15 |  |
| Prevent gestures disabled | 1. Disable setting "Prevent gestures"<br>2. Try to drag an drop<br>3. Try to do a multiselection with two fingers| Actions are not posible | P m15 |  |
| Streaming enabled | 1. Enable setting "Streaming"<br>2. Open a video file| Video is played and not downloaded. Cloud icon remains in the item in list of files | P m15 |  |
| Streaming disabled | 1. Disable setting "Streaming"<br>2. Open a video file| Video is downloaded and then played. Cloud icon removed from the item in list of files | P m15 |  |
| Media upload HEIC > JPG | 1. Enable setting "Convert HEIC to JPG"<br>2. Upload an HEIC file| File is saved as JPG | P m15 |  |
| Media upload MP4 | 1. Enable setting "Convert videos to MP4"<br>2. Upload video file in MOV format| Video is saved as MP4 | P m15 |  |
| Media upload Preserve original name enabled | 1. Enable setting "Preserve original media file names"<br>2. Upload a picture| Picture is saved with format IMG_xxxx |  P m15|  |
| Media upload Preserve original name disabled | 1. Disable setting "Preserve original media file names"<br>2. Upload a picture| Picture is saved with format Photo-timestamp_xxxx| P m15 |  |
| Media upload Prefer unedited (IAP) | 1. Enable setting "Prefer unedited"<br>2. With photos app, edit a picure with some filters...<br>3. Upload a picture| Picture is saved with out changes, in original version| P m15 |  |
| Documentation | Open Documentation Section  | Documentation web is opened | P m15  |   |
| Help | Open Help Section  | Help web is opened | P m15  |  |
| Send feedback | Open Send feedback section | feedback mail is opened| P m15  |  |
| Recommend | Open Recommend section | recommend mail is opened| P m15  |  |
| Privacy policy | Open Privacy policy section | privacy policy is opened| P m15  |  |
| Acknowledgement | Open Acknowledgement section | Acknowledgement is opened| P m15  |  |
| App version | 1. Click on the App version cell<br>2. Paste in a text editor  | 1. Copied to clipboard<br>2. Information correctly pasted |  P m15 |  |
|**Item Actions**| 1 device|||||
| Create folder | In (+) menu of the list of files, select create folder | Correctly created | P m15  | AUTO  |
| Open In | Open a file in a 3rd party app | Correctly downloaded and sent | P m15    |  |
| Copy file | Copy a file to another location | Correctly copied | P m15  | | |
| Copy folder| Copy a folder to another location | Correctly copied | P m15  | AUTO |  |
| Move file | Move a file to another location | Correctly moved | P m15  | |  |
| Move folder| Move a folder to another location | Correctly moved |  P m15  | AUTO|  |
| Duplicate file | Duplicate a file to another location | Correctly duplicated | P m15  | |  |
| Duplicate folder| Duplicate a folder to another location | Correctly duplicated | P m15  | AUTO |  |
| Rename file | Rename a file | Correctly renamed | P m15  | AUTO |  |
| Rename folder| Rename a folder  | Correctly renamed | P m15  | AUTO |  |
| Delete file | Delete a file | Correctly deleted |  P m15  | |  |
| Delete folder| Delete a folder  | Correctly deleted | P m15  | AUTO |  |
| Favorite file | Open the card of a file and click the favorite star | File is favorited (check in server) |  P m15|  |
| Unfavorite file | Open the card of a favorited file and click the favorite star | File is unfavorited (check in server) | P m15 |  |
| Sort Date | Sort the file list by date  | Newest on the top | P m15 |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top | P m15 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m15 |  |
| Sort Type | Sort the file list by type  | Grouped by type | P m15 |  |
| Sort Size | Sort the file list by size  | Biggest on the top | P m15 |  |
| Sort Date | Sort the file list by date  | Newest on the top | P m15 |  |
| Sort Shared | Sort the file list by shared  | Shared on the top | P m15 |  |
|**Clipboard**| 1 device|||||
| Copy file same account | 1. Select to copy a file<br>2. Copy to Clipboard<br>3. Paste in another location in the same account | Correctly copied. Notification indicating the number of copied items | P m15  |
| Copy file another account | 1. Select to copy a file<br>2. Copy to Clipboard<br>3. Paste in another location in other oC account | Correctly copied. Notification indicating the number of copied items |  P m15 |
| Copy file another location | 1. Select to copy a folder<br>2. Copy to Clipboard<br>3. Paste in another location (not oC) | Correctly copied. Notification indicating the number of copied items | P m15  |
| Copy folder same account | 1. Select to copy a folder<br>2. Copy to Clipboard<br>3. Paste in another location in the same account | Correctly copied. Notification indicating the number of copied items | P m15  |
| Copy folder two accounts | 1. Add two accounts<br>2. Select to copy a folder (no matter which account)<br>3. Copy to Clipboard | Note inside the notification about "folders only copied in the same account" | P m15 | 
| Copy folder another account | 1. Select to copy a file<br>2. Copy to Clipboard<br>3. Paste in another location in other oC account | Correctly copied. Notification indicating the number of copied items | NA  | Not supported yet
| Cut item same account | 1. Cut any item<br>2. Paste to another location in the same account | Correctly pasted. Notification indicating the number of cut items |  P m15 |
| Cut item another account/location| 1. Cut any item<br>2. Paste to another location  | Correctly pasted. Notification indicating the number of cut items | NA  | Not supported yet
|**Upload & Download**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m15 t14|  |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder| P m15 t14 |  |
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m15 t14 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P m15 t14 | |
| Upload a bunch of files | Select "Upload from  Files in a non-root folder<br>Select a huge amount of files (~300)| All files are uplaoded |P m15 t14  | |
| Restrict uploads to None |In Device Settings > ownCloud > Photos, Select "None"<br>Try to upload a picture from albums| Not allowed, error displayed |P m15 t14 | |
| Restrict upload to Selected I |In Device Settings > ownCloud > Photos, Select "Selected Photos"<br>Try to upload a picture from albums that were not selected in previous step| Not allowed, error displayed | P m15 t14| |
| Restrict upload to Selected II |In Device Settings > ownCloud > Photos, Select "Selected Photos"<br>Try to upload a picture from albums that were selected in previous step| Pics uplaoded |P m15 t14 | |
| Download file in non-root | Tap on a single file | File is downloaded in non-root folder. Download icon disappears| P m15 t14 | |
| Download big file in root | Tap on a single file | File is downloaded in root folder. Download icon disappears|P m15 t14 | |
| Download several files | Tap on several files | all are enqueued and fully downloaded | P m15 | |
| Download a bunch of files | Tap on a huge number of files| all are enqueued and fully downloaded. Last one is displayed |P m15 t14 | |
|**Auto uploads**||||||
| Auto uploads Photos | In Settings, Media Upload, enable Auto uploads for photos with a correct target folder<br>Take some photos and videos| Pics are uploaded after opening the app. Videos are not uploaded | P m15 t14 |  |
| Auto uploads videos | In Settings, Media Upload, enable Auto uploads for videos with a correct target folder<br>Take some photos and videos| Videos are uploaded after opening the app. Photos are not uploaded | P m15 t14 |   |
|**Multiaccount**||||||
| Switch account | Create several accounts and browse through them | Correct browsing | P m15 | |
| Upload in several | Upload several items to different accounts at the time | All items corectly uploaded | P m15 t14 | |
| Download in several | Download several items in different accounts at the time | All items corectly uploaded | P m15 t14 |  |
|**Files preview**||||||
| PDF | Download and open a PDF file | Correctly displayed | P m15 t14 |  |
| PDF search | Download and open a PDF file and search by a pattern | Correct search |P m15 t14 |  |
| PDF Go To Page | Download and open a PDF file and go to a page (in the page counter) | Correct jump | P m15 t14|  |
| PDF List of Contents | Download and open a PDF file and open the list of contents. Switch thumbnails/list| Correct displayed | P m15 t14 |  |
| PDF Full screen | Download and open a PDF file and tap on the screen| Correct displayed in full screen | P m15 t14 |  |
| PDF Navigate | Download and open a PDF file<br>Open search, and search for a common pattern to have a bunch of results<br>Navigate through the results in the file| Results are shown on the file<br>Navigation correct |P m15 t14  |  |
| Doc | Download and open a Doc file | Correctly displayed |P m15 t14 |  |
| Excel | Download and open a excel file | Correctly displayed |P m15 t14 |  |
| Ppt | Download and open a ppt file | Correctly displayed |P m15 t14 |  |
| Txt | Download and open a txt file | Correctly displayed |P m15 t14 |  |
| Image | Download and open a png, jpg files | Correctly displayed |P m15 t14 |  |
| GIF | Download and open a GIF file | Correctly displayed | P m15 t14|  |
| Video | Download and open a video file. Go back and the video stops | Correctly played | P m15 t14 |  |
| Slow-mo Video | Download and open a slow-mo video file. taken with the camera| Correctly played in slow mo | P m15 t14  |  |
| Audio | Download and open a audio file. Go back and the music stops | Correctly played | P m15 t14 |  |
| Media background | Download an open a audio file. Switch the screen off | Audio plays in background |P m15 t14  |  |
| Non openable | Download and open a non openable file | Placeholder displayed with date and size|P m15  t14|  |
| Damaged | Download and open a damaged file | Placeholder displayed |P m15 t14 |  |
| Presentation mode | 1. On device, set screen auto-lock for 30 seconds<br>2. Open any file<br>3. Set in card "Presentation mode"| After 30 seconds, screen keeps alive | P m15 t14|  |
| Presentation mode cancel | 1. On device, set screen auto-lock for 30 seconds<br>2. Open any file<br>3. Set in card "Presentation mode"<br>4. Cancel it in the dialog| After 30 seconds, screen locks |P m15 t14 |  |
|**Offline**| 1 device|||||
| Create folder no conn | Create folder without connection<br> Recover connection | Action is done after recovering connection | P m15  |  |
| Move item  no conn| Move item without connection<br> Recover connection | Action is done after recovering connection | P m15  | |
| Copy item  no conn| Copy item without connection<br> Recover connection | Action is done after recovering connection | P m15  |  |
| Duplicate item  no conn| Duplicate item without connection<br> Recover connection | Action is done after recovering connection |  P m15 |  |
| Remove item  no conn| Remove item without connection<br> Recover connection | Action is done after recovering connection | P m15  |  |
| Download item  no conn| Download item without connection<br> Recover connection | First, an error is received.|  P m15 |  |
| Upload item  no conn| Upload item without connection<br> Recover connection | Action is done after recovering connection| P m15  |  |
| Upload many items  no conn| Upload many items without connection<br> Recover connection | Action is done after recovering connection| P m15 |  |
| All actions  no conn| Perform all actions above without connection<br> Recover connection | Every action is done after recovering connection. All process finishes OK| P m15  |   |
| Maintenance mode | Actions under maintenance mode: create folder, delete, remove, move, duplicate, upload | Actions are done after recovering connection|  P m15  |  |
|**Error handling**|1 device|||||
| Create folder | Create folder with existing name | Correct error |P m15   |  |
| Rename | Rename item with existing name in target | Correct error | P m15  |  |
| Copy | Copy item with existing name in target | Correct error | P m15  |  |
| Move | Move item with existing name in target | Correct error |  P m15 |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error | P m15  |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error | P m15 |   |
| Several| Cause together some of the errors above| Messages are grouped by kind, and can be fixed individually or grouped  | P m15 |   |
|**Conflict handling**|1 device|||||
| Conflict detected | 1. Edit a file with device 1<br>2. Edit the same file with device 2<br>3. Submit changes with device 1<br>4. Submit changes with device 2 just a couple of seconds later | Device 1 uploads its new version correctly<br>Device 2 shows the conflict with three options: Cancel, Replace, Keep Both |  P m15|
| Cancel | 1. Cause a conflict following steps in Conflict detection case<br>2. In Device 2, Select `Cancel` |  Device 1 uploads its new version correctly<br> Local copy in Device 2 is deleted | P m15 |
| Replace | 1. Cause a conflict following steps in Conflict detection case<br>2. In Device 2, Select `Replace` |  Device 1 uploads its new version correctly<br> Device 2 replaces its version with the server version uploaded by Device 1<br>Device 1 updates its version to the Device 2 one | P m15 |  |
| Keep Both | 1. Cause a conflict following steps in Conflict detection case<br>2. In Device 2, Select `Keep Both` |  Device 1 uploads its new version correctly<br> Device 2 keeps its version locally and creates a new file with the version uploaded by Device 1 | P m15 |
|**Available Offline**|1 device|||||
| File | 1. Set a file as av. offline<br>2. In the list of accounts: swipe left the account, and select Manage<br>3. Select "Delete local copies"<br>4. Remove device connection<br>5. Open the file | File is accessible | P m15 | AUTO |
| Folder | 1. Set a folder with subfolders as av. offline<br>2. In the list of accounts: swipe left the account, and select Manage<br>3. Select "Delete local copies"<br>4. Remove device connection<br>5. Open the folder | All the content in the folders and subfolders is accesible and openable | P m15 | |
| Add to av. offline | 1. Set a folder as av. offline<br>2. Copy or move a file and a folder inside the av. offline folder | Content copied/moved is now av. offline | P m15 | AUTO |
| Displace av. offline file | 1. Set a file as av. offline<br>2. Move the file to another location that is not av. offline| File is av. offline in the new location | P m15 | |
| Displace from av. offline folder | 1. Set a folder as av. offline<br>2. Copy or move a file and a folder from the av. offline folder to another location that is not av. offline| Content copied/moved is not av. offline anymore | P m15| |
|**Files App**| **2 auth methods** 1 device |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P m15 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P m15 |  |
| Browse Basic | Open an ownCloud Files app location | Content is correctly displayed | P m15|  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P m15|  |
| Download Basic| Open an ownCloud Basic auth Files app location<br>Download a file | File is correctly displayed | P m15 |  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P m15 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P m15 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is remed correctly in oC app |  P m15|  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app |  P m15| |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P m15 |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P m15|  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P m15 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P m15 |  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P m15 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  P m15 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | P m15  |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P m15 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  |  P m15 |   |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P m15  | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P m15 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app |P m15  |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P m15 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P m15 |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | P m15 |  |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |  P m15|  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted |  P m15|  |
| Move between oC accounts root | Move a file from an oC account to anocther one in root folder | Content correctly moved |  P m15|  |
| Move between oC accounts non-root | Move a file from an oC account to anocther one in non-root folder | Content correctly moved | P m15 |  |
| Copy between oC accounts root | Copy a file from an oC account to anocther one in root folder | Content correctly copied |  P m15|  |
| Copy between oC accounts non-root | Copy a file from an oC account to anocther one in non-root folder | Content correctly copied | P m15 |  |
| Share a file with user | 1.Select a file or folder<br>2. In contextual menu, select Share<br>3. Select sharee | Content correctly shared |  P m15|  |
| Share a file by link | 1.Select a file or folder<br>2. In contextual menu, select Links<br>3. Create a new link (with defaults) | Link correctly created |  P m15|  |
|**Remote actions (Files App)**||||||
| Rename remote| Rename a file or folder in web UI | File is automatically renamed in Files app | P m15 |  |
| Move remote| Move a file or folder in web UI | File is automatically moved in Files app | P m15|  | |
| Delete remote| Delete a file or folder in web UI | Delete is automatically moved in Files app | P m15 |  |
| Upload remote| Upload new content in web UI | New content refreshed in Files app | P m15 |  |
|**Error handling (Files App)**||||||
| Colliding name | Move, copy or rename a folder, so the target collides with an existing item | Correct error | P m15 | |
| Target folder deleted | Select Move/Copy of an item in Files app<br>Before submitting the operation, remove the target folder using another client or device  | Correct error |P m15  | |
|**Private Share**|1 device|||||
| Share with a user | Open Share<br>Type a correct user name<br>Select user | Sharees list updated with the user |  P m15 | AUTO |  |
| Share with a group | Open Share<br>Type a correct group name<br>Select group | Group list updated with the user. Check that every user in the group can access the file |P m15 | AUTO  |  |
| Permissions | 1. Open Share<br>2. Type a correct user name<br>3. Select user<br>4. Revoke "Can Edit and Change" permission | Share is created with the correct permissons (check in web UI) | P m15 | AUTO |  |
| Edit | 1. Using a created share, modify permissions (grant new permissions and revoke existing permissions)| Share is updated with the correct permissons (check in web UI) | P m15 | AUTO |  |
| Delete | Delete an existing share by swiping left in the list of shares| Share is removed (check in web UI) | P m15 | AUTO |  |
|**Public Link**|1 device|||||
| Create with name | Select to create a public link with an specific name | Correct creation with name (check in web UI)| P m15 | AUTO  |  | | 
| Create with Download/View/Upload | Select to create a public link with Download/View/Upload permission | Correct creation with permissions (check in web UI)|P m15 | AUTO | | | 
| Create with Upload Only | Select to create a public link with "Upload Only" permission | Correct creation with permissions (check in web UI)| P m15 | AUTO| | | 
| Create with Password | Select to create a public link with password | Correct creation with password (check in web UI). Open the link in browser and check password is asked| P m15 | AUTO| | | 
| Create with Expiration | Select to create a public link with expiration date | Correct creation with expiration date (check in web UI) | P m15 | AUTO| | | 
| Edit | 1. In the list of shares, open an existing public share<br>2. Change the name, the permission, password and expiration date | Correct edition (check in web UI). Get the link and open in browser to check password is correct. | P m15 | AUTO| | | 
| Delete | 1. In the list of shares, delete an existing public link | Public link is deleted (check in web ui)  |P m15 | AUTO | | | 
|**Private link**|1 device|||||
| Get link View | Open Share view | Option correctly displayed | P m15 |  |    | | 
| Copy link | Get copy link and paste in the browser | File correctly linked |   P m15 | | | | 
|**Universal link**|1 device|||||
| File in root supported not downloaded | 1. Get private link of a supported format downloaded file in root<br>2. Open the link in the device (use suffix owncloud://)| App is opened and the file is downloaded and opened |  P m15 |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device (use suffix owncloud://) | App is opened and folder content displayed |  P m15|  |
| Different accounts | 1. Get private link of three items in three different accounts<br>2. Open the links in the device when the open account is a different one | App is opened and the items are correctly shown inside their accounts |  P m15 |  |
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message  about unknown link|  P m15|  |
|**Share Sheet**||||||
| Root | Save an external file in the root | File correctly saved | P m15 t14  |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m15 t14  |  |  |
| Share many | Save many external files in the root | Files correctly saved |  P m15 t14 |  |  |
| Share text | In Safari, open a web page and select text<br>Share it with oC | Text saved in a text file | P m15 t14  |   |  |
| Share image | In Safari, open a web page and select an image onto a web<br>Share it with oC | Image saved correctly|  P m15 t14| |  |
| Several accounts | Add several accounts<br>Save an external file in the root folder of one of them, that is not the current one | File correctly saved in the selected account | P m15 t14 |  |  |
|**Drag & Drop**|1 device (iPad)|||||
| Safari txt| Drag and drop text from Safari into the oC app| Text saved in a new file| P t14 | |  |
| Safari picture | Drag and drop image from Safari into the oC app| Picture saved in a new file| P t14  | |  |
| Notes txt | Drag and drop text from Notes app into the oC app| Text saved in a new file|P t14   | |  |
| Mail | Drag and drop text from Mail app into the oC app| Text saved in a new file| P t14 | |  |
| Mail file | Drag and drop attached file from Mail app into the oC app| File saved in the app| P t14 | |  |
| Photos picture | Drag and drop image from Photos into the oC app| Picture saved in a new file| P t14 | |  |
| Photos video | Drag and drop video from Photos into the oC app| Video saved in a new file| P t14 | |  |
| Pages file | Drag and drop file from Pages into the oC app| File saved in a new file| P t14 | |  |
|**IAP features**| Use an enterprise server |||||
| Document Scanner PDF | Open (+) menu in root folder<br>Select Scan Document<br>Scan a document<br>Set a file name and a correct location<br>Select PDF as format | PDF file correctly uploaded | P m15 t14  | |
| Document Scanner JPG | Open (+) menu in root folder<br>Select Scan Document<br>Scan a document<br>Set a file name and a correct location<br>Select JPG as format | JPG file correctly uploaded | P m15 t14 | |
| Markup PDF Overwrite | Open card of PDF file<br>Select Markup<br>Add some strokes, sign and some shapes<br>Overwrite the file with new changes | File correctly saved with new changes | P m15 t14 | |
| Markup JPG New file | Open card of image file<br>Select Markup<br>Add some strokes, sign and some shapes<br>Save in a new file | New file correctly saved with new changes | P m15 t14 | |
| Metadata | Open card of image file<br>Select Metadata | Check that information there is correctly displayed| P m15 t14 | |
| Shortcuts | Open Shortcuts app (iOS>13) and create a shortcut to create new folder in an existing oc account<br>Execute the shortcut | Folder is created | P m15 t14 | |
| Shortcuts error | 1. Open Shortcuts app (iOS>13) and create a shortcut to create new folder in an existing oc OAuth2 account<br>2. Remove token from  admin dashboard<br>3. Execute the shortcut | Correct error displayed | P m15 t14| |
| Account with IAP locked | Create a new account in a server with no IAP features available | Shortcuts can not be executed<br>Scan Documents is locked<br>Markup for PDF and JPG is locked<br>Image metadata for images is locked | P m15 t14| |
|**Miscellaneous**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m15 t14 | |
| Quota correct | Open the root folder | Quota is correctly displayed | P m15 t14| |
| Contextual menu | Long press over an item of the list | Contextual menu displayed| P m15 t14  | AUTO |
| Take photo and video | In file list,in the (+) menu, select "Take photo or video"<br>Take a photo and then, a video | Both are uploaded to the current folder| P m15 t14  | |
| Quick access | Open quick access section and check images, pdfs and documents |  Check that the info showed matches with the account| P m15 t14 | |
| Restoration | 1. Open a file<br>2. Go to background (homescreen) without killing<br>3. Open another app and then kill oC app<br>4. Open app  | Displayed the file opened in 1.  | P m15 t14 | |
|**Accesibility**|1 device|||||
| Voice Over | Enable Voice Over and perform some basic exploratory tests, putting more effort in the newest features.In this case, the only-one-account presentation view| Commands and names are correctly spelt | P m15 | |
|**Upgrade**||||||
| From previous| 1. Install previous version with basic, OAuth2 and OIDC accounts<br>2. Perform some actions like download some files, set folders as available offline and share some items<br>3. Enable all the Settings<br>4. Install current version| Correct Upgrade<br>Correct Release Notes<br>Settings are correct<br>All accounts are correct and actions persist| P m15 t14 | |
|**Changelog**||||||
| [#1044](https://github.com/owncloud/ios-app/pull/1044) |  |  | P m15 t14 |  |
| [#1053](https://github.com/owncloud/ios-app/pull/1053) |  |  | P m15 t14 |  |
| [#1051](https://github.com/owncloud/ios-app/pull/1051) |  |  | P m15 t14 |  |
| [#1061](https://github.com/owncloud/ios-app/pull/1061) |  |  | P m15 t14 |  |