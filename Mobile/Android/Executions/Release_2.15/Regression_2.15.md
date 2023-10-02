#### Version 2.15

#### PR: [https://github.com/owncloud/android/issues/2876]([https://github.com/owncloud/android/issues/2876])<br>


Device/s: Pixel 2 v10, Huawei P20Lite v9<br>
Server: 10.4.1 

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile <br>
t -> tablet <br>
10 -> Android version<br>
NA -> non applicable

P m8 -> Passed in an phone with Android 8<br>
F t8 -> Failed in an tabled with Android 8<br>
P m8 t8 -> Passed with a phone with Android 8 and an tabled with Android 8 <br>
P m8 F t8 -> Passed with a phone with Android 8 and failed with tablet with Android 8  <br>
For the current version, the following sections has been removed, since there is not affections in terms of regressions:

- Multiselection
- Thumbnails
- Local Search
- Grid/List
- User quota
- Instant uploads
- Videostreaming
- Conflict handling
- Document Provider
- Sharing (trusting automatic tests, just a couple of manual tests)
- Security is delegated to automatic tests, but fingerprint/biometrical will be tested manually as well.


| Title | Procedure |  Expected Result | Result | Comments |
| :---: | :-------- | :--------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed | P m10 m9
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m10 m9
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m10 m9
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m10 m9
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m10 m9
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m10 m9
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown | P m10 m9
| Empty password | 1. Type a correct url<br>2. Try to log in without filling the password | error is shown | P m10 m9
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password | Credential error is shown | P m10 m9
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud | P m10 m9
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud | P m10
| With blanks | Set some blanks after and before user name | Correct access | P m10 | FIXED: Not posible to login
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access | P m10 m9
| LDAP with username | Login with an LDAP user, that uses as id the username | Correct access | P m10 m9
| From Browser | 1. Login in a web browser<br>2. Copy the URL and paste it in server field | The URL is cleaned and connection is stablished | F m10 | Not regression, but check when it is missed
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view | P m10 m9
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted | P m10 m9
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected | P m10 m9
| App Password | Share a folder with an email<br>Login using the email | Correctly connected | P m10
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m10 m9
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m10 m9
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m10 m9
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m10 m9
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed | P m10 m9
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded | P m10 m9
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keep on using the app | P m10 m9
| Logout | Logout in a open and active OIDC session | Moved to login view| NA | Not implemented  yet |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m10
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m10
| **Accounts manager** |   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager | P m10
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m10
| Create a new OIDC account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m10
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message | P m10
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message | P m10
|Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use | P m10
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" | P m10
| Edit and chnage the password | Edit the account (Change the password for an incorrect one)| It is not possible, credentials error | P m10
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account | P m10
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account | P m10
| **Security** |   |  |
| Biometrical lock | Open Settings View | Option is enabled if device has fingerprint support | P m10
| Biometrical unlock | 1. After registering a finger, enable biometrical in Settings<br>2. Leave the app and enter again<br>3. Repeat the process but cancel the biometrical | 2. Fingerprint asked<br>3. Passcode/Pattern asked | P m10
| Upload file from camera with security | With a sec method enabled (pattern/passcode/biometrical), upload from camera | Method not asked | P m10
| Upload file from external app with security | With a sec method enabled (pattern/passcode/biometrical), upload from external app | Method asked | P m10
| **Actions with no connection** |   |  |
| Create a folder without connection | Create a folder without connection | An error message is shown | P m10
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown| P m10
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown| P m10
| Downlad a file/folder without connection | Download a file/folder without connection | An error message is shown | P m10
| Upload a file without connection | 1. Upload a file  without connection<br>2. Click in the notification | 1. An error message is shown<br>2. Check that the notification is correct | P m10
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown | P m10
| Share by link | Select to share by link a file | An error is shown | P m10 | FIXED: Sometimes crashes
| Share with user | Select to share with a user | An error is shown | P m10
| **Specific error handling (server set ups)** |   |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message | P m10
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct | P m10
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct | P m10
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m10
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m10 | Check when device's screen is switched off
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view | P m10
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m10
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view | P m10
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list | P m10
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view | P m10
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared | P m10
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)| P m10
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT | P m10
| **Upload from external** |   |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m10
| Send text | Copy text and share it with oC | A txt file is created with the copied text | P m10
| **Download and preview** |   |  |
| Download file | 1. Click in a single file | The content is displayed | P m10 | |
| Download a big file | 1. Click in a single file which size is > 300MB | The content is displayed | P m10 | |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded | P m10 | |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder| P m10 | |
| txt | Download a txt file | The content is correctly displayed| P m10 | |
| png | Download a png file | Image is correctly displayed| P m10 | |
| jpg | Download a jpg file | Image is correctly displayed|P m10  | |
| gif | Open a GIF file | GIF correctly reproduced in both orientations |P m10 
| unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up|P m10  | |
| **Av. offline** |   |  |
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | P m10
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded | P m10
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | P m10
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | P m10
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | P m10
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync | P m10
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine | P m10
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | P m10
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed |  P m10
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | P m10 |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | P m10 |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | P m10 |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | P m10|  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | P m10  |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m10 | AUTO |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m10 | AUTO| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m10 | AUTO  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m10 | AUTO |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | P m10 | AUTO|   | 
| **Share by link** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m10 | AUTO
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m10 | AUTO
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | P m10
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m10 | AUTO
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | P m10
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed | P m10 | AUTO
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" | P m10 | AUTO
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content | P m10 | AUTO
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m10 | AUTO
| **Share with users** |   |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | P m10 | AUTO
| Edit permissions| Modify the permissions of an existing share | Check in web UI or another client that the modification was correct | P m10 | AUTO
| Delete Share | Remove an existing share| Check in web UI or another client that the share does not exist anymore | P m10 | AUTO
| **Miscellanous** |   |  |
| Remote thumbnails | 1. Access to the photos folder<br>2. Check that the thumbnails are previewed |  Check that the thumbnails are previewed  | P m10
| Local thumbnails | 1. Access to the photos folder<br>2. Download an image<br>3. Turn down the connection|  Check that the thumbnails are previewed for the already downloaded image | P m10
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders| P m10
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders| P m10
| Grid and List view | 1. Change from list to grid view several times<br>2. Browse into a folder and change to list/grid | 1. Changes are performed correctly<br>2. Changes are inherited when a option is not select | P m10
| Animations in power save | Enable power save mode. | Animations in app disabled (while browsing) | P m10
| Local search | Enter a pattern that matches with any item on the file list | Correct filtered | P m10
| Navigation bar | 1. Perform some uploads, set files and folders as av. offline and create some public links<br>2. Navigate through the items in the bottom navigation bar | Every tab shows the correct information | P m10
| **Upgrade** |   |  |
| Wizard | Install 2.14.2 and then, upgrade to the current one | Upgrade wizard is shown | P m10 m9
| Upgrade from 2.14 | Install 2.14.2 and then, upgrade to the current one | App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed| P m10 m9
| Upgrade from 2.15.beta1 | Install 2.15.beta1 and then, upgrade to the current one | App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed| P m10 m9
| Upgrade from 2.15.beta2 | Install 2.15.beta2 and then, upgrade to the current one | App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed| P m10 m9
| Upgrade with server 9.x | Attach a 9.x server version in 2.14.2 and then, upgrade to the current one | Account is not supported anymore | P m10 m9