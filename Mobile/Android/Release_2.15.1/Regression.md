#### Version 2.15.1

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

 -> Passed in an phone with Android 8<br>
F t8 -> Failed in an tabled with Android 8<br>
 t8 -> Passed with a phone with Android 8 and an tabled with Android 8 <br>
 F t8 -> Passed with a phone with Android 8 and failed with tablet with Android 8  <br>

For the current version, the main topic will be test everything from a network point of view.

Features like available offline, get Quota and avatar, will be tested as part of the fixes to release.

Check Android 10 target upgrade.


| Title | Procedure |  Expected Result | Result | Comments |
| :---: | :-------- | :--------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed |
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown |
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs |
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs |
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) |
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) |
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown |
| Empty credentials | 1. Type a correct url and let credentials empty | Log in button is hidden |
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown |
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud |
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud |
| With blanks | Set some blanks after and before user name | Correct access |
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access |
| From Browser | 1. Login in a web browser<br>2. Copy the URL and paste it in server field | The URL is cleaned and connection is stablished |
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view |
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted |
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected |
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed |
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded |
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app |
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  |
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed |
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded |
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keep on using the app |
| Logout | Logout in a open and active OIDC session | Moved to login view| | |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK |
| **Accounts manager** |   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager |
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager |
| Create a new OIDC account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager |
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message |
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message |
|Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use |
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" |
| Edit and chnage the password | Edit the account (Change the password for an incorrect one)| It is not possible, credentials error |
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account |
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account |
| **User quota** |   |  |
| Default/Unlimited | Set aun user with default/unlimited quota | No limite is displayed |
| 5GB | Set quota to 5GB | Quota is correctly dispplayed in drawer with correct progress bar |
| Other | Set quota to Other value, for example , 1500 MB | Quota is correctly dispplayed in drawer with correct progress bar |
| 0 mB | Set Qouta to Other, and set 0 MB | "No storage information available" |
| **Uploads** |   |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct |
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view |
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view |
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view |
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view |
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list |
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared |
| Instant uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  |
| Instant uploads, only wifi| 1. Enable instant uploads of picture or video and only with wifi<br>2. Using 3G/4G, take a picture or video<br>3. Then wifi is back, take another picture or video| 2. The pic or video is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum |
| Instant uploads, select move or copy| 1. enable instant uploads of picture or video<br>2. In "Original file will be", select move<br>3. take a picture or video<br>4. In "Original file will be", select copy<br>5. take a picture or video| 3. The original is not stored in device<br>5. The original is stored in device and in app |
| Change instant upload Camera folder | 1. Set a source folder<br>2. Take photos and videos<br>3. Change the folder<br>4. Take photos and videos | 2. Videos and photos uploaded<br>4. Videos and photos not uploaded |
| Deleted Folder | 1. Upload files to a folder<br>2. In server, delete de target folder | Uploads fails, so the target folder does not exist anymore |
| Error permissions | 1. Share a folder wiithout permissions<br>2. Login with the sharee and upload a file into the folder | File are moved to failed with error of permissions  |
| Close app | 1. Upload files<br>2. Before the upload finishes, close the app | File are moved to failed with error of closed app  |
| Delete account | 1. In settings view, remove one account | All uploads from the removed account are removed from uploads view |
| Multiaccount | 1. Add three different accounts<br>2. Upload files from all of them at the same time  | Files are correctly uploaded in each account and folder |
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder |
| Upload from camera with different camera apps | 1. Select upload from camera<br>2. Select a camera app and take a pic | Pic uploaded to the correct folder |
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)|
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT |
| **Upload from external** |   |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated |
| Send text | Copy text and share it with oC | A txt file is created with the copied text |
| **Av. offline** |   |  |
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath) | File is downloaded |
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded |
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed |
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync |
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine |
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |
| Modify external app closed | 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |
| Modify external app opened | 1. Set a txt file as. av offline (or a folder that contains it).2. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, just browsing to the containing folder |
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. |
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed |
| **Miscellanous** |   |  |
| Avatar | 1. In web, set an avatar to the user|  Check in app that the avatar is correctly displayed in drawer and account manager |
| **Upgrade** |   |  |
| Upgrade from latest version | Install the previous version and then, upgrade to the current one | App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed|
| Upgrade from 9.x | Install a 9.x version and then, upgrade to the current one | Account is not supported anymore |

Network library operations:

| Test Case | Expected Result | Result | Comments |
| :-------: | :-------------- | :----: | :------: | 
|**URL**||||||
| http url |  Correct behaviour |   |  |
| https trusted url | Correct behaviour | | | 
| https non-trusted url | Show certificate to be approved |  |   | 
| https url with http prefix | Correct error |  |  Bad Request |
| 301 Redirection | Correct behaviour |  |Redirections not followed |
| 302 Redirection | Correct behaviour |  | Redirections not followed |
| No internet connection | Correct error |  |  |  | 
| No server connection | Correct error |  |  |  | 
| Maintenance mode | Correct error |  | Message not accurate |
| File Firewall | Correct error |  | Login is not affected |
| Change server certificate | Alert |  | |  |  |
|**Login**||||||
| http url |  Correct behaviour |  | Not last commit |
| https url |  Correct behaviour |  |  |  | 
| OAuth2 |  Correct behaviour |  |  |
| OAuth2 token renewal |  Correct behaviour |  |Request to renew is not triggered |
| Incorrect credentials |  Correct error |  |  |
| Blank credentials |  Correct error |  |  |  | 
| Special characters |  Correct behaviour |  |  |  | 
| Same accout twice |  Correct error |  |  |  | 
| Multiaccount | Both accounts handled correctly |  |  Second account with credentials of the first one
|**Uploads**||||||
| Upload one file | File uploaded |  |  |  |  
| Upload one file (move) | File uploaded |  |  |  |  
| Upload big file | File uploaded |  |  | | |
| Upload many files | Files uploaded |  |  |  | 
| Upload multiaccount | Files uploaded correctly |  | Bad behaviour in multiaccount
| Cancel upload | Files removed from upload queue |  | DELETE send to remove remote folder|
| Retry cancelled upload | File uploaded |  | |  |  |
| Connection lost | Correct error message |  | |  |  |
| Connection recovered | Uploads are retried and finish correctly |  | No chunks|
| Upload after removing failed | File uploaded |  | Folder in dav exists and MKCOL fails. Sent PUT to target folder.|
| Session expired | Upload resumed | | Pending to fix problems with redirections |
| Instant uploads pics | Pic uploaded |  | Folder not created. MI |
| Instant uploads videos | Video uploaded |  | Folder not created|
| Upload from camera | Pic uploaded |  |  |  |  
| Content from other apps | Content uploaded |  |  |  | 
| Shared content from other apps | Content uploaded |  | ploaded but appears as failed. 
| Copied text from other apps | Content uploaded |  |  | |
| File Firewall | Correct error |  | Error not correct | 
| Antivirus | Correct error |  | Error not correct | 
|**Downloads**||||||
| Download one file | File downloaded |  |  |  | 
| Download one big file | File downloaded |  |  | |
| Download many files | Files downloaded |  |  |  | 
| Download folder | Content downloaded |  | Only if it is discovered
| Download folder with many subfolders | Content downloaded |  | Only if it is discovered
| Download downloaded file | No downlaod, only display |  |  Downloaded again
| Cancel download file | File not downloaded |  |  |  | 
| Cancel download folder | Remaining content not downloaded |  |  |  | 
| Connection lost | Correct message |  |  |  | 
| Resume download | Download finishes |  |  |  | 
| Send (not downloaded)  | Downloaded first, then Send |  |  |  | 
| File Firewall | Correct error |  | Error not correct |
|**Av. offline**||||||
| File as av.offline | File synced |  | Downloaded always
| Folder as av.offline | Folder synced |  | Only first depth level
| Folder with subfolders as av.offline | Folder synced |  | Not synced
| Several files as av.offline | Files synced |  | Downloaded always
| Several folders as av.offline | Folders synced |  | Only first depth level
| Add content to av. offline folder| Folder synced |  | Not synced
| Edit content of av. offline | Content synced | | | |
| Edit content in server & app of av. offline | Conflict | | | |
| Solve conflict with local | local version uploaded, remote deleted | | | |
| Solve conflict with remote | remote version downloaded, local deleted | | | |
| Solve conflict with both | both synced | | | |
|**File operations**||||||
| Move one file | Moved to target|  | | | 
| Move one folder | Moved to target|  | | | 
| Move one folder to itself | Correct error |  | | | 
| Move several items | Moved correctly |  | | | 
| Move without connection| Correct error |  | | | 
| Copy one file | Copied to target|  | | | 
| Copy one folder | Copied to target|  | | | 
| Copy one folder to itself | Correct error |  | | | 
| Copy several items | Copied correctly |  | | | 
| Copy without connection| Correct error |  | | | 
| Delete one file | Deleted |  | | | 
| Delete one folder | Deleted |  | | | 
| Delete several items | Deleted correctly |  | | | 
| Delete without connection| Correct error |  | | | 
| Rename one file | Renamed |  | | | 
| Rename one folder | Renamed |  | | | 
| Rename without connection| Correct error |  | | | 
| Create folder | Created |  | | | 
| Create folder without connection| Correct error |  | | | 
|**Sharing**||||||
| Private link | Works properly |  | | 
| Share file with user | File shared |  | | |   
| Share folder with user | Folder shared |  | | |  
| Share file with group | File shared |  | | |  
| Share folder with group | Folder shared |  | | |  
| Share folder with create permission | Folder shared with create permission (check others are not) |  | | |  
| Share folder with edit permission | Folder shared with edit permission (check others are not) |  | ||  
| Share folder with delete permission | Folder shared with delete permission (check others are not) |  | | | 
| Share folder with reshare permission | Folder shared with reshare permission (check others are not) |  | | | 
| Share folder with all permissions | Folder shared with all permission |  | | | 
| Share folder with no permissions | Folder shared with no permission|  | | | 
| Share file with edit permissions | File shared with edit permission|  | | | 
| Share file with reshare permissions | File shared with reshare permission|  | | | 
| Share file with all permissions | File shared with all permission |  | | | 
| Share file with no permissions | File shared with no permission|  | | | 
| Federated share | Content shared |  | | | 
| Unshare | Content unshared |  | | | 
| Create Private share default | Correctly created |  | | | 
| Create Private share name | Correctly created |  | | | 
| Create Private share expiration | Correctly created |  | | | 
| Create Private share password | Correctly created |  | | | 
| Create Private share expiration + password | Correctly created |  | | | 
| Create Private share download/view | Correctly created |  | | | 
| Create Private share download/view/upload | Correctly created |  | | | 
| Create Private share upload only | Correctly created |  | | | 
| Update Private share name | Correctly updated |  | | | 
| Update Private share expiration | Correctly updated |  | | | 
| Update Private share password | Correctly updated |  | | | 
| Update Private share expiration + password | Correctly updated |  | | | 
| Update Private share download/view | Correctly updated |  | | | 
| Update Private share download/view/upload | Correctly updated |  | | | 
| Update Private share upload only | Correctly updated |  | | | 
| Remove private share| Correctly deleted |  | | | 

