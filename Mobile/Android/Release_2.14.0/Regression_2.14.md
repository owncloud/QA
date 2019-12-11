#### Version 2.14

#### PRs: https://github.com/owncloud/android/issues/2727<br>


Device/s: XiaomiMiA2 v9 <br>
Server: 10.3.1 

How to read Results:

P -> Passed<br>
F -> Failed<br>
m -> mobile (iPhone)<br>
t -> tablet (iPad)<br>
12 -> iOS version<br>
 -> non applicable

P m8 -> Passed in an phone with Android 8<br>
F t8 -> Failed in an tabled with Android 8<br>
P m8 t8 -> Passed with a phone with Android 8 and an tabled with Android 8 <br>
P m12 F t12 -> Passed with a phone with Android 8 and failed with tablet with Android 8  <br>
For the current version, the following sections has been removed, since there is not affections in terms of regressions:

- Multiselection
- Av. offline
- Thumbnails
- Local Search
- Grid/List
- Previews
- Accounts manager
- User quota
- Videostreaming
- Conflict handling

Section Security is delegated to automatic tests


| Title | Steps |  Expected Result | Result | Comments
| :---- | :---- | :--------------- | :----- | :--------
| **Wizard**|
| Welcome wizard | Install the app from scratch | Welcome wizard shown and correctly displayed | P m9
| Upgrade wizard | Upgrade from latest version | Upgrade wizard shown and correctly displayed |
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m9
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m9
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m9 |
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m9 |
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown | P m9 |
| Empty password | 1. Type a correct url<br>2. Try to log in without filling the password | login button not shown | P m9 |
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown | P m9 |
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud | P m9 |
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud | P m9 |
| With blanks | Set some blanks after and before user name | Correct access | P m9 |
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view |
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed |
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded |
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app |
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |
| **Actions with no connection** |   |  |
| Create a folder without connection | Create a folder without connection | An error message is shown | P m9 |
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown| P m9 |
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown| P m9 |
| Downlad a file/folder without connection | Download a file/folder without connection | An error message is shown | P m9 |
| Upload a file without connection | 1. Upload a file  without connection<br>2. Click in the notification | 1. An error message is shown<br>2. Check that the notification is correct | P m9 |
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown | P m9 | 
| Share by link | Select to share by link a file | An error is shown | P m9 |
| Share with user | Select to share with a user | An error is shown | P m9 |
| **Specific error handling (server set ups)** |   |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message | P m9 |
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct | P m9 |
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct | P m9 |
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct | F m9 | Crash
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct |
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view |
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view |
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view |
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view |
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list |
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared |
| Move or copy uploadeds | 1. Select to upload a file and select "Copy"<br>2. Select to upload a file and select "Move" | 1. The original is not removed from device<br>2. The original is removed from device |
| Camera uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  |
| Camera uploads, only wifi| 1. Enable instant uploads of picture or video and only with wifi<br>2. Using 3G/4G, take a picture or video<br>3. Then wifi is back, take another picture or video| 2. The pic or video is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum AUTOMATICALLY |
| Camera uploads, select move or copy| 1. enable instant uploads of picture or video<br>2. In "Original file will be", select move<br>3. take a picture or video<br>4. In "Original file will be", select copy<br>5. take a picture or video| 3. The original is not stored in device<br>5. The original is stored in device and in app |
| Change Camera upload Camera folder | 1. Set a source folder<br>2. Take photos and videos<br>3. Change the folder<br>4. Take photos and videos | 2. Videos and photos uploaded<br>4. Videos and photos not uploaded |
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore |
| Error permissions | 1. Share a folder wiithout permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  |
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  |
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view |
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder |
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder |
| Upload from camera with different camera apps | 1. Select upload from camera<br>2. Select a camera app and take a pic | Pic uploaded to the correct folder |
| **Upload from external** |   |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated |
| Send text | Copy text and share it with oC | A txt file is created with the copied text |
| **Document Provider** |   |  |
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied |  |  |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied | |  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied |  NA |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied |  |  |
| Copy a file to other location  in the same oC account| From doc prov, copy a files to other location in the same account | Correct copied |  |  |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied |  |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | |  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied |  | Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied |  |  |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied | |  |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved |  |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  |  |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account |  |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly |  |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | |   |  |
| **Share by link** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m9 |
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m9 |
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link |P m9 |
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option does not appear. | P m9 |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m9
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared |P m9
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server |P m9
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |P m9
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |P m9
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |P m9
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m9
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed |P m9
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date | P m9
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input | P m9
| Shortcut | Create several new public links in different levels<br>Open drawer and select the option "Shared by link"| List is correct. All shared links are there. | F m9 | Error removing links of items in non-root
| **Share with users** |   |  |
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
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder |
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared |
| **Miscellanous** |   |  |
| Splash screen | 1. Kill the app<br>2. Open again | Splash screen is there | P m9 |
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders |P m9 |
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders| P m9 |
| Logging | 1. Perform several actions in the account<br>2. In Settings, open Logs | Logcat and Logfiles are generated. Filters work properly. Content can be cleared (even files) and shared |
| Copy overlapped | 1. Copy the same file to a target folder twice | File is twice in the folder | P m9 |
|pull/2679#issuecomment-550198312||||