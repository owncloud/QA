#### Version 2.19

#### PR: [https://github.com/owncloud/android/issues/]([https://github.com/owncloud/android/issues/3325])<br>


Device/s: Pixel2 v11, Nexus6P v7, HuaweiP20 v9 <br>
Server: 10.8

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

Not tested this version: quota, conflict, multiselection


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed | P m11 m7 | FIXED: Button cut off
| **Login View**|
| Settings access| Install the app from scratch  | Settings are accesible from login view. Auto upload section is hidden | P m11 m7
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m11 m7 | AUTO
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m11 m7 
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m11 m7
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m11 m7 | AUTO
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m11 m7 | 
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown |P m11 m7 | AUTO
| Empty credentials | 1. Type a correct url and let credentials empty | Log in button is hidden |P m11 m7
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown | P m11 m7
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud | P m11 m7 | AUTO
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud | P m11 m7
| With blanks | Set some blanks after and before user name | Correct access | P m11 m7 | AUTO
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access |P m11 m7 | AUTO
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view | P m11 m7
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted | P m11 m7 | AUTO
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected | P m11 m7
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m11 m7 | 
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m11 m7 | 
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keeps on using the app | P m11 m7
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m11 m7
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed | P m11 m7 | 
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded | P m11 m7 | 
| Logout | Logout in a open and active OIDC session | Moved to login view| NA | |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m11 | AUTO
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |P m11 | AUTO
| **Accounts manager** |   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager | P m11 m7 | 
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager |P m11 m7 | 
| Create a new OIDC account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m11 m7 | 
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message | P m11 m7 | 
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message | P m11 m7 | 
|Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use | P m11 m7 | 
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" | P m11 m7 | 
| Edit and change the password | 1. Edit one account with the key icon<br>2. Enter incorrect password| Credentials error | P m11 m7 | 
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account | P m11 m7 | 
| Remove accounts files removed | 1. Remove an account with downloaded files, from Accounts manager | Account is not in account manager<br>Content inside is removed (check in Device Explorer) | P m11 m7 | 
| Remove auto upload account | 1. Remove an account from Accounts manager, that is the account selected for auto uploads| Warning is shown, user has to accept the deletion |P m11 m7
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account |P m11 m7
| Sync Account | 1. Add an account without browsing into in<br>2. Sync the app with the sync icon<br>3. Remove connection from device<br>4. Browse through the account| Everything is discovered | P m11 m7 | 
| **Security** | 1 device  |  |
| Passcode enable | 1. Enable passcode<br>2. Leave the app before entering<br>3. Open app<br>4. Enter a correct passcode twice<br>5. Leave the app and open it again| 3. Passcode not asked<br>5. Passcode asked | P m11 
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current pincode, don't enter it, leave the app<br>3. Open the app again<br>| Passcode is asked | P m11 
| Disable app passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore | P m11 
| Passcode security | 1. Select to disable passcode<br>2. Without entering it, kill the app<br>3. Open the app<br>| Passcode is asked | P m11 
| Passcode security | 1. Go to device settings and clear data<br>2. Open the app<br>| Passcode is asked | P m11 
| Pattern lock | 1. Enable Pattern lock<br>2. Leave the app and enter again | Pattern lock is asked | P m11 
| Disable pattern lock | 1. Select to disable pattern<br>2. When it's asked to enter the current pattern, don't enter it, leave the app<br>3. Open the app again<br>| Pattern is asked | P m11 
| Disable pattern lock | 1. select to disable pattern<br>2. When it's asked to enter the current pattern, enter it<br>3.- Leave the app<br>4. Open the app<br>| Pattern is not asked anymore | P m11 
| Both at the same time | Try to enable pattern and passcode lock at the same time | Not posible | P m11 
| Biometrical lock | Device supports biometrical | Option is displayed in `Settings`  |P m11 
| Biometrical lock unsupported | Device does not support biometrical | Option is hidden in `Settings`  |P m11 
| Biometrical lock | 1. After registering a finger, leave the app and enter again<br>2. Enter an incorrect finger<br>3. Enter a correct finger| 1. Biometrical asked<br>2. Error<br>3. App unlocked |P m11 
| Biometrical cancel | 1. After registering a finger, leave the app and enter again<br>2. Repeat the process but cancel the biometrical | 1. Biometrical asked<br>2. Passcode/Pattern asked |P m11 
| Upload file from camera with security | With a security method enabled (pattern/passcode/biometrical), upload from camera | Security not asked |P m11 
| Upload file from external app with security | With a security method enabled (pattern/passcode/biometrical), upload from external app | Security asked |P m11 
| **Actions with no connection** |  1 device |  |
| Create a folder without connection | Create a folder without connection | An error message is shown | P m11 
| Delete a folder/file without connection | Delete a folder from the server without connection | An error message is shown| P m11 
| Rename folder/file without connection | Rename a folder/file without connection | An error message is shown| P m11 
| Download a file/folder without connection | Download a file/folder without connection | An error message is shown | P m11 
| Upload a file without connection | 1. Upload a file  without connection<br>2. Click in the notification | 1. An error message is shown<br>2. Check that the notification is correct | P m11 
| Move a file/folder without connection | Select to move a file/folder without connection | An error is shown | P m11 
| Share by link | Select to share by link a file | An error is shown | P m11 
| Share with user | Select to share with a user | An error is shown | P m11 
| **Specific error handling (server set ups)** | 1 device  |  |
| Maintenance mode login | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to login | Correct error message | P m11 
| Maintenance mode uploads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to upload content | In uploads view, the error is correct |P m11 
| Maintenance mode downloads | 1. Set a server en maintenance mode: sudo -u www-data ./occ maintenance:mode - -on<br>2. Try to download content | In uploads view, the error is correct |P m11 
| Insufficient Quota | 1. Set a low quota for a user.<br>2. Try to upload a file greater than the quota | In uploads view, the error is correct |P m11  | https://github.com/owncloud/android/issues/2653
| Antivirus | 1. Enable antivirus in server<br>2. Upload EICAR file<br>| Correct error message in notification |P m11 
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m11 m7
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m11 m7
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view |P m11 m7
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list | P m11 m7
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |P m11 m7
| Clear Uploaded | 1. Upload some files<br>2. Clear the Uplaoded list when the files have been uploaded | Uploaded list cleared | P m11 m7
| Clear Failed | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Clear list | 2. Files are moved to Failed<br>3. List cleared | P m11 m7
| Retry Failed I | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Recover wifi connection | 2. Files are moved to Failed<br>3. Files are automatically retried and moved to Current | P m11 m7
| Retry Failed II | 1. Upload a bunch of files<br>2. Set the server in maintenance mode while the files are being uploaded<br>3. Switch maintenance mode off<br>4. Retry manually  | 2. Files are moved to Failed<br>3. Files are not retried<br>4. Files are automatically retried and moved to Current |  P m11 m7
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore |  P m11 m7
| Error permissions | 1. Share a folder without permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  | [issue](https://github.com/owncloud/android/issues/2653)
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  |P m11 m7
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view | P m11 m7
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder |  P m11 m7
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder |P m11 m7
| Upload from camera with different camera apps | 1. Select upload from camera<br>2. Select a camera app and take a pic | Pic uploaded to the correct folder |P m11 m7
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)|P m11 m7
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT | P m11 m7
| **Auto Uploads** |   |  |
| Auto uploads pictures| 1. Enable auto uploads pictures and close the app<br>2. Take a picture<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, pictures are uploaded after maximum 15 minutes  | P m11 m7
| Auto uploads pictures account & folder| 1. Enable auto uploads pictures<br>2. Set an account and folder (non-root) as target<br>3. Take some pictures| Pictures uploaded to this location after 15 min max  | P m11 m7
| Auto uploads pictures, only wifi| 1. Enable auto uploads pictures and only with wifi<br>2. Using 3G/4G, take a picture<br>3. When wifi is back, take another picture | 2. The picture is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum | P m9
| Auto uploads pictures, only charging| 1. Enable auto uploads pictures with only charging option<br>2. Without charging, take a picture <br>3. Plug the device on, take another picture | 2. The picture is not uploaded<br>3. The picture is upload after 15 mins maximum | P m11
| Auto uploads pictures, select move or copy| 1. Enable auto uploads of pictures<br>2. In "Original file will be", select move<br>3. Take a picture<br>4. In "Original file will be", select copy<br>5. Take a picture| 3. The original is not stored in device<br>5. The original is stored in device and in app | P m11 m7
| Auto Upload pictures, change Camera folder | 1. Set a source folder<br>2. Take pictures with the camera<br>3. Change the folder<br>4. Take pictures | 2. Pictures uploaded<br>4. Pictures not uploaded | P m11 m7
| Auto uploads videos| 1. Enable auto uploads videos and close the app<br>2. Take a video<br>3. Take another video<br>4. Switch off the device<br>| Open the device after 5 minutes, videos are uploaded after maximum 15 minutes  | P m11 m7
| Auto uploads pictures account & folder| 1. Enable auto uploads pictures<br>2. Set an account and folder (non-root) as target<br>3. Take some pictures| Pictures uploaded to this location after 15 min max  | P m11 m7
| Auto uploads videos, only wifi| 1. Enable auto uploads videos and only with wifi<br>2. Using 3G/4G, take a video <br>3. When wifi is back, take another video | 2. The video is not uploaded and no error is notified<br>3. The video is upload after 15 mins maximum | P m9
| Auto uploads videos, only charging| 1. Enable auto uploads videos wuth only charging option<br>2. Without charging, take a video <br>3. Plug the device on, take another video | 2. The video is not uploaded<br>3. The video is upload after 15 mins maximum | P m7 m11
| Auto uploads videos, select move or copy| 1. Enable auto uploads of videos <br>2. In "Original file will be", select move<br>3. Take a picture<br>4. In "Original file will be", select copy<br>5. Take a video| 3. The original is not stored in device<br>5. The original is stored in device and in app | P m11 m7
| Auto Upload videos, change Camera folder | 1. Set a source folder<br>2. Take videos with the camera<br>3. Change the folder<br>4. Take videos | 2. Videos uploaded<br>4. Videos not uploaded |  P m11 m7
| Retry one | 1. Perform one auto uploads (only one file), making it fail (removing target folder, swithching server off)<br>2. Restablish correct connections<br>3. Click on the failed upload in uploads view | 1. Auto uploads fail, and they are listed in the Failed list of Uploads view<br>2. Upload retried and completed | P m11 m7
| Retry all | 1. Perform some auto uploads (videos and photos), making it fail (removing target folder, swithching server off)<br>2. Restablish correct connections<br>3. Click on the "Retry" button | 1. Auto uploads fail, and they are listed in the Failed list of Uploads view<br>2. Uploads retried and completed | P m11 m7
| **Upload from external** |   |  |
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m11 m7 | 
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view | P m11 m7 | 
| Send text | Copy text and share it with oC | A txt file is created with the copied text | P m11
| **VideoStreaming** |  1 device |  |
| Stream a video with http | 1. With a http server stream a video (basic auth). Use the controls to move forward and backward and change orientation | Video is streamed correctly | P m11
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward and change orientation | Video is streamed correctly | P m11 
| Stream a video with https (non trusted server) | 1. With a https server stream a video. | Video is not streamed, so that the server is not secure. | P m11
| Stream vide with non playable format | Try to stream a MOV video file | Video is not streamed, downloaded instead | P m11
| **Download and preview** |   |  |
| Download file | 1. Click in a single file | The content is displayed. Notification with the progress, when download finishes is gone | P m11 m7 | |
| Download a big file | 1. Click in a single file which size is > 300MB | The content is displayed. Notification with the progress, when download finishes is gone | P m11 m7 | |
| Download folder | 1. Select a folder<br>2. Click on sync button to download | The content is downloaded. Notification with the progress of every file, when download finishes is gone |P m11  m7 | |
| Download folder with subfolders | 1. Select a folder which contains several subfolders with subfolders<br>2. Click on sync button to download | The content is downloaded in every subfolder. Notification with the progress of every file, when download finishes is gone|P m11  m7 | |
| txt | Download a txt file | The content is correctly displayed|P m11 m7 | |
| png | Download a png file | Image is correctly displayed|P m11  m7| |
| jpg | Download a jpg file | Image is correctly displayed| P m11 m7| |
| gif | Open a GIF file | GIF correctly reproduced in both orientations |P m11 m7
| audio without coverart | Open a MP3 file that does not include cover| Music played and placeholder note displayed |P m11 m7
| audio with coverart | Open a MP3 file that includes cover| Music played and cover displayed |P m11 m7
| unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up| F m11 m7| check how it is not opened |
| Open with | 1. Download a file<br>2. Select the option `Open with`<br>3. Select an app from the list | Correctly opened | P m11 m7||
| **Av. offline** |   |  |
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath) | File is downloaded | P m11 | AUTO
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | P m11
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded | P m11
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | P m11
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | P m11
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | P m11
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync |P m11
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine |P m11
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |P m11
| Modify external app closed | 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app | NA | Only via Doc Provider
| Modify external app opened | 1. Set a txt file as. av offline (or a folder that contains it)<br>2. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, just browsing to the containing folder | NA | Only via Doc Provider
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. |P m11
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed |P m11
|**Basic Operations**||||||
| Create folder | Create a new folder  | Folder is created inside the oC account | P m11 | AUTO |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | P m11 | AUTO
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |  P m11 | AUTO
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m11 | AUTO
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m11 | AUTO
| Copy file | Copy a file in root folder and non-root folder | Files copied correctly | P m11 | AUTO
| Copy folder | Copy a folder in root folder and non-root folder | Folders copied correctly | P m11 | AUTO
| Move file | Move a file in root folder and non-root folder | Files moved correctly | P m11 | AUTO
| Move folder | Move a folder in root folder and non-root folder | Folders moved correctly | P m11 | AUTO
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m11
| **Document Provider** | 1 device  |  |
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | P m11 |  |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied |P m11 |  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied |  P m11 |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | P m11 |  |
| Copy a file to other location  in the same oC account| From doc prov, copy a files to other location in the same account | Correct copied | P m11 |  |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied | P m11 |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | P m11|  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied |  P m11| Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied |  P m11|  |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied |P m11 |  |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | P m11 |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder |P m11 |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | P m11|   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name |P m11 |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  |  |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account | P m11 |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly |P m11 |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |P m11  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | P m11|  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly | P m11 |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update |P m11  |   |  |
| **Share by link** |  1 device |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m11 | AUTO
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m11 | AUTO
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link |P m11 
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option is visible but only with the link. | P m11
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m11 | AUTO
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | P m11 | AUTO
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | P m11 | AUTO
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |P m11 | AUTO
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |P m11 | AUTO
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |P m11 | AUTO
| Edit links | After creating a link on the same file, edit the information: permissions, password, expiration date | Check in server the new fields |P m11 | AUTO
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear |P m11 | AUTO
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed |P m11
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date |P m11
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input |P m11
| Share created link | Create a new public link<br>Share it with another app by using the Share Sheet  | Correctly shared |P m11
| **Share with users** |  1 device |  |
|Shared with one user (regular server)| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | P m11 | AUTO
| Shared with a group | Prerrequisites: create a group whose name includes special characters<br>1. From the mobile app select to share a folder<br>2. Search the group and select it | Check that any user from the group has access to the folder<br>Check that the file includes the share icon |P m11 | AUTO
| Shared with an already shared user | Share an item with an user who has already the item shared with | An error is shown | P m11
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Option not displayed |P m11
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees |P m11
| Unshare | 1. From the previous test case - previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more |P m11 | AUTO
| Share with users + Share with link | 1. From the previous test case - previosly shared user, select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |P m11 |
| Share with privileges - edit and share | 1. Share a file with edit permission with user1<br>2. Login with user1 and try to edit the file<br>3. Grant user1 to share | 2. user1 can see and edit the file<br>3. user1 can share the file |P m11
| Share with privileges - folders | 1. Share a folder with user1 with create and delete privileges, and without change<br>2. Login with user1 and try to upload/delete files<br>3. Change the content of any file | 2. user1 can create/delete in the folder<br>3. user1 can not change the file in the folder |P m11
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |P m11
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |P m11 | AUTO
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared |P m11
| **Private link** |   |  |
| Private link shared | Open shares view<br>Click on the private link and share it with another app  | Correctly shared  | P m11 m7 | | 
| **Miscellanous** |   |  |
| Thumbnails | 1. Open a folder with pics and txt files |  Check that the thumbnails (pics and txt files) are previewed  |P m11 m7
| Avatar | 1. In web, set an avatar to the user<br>2. Change the avatar in web<br>3. In app, click on the avatar|  1. Check in app that the avatar is correctly displayed in the top right corner<br>2. Check the avatar changes also in app<br>3. Moved to account manager  | P m11 m7
| Sort by date | 1. Change the list order from name to date<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m11 m7
| Sort by size | 1. Change the list order from date to size<br>2. Check descending option | Data is listed by date ascending and descending without obeying files and folders|P m11 m7
| Grid and List view | 1. Change from list to grid view several times<br>2. Browse into a folder and change to list/grid | 1. Changes are performed correctly<br>2. Changes are inherited when a option is not select |P m11 m7
| Animations in power save | Enable power save mode. | Animations in app disabled (while browsing) | P m7
| Notification music player |  Upload a music file and play it | Notification with the progress of the file is shown  | P m11 m7
| Local search | Enter a pattern that matches with any item on the file list | Correct filtered |
| Logging | 1. Perform several actions in the account<br>2. In Settings, open Logs | Log file is diplayed and can be deleted, opened with and shared with | F m11 m7 | Logs collected with option disabled
| Logging HTTP on | 1. In Settings, enable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are logged including headers and body| P m11 m7
| Logging HTTP off | 1. In Settings, disable `Logging HTTP requests`<br>2. Perform several actions in the account with network requests | Requests are not logged | P m11 m7
| Allow Touches | 1. In Settings > Security, enable `Touches with other visible windows`<br>2. Switch some light modulation app like Twilight on  | It is posible to touch in the app | P m11 m7
| Navigation bar | 1. Perform some uploads, set files and folders as av. offline and create some public links<br>2. Navigate through the items in the bottom navigation bar | Every tab shows the correct information |P m11 m7
| **Changelog** |   |  |
| [3340](https://github.com/owncloud/android/issues/3340) | |  | P m11 m7
| [3342](https://github.com/owncloud/android/issues/3342) | |  | P m11 m7
| [3357](https://github.com/owncloud/android/issues/3357) | |  | P m11 m7
| [3351](https://github.com/owncloud/android/issues/3351) | |  | P m11 m7 | FIXED Round button out of screen
| [125](https://github.com/owncloud/android/issues/125) | |  | P m11 m7
| **Upgrade** |   |  |
| Upgrade from latest beta version | Install the previous version and then, upgrade to the current one |  Migration Wizard is shown. App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed<br>Everything downloaded and av. offline migrated| P m11 m7
| Upgrade from 2.18.3 | Install 2.18.3 and then, upgrade to the current one |  Migration Wizard is shown. App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed<br>Everything downloaded and av. offline migrated| P m7 m11
