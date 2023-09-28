#### Version 3.0

#### PR: [https://github.com/owncloud/android/issues/]([https://github.com/owncloud/android/issues/])<br>


Device/s: Samsung A51 v12<br>
Server: oCIS 2.0.0-rc.1

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


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed | P m12
| **Login View**|
| Settings access| Install the app from scratch  | Settings are accesible from login view. Auto upload section is hidden | P m12
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | NA | Non applying to oCIS
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | NA | Non applying to oCIS
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m12 
| **Basic Auth** |  NA |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) |
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) |
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown |
| Empty credentials | 1. Type a correct url and let credentials empty | Log in button is hidden |
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown |
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud |
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud |
| With blanks | Set some blanks after and before user name | Correct access |
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access |
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view |
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted |
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected |
| **OAuth2** | NA  |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed |
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded |
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keeps on using the app |
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  |
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed | P m12
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded | P m12
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keeps on using the app |
| Logout | Logout in a open and active OIDC session | Moved to login view| NA | |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m12 | Tested against ocis.owncloud.works
| **Accounts manager** |   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager | NA | Basic auth not applied
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager  | NA | OAuth2 not applied
| Create a new OIDC account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m12
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message | P m12
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message | P m12
| Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use | P m12
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" | P m12
| Edit and change the password | 1. Edit one account with the key icon<br>2. Enter incorrect password| Credentials error | P m12
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account | P m12
| Remove accounts files removed | 1. Remove an account with downloaded files, from Accounts manager | Account is not in account manager<br>Content inside is removed (check in Device Explorer) | P m12
| Remove auto upload account | 1. Remove an account from Accounts manager, that is the account selected for auto uploads| Warning is shown, user has to accept the deletion | P m12 | 
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account | F m12 | FiXED: Sign in is lost
| Sync Account | 1. Add an account without browsing into in<br>2. Sync the app with the sync icon<br>3. Remove connection from device<br>4. Browse through the account| Everything is discovered | P m12
| **User quota** |   |  |
| Default/Unlimited | Set aun user with default/unlimited quota | No limite is displayed | P m12
| 5GB | Set quota to 5GB | Quota is correctly dispplayed in drawer with correct progress bar | F m12 | not correctly displayed (17)
| Other | Set quota to Other value, for example , 1500 MB | Quota is correctly dispplayed in drawer with correct progress bar | F m12 | not correctly displayed (17)
| No restriction | Set Qouta to "No restriction" | "No storage information available" | P m12 | 
| **Security** |   |  |
| Passcode enabled without biometrical | 1. Enable passcode<br>2. Leave the app before entering<br>3. Open app<br>4. Enter a correct passcode twice and not enable biometrical<br>5. Leave the app and open it again| 3. Passcode not asked<br>4. Biometrical asked to be enabled<br>5. Passcode asked | P m12
| Passcode enable with biometrical | 1. Enable passcode<br>2. Leave the app before entering<br>3. Open app<br>4. Enter a correct passcode twice and enable biometrical<br>5. Leave the app and open it again| 3. Passcode not asked<br>4. Biometrical asked to be enabled<br>5. Biometrical asked |P m12
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, don't enter it, leave the app<br>3. Open the app again<br>| Passcode is asked |P m12
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore |P m12
| Passcode security | 1. Enable passcode in the app<br>2. Go to device settings and clear data<br>3. Open the app<br>| Passcode is asked |P m12
| Pattern lock without biometrical | 1. Enable Pattern lock and not enable biometrical<br>2. Leave the app and enter again | Pattern lock is asked |P m12
| Pattern lock with biometrical | 1. Enable Pattern lock and enable biometrical<br>2. Leave the app and enter again | Biometrical is asked |P m12
| Disable pattern lock | 1. Select to disable pattern<br>2. When it's asked to enter the current pattern, don't enter it, leave the app<br>3. Open the app again<br>| Pattern is asked |P m12
| Disable pattern lock | 1. select to disable pattern<br>2. When it's asked to enter the current pattern, enter it<br>3. Leave the app<br>4. Open the app<br>| Pattern is not asked anymore |P m12
| Both at the same time | Try to enable pattern and passcode lock at the same time | Not posible |P m12
| Biometrical lock | Device supports biometrical | Option is displayed in `Settings`  |P m12
| Biometrical lock unsupported | Device does not support biometrical | Option is hidden in `Settings`  |
| Biometrical lock | 1. After registering a finger, leave the app and enter again<br>2. Enter an incorrect finger<br>3. Enter a correct finger| 1. Biometrical asked<br>2. Error<br>3. App unlocked |P m12
| Biometrical cancel | 1. With a finger registered, leave the app and enter again<br>2. Repeat the process but cancel the biometrical | 1. Biometrical asked<br>2. Passcode/Pattern asked |P m12
| Upload file from camera with security | With a security method enabled (pattern/passcode/biometrical), upload from camera | Security not asked |P m12
| Upload file from external app with security | With a security method enabled (pattern/passcode/biometrical), upload from external app | Security asked |P m12
| Lock application Immediately | 1. In Settings > Security, enable passcode<br>2. In `Lock application`, let `immediately`<br>3. Reopen the app| app is locked with passcode| P m12
| Lock application 1 minute | 1. In Settings > Security, enable passcode<br>2. In `Lock application`, set `1 minute`<br>3. Reopen the app<br>4. Reopen the app after 1 min| 3. App is not locked<br>4. App is locked with passcode| P m12
| Lock application 5 minutes | 1. In Settings > Security, enable passcode<br>2. In `Lock application`, set `5 minutes`<br>3. Reopen the app<br>4. Reopen the app after 5 min| 3. App is not locked<br>4. App is locked with passcode| P m12
| Lock Access doc provider | 1. In Settings > Security, enable `Lock access from document provider`<br>2. Enter in app with doc provider support | ownCloud is locked | P m12
| Allow Touches | 1. In Settings > Security, enable `Touches with other visible windows`<br>2. Switch some light modulation app like Twilight on  | It is posible to touch in the app | P m12
| Brute force protection| 1. In Settings > Security, enable `Passcode`<br>2. Enter incorrect passcodes many times  | After the 3rd attempt, the time to enter a new one increases more every time| P m12
| **Actions with no connection** |   |  |
| Create a folder without connection | Create a folder without connection | An error message is shown | P m12
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown| P m12
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown| P m12
| Download a file/folder without connection | Download a file/folder without connection | An error message is shown | P m12 | FIXED: no error message
| Upload a file without connection | 1. Upload a file  without connection<br>2. Recover connection | 1. File enqueued<br>2. File resumed and uploaded | P m12 | Files finished not listed (EXPECTED)
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown | P m12
| Share by link | Select to share by link a file | An error is shown | P m12
| Share with user | Select to share with a user | An error is shown | P m12 | Improvement: Toast instead of snackbar
| **Specific error handling (server set ups)** |   |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message |
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct |
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct |
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct | | https://github.com/owncloud/android/issues/2653
| Antivirus | 1. Enable antivirus in server<br>2. Upload EICAR file<br>| Correct error message in notification |
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m12
| Upload a very big file | Upload a file > 1GB to oC | The file is uploaded and correctly managed in uploads view | P m12 | 
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view | P m12
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list | P m12
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view | F m12 | Cancelled in list view (Regression)
| Clear Uploaded | 1. Upload some files<br>2. Clear the Uplaoded list when the files have been uploaded | Uploaded list cleared | P m12
| Retry Failed I | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Recover wifi connection | 2. Files are moved to Enqueued<br>3. Files are automatically retried and moved to Current | P m12
| Retry Failed II | 1. Upload a bunch of files<br>2. Set the server in maintenance mode while the files are being uploaded<br>3. Switch maintenance mode off<br>4. Retry manually  | 2. Files are moved to Failed<br>3. Files are not retried<br>4. Files are automatically retried and moved to Current | 
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore | F m12 | Folder recreated
| Error permissions | 1. Share a folder without permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  | [issue](https://github.com/owncloud/android/issues/2653)
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  | P m12 | FIXED: Unknown error, workers finish the job
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view | P m12 |
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder | P m12
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder | P m12
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)| P m12
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT | P m12 | FIXED: Unknown error
| **Auto Uploads** |   |  |
| Auto uploads pictures| 1. Enable auto uploads pictures and close the app<br>2. Take a picture<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, pictures are uploaded after maximum 15 minutes  | P m12
| Auto uploads pictures account & folder| 1. Enable auto uploads pictures<br>2. Set an account and folder (non-root) as target<br>3. Take some pictures| Pictures uploaded to this location after 15 min max  | P m12
| Auto uploads pictures, only wifi| 1. Enable auto uploads pictures and only with wifi<br>2. Using 3G/4G, take a picture<br>3. When wifi is back, take another picture | 2. The picture is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum | P m12
| Auto uploads pictures, only charging| 1. Enable auto uploads pictures with only charging option<br>2. Without charging, take a picture <br>3. Plug the device on, take another picture | 2. The picture is not uploaded<br>3. The picture is upload after 15 mins maximum |
| Auto uploads pictures, select move or copy| 1. Enable auto uploads of pictures<br>2. In "Original file will be", select move<br>3. Take a picture<br>4. In "Original file will be", select copy<br>5. Take a picture| 3. The original is not stored in device<br>5. The original is stored in device and in app | P m12
| Auto Upload pictures, change Camera folder | 1. Set a source folder<br>2. Take pictures with the camera<br>3. Change the folder<br>4. Take pictures | 2. Pictures uploaded<br>4. Pictures not uploaded |
| Auto uploads videos| 1. Enable auto uploads videos and close the app<br>2. Take a video<br>3. Take another video<br>4. Switch off the device<br>| Open the device after 5 minutes, videos are uploaded after maximum 15 minutes  | P m12
| Auto uploads pictures account & folder| 1. Enable auto uploads pictures<br>2. Set an account and folder (non-root) as target<br>3. Take some pictures| Pictures uploaded to this location after 15 min max  | P m12
| Auto uploads videos, only wifi| 1. Enable auto uploads videos and only with wifi<br>2. Using 3G/4G, take a video <br>3. When wifi is back, take another video | 2. The video is not uploaded and no error is notified<br>3. The video is upload after 15 mins maximum |P m12
| Auto uploads videos, only charging| 1. Enable auto uploads videos wuth only charging option<br>2. Without charging, take a video <br>3. Plug the device on, take another video | 2. The video is not uploaded<br>3. The video is upload after 15 mins maximum |
| Auto uploads videos, select move or copy| 1. Enable auto uploads of videos <br>2. In "Original file will be", select move<br>3. Take a picture<br>4. In "Original file will be", select copy<br>5. Take a video| 3. The original is not stored in device<br>5. The original is stored in device and in app | P m12
| Auto Upload videos, change Camera folder | 1. Set a source folder<br>2. Take videos with the camera<br>3. Change the folder<br>4. Take videos | 2. Videos uploaded<br>4. Videos not uploaded |
| **Upload from external** |   |  |
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m12 | 
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view |  | 
| Send text | Copy text and share it with oC | A txt file is created with the copied text | P m12
| **VideoStreaming** |   |  |
| Stream a video with http | 1. With a http server stream a video (basic auth). Use the controls to move forward and backward and change orientation | Video is streamed correctly | P m12
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward and change orientation | Video is streamed correctly | P m12
| Stream a video with https (non trusted server) | 1. With a https server stream a video. | Video is not streamed, so that the server is not secure. | P m12
| Stream video with non playable format | Try to stream a ogv (or any other not supported format) video file | Video is not streamed, downloaded instead | F m12 | bad error message, not downloaded after
| **Conflict handling** |   |  |
| Update file | 1. Create a txt file, and download it to the app<br>2. Update the file in the server or in another client<br>3. Tap on the file| The content is updated | P m12
| Update file - Conflict Server | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Server" | 5. Conflict is detected and notification shows it<br>6. Server version is downloaded to the device | P m12
| Update file - Conflict Device | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Device" | 5. Conflict is detected and notification shows it<br>6. Device version is uploaded to the server |P m12
| Update file - Conflict Both | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | 5. Conflict is detected and notification shows it<br>6. Device version is uploaded to the server and server version is downloaded |P m12
| **Download and preview** |   |  |
| Download file | 1. Click in a single file | The content is displayed. Notification with the progress, when download finishes is gone | P m12 | |
| Download a big file | 1. Click in a single file which size is > 300MB | The content is displayed. Notification with the progress, when download finishes is gone | P m12 | |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded. Notification with the progress of every file, when download finishes is gone | P m12 | |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder. Notification with the progress of every file, when download finishes is gone| P m12 | |
| txt | Download a txt file | The content is correctly displayed| P m12 | |
| png | Download a png file | Image is correctly displayed| P m12 | |
| jpg | Download a jpg file | Image is correctly displayed| P m12 | |
| gif | Open a GIF file | GIF correctly reproduced in both orientations | P m12
| audio without coverart | Open a MP3 file that does not include cover| Music played and placeholder note displayed | P m12
| audio with coverart | Open a MP3 file that includes cover| Music played and cover displayed | P m12
| unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up| P m12 | |
| Open with | 1. Download a file<br>2. Select the option `Open with`<br>3. Select an app from the list<br>4. Edit the file | 3. Correctly opened<br>4. Correctly edited and synced with server| P m12 | |
| **Details view** |   |  |
| View | Open details view of a file | Correctly displayed in both orientations | P m12 | |
| Not Downloaded | 1. Open details view of a file<br>2. Click on thumbnail | File is downloaded and displayed | P m12 | |
| Downloaded | 1. Remove connection<br>2. Open details view of a downloaded file<br>3. Click on thumbnail | File is displayed | P m12 | |
| **Av. offline** |   |  |
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath) | File is downloaded |P m12
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |P m12
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded |P m12
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |P m12
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed |P m12
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |P m12
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync |P m12
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine |P m12
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |P m12
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | P m12 | FIXED: no way to cancel 
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed |P m12
|**Basic Operations**||||||
| Create folder | Create a new folder  | Folder is created inside the oC account | P m12 |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly |P m12  |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly | P m12  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m12 |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m12  |  |  |
| Copy file | Copy a file in root folder and non-root folder | Files copied correctly | P m12 |  |  |
| Copy folder | Copy a folder in root folder and non-root folder | Folders copied correctly | P m12  |  |  |
| Move file | Move a file in root folder and non-root folder | Files moved correctly |P m12  |  |  |
| Move folder | Move a folder in root folder and non-root folder | Folders moved correctly | P m12  |  |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m12 
| **Document Provider** |   |  |
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m12  |  |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied | P m12 |  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied |  NA |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m12 |  |
| Copy a file to other oC account| From doc prov, copy a files to other oC account | Correct copied | F m12 |  Could not copy |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied | F m12 | Could not copy |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m12 |  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | P m12 | Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Folder to oC other account | From doc prov, copy a file to other oC account| Correct copied |  NA |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied | P m12 |  |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied | F m12 | Could not copy |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | F m12 | Crash  |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | P m12 | FIXED: Saved in the parent folder  |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | P m12 |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | P m12 |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m12 |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m12 |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly | P m12 |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m12 |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m12 |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | |   |  |
| **Share by link** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | F m12 | FIXED: Error if file is not in root. Not displayed!
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m12 | FIXED: Error while removing
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | P m12
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option is visible but only with the link. |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m12
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | P m12
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | P m12
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |P m12
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |P m12
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |P m12
| Edit links | After creating a link on the same file, edit the information: permissions, password, expiration date | Check in server the new fields | P m12 | check permissions levels in oCIS
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m12 | FIXED: Error while removing
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed |
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date |
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input |
| Share created link | Create a new public link<br>Share it with another app by using the Share Sheet  | Correctly shared |
| **Share with users** |   |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | F m12 | FIXED: Error if file is not in root. Not Displayed
| Shared with a group | Prerrequisites: create a group whose name includes special characters<br>1. From the mobile app select to share a folder<br>2. Search the group and select it | Check that any user from the group has access to the folder<br>Check that the file includes the share icon | P m12
| Shared with an already shared user | Share an item with an user who has already the item shared with | An error is shown | F m12 | incorrect error
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Option not displayed | F m12 | Incorrect error
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees | P m12
| Unshare | 1. From the previous test case - previosly shared user, select shared with user<br>2. Unshare with 1 of the users in web<br>| The share with user icon is not included<br>User does not have access to the folder any more | P m12
| Share with users + Share with link | 1. From the previous test case - previosly shared user, select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file | P m12
| Share with privileges - edit and share | 1. Share a file with edit permission with user1<br>2. Login with user1 and try to edit the file<br>3. Grant user1 to share | 2. user1 can see and edit the file<br>3. user1 can share the file | F m12 | Incorrect error
| Share folder from inside | 1. Browse into any folder<br>2. Share it with user1 by using the share icon on the top (no matter permissions) | Folder is correctly shared with user1 | P m12
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder | F m12 | Incorrect error message
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file | P m12
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file | ??
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared | ??
| **Private link** |   |  |
| Private link shared | Open shares view<br>Click on the private link and share it with another app  | Correctly shared  | NA | Not available oCIS
| **Miscellanous** |   |  |
| Thumbnails | 1. Open a folder with pics and txt files |  Check that the thumbnails (pics and txt files) are previewed  | P m12
| Avatar | 1. In web, set an avatar to the user<br>2. Change the avatar in web<br>3. In app, click on the avatar|  1. Check in app that the avatar is correctly displayed in the top right corner<br>2. Check the avatar changes also in app<br>3. Moved to account manager  |
| Sort by name | 1. Change the list order to name<br>2. Check descending option | Data is listed by name ascending and descending without obeying files and folders|P m12
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m12
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m12
| Grid and List view | 1. Change from list to grid view several times<br>2. Browse into a folder and change to list/grid | 1. Changes are performed correctly<br>2. Changes are inherited when a option is not select |P m12
| Local search | Enter a pattern that matches with any item on the file list | Correct filtered |P m12
| Logging | 1. Perform several actions in the account<br>2. In Settings, open Logs | Log file is diplayed and can be deleted, opened with and shared with | P m12
| Logging HTTP on | 1. In Settings, enable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are logged including headers and body|P m12
| Logging HTTP off | 1. In Settings, disable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are not logged |P m12
| Logging Debug|  Build the app in debug mode | In `Settings, logging is enabled|P m12
| Navigation bar | 1. Perform some uploads, set files and folders as av. offline and create some public links<br>2. Navigate through the items in the bottom navigation bar | Every tab shows the correct information | P m12
| Hidden files | 1. Create file and folder starting with "." (will be hidden)<br>2. Enable option "show hidden files" in Settings > Advanced<br>3. Disable option "show hidden files" in Settings > Advanced | 2. Hidden file and folder shown<br>3. Hidden file and folder not shown| P m12
| **Upgrade** |   |  |
| Upgrade from latest version | Install the previous version and then, upgrade to the current one |  Release notes is shown and also linked in Settings. App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed|
