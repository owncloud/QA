### Regression 2.11

Nexus 5X v9<br>
Nexus 6P v7

| Title | Procedure |  Expected Result | Result | Comments
| :---: | :-------- | :--------------- | :----: | :-----
| **Welcome Wizard**| 1 devices
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed in both orientations | P m9 m7
| **Detect Auth Method**  |2  devices  |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m9 m7| AUTO
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m9 m7
| **Basic Auth** |  1 device |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m9 m7 | AUTO
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m9 m7 | AUTO
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown |  P m9 m7 | AUTO
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown | P m9 m7 | AUTO
| Account already exists | Log in in an already existing account | Error is shown |  P m9 | AUTO
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud | P m9 m7 | 
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud | P m9 | AUTO  | 
| With blanks | Set some blanks after and before user name | Correct access |  P m9 m7 | AUTO
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access |   | | From Browser | 1. Login in a web browser<br>2. Copy the URL and paste it in server field | The URL is cleaned and connection is stablished | 
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view | 
| **OAuth2** | 1 device  |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m9 m7  
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m9 m7 
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m9 m7
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m9 m7  
| **Redirections** | 1 device  |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m9
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m9
| **Accounts manager** | NA   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager |  
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager |  
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message |  
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message |  
|Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use |  
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" | 
| Edit and chhnge the password | Edit the account (Change the password for an incorrect one)| It is not possible, credentials error | 
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account | 
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account | 
| **User quota** | NA   |  |
| Default/Unlimited | Set aun user with default/unlimited quota | No limite is displayed | 
| 5GB | Set quota to 5GB | Quota is correctly dispplayed in drawer with correct progress bar | 
| Other | Set quota to Other value, for example , 1500 MB | Quota is correctly dispplayed in drawer with correct progress bar | 
| 0 mB | Set Qouta to Other, and set 0 MB | "No storage information available" | 
| **Security** | NA   |  |
| Passcode enable | 1. Enable passcode (While doing that, change the orientation of the device)<br>2. Leave the app<br>3. Kill the app<br>4. passcode is asked (While doing that change the orientation of the device)<br>5. Fill in the correct password and select the account and folder | Passcode asked |  
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current pincode, don't enter it, leave the app<br>3. Open the app again<br>| Passcode is asked | 
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore | 
| Passcode security | 1. Select to disable passcode<br>2. Without entering it, kill the app<br>3. Open the app<br>| Passcode is asked | 
| Passcode security | 1. Go to device settings and clear data<br>2. Open the app<br>| Passcode is asked | 
| Pattern lock | 1. Enable Pattern lock<br>2. Leave the app and enter again | Pattern lock is asked | 
| Disable pattern lock | 1. Select to disable pattern<br>2. When it's asked to enter the current pattern, don't enter it, leave the app<br>3. Open the app again<br>| Pattern is asked | 
| Disable pattern lock | 1. select to disable pattern<br>2. When it's asked to enter the current pattern, enter it<br>3.- Leave the app<br>4. Open the app<br>| Pattern is not asked anymore | 
| Both at the same time | Try to enable pattern and passcode lock at the same time | Not posible | 
| Fingerprint lock | Option is enabled if device has fingerprint support | Pattern is asked | 
| Fingerprint unlock | 1. After registering a finger, leave the app and enter again<br>2. Repeat the process but cancel the fingerprint | 1. Fingerprint asked<br>2. Passcode/Pattern asked | 
| Upload file from camera with security | With a sec method enabled (pattern/passcode/fingerp), upload from camera | Method not asked | 
| Upload file from external app with security | With a sec method enabled (pattern/passcode/fingerp), upload from external app | Method not asked | 
| **Actions with no connection** |  NA  |  |
| Create a folder without connection | Create a folder without connection | An error message is shown |  
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown| 
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown| 
| Downlad a file/folder without connection | Download a file/folder without connection | An error message is shown | 
| Upload a file without connection | 1. Upload a file  without connection<br>2. Click in the notification | 1. An error message is shown<br>2. Check that the notification is correct | 
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown | 
| Share by link | Select to share by link a file | An error is shown | 
| Share with user | Select to share with a user | An error is shown | 
| **Specific error handling (server set ups)** | NA   |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message | 
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct | 
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct | 
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct | 
| Antivirus | 1. Enable antivirus in server<br>2. Upload EICAR file<br>| Correct error message in notification |
| **Uploads** |  2 devices |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m9 m7
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m9 m7
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view | P m9 m7
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m9 m7
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view | P m9 m7
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list |  P m9 m7
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |  P m9 m7
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared | P m9 m7
| Instant uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  | P m9 m7
| Instant uploads, only wifi| 1. Enable instant uploads of picture or video and only with wifi<br>2. Using 3G/4G, take a picture or video<br>3. Then wifi is back, take another picture or video| 2. The pic or video is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum |  
| Instant uploads, select move or copy| 1. enable instant uploads of picture or video<br>2. In "Original file will be", select move<br>3. take a picture or video<br>4. In "Original file will be", select copy<br>5. take a picture or video| 3. The original is not stored in device<br>5. The original is stored in device and in app | 
| Change instant upload Camera folder | 1. Set a source folder<br>2. Take photos and videos<br>3. Change the folder<br>4. Take photos and videos | 2. Videos and photos uploaded<br>4. Videos and photos not uploaded | 
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore | 
| Error permissions | 1. Share a folder wiithout permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  | 
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  | 
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view | 
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder | 
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder | P m9 m7
| Upload from camera with different camera apps | 1. Select upload from camera<br>2. Select a camera app and take a pic | Pic uploaded to the correct folder |  
| **Upload from external** | 1 device  |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m9 m7 
| Send text | Copy text and share it with oC | A txt file is created with the copied text | P m9 m7
| **VideoStreaming** | NA  |  |
| Stream a video with http | 1. With a http server stream a video (basic auth). Use the controls to move forward and backward and change orientation | Video is streamed correctly | 
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward  and change orientation | Video is streamed correctly | 
| Stream a video with https (non trusted server) | 1. With a https server stream a video. | Video is not streamed, so that the server is not secure. | 
| **Conflict handling** |  1 device |  |
| Update file | 1. Create a txt file, and download it to the app<br>2. Update the file in the server or in another client<br>3. Tap on the file| The content is updated | P m9
| Update file - Conflict Server | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Server" | 5. Conflict is detected<br>6. Server version is downloaded to the device | P m9
| Update file - Conflict Device | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Device" | 5. Conflict is detected<br>6. Device version is uploaded to the server | P m9
| Update file - Conflict Both | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | 5. Conflict is detected<br>6. Device version is uploaded to the server and server version is downloaded | P m9
| **Av. offline** | NA |  |
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | 
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded | 
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | 
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | 
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | 
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync | 
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine | 
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | 
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed | 
| Av. offline background | Edit an av. offline file with ownCloud closed and wait 15 minutes | file is updated, te app is not needed to be opened | 
| **Av. offline shortcut** | 2 devices |  |
| Add in menu | Set serveral files and folders in different levels as av. offline | They appear correctly in Av. Offline shortcut |  |  |
| Remove in menu | Unset serveral files and folders in different levels as av. offline | They do not appear in Av. Offline shortcut anymore |  |  |
| Details view | Open details from av. offline shortcut |Correct view |  |  |
| Open In view | Open "Open In" from av. offline shortcut |Correct view and action |  |  |
| Select all and inverse | In the view, try to select all and inverse of the list (no option if list is empty) | Correct  |  |  |
| **Multiselection files** | NA   |  |
| Sync files | 1. Select several files<br>2. Tap on sync | Files are downloaded correctly | 
| Delete files | 1. Select several files<br>2. Tap on delete | Files are deleted correctly woth only one message|
| Copy files | 1. Select several files<br>2. Tap on copy and select a target folder | Files are copied correctly |
| Move files | 1. Select several files<br>2. Tap on move and select a target folder | Files are moved correctly |
| Available offline | 1. Select several files<br>2. Tap on available offline | Files are set as available offline |
| Sellect all | 1. Select "Select all"<br>2. Make any action | All files in the list with the action |
| Sellect inverse | 1. Select some items<br>2. Select "inverse"<br>3. Make any action | Inverse selection of fils with the action |
| **Multiselection folders** |  NA |  |
| Sync folders | 1. Select several folders (with subfolders) and not in root<br>2. Tap on sync | Folders are downloaded correctly |
| Delete folders | 1. Select several folders<br>2. Tap on delete | Folders are deleted correctly with only one message |
| Copy folders | 1. Select several folders<br>2. Tap on copy and select a target folder | Folders are copied correctly |
| Move folders | 1. Select several folders<br>2. Tap on move and select a target folder | Folders are moved correctly |
| Available offline | 1. Select several folders<br>2. Tap on available offline | Folders are downloaded correctly |
| **Document Provider** | 2 devices  |  |
| List of accounts | 1. Open Files/Downloads | Check that there are available the same accounts attached to the oC app | P m9 m7
| Add account | 1. Add a new account to oC | Check that the account is available in Files/Downloads | P m9 m7
| Remove account | 1.Remove an account in oC | Check that the account is not available anymore in Files/Downloads | P m9 m7
| Browse and open (not downloaded) | Browse through file structure and open at least 3 files of different extensions that are not downloaded in oC | Correct browsing and previewing |  P m9 m7
| Browse and open (downloaded) | Browse through file structure and open at least 3 files of different extensions that are already downloaded in oC | Correct browsing and previewing |  P m9 m7
| Create folder | Create a folder in root and another one in non-root | Correct created | P m9 m7
| Rename | Rename a file and a folder | Correct renamed | P m9 m7
| Delete | Delete a file and a folder | Correct deleted | P m9 m7
| Edit & Save | Try to save a file after modify it | Correct edited and saved | P m9 m7
| Edit & Save with conflicts | Try to save a file after modify it and in web UI | Correct conflict handling | P m9 m7
| **Share by link** |  NA  |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works |  | 
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work |  | 
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | 
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option does not appear. | 
  Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared |  | 
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared |  | 
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server |  | 
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed | 
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear |   | 
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed | 
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date |  | 
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input | 
| **Share with users** | NA   |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | 
| Shared with one user ldap | Select to share a file whose name contains special characters  | Check that user2 has access to the file<br>Check that the file includes the share icon | 
| Shared with a group | Prerrequisites: create a group whose name includes special characters<br>1. From the mobile app select to share a folder<br>2. Search the group and select it | Check that any user from the group has access to the folder<br>Check that the file includes the share icon |
| Previously shared users | Prerrequisite<br>- From the web shared a folder (fodler1) with at least 8 users / groups<br>1. Select to share the folder1 | It's shown the info about what users have been previously shared with  |
| Shared with an already shared user | 1. From the previous test case - previously shared users - select to share the folder1<br>2. Select as user to share 1 that it's already shared with | An error is shown |
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Option not displayed | 
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees | 
| Unshare | 1. From the previous test case - previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more | 
| Share with users + Share with link | 1. From the previous test case - previosly shared user, select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |
| Share with privileges - edit and share | 1. Share a file with edit permission with user1<br>2. Login with user1 and try to edit the file<br>3. Grant user1 to share | 2. user1 can see and edit the file<br>3. user1 can share the file |
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder |   | FIXED: Lack of notification
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file | 
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |  |
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared | 
| **Miscellanous** |  NA  |  |
| Remote thumbnails | 1. Access to the photos folder<br>2. Check that the thumbnails are previewed |  Check that the thumbnails are previewed  | 
| Local thumbnails | 1. Access to the photos folder<br>2. Download an image<br>3. Turn down the connection|  Check that the thumbnails are previewed for the already downloaded image |
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending |
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending |
| Grid and List view | 1. Change from list to grid view several times<br>2. Browse into a folder and change to list/grid | 1. Changes are performed correctly<br>2. Changes are inherited when a option is not select |
| GIF support | Open a GIF file | GIF correctly reproduced in both orientations |
| Animations in power save | Enable power save mode. | Animations in app disabled (while browsing) |
| Local search | Enter a pattern that matches with any item on the file list | Correct filtered |
| Light filtering | Enable a light filtering app (like Twilight) and the option in settings. Check in several views | Tapping is allowed in every view|
| **BugFixing** |  2 devices  |  |
| 2439 | | P m9 m7 |
| 2485 | | P m9 m7 |
| 2478 | | P m9 m7 |
| 2493 | | P m9 m7 |
| 2481 | | P m9 m7 |
| 2451 | | P m9 m7 |
| 2471 | | P m9 m7 |
| 2563 | | P m9 m7 |
| 2536 | | P m9 m7 |
| **Upgrade** |
| Upgrade from 2.10.1 basic | Install 2.10.1 with basic and upgrade to the current one| Correct upgrade with upgrade wizard | P m9 m7
| Upgrade from 2.10.1 oauth2 | Install 2.10.1 with oauth2 and upgrade to the current one| Correct upgrade with upgrade wizard| P m9 m7