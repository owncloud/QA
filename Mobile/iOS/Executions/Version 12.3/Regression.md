# Release


**Device/s**: iPhone XR v18.0. iPad v17.6  <br>
**Server**: oCIS 5.0.6  <br>
**Xcode version**: Version 15.4 (15F31d)<br>
**Date**: 16/09/2024 <br>
**Tester**: jrecio <br>
**Context**: improvements in iOS SDK<br>

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

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :----: | :------------- |
|**Basic Auth**||||
| Basic auth http | 1. Type an correct URL to the app with http and basic auth | Host certificate is there. Credentials are asked  | P m18 t17  |  |
| Basic auth right credentials | 1. Type an correct URL to the app with basic auth<br>2. Type correct credentials<br>3. Add name to the bookmark | Account list displayeed including the new account with bookmark name |  P m18 t17  |  |
| Basic auth wrong credentials | 1. Type an correct URL to the app with basic auth<br>2. Type wrong credentials | Error: `Authorization failed` | P m18 t17   |  |
| Red 301 | 1. Enter an URL that points to 301 redirection<br>2. `Approve`<br>3. Complete the authentication process | 1. `Review connection` dialog displayed, showing the target URL<br>2. Redirection followed to the new location. New Location displayed in login view<br>3. Account added and listed using the target URL |  P m18 t17  |  |  
| **OAuth2** |   |  |
| Correct credentials | 1. Enter correct credentials in OAuth2 view (browser)<br>2. Add name to the account (optional)| Account added and listed | P m18 t17  |  | 
| Cancel OAuth2 Login | 1. Enter correct credentials in OAuth2 view (browser)<br>2. Cancel authentication process in browser| Moved to login view | P m18 t17  |  |
| Renewal OAuth2 token | 1. Enter correct credentials in browser and authorize<br>2. Wait till token expires (default 1h)<br>3. Perform any operations in the list of files | Operation is completed with no authentication/authorization errors. Check with mitmproxy or any other tool that the token endpoint was called | P m18 t17 
| Revoke OAuth2 token (oC10) |1. Enter correct credentials in browser and authorize<br>2. Revoke the iOS token<br>3. Perform any operation in list of files<br>4. Click on `Sign In` and enter correct credentals | 3. Error in list of files: `Access denied`<br>4. List of files displayed again. |  P m18 t17  |  |
| Logout  | 1. Complete authentication/authorization process in a OAuth | | NA 
| **OIDC** |   |  |
| Correct credentials | 1. Enter correct credentials in OIDC view (browser)<br>2. Add name to the account (optional)| Account added and listed | P m18 t17  |  | 
| Cancel OIDC Login | 1. Enter correct credentials in OIDC view (browser)<br>2. Cancel authentication process in browser| Moved to login view | P m18 t17  |  |
| Cancel OIDC Authorizaton | 1. Enter correct credentials in browser<br>3. Cancel process in authorization view | Moved to login view |P m18 t17   |  |
| Renewal OIDC token | 1. Enter correct credentials in browser and authorize<br>2. Wait till token expires (default 1h)<br>3. Perform any operations in the list of files | Operation is completed with no authentication/authorization errors. Check with mitmproxy or any other tool that the token endpoint was called | P m18 t17 
| Revoke OAuth2 token |1. Enter correct credentials in browser and authorize<br>2. Revoke the iOS token<br>3. Perform any operation in list of files<br>4. Click on `Sign In` and enter correct credentals | 3. Error in list of files: `Access denied`<br>4. List of files displayed again. | NA | No way|
| **Accounts view (sidebar)** |  Logged user |  |
| One account | 1. Open sidebar menu with the up-left button<br>2. Open the account pill | 1. Only one account listed<br>2. Sections: `Personal`, `Shares`, `Spaces` (only oCIS), `Quick access`, `Status` | P m18 t17  |
| More than one account | 1. Enter correct credentials of more accounts<br>2. Open sidebar menu with the up-left button<br>3. Open the account pill for every account  | 2. All accounts listed<br>3. Sections: `Personal`, `Shares`, `Spaces` (only oCIS), `Quick access`, `Status`  |  P m18 t17 |
| Account options | 1. Open sidebar menu with the up-left button<br>2. Long press over the account pill | 1. Only one account listed<br>2. Sections: `Edit`, `Manage`, `Delete`, `Disconnect`, `Open in new window` (only iPad) | P m18 t17  |
| Edit credentials | 1. Long press over the account pill<br>2. Select `Edit`<br>3. In server, change credentials<br>4. Enter new credentials in app | Login correct, file list displayed | P m18 t17 |
| Edit name | 1. Long press over the account pill<br>2. Select `Edit`<br>3. Enter new name<br>4. Save | Account name edited and displayed in the account pill after reopening the app | P m18 t17
| Manage storage | 1. Download some files by clicking on them in the file of list, and set some fles as av. offline<br>2. Long press over the account pill in sidebar<br>3. Select `Manage`<br>4. Click on `Delete all Offline files` | All downloaded files are removed (download icon is again visible) but the av. offline| P m18 t17 | |
| Manage storage av. offline | 1. Download some files by clicking on them in the file of list<br>2. Long press over the account pill in sidebar<br>3. Select `Manage`<br>4. Click on `Delete all Offline files` and select `Include available offline` | All downloaded files are removed (download icon is again visible) including the available offline | P m18 t17 | |
| Delete |  1. Long press over the account pill<br>2. Select `Delete`| Account removed from the sidebar and device | P m18 t17  || 
|**Settings**||||||
| Passcode 4 digit | 1. Enable `Passcode Lock`<br>2. Select `4 digit code`<br>3. Set a code by entering twice<br>4. Don't use Face ID<br>5. Close app and open again| 4-digit passcode asked | P m18 t17 |  |
| Passcode 6 digit | 1. Enable `Passcode Lock`<br>2. Select `6 digit code`<br>3. Set a code by entering twice<br>4. Don't use Face ID<br>5. Close app and open again| 6-digit passcode asked | P m18 t17 |  |
| Passcode Files App| 1. Enable `Passcode Lock` and set a code<br>2. Close app and open Files App. selecting an ownCloud account | Passcode asked (check with 4 and 6 digits) |  P m18 t17|  |
| Passcode removed | 1. Disable `Passcode lock`<br>2. Close app and open again| Passcode not asked anymore | P m18 t17 |  |
| Face ID | 1. Enable `Face ID` (it must be enrolled in device and passcode enabled in advance)<br>2. Close app and open again| Face ID asked |  P m18 t17|  |
| Face ID removed | 1. Disable `Face ID`<br>2. Close app and open again| Face ID not asked.<br> Passcode asked | P m18 t17 |  |
| Face ID failing | 1. Enable `Face ID`<br>2. Close app and open again, making Face ID fail<br>3. Unlock using passcode<br>4. Open app again | Face ID not asked.<br> Passcode asked | P m18 t17 |  |
| Lock | 1. Enable `Passcode lock<`br>2. Set lock application after 1 minute<br>3. Minimize the app and reopen before 1 minute<br>4. Minimize again and reopen after 1 minute| 3. Passcode not asked<br>4. Passcode asked | P m18 t17 |  |
| Theme | 1. Select Dark<br>2. Select Light<br>3. Select System | All themes are correcly saved and displayed in file list | P m18 t17 |  |
| Delete unused | 1. Set `Delete unused copies` to 1 minute<br>2. Download two files | After 1 minute, local copies are removed (download icon appears again in the row on the file list) | P m18 t17  |  |
| Show hidden | 1. Enable setting `Show hidden files`<br>2. In web, create a file of folder that stars with `.`<br>3. Disable the setting| 2. Item displayed in file list<br>3. Item not displayed in file list| P m18 t17  |
| Show folders at the top | 1. Enable setting `Show folders at the top`<br>2. Disable setting `Show folders at the top`| 1. Folders placed at the top in list of files<br>2. Folders mixed with files depending of the sort method in list of files| P m18 t17 |  |
| Prevent gestures disabled | 1. Disable setting `Prevent gestures`<br>2. Try to drag an drop<br>3. Try to do a multiselection with two fingers| Actions are not posible to do |P m18 t17  |  |
| Streaming enabled | 1. Enable setting `Streaming`<br>2. Open a video file| Video is played and not downloaded. Cloud icon remains in the item in list of files | P m18 t17 |  |
| Streaming disabled | 1. Disable setting  `Streaming`<br>2. Open a video file| Video is downloaded and then played. Cloud icon removed from the item in list of files | P m18 t17 |  |
| Media upload HEIC > JPG | 1. Enable setting  `Convert HEIC to JPG`<br>2. Upload an HEIC file| File is saved as JPG | P m18 |  |
| Media upload MP4 | 1. Enable setting `Convert videos to MP4`<br>2. Upload video file in MOV format| Video is saved as MP4 | P m18 |  |
| Media upload Preserve original name enabled | 1. Enable setting `Preserve original media file names`<br>2. Upload a picture| Picture is saved with format `IMG_xxxx` | P m18 | |
| Media upload Preserve original name disabled | 1. Disable setting `Preserve original media file names`<br>2. Upload a picture| Picture is saved with format `Photo-timestamp_xxxx`|  P m18|  |
| Media upload Prefer unedited (IAP) | 1. Enable setting `Prefer unedited`<br>2. With Photos app, edit a picure with some filters<br>3. Upload a picture| Picture is saved without changes, in original version|  P m18|  |
| Media upload Prefer RAW (IAP) | 1. Enable setting `Prefer RAW`<br>2. With a Photo app like `Halide`, take a RAW picture<br>3. Upload the picture<br>4. Disable `Prefer RAW` and repeat| 3. Uploaded in DNG format<br>4. Uploaded in JPG format |  P m18|  |
| Media upload original videos | 1. Enable setting `Prefer original videos`<br>2. Edit a video, changing orientation or any other change<br>3. Upload the video<br>4. Disable `Prefer original video` and repeat| 3. Uploaded original video<br>4. Uploaded edited video| P m18 |  |
| Help & Contact | Click on `Help & Contact`  | `Documentation`, `Help` and `Feedback` sections available. Buttons and links work fine | P m18   |  |
| Recommend | Click on `Recommend` | Recommend mail is opened| P m18 |  |
| Privacy policy | Click on `Privacy policy` | Privacy policy is opened| P m18 |  |
| Acknowledgement | Click on `Acknowledgement` | Acknowledgement is opened|  P m18 |  |
| App version | 1. Click on the App version cell<br>2. Paste in a text editor  | 1. Copied to clipboard<br>2. Information correctly pasted | P m18 |  |
|**Item Actions**||||||
| Create folder | 1. In (+) menu of the list of files, select `Create folder`<br>2. Add a correct name | Folder correctly created |  AUTO |  |
| Open In | 1. Open 3-dot-button menu of a file in the list and select `Open In`<br>2. Open the file in a 3rd party app | File downloaded and sent to the app |  P m18 t17 |  |
| Copy file - destination | 1. Open 3-dot-button menu of a file in the list and select `Copy`<br>2. `Choose destination directory...`<br>3. Select a correct location | File copied to the chosen location| AUTO | |
| Copy folder - destination | 1. Open 3-dot-button menu of a folder with subfolders in the list and select `Copy`<br>2. `Choose destination directory...`<br>3. Select a correct location | Folder and subfolders copied to the chosen location|  AUTO | |
| Copy file - clipboard | 1. Open 3-dot-button menu of a file in the list and select `Copy`<br>2. `Copy to Clipboard`<br>3. Browse to another location<br>4. In the 3-dot-button of top right corner, select `Paste` | File pasted to the chosen location|   P m18 t17  |
| Copy folder - clipboard | 1. Open 3-dot-button menu of a folder with subfolders in the list and select `Copy`<br>2. `Copy to Clipboard`<br>3. Browse to another location<br>4. In the 3-dot-button of top right corner, select `Paste` | Folder and subfolders pasted to the chosen location|  P m18 t17   | |
| Move file | 1. Open 3-dot-button menu of a file in the list and select `Move`<br> 2. Select a correct location | File moved to the chosen location | AUTO |  |
| Move folder | 1. Open 3-dot-button menu of a folder with subfolders in the list and select `Move`<br>2. Select a correct location | Folder and subfolders moved to the chosen location | AUTO |  |
| Duplicate file | Open 3-dot-button menu of a file in the list and select `Duplicate` | File duplicated in same location adding `(1)` to the name| P m18 t17  | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352229961) |
| Duplicate folder | Open 3-dot-button menu of a folder with subfolders in the list and select `Duplicate` | Folder duplicated in same location adding `(1)` to the name| AUTO |  |
| Rename file | 1. Open 3-dot-button menu of a file in the list and select `Rename`<br> 2. Enter a new name | File renamed | AUTO  |  |
| Rename folder | 1. Open 3-dot-button menu of a folder in the list and select `Rename`<br> 2. Enter a new name | Folder renamed |AUTO  |  |
| Delete file | 1. Open 3-dot-button menu of a file in the list and select `Delete`<br> 2. Confirm deletion | File deleted from list | AUTO |  |
| Delete folder | 1. Open 3-dot-button menu of a folder with subfolders in the list and select `Delete`<br> 2. Confirm deletion | Folder and subfolders deleted from list | AUTO |  |
| Favorite item (oC10) |1. Open the card of any item and click the favorite star | File is favorited (check in server) | AUTO |  |
| Unfavorite item (oC10)  | 1. Open the card of a favorited item and click the favorite star | File is unfavorited (check in server) | AUTO |  |
| Sort Date | Sort the file list by date  | Newest on the top | P m18 t17  |  |
| Sort A-Z | Sort the file list by A-Z  | A on the top |  P m18 t17 |  |
| Sort Z-A | Sort the file list by Z-A  | Z on the top | P m18 t17  |  |
| Sort Numbers | Sort the file list by A-Z, with some files/folders called `1`, `11`, `100`.  | Order is `1`, `11`, `100` |  P m18 t17 |  |
| Sort Type | Sort the file list by type  | Grouped by type | P m18 t17  |  |
| Sort Size | Sort the file list by size  | Biggest on the top |  P m18 t17 |  |
| Sort Date | Sort the file list by date  | Newest on the top | P m18 t17  |  |
| Sort last used | Sort the file list by last used  | Recently used on the top |  P m18 t17 |  |
| Sort Shared | Sort the file list by shared  | Shared on the top | P m18 t17  |  |
|**Clipboard**| Review |||||
| Copy file same account | 1. Select to copy a file<br>2. Copy to Clipboard<br>3. Paste in another location in the same account | Correctly copied. Notification indicating the number of copied items | P m18 t17  |
| Copy file another account | 1. Select to copy a file<br>2. Copy to Clipboard<br>3. Paste in another location in other oC account | Correctly copied. Notification indicating the number of copied items |  P m18 t17    |
| Copy file another location | 1. Select to copy a folder<br>2. Copy to Clipboard<br>3. Paste in another location (not oC) | Correctly copied. Notification indicating the number of copied items |  P m18 t17    |
| Copy folder same account | 1. Select to copy a folder<br>2. Copy to Clipboard<br>3. Paste in another location in the same account | Correctly copied. Notification indicating the number of copied items |    P m18 t17    |
| Notification copy folder two accounts | 1. Add two accounts<br>2. Select to copy a folder (no matter which account)<br>3. Copy to Clipboard | Note inside the notification about "folders only copied in the same account" |  P m18 t17    |
| Copy folder another account | 1. Select to copy a file<br>2. Copy to Clipboard<br>3. Paste in another location in other oC account | Correctly copied. Notification indicating the number of copied items | NA  | Not supported yet
| Cut item same account | 1. Cut any item<br>2. Paste to another location in the same account | Correctly pasted. Notification indicating the number of cut items |   P m18 t17   |
| Cut item another account/location| 1. Cut any item<br>2. Paste to another location  | Correctly pasted. Notification indicating the number of cut items |  P m18 t17   | 
|**Upload & Download**||||||
| Upload photo in root | 1. In root folder, click on `+`<br>2. Select `Upload from photo library`<br>3. Select one pic| Pic is uploaded in root folder | P t17 m18  | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714) |
| Upload photo in non-root | 1. In non-root folder, click on `+`<br>2. Select `Upload from photo library`<br>3. Select one pic| Pic is uploaded in chosen folder folder | P t17 m18   | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714) |
| Upload video in root | 1. In root folder, click on `+`<br>2. Select `Upload from photo library`<br>3. Select one video | Video is uploaded in root folder |  P t17 m18 | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714) |
| Upload video in non-root | 1. In non-root folder, click on `+`<br>2. Select `Upload from photo library`<br>3. Select one video | Video is uploaded in chosen folder | P t17 m18   |  FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714)|
| Upload to custom space (oCIS) | 1. In non-root folder in a custom space, click on `+`<br>2. Select `Upload from photo library`<br>3. Select video and picture | Items are uploaded in chosen folder |P t17 m18  | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714) |
| Upload a bunch of files | 1. Click on `+`<br>2.Select to upload from `Files` or from `Photo library`<br>3. Select a huge amount of files (~500)| All files are uploaded to the correct location | P t17 m18  | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714) |
| Restrict uploads to None | 1. In Device Settings > ownCloud > Photos, Select `None`<br>2. Try to upload a picture from albums| Not allowed, error displayed | P t17 m18 | |
| Restrict upload to Selected (I) | 1. In Device Settings > ownCloud > Photos, Select `Selected Photos`<br>2. Try to upload a picture from albums that were not selected in previous step| Not allowed, error displayed | P t17 m18 | |
| Restrict upload to Selected (II) |1. In Device Settings > ownCloud > Photos, Select `Selected Photos`<br>2. Try to upload a picture from albums that were selected in previous step| Pics uploaded to the correct location | P t17 m18 | |
| Download file in non-root | 1. Click on a single file located in non-root folder<br>2. Remove device connection | File is downloaded in non-root folder. Download icon disappears. File is openable without connection| P t17 m18 | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352619960) |
| Download big file in root | 1. Click on a single file (size ~2GB) located in non-root folder<br>2. Remove device connection  | File is downloaded in root folder. Download icon disappears. File is openable without connection| P t17 m18 | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352619960) |
| Download a bunch of files | 1. Click on a huge number of files| All are fully downloaded  | P t17 m18 | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352276714) |
|**Auto uploads**||||||
| Auto uploads Photos | 1. In `Settings` >  `Media Upload`, enable Auto uploads for photos with a correct target folder and let videos disabled<br>2. Take some photos and videos| Pics are uploaded after opening the app. Videos are not uploaded | P m18  |   |
| Auto uploads videos | 1. In `Settings`, `Media Upload`, enable Auto uploads for videos with a correct target folder and let pics disabled<br>2. Take some photos and videos| Videos are uploaded after opening the app. Photos are not uploaded |  P m18 |   |
|**Multiaccount**||||||
| Switch account | 1. Add several accounts and browse through them | Correct browsing, showing the correct files in every account|  P t17 m18 | |
| Upload in several | 1. Upload several files to different accounts at the time | All items corectly uploaded to the correct account and location | P t17 m18 | |
| Download in several | 1. Download several items in different accounts at the time | All items corectly downloaded  | P t17 m18 |  |
|**Files preview**||||||
| PDF | 1. Click on a PDF file | PDF file is downloaded and correctly displayed | P t17 m18 |  |
| PDF search | 1. Click on a PDF file<br>2. Click on the lens icon and enter a string  | 1. PDF file downloaded and opened<br>2. Correct search showing strings that matches the entered| P t17 m18|  |
| PDF Go To Page | 1. Click on a PDF file<br>2. Click on the the page counter<br>3. Enter a valid number of page | Jumps to that page | P t17 m18|  |
| PDF List of Contents | 1. Click on a PDF file<br>2. Click on the list of contents<br>3. Click on any random entry | 2. List of contents displayed<br>3. Jump to that entry in the document | P t17 m18 |  |
| PDF Full screen | 1. Click on a PDF file<br>2. Double click on the screen | Correct displayed in full screen | P t17 m18 |  |
| PDF Navigate | 1. Click on a PDF file<br>2. Click on lens icon to search<br>3. Enter a string which matches several times<br>4. Navigate through the results in the file using the right and left arrows| 3. Matching strings are listed<br>4. Navigation through results is correct | P t17 m18 |  |
| Docx | 1. Click on a .docx file | .docx file downloaded and displayed |P t17 m18 | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352644027) |
| Xlsx | 1. Click on a .xlsx file | .xlsx file downloaded and displayed | P t17 m18| FIXED:[LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352644027) |
| Pptx | 1. Click on a .pptx file | .pptx file downloaded and displayed | P t17 m18| FIXED:[LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352644027) |
| Txt | 1. Click on a .txt file | .txt file downloaded and displayed | P t17 m18| FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2352644027) |  |
| Image | 1. Click on a .png and .jpg files | .png and .jpg files downloaded and displayed | P t17 m18 |  |
| GIF | 1. Click on a .gif file | .gif file downloaded and displayed |  P t17 m18|  |
| Video | 1. Click on a .mov file | .mov file downloaded and displayed | P t17 m18 |  |
| Audio | 1. Click on a .mp3 file<br>2. Go back and the music stops | Correctly played | P t17 m18 |  |
| Media background | 1. Click on a .mp3 file<br>2. Switch the screen off | Audio plays in background | P t17 m18 |  |
| Non openable | 1. Click on a non openable file | Placeholder displayed with date and size| P t17 m18 |  |
| Damaged | 1. Click on a damaged file | Placeholder displayed | P t17 m18 |  |
| Presentation mode | 1. On device settings, set screen auto-lock for 30 seconds<br>2. Open any file with preview<br>3. Click on 3-dot-button and select `Presentation mode`| After 30 seconds, screen keeps alive and file displayed | P t17 m18 |  |
|**Offline**| **Device with no connection**|||||
| Create folder | 1. Create a new folder<br>2. Recover connection | Action is done after recovering connection | P t17 m18 |  |
| Move  | 1. Move any item<br>2. Recover connection | Action is done after recovering connection | P t17 m18 | |
| Copy item | 1. Copy any item to another location<br>2. Recover connection | Action is done after recovering connection | P t17 m18 |  |
| Duplicate item | 1. Duplication any item<br>2. Recover connection | Action is done after recovering connection | P t17 m18 |  |
| Remove item | 1. Remove any item<br>2. Recover connection | Action is done after recovering connection | P t17 m18 |  |
| Download item  | 1. Download a file<br>2. Recover connection | Error: `Network unavailable`| P t17 m18 |  |
| Upload item | 1. Upload a file<br>2. Recover connection | Action is done after recovering connection| P t17 m18 |  |
| Upload many items | 1. Upload many items<br> 2. Recover connection | Action is done after recovering connection|P t17 m18 |  |
| All actions| 1. Perform all actions above  together without connection<br>2. Recover connection | Every action is done after recovering connection. All process finishes OK| P t17 m18 |   |
|**Error handling**||||||
| Create folder | Create folder with existing name | Correct error |  P t17 m18 |  |
| Rename | Rename item with existing name in target | Correct error |  P t17 m18 |  |
| Copy | Copy item with existing name in target | Correct error |   P t17 m18 |  |
| Move | Move item with existing name in target | Correct error |  P t17 m18 |  |
| Non existing | Delete/Rename/Duplicate/Copy/Move an item just removed in other client or server | Correct error | P t17 m18 |  |
| Quota exceeded | Upload some content so that the user quota is exceeded | Correct error |  P t17 m18  |   |
| Several| Cause together some of the errors above| Messages are grouped by kind, and can be fixed individually or grouped  | P t17 m18  |   |
|**Open with**||||||
| Open with external | In a server with app providers, open some files into available providers displayed in the file card | Correctly opened. File can be edited |  P t17 m18  |   |
|**Conflict handling**||||||
| Conflict detected | 1. Edit a file with device 1<br>2. Edit the same file with device 2<br>3. Submit changes with device 1<br>4. Submit changes with device 2 just a couple of seconds later | Device 1 uploads its new version correctly<br>Device 2 shows the conflict with three options: `Cancel`, `Replace`, `Keep Both` | P m18 |
| Cancel | 1. Cause a conflict following steps in previous case<br>2. In Device 2, Select `Cancel` |  Device 1 uploads its new version correctly<br>Local copy in Device 2 is deleted |  P m18 |
| Replace | 1. Cause a conflict following steps in previous case<br>2. In Device 2, Select `Replace` |  Device 1 uploads its new version correctly<br> Device 2 replaces its version with the server version uploaded by Device 1<br>Device 1 updates its version to the Device 2 one | P m18  |  |
| Keep Both | 1. Cause a conflict following steps in previous case<br>2. In Device 2, Select `Keep Both` |  Device 1 uploads its new version correctly<br> Device 2 keeps its version locally and creates a new file with the version uploaded by Device 1 |P m18   |
|**Available Offline**||||||
| File | 1. Set a previewable file as av. offline (3-dot-button menu)<br>2. Open the sidebar and long press over the account name<br>3. Select `Manage`<br>4. Select `Delete all offline files`<br>5. Remove device connection<br>6. Open the file | File content is displayed|  P t17 m18 | |
| Folder | 1. Set a folder as av. offline (3-dot-button menu)<br>2. Open the sidebar and long press over the account name<br>3. Select `Manage`<br>4. Select `Delete all offline files`<br>5. Remove device connection<br>6. Open any file inside the folder | File content is displayed|  P t17 m18| |
| Add to av. offline | 1. Set a folder as av. offline<br>2. Copy or move a file and a folder inside the av. offline folder | Content copied/moved is now av. offline | AUTO | |
| Move av. offline file | 1. Set a file as av. offline<br>2. Move the file to another location that is not av. offline| File is av. offline in the new location | AUTO | |
| Move from av. offline folder | 1. Set a folder as av. offline<br>2. Copy or move a file and a folder from the av. offline folder to another location that is not av. offline| Content moved is not av. offline anymore | AUTO | |
|**Files App**|  |||||
| Location one account| Attach one account to the app<br>Open available locations in files app | Account is there | P t17 m18 |  |
| Location several account| Attach serveral accounts to the app<br>Open available locations in files app | All Accounts are there, one location per account attached | P t17 m18 |  |
| Browse OAuth2 | Open an ownCloud Files app location | Content is correctly displayed | P t17 m18|  |
| Download OAuth2| Open an ownCloud OAuth2Files app location<br>Download a file | File is correctly displayed | P t17 m18 |  |
| Create a folder | Open an ownCloud Files app location<br>Create a new folder with special characters | Folder is created in oC app | P t17 m18 | |
| Rename downloaded item (file and folder)| Open an ownCloud Files app location<br>Rename an downloaded item | Item is remed correctly in oC app | P t17 m18 |  |
| Rename non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Rename an non-downloaded item | Item is renamed correctly in oC app | P t17 m18 | |
| Move downloaded item (file and folder)| Open an ownCloud Files app location<br>Move an downloaded item | Item is moved correctly in oC app | P t17 m18 |  |
| Move non-downloaded item (file and folder) | Open an ownCloud Files app location<br>Move an non-downloaded item | Item is moved correctly in oC app | P t17 m18|  |
| Move a folder with subfolders| Open an ownCloud Files app location<br>Move a folder that contains subfolders to another folder with special characters | Item is moved correctly in oC app | P t17 m18 |  |
| Copy Paste downloaded item | Open an ownCloud Files app location<br>Copy and Paste an downloaded item | Item is pasted correctly in oC app | P t17 m18|  |
| Copy Paste non-downloaded item | Open an ownCloud Files app location<br>Copy and Paste an non-downloaded item | Item is pasted correctly in oC app | P t17 m18 |  |
| Duplicate item downloaded| Open an ownCloud Files app location<br>Duplicate an downloaded item | Item is duplicated correctly in oC app |  P t17 m18 |  |
| Duplicate item non-downloaded | Open an ownCloud Files app location<br>Duplicate an non-downloaded item | Item is duplicated correctly in oC app | P t17 m18  |  |
| Share item downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is sent correctly  | P t17 m18 |  |
| Share item non-downloaded | Open an ownCloud Files app location<br>Share an item by email | Item is downloaded and  sent correctly  | P t17 m18  |   |
| Item info | Open an ownCloud Files app location<br>Open info option | Item info is correct  | P t17 m18 | |
| Delete one folder | Open an ownCloud Files app location<br>Delete a folder | Folder is deleted in oC app | P t17 m18 |  |
| Delete one file | Open an ownCloud Files app location<br>Delete a file | File is deleted in oC app | P t17 m18 |  |
| Upload files app| Open a file with Files app, an MSOffice one f.ex.<br>Modify it<br>Save changes | File is correctly uploaded to ownCloud | P t17 m18 |  |
| Upload external| Open an external app to edit files<br>Create a file and upload to oC via Files App | File is correctly uploaded | P t17 m18 |  |
| Upload non-root| Open an external app to edit files<br>Create a file and upload to oC via Files App to a non-root folder| File is correctly uploaded | P t17 m18 |  |
| Copy from other location | Open another location in Files app and copy content<br>Paste it into ownCloud location | Content upload to oC |P t17 m18  |  |
| Copy to other location |Open an ownCloud Files app location<br>Copy content and Paste it into another location | Content correctly pasted |  P t17 m18|  |
| Share a file with user | 1.Select a file or folder<br>2. In contextual menu, select Share<br>3. Select sharee | Content correctly shared | F m18 P t17  | [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2360775162) |
| Share a file by link | 1.Select a file or folder<br>2. In contextual menu, select Links<br>3. Create a new link (with defaults) | Link correctly created |  F m18 P t17 |  [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2360775162)|
|**Private Share**||||||
| Share with a user | 1. Click on 3-dot-button > `Sharing`<br>2. `Invite`<br>3. Type a correct user name<br>4. Select user<br>5. Select Viewer permission and `Invite` | Sharees list updated with the user | AUTO  |  |
| Share with a group | 1. Click on 3-dot-button > `Sharing`<br>2. `Invite`<br>3. Type a correct group name<br>4. Select group<br>5. Select Viewer permission and `Invite`| List updated with the group. Check that every user in the group can access the file | AUTO |  |
| Permissions | 1. Click on 3-dot-button > `Sharing`<br>2. `Invite`<br>3. Type a correct user name<br>4. Select user<br>5. Select Editor permission and `Invite`| Share is created with the correct permissons (check in web UI) | AUTO |  |
| Edit | 1. Accessing a created share, modify permissions (grant new permissions and revoke existing permissions)| Share is updated with the correct permissons (check in web UI) | AUTO  |  |
| Delete | 1. Delete an existing share by swiping left in the list of shares| Share is removed (check in web UI) |  AUTO |  |
|**Public Link**||||||
| Create with name | 1. Click on 3-dot-button > `Sharing`<br>2. `Create link` giving an specific name<br>3. `Create Link` | Link is listed with proper name (check in web UI)  | AUTO | | 
| Create with Editor | 1. Click on 3-dot-button > `Sharing`<br>2. `Create link` giving `Editor` permission<br>3. `Create Link` | Link is listed with `Editor` permissions (check in web UI)| AUTO | | 
| Create with Password | 1. Click on 3-dot-button > `Sharing`<br>2. `Create link` adding password | Link is listed with password (check in web UI) | AUTO | |
| Create with Expiration | 1. Click on 3-dot-button > `Sharing`<br>2. `Create link` adding espiration date | Link is listed with correct expiration date (check in web UI)  | AUTO | | | 
| Edit link | 1. In the list of links, open an existing public link<br>2. Modify the name, the permission, password and expiration date | Correct edition (check in web UI). Get the link and open in browser to check password is correct | AUTO | | | 
| Delete link | 1. In the list of links, delete an existing public link | Public link is deleted (check in web ui)  | AUTO | | | 
|**Private link**||||||
| Copy Private link | 1. Click on 3-dot-button > `Sharing`<br>2. Click on `Copy Private Link`<br>3. Paste somewhere the clipboard content | Link correct (compare with web UI) | P t17 m18 | | 
|**Universal link**||||||
| File in root supported not downloaded | 1. Get private link of a supported format downloaded file in root<br>2. Open the link in the device (use suffix owncloud://)| App is opened and the file is downloaded and opened | P m18  |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device (use suffix owncloud://) | App is opened and folder content displayed |  P m18 |  |
| Different accounts | 1. Get private link of three items in three different accounts<br>2. Open the links in the device when the open account is a different one | App is opened and the items are correctly shown inside their accounts |  P m18  |  |
| Shared item | 1. Get private link of a file or folder tht is in the shared jail<2. Open the link in a device |App is opened and item displayed |  P m18  |  |
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message  about unknown link|P m18   |  |
|**Share Sheet**||||||
| Root | Save an external file in the root | File correctly saved | P t17 m18  | FIXED: [LINK](https://github.com/owncloud/ios-app/issues/1362#issuecomment-2358217336) |  |
| Non root | Save an external file in non-root folder | File correctly saved |  P t17 m18 |  |  |
| Share many | Save many external files in the root | Files correctly saved | P t17 m18  |  |  |
| Share text | In Safari, open a web page and select text<br>Share it with oC | Text saved in a text file | P t17 m18  |   |  |
| Share image | In Safari, open a web page and select an image onto a web<br>Share it with oC | Image saved correctly| P t17 m18 | |  |
| Several accounts | Add several accounts<br>Save an external file in the root folder of one of them, that is not the current one | File correctly saved in the selected account |  P t17 m18|  |  |
|**Drag & Drop**| iPad in multiwindow|||||
| Safari txt| Drag and drop text from Safari into the oC app| Text saved in a new file| P t17  | |  |
| Safari picture | Drag and drop image from Safari into the oC app| Picture saved in a new file| P t17 | |  |
| Notes txt | Drag and drop text from Notes app into the oC app| Text saved in a new file| P t17  | |  |
| Mail | Drag and drop text from Mail app into the oC app| Text saved in a new file| P t17 | |  |
| Mail file | Drag and drop attached file from Mail app into the oC app| File saved in the app| P t17 | |  |
| Photos picture | Drag and drop image from Photos into the oC app| Picture saved in a new file| P t17 | |  |
| Photos video | Drag and drop video from Photos into the oC app| Video saved in a new file| P t17  | |  |
| Pages file | Drag and drop file from Pages into the oC app| File saved in a new file| P t17 | |  |
|**IAP features**| Use an enterprise server |||||
| Document Scanner PDF | Open (+) menu in root folder<br>Select Scan Document<br>Scan a document<br>Set a file name and a correct location<br>Select PDF as format | PDF file correctly uploaded | P t17 m18 | |
| Document Scanner JPG | Open (+) menu in root folder<br>Select Scan Document<br>Scan a document<br>Set a file name and a correct location<br>Select JPG as format | JPG file correctly uploaded |  P t17 m18 | |
| Markup PDF Overwrite | Open card of PDF file<br>Select Markup<br>Add some strokes, sign and some shapes<br>Overwrite the file with new changes | File correctly saved with new changes |  P t17 m18 | |
| Markup JPG New file | Open card of image file<br>Select Markup<br>Add some strokes, sign and some shapes<br>Save in a new file | New file correctly saved with new changes |  P t17 m18| |
| Metadata | Open card of image file<br>Select Metadata | Check that information there is correctly displayed| P t17 m18 | |
| Shortcuts | Open Shortcuts app (iOS>13) and create a shortcut to create new folder in an existing oc account<br>Execute the shortcut | Folder is created | NA | Not adapted |
| Shortcuts error | 1. Open Shortcuts app (iOS>13) and create a shortcut to create new folder in an existing oc OAuth2 account<br>2. Remove token from  admin dashboard<br>3. Execute the shortcut | Correct error displayed | NA | Not adapted |
| Account with IAP locked | Create a new account in a server with no IAP features available | Shortcuts can not be executed<br>Scan Documents is locked<br>Markup for PDF and JPG is locked<br>Image metadata for images is locked |  P t17 m18 | |
|**Miscellaneous**||||||
| Thumbnails | Open a folder which contains images | thumbnails are correctly displayed for downloaded and non downloaded images, in portrait and landscape | P m18  | |
| Quota correct | Open the root folder | Quota is correctly displayed | P m18 | |
| Contextual menu | Long press over an item of the list | Contextual menu displayed| P m18 | |
| Save from mail | Open mail and save an attachment in ownCloud account  with the option "Sharing"| Correctly saved |P m18  | |
| Take photo and video | In file list,in the (+) menu, select "Take photo or video"<br>Take a photo and then, a video | Both are uploaded to the current folder| P m18 | |
| Restoration | 1. Open a file<br>2. Go to background (homescreen) without killing<br>3. Open another app and then kill oC app<br>4. Open app  | Displayed the file opened in 1.  | P m18 | |
|**Upgrade**||||||
| From previous| 1. Install previous version with basic, OAuth2 and OIDC accounts<br>2. Perform some actions like download some files, set folders as available offline and share some items<br>3. Enable all the Settings<br>4. Install current version| Correct Upgrade<br>Correct Release Notes<br>Settings are correct<br>All accounts are correct and actions persist| P m18 t17 | |


