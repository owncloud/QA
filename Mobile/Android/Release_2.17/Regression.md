#### Version 11.7

#### Issue: [https://github.com/owncloud/android/issues/]([https://github.com/owncloud/android/issues/3098])<br>

#### PR: [https://github.com/owncloud/android/issues/]([https://github.com/owncloud/android/issues/3149])<br>


Device/s: Pixel2 v11, Nexus 6P v7<br>
Server: 10.6

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

Not tested: Security, Sharing, Document Provider, Instant uploads, Multiselection, Conflict

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed |P m11
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m11 m7
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m11 m7 | AUTO
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs |  P m11 m7 | AUTO
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m11  m7| AUTO| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) |P m11 m7
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown | P m11 m7 | AUTO
| Empty credentials | 1. Type a correct url and let credentials empty | Log in button is hidden |  P m11 m7 |
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown | P m11 m7 | AUTO
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud | P m11 m7 | AUTO
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud | P m11 m7 |
| With blanks | Set some blanks after and before user name | Correct access | P m11 m7 | AUTO 
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access | P m11 m7 | AUTO
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view | P m11 m7
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted | P m11 m7 | AUTO
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected |P m11 m7
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m11 m7 | AUTO
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m11 m7
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m11  m7
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m11  m7
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed |P m11 m7 | AUTO |  |
| Log in DCR | Log in OIDC server that uses dynamic client registration | Login correct. Files view displayed |P m11  m7
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded |P m11 m7 | 
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keep on using the app | NA | Servers with DCR
| Logout | Logout in a open and active OIDC session | Moved to login view| NA | Not implemented yet|
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |P m11 m7 | AUTO
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m11 m7 | AUTO
| **Accounts manager** |   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager | P m11 m7
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m11 m7
| Create a new OIDC account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m11 m7
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message | P m11 m7
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message | P m11 m7
|Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use | P m11 m7
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" | P m11 m7
| Edit and change the password | Edit the account (Change the password for an incorrect one)| It is not possible, credentials error | P m11 m7
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account | P m11 m7
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account | P m11 m7
| Sync Account | 1. Add an account without browsing into in<br>2. Sync the app with the sync icon<br>3. Remove connection from device<br>4. Browse through the account| Everything is discovered | P m11 m7
| **Actions with no connection** |   |  |
| Create a folder without connection | Create a folder without connection | An error message is shown |P m11
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown|P m11
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown|P m11
| Downlad a file/folder without connection | Download a file/folder without connection | An error message is shown |P m11
| Upload a file without connection | 1. Upload a file  without connection<br>2. Click in the notification | 1. An error message is shown<br>2. Check that the notification is correct |P m11
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown |P m11
| Share by link | Select to share by link a file | An error is shown |P m11
| Share with user | Select to share with a user | An error is shown |P m11
| **Specific error handling (server set ups)** |   |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message |P m11
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct |P m11
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct |P m11
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct |P m11
| Antivirus | 1. Enable antivirus in server<br>2. Upload EICAR file<br>| Correct error message in notification | P m11 | [#3115](https://github.com/owncloud/android/issues/3115)
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m11
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m11
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view | P m11
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list | P m11
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view | P m11
| Clear Uploaded | 1. Upload some files | No Clear button on this list | F m11 | Clear button is there
| Clear Current | 1. Upload a bunch of files<br>2. Clear the Uplaoded list while the files are being uploaded | Current list cleared | P m11
| Clear Failed | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Clear list | 2. Files are moved to Failed<br>3. List cleared | P m11
| Retry Failed | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Retry list | 2. Files are moved to Failed<br>3. Files are retried and moved to Current | P m11
| Instant uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  | P m11
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore | P m11
| Error permissions | 1. Share a folder without permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  | P m11 | [issue](https://github.com/owncloud/android/issues/2653)
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  | P m11
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view | P m11
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder | P m11
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder | P m11 m7
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)| P m11 m7
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT | P m11 m7
| **Upload from external** |   |  |
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m11 | 
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view | P m11 | 
| Send text | Copy text and share it with oC | A txt file is created with the copied text | F m11 m7 | Dialog not dismissed
| **VideoStreaming** |   |  |
| Stream a video with http | 1. With a http server stream a video (basic auth). Use the controls to move forward and backward and change orientation | Video is streamed correctly | P m11 m7
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward and change orientation | Video is streamed correctly | P m11 m7
| **Download and preview** |   |  |
| Download file | 1. Click in a single file | The content is displayed. Notification with the progress, when download finishes is gone | P m11  m7| |
| Download a big file | 1. Click in a single file which size is > 300MB | The content is displayed. Notification with the progress, when download finishes is gone | P m11  m7| |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded. Notification with the progress of every file, when download finishes is gone |P m11  m7| |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder. Notification with the progress of every file, when download finishes is gone|P m11  m7| |
| txt | Download a txt file | The content is correctly displayed|P m11  m7| |
| png | Download a png file | Image is correctly displayed| P m11  m7| |
| jpg | Download a jpg file | Image is correctly displayed| P m11  m7| |
| gif | Open a GIF file | GIF correctly reproduced in both orientations |
| unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up| P m11 m7 | |
| **Av. offline** |   |  |
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath) | File is downloaded |P m11 
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |P m11 
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded |P m11 
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |P m11 
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed |P m11 
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |P m11 
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync |P m11 
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine |P m11 
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app | P m11
| Modify external app closed | 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app | P m11
| Modify external app opened | 1. Set a txt file as. av offline (or a folder that contains it).2. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, just browsing to the containing folder | P m11
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | P m11
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed | P m11
|**Basic Operations**||||||
| Create folder | Create a new folder  | Folder is created inside the oC account | P m11 | AUTO |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m11 m7 | AUTO |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly | P m11 m7 | AUTO |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m11 m7 | AUTO |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m11 m7 | AUTO |  |
| Copy file | Copy a file in root folder and non-root folder | Files copied correctly | P m11 m7 | AUTO |  |
| Copy folder | Copy a folder in root folder and non-root folder | Folders copied correctly | P m11 m7 | AUTO |  |
| Move file | Move a file in root folder and non-root folder | Files moved correctly |P m11 m7 | AUTO |  |
| Move folder | Move a folder in root folder and non-root folder | Folders moved correctly | P m11 m7 | AUTO |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m11 m7
| **Share by link** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works |P m11 m7 | AUTO |  |
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work |P m11 m7 | AUTO |  |
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | P m11 m7
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option is visible but only with the link. | P m11 m7
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared |P m11  m7| AUTO |  |
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared |P m11  m7| AUTO |  |
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | P m11 m7
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |P m11 m7 | AUTO |  |
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |P m11 m7 | AUTO |  |
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |P m11  m7| AUTO |  |
| Edit links | After creating a link on the same file, edit the information: permissions, password, expiration date | Check in server the new fields |P m11 m7 | AUTO |  |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear |P m11 m7 | AUTO |  |
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed | P m11 m7
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date | NA | Check with server, does not seem to work fine
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input | NA | Check with server, does not seem to work fine
| Share created link | Create a new public link<br>Share it with another app by using the Share Sheet  | Correctly shared | P m11 m7
| **Share with users** |   |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | P m11 m7 | AUTO |  |
| Shared with a group | Prerrequisites: create a group whose name includes special characters<br>1. From the mobile app select to share a folder<br>2. Search the group and select it | Check that any user from the group has access to the folder<br>Check that the file includes the share icon |P m11 m7 | AUTO |  |
| Shared with an already shared user | Share an item with an user who has already the item shared with | An error is shown | P m11 m7
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Option not displayed | P m11 m7
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees | P m11 m7
| Unshare | 1. From the previous test case - previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more |P m11  m7| AUTO |  |
| Share with users + Share with link | 1. From the previous test case - previosly shared user, select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file | P m11 m7
| Share with privileges - edit and share | 1. Share a file with edit permission with user1<br>2. Login with user1 and try to edit the file<br>3. Grant user1 to share | 2. user1 can see and edit the file<br>3. user1 can share the file |P m11 m7
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder |P m11 m7
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |P m11 m7
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |P m11 m7 | AUTO |  |
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared |P m11 m7
| **Private link** |   |  |
| Private link shared | Open shares view<br>Click on the private link and share it with another app  | Correctly shared  | P m11 m7 | 
| **Miscellanous** |   |  |
| Thumbnails | 1. Open a folder with pics and txt files |  Check that the thumbnails (pics and txt files) are previewed  | P m11 m7
| Avatar | 1. In web, set an avatar to the user<br>2. Change the avatar in web<br>3. In app, click on the avatar|  1. Check in app that the avatar is correctly displayed in the top right corner<br>2. Check the avatar changes also in app<br>3. Moved to account manager  | P m11 m7
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m11 m7
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m11 m7
| Grid and List view | 1. Change from list to grid view several times<br>2. Browse into a folder and change to list/grid | 1. Changes are performed correctly<br>2. Changes are inherited when a option is not select |P m11 m7
| Animations in power save | Enable power save mode. | Animations in app disabled (while browsing) |P m11 m7
| Notification music player |  Upload a music file and play it | Notification with the progress of the file is shown  |P m11 m7
| Local search | Enter a pattern that matches with any item on the file list | Correct filtered |P m11 m7
| Logging | 1. Perform several actions in the account<br>2. In Settings, open Logs | Logcat and Logfiles are generated. Filters work properly. Content can be cleared (even files) and shared |  P m11 m7| FIXED: Header missing
| Logging HTTP on | 1. In Settings, enable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are logged including headers and body|P m11 m7
| Logging HTTP off | 1. In Settings, disable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are not logged |P m11 m7
| Navigation bar | 1. Perform some uploads, set files and folders as av. offline and create some public links<br>2. Navigate through the items in the bottom navigation bar | Every tab shows the correct information |P m11 m7
| **Upgrade** |   |  |
| Upgrade from latest version | Install the previous version and then, upgrade to the current one | Wizard is shown. App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed| F m7 m11 | Wizard is lost
| **Changelog** |   |  |
| [3041](https://github.com/owncloud/android/issues/3041) | |  | P m11 m7
| [3113](https://github.com/owncloud/android/issues/3113) | |  | P m11 m7
| [3055](https://github.com/owncloud/android/issues/3055) | |  | P m11 m7
| [2891](https://github.com/owncloud/android/issues/2891) | |  | P m11 m7