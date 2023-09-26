| Title | Procedure |  Expected Result | Result | Comments |
| :---: | :-------- | :--------------- | :----: | :------: |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed | P m11
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m11
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m11
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m11
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m11
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m11
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown |P m11
| Empty credentials | 1. Type a correct url and let credentials empty | Log in button is hidden |P m11
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown |P m11
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud |P m11
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud |P m11
| With blanks | Set some blanks after and before user name | Correct access |P m11
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access |
| From Browser | 1. Login in a web browser<br>2. Copy the URL and paste it in server field | The URL is cleaned and connection is stablished |P m11
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view |P m11
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted |P m11
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected |P m11
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed |P m11
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded |P m11
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app |P m11
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  |P m11
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed | 
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded | 
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keep on using the app | 
| Logout | Logout in a open and active OIDC session | Moved to login view| NA| |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |
| **User quota** |   |  |
| Default/Unlimited | Set aun user with default/unlimited quota | No limite is displayed | P m11
| 5GB | Set quota to 5GB | Quota is correctly dispplayed in drawer with correct progress bar |P m11
| Other | Set quota to Other value, for example , 1500 MB | Quota is correctly dispplayed in drawer with correct progress bar |P m11
| 0 mB | Set Qouta to Other, and set 0 MB | "No storage information available" |P m11
| **Security** |   |  |
| Passcode enable | 1. Enable passcode (While doing that, change the orientation of the device)<br>2. Leave the app<br>3. Kill the app<br>4. passcode is asked (While doing that change the orientation of the device)<br>5. Fill in the correct password and select the account and folder | Passcode asked |P m11
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current pincode, don't enter it, leave the app<br>3. Open the app again<br>| Passcode is asked |P m11
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore |P m11
| Passcode security | 1. Select to disable passcode<br>2. Without entering it, kill the app<br>3. Open the app<br>| Passcode is asked |P m11
| Passcode security | 1. Go to device settings and clear data<br>2. Open the app<br>| Passcode is asked |P m11
| Pattern lock | 1. Enable Pattern lock<br>2. Leave the app and enter again | Pattern lock is asked |P m11
| Disable pattern lock | 1. Select to disable pattern<br>2. When it's asked to enter the current pattern, don't enter it, leave the app<br>3. Open the app again<br>| Pattern is asked |P m11
| Disable pattern lock | 1. select to disable pattern<br>2. When it's asked to enter the current pattern, enter it<br>3.- Leave the app<br>4. Open the app<br>| Pattern is not asked anymore |P m11
| Both at the same time | Try to enable pattern and passcode lock at the same time | Not posible |P m11
| Biometrical lock | Device supports biometrical | Option is enabled in `Settings`  |P m11
| Biometrical unlock | 1. After registering a finger, leave the app and enter again<br>2. Repeat the process but cancel the biometrical | 1. Biometrical asked<br>2. Passcode/Pattern asked |P m11
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
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message | P m11
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct |P m11
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct |P m11
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct |P m11
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m11
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m11
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view | P m11
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m11
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view | P m11
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list |P m11
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |P m11
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared |P m11
| Instant uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  |P m11
| Instant uploads, select move or copy| 1. enable instant uploads of picture or video<br>2. In "Original file will be", select move<br>3. take a picture or video<br>4. In "Original file will be", select copy<br>5. take a picture or video| 3. The original is not stored in device<br>5. The original is stored in device and in app |P m11
| Change instant upload Camera folder | 1. Set a source folder<br>2. Take photos and videos<br>3. Change the folder<br>4. Take photos and videos | 2. Videos and photos uploaded<br>4. Videos and photos not uploaded |P m11
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore |P m11
| Error permissions | 1. Share a folder wiithout permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  | P m11
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  |P m11
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view |P m11
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder |P m11
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder |P m11
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)| P m11
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT |
| **Upload from external** |   |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m11
| Send text | Copy text and share it with oC | A txt file is created with the copied text |P m11
| **VideoStreaming** |  |  |
| Stream a video with http | 1. With a http server stream a video (basic auth). Use the controls to move forward and backward and change orientation | Video is streamed correctly |P m11
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward and change orientation | Video is streamed correctly |
| Stream a video with https (non trusted server) | 1. With a https server stream a video. | Video is not streamed, so that the server is not secure. |
| **Download and preview** |   |  |
| Download file | 1. Click in a single file | The content is displayed |P m11 | |
| Download a big file | 1. Click in a single file which size is > 300MB | The content is displayed | P m11| |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded | P m11| |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder| P m11| |
| txt | Download a txt file | The content is correctly displayed|P m11 | |
| png | Download a png file | Image is correctly displayed|P m11 | |
| jpg | Download a jpg file | Image is correctly displayed| P m11| |
| gif | Open a GIF file | GIF correctly reproduced in both orientations |P m11
| unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up| P m11| |
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
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. |P m11
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed |P m11
|**Basic Operations**||||||
| Create folder | Create a new folder  | Folder is created inside the oC account | P m11 |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m11|  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |  P m11|  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly |P m11 |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly |P m11  |  |  |
| Copy file | Copy a file in root folder and non-root folder | Files copied correctly | P m11|  |  |
| Copy folder | Copy a folder in root folder and non-root folder | Folders copied correctly | P m11 |  |  |
| Move file | Move a file in root folder and non-root folder | Files moved correctly | P m11|  |  |
| Move folder | Move a folder in root folder and non-root folder | Folders moved correctly | P m11 |  |  |
| **Document Provider** |   |  |
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m11 |  Error? |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied | F m11 | Error? |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied | F m11 | Error
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m11 | |
| Copy a file to other location  in the same oC account| From doc prov, copy a files to other location in the same account | Correct copied | F m11 |  |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied | F m11 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m11 |  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | P m11 | Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied | P m11 |  |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied | P m11 | https://github.com/owncloud/android/issues/2658 |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | NA |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | NA |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | NA |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | P m11 |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m11 |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly |P m11 |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |P m11  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m11|  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m11 |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | P m11 |   |  |
| **Share by link** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works |P m11
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work |P m11
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link |P m11
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option does not appear. |P m11
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared |P m11
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared |P m11
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server |P m11
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |P m11
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |P m11
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |P m11
| Edit links | After creating a link on the same file, edit the information: permissions, password, expiration date | Check in server the new fields |P m11
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear |P m11
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed |P m11
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date |P m11
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input |P m11
| **Share with users** |   |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon |P m11
| Shared with a group | Prerrequisites: create a group whose name includes special characters<br>1. From the mobile app select to share a folder<br>2. Search the group and select it | Check that any user from the group has access to the folder<br>Check that the file includes the share icon |P m11
| Previously shared users | Prerrequisite<br>- From the web shared a folder (fodler1) with at least 8 users / groups<br>1. Select to share the folder1 | It's shown the info about what users have been previously shared with  |P m11
| Shared with an already shared user | 1. From the previous test case - previously shared users - select to share the folder1<br>2. Select as user to share 1 that it's already shared with | An error is shown |P m11
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Option not displayed |P m11
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees |P m11
| Unshare | 1. From the previous test case - previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more |P m11
| Share with users + Share with link | 1. From the previous test case - previosly shared user, select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |P m11
| Share with privileges - edit and share | 1. Share a file with edit permission with user1<br>2. Login with user1 and try to edit the file<br>3. Grant user1 to share | 2. user1 can see and edit the file<br>3. user1 can share the file |P m11
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder |P m11
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |P m11
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |P m11
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared |P m11
| **Miscellanous** |   |  |
| Remote thumbnails | 1. Access to the photos folder<br>2. Check that the thumbnails are previewed |  Check that the thumbnails are previewed  | P m11
| Avatar | 1. In web, set an avatar to the user|  Check in app that the avatar is correctly displayed in drawer and account manager |P m11
| Local thumbnails | 1. Access to the photos folder<br>2. Download an image<br>3. Turn down the connection|  Check that the thumbnails are previewed for the already downloaded image |P m11
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m11
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m11
| Grid and List view | 1. Change from list to grid view several times<br>2. Browse into a folder and change to list/grid | 1. Changes are performed correctly<br>2. Changes are inherited when a option is not select |P m11
| Animations in power save | Enable power save mode. | Animations in app disabled (while browsing) |P m11
| Local search | Enter a pattern that matches with any item on the file list | Correct filtered |P m11
| Navigation bar | 1. Perform some uploads, set files and folders as av. offline and create some public links<br>2. Navigate through the items in the bottom navigation bar | Every tab shows the correct information |P m11