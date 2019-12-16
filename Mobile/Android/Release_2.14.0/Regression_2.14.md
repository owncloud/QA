#### Version 2.14

#### PRs: https://github.com/owncloud/android/issues/2727<br>


Device/s: XiaomiMiA2 v9, Nexus 6P v7, Samsung S9 v9, Pixel2 v10 (smoking) <br>
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
- Redirections
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
| :---- | :---- | :--------------- | :----: | :--------
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
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m7 m9
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m7 m9
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m7 m9 | FIXED: credentials mixed in multiaccount
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m7 m9
| **Actions with no connection** |  1 device |  |
| Create a folder without connection | Create a folder without connection | An error message is shown | P m9 |
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown| P m9 |
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown| P m9 |
| Downlad a file/folder without connection | Download a file/folder without connection | An error message is shown | P m9 |
| Upload a file without connection | 1. Upload a file  without connection<br>2. Click in the notification | 1. An error message is shown<br>2. Check that the notification is correct | P m9 |
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown | P m9 | 
| Share by link | Select to share by link a file | An error is shown | P m9 |
| Share with user | Select to share with a user | An error is shown | P m9 |
| **Specific error handling (server set ups)** |  1 device |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message | P m9 |
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct | P m9 |
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct | P m9 |
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct | P m9 m7 | FIXED: Crash
| **Uploads** |  1 device |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m7 m9|
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m7 m9|
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view |P m7 m9|
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m7 m9|
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view |P m7 m9|
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list |P m7 m9|
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |P m7 m9|
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared | P m7 |
| Move or copy uploadeds | 1. Select to upload a file and select "Copy"<br>2. Select to upload a file and select "Move" | 1. The original is not removed from device<br>2. The original is removed from device | NA
| Camera uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  |P m7 |
| Camera uploads, only wifi| 1. Enable instant uploads of picture or video and only with wifi<br>2. Using 3G/4G, take a picture or video<br>3. Then wifi is back, take another picture or video| 2. The pic or video is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum AUTOMATICALLY | P m7 |
| Camera uploads, select move or copy| 1. enable instant uploads of picture or video<br>2. In "Original file will be", select move<br>3. take a picture or video<br>4. In "Original file will be", select copy<br>5. take a picture or video| 3. The original is not stored in device<br>5. The original is stored in device and in app |P m7 |
| Change Camera upload Camera folder | 1. Set a source folder<br>2. Take photos and videos<br>3. Change the folder<br>4. Take photos and videos | 2. Videos and photos uploaded<br>4. Videos and photos not uploaded |P m7 |
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete the target folder | Uploads fails, so the target folder does not exist anymore | P m7
| Error permissions | 1. Share a folder wiithout permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  | F m7 | Moved to new arch (sync)
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  | P m7
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view | P m7
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder | P m7
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder | P m7
| **Upload from external** |   |  |
| Send text | Copy text and share it with oC | A txt file is created with the copied text | P m7
| **Document Provider** | 2 devices  |  |
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m7 m9 |  |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied |P m7 m9|  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied |  P m7 m9 |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m7 m9|  |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied | P m7 m9 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m7 m9 |  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | NA (pending to fix) | Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied |NA (pending to fix)  |  Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied | P m7 m9 |  |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | P m7 m9|   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | P m7 m9 |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | P m7 m9 |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | P m9 | Office doc |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | P m7 m9 |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m7 m9|  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m7 m9|  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly | P m7 m9 |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly |P m7 m9|  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m7 m9 |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | P m9 | with Quick edit + txt files  |  |
| **Share by link** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m9 m7|
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m9 m7|
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link |P m9 m7 |
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option does not appear. | P m9 |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m9 m7
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared |P m9 m7
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server |P m9 m7
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |P m9 m7
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |P m9 m7
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |P m9 m7
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m9 m7
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed |P m9 m7
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date | P m9 m7
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input | P m9 m7|
| Shortcut | Create several new public links in different levels<br>Open drawer and select the option "Shared by link"| List is correct. All shared links are there. | P m9 m7 | WONTFIX: Error removing links of items in non-root
| **Share with users** |   |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon |P m9 m7|
| Shared with a group | Prerrequisites: create a group whose name includes special characters<br>1. From the mobile app select to share a folder<br>2. Search the group and select it | Check that any user from the group has access to the folder<br>Check that the file includes the share icon |P m9 m7|
| Previously shared users | Prerrequisite<br>- From the web shared a folder (fodler1) with at least 8 users / groups<br>1. Select to share the folder1 | It's shown the info about what users have been previously shared with  |P m9 m7|
| Shared with an already shared user | 1. From the previous test case - previously shared users - select to share the folder1<br>2. Select as user to share 1 that it's already shared with | An error is shown |P m9 m7|
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Option not displayed | P m7 m9 | FIXED: Allowed to reshare
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees | P m7 m9 |
| Unshare | 1. From the previous test case - previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more | P m7 m9
| Share with users + Share with link | 1. From the previous test case - previosly shared user, select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |P m7 m9
| Share with privileges - edit and share | 1. Share a file with edit permission with user1<br>2. Login with user1 and try to edit the file<br>3. Grant user1 to share | 2. user1 can see and edit the file<br>3. user1 can share the file |P m7 m9|
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder |P m7 m9|
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |P m7 m9|
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |P m7 m9|
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared |P m7 m9|
| **Miscellanous** | 1 device  |  |
| Splash screen | 1. Kill the app<br>2. Open again | Splash screen is there | P m9 |
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders |P m9 |
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders| P m9 |
| Logging | 1. Perform several actions in the account<br>2. In Settings, open Logs | Logcat and Logfiles are generated. Filters work properly. Content can be cleared (even files) and shared |P m7 m9
| Copy overlapped | 1. Copy the same file to a target folder twice | File is twice in the folder | P m9 |
|pull/2679#issuecomment-550198312| | |P m7 | |||