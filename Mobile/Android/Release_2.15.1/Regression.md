#### Version 2.15.1

#### PR: [https://github.com/owncloud/android/issues/2876]([https://github.com/owncloud/android/issues/2876])<br>


Device/s: Pixel 2 v10, Huawei P20Lite v9, Huawei 6P v7<br>
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

For the current version, the main topic will be test everything from a network point of view.

Features like available offline, get Quota and avatar, will be tested as part of the fixes to release.

Check Android 10 target upgrade.


Network library operations:

| Test Case | Expected Result | Result | Comments |
| :-------: | :-------------- | :----: | :------: | 
|**URL**||||||
| http url |  Correct behaviour | P m10  |  |
| https trusted url | Correct behaviour | P m10 | | 
| https non-trusted url | Show certificate to be approved | P m10 |   | 
| https url with http prefix | Correct error | P m10 |   |
| 301 Redirection | Correct behaviour | P m10 | FIXED: unknown error |
| 302 Redirection | Correct behaviour | P m10 | FIXED: unknown error  |
| No internet connection | Correct error | P m10 |  |  | 
| No server connection | Correct error | P m10 |  |  | 
| Maintenance mode | Correct error | P m10 |   |
| File Firewall | Correct error | NA | Login is not affected |
| Change server certificate | Alert | P m10 | |  |  |
|**Login**||||||
| http url |  Correct behaviour | P m10 |   |
| https url |  Correct behaviour | P m10 |  |  | 
| OAuth2 |  Correct behaviour | P m10 |  |
| OAuth2 token renewal |  Correct behaviour | P m10 |  |
| Incorrect credentials |  Correct error | P m9 |  |
| Blank credentials |  Correct error | P m9 |  |  | 
| Special characters |  Correct behaviour | P m9 |  |  | 
| Same accout twice |  Correct error | P m10 m9 |  |  | 
| Multiaccount | Both accounts handled correctly | P m10 | 
|**Uploads**||||||
| Upload one file | File uploaded | P m10 |  |  |  
| Upload big file | File uploaded | P m10 |  | | |
| Upload many files | Files uploaded | P m10 |  |  | 
| Upload multiaccount | Files uploaded correctly | P m10 | 
| Cancel upload | Files removed from upload queue | P m10 | 
| Connection lost | Correct error message | P m10 | |  |  |
| Connection recovered | Uploads are retried and finish correctly | P m10 |  |
| Session expired OAuth2| Upload resumed | P m10 |  |
| Instant uploads pics | Pic uploaded | P m10 |   |
| Instant uploads videos | Video uploaded | P m10 |  |
| Upload from camera | Pic uploaded | P m10 |  |  |  
| Content from other apps | Content uploaded | P m10 |  |  | 
| Copied text from other apps | Content uploaded | P m10 |  | |
| File Firewall | Correct error | P m10 |  | 
|**Downloads**||||||
| Download one file | File downloaded | P m10 |  |  | 
| Download one big file | File downloaded | P m10 |  | |
| Download many files | Files downloaded | P m10 |  |  | 
| Download folder | Content downloaded | P m10 | 
| Download folder with many subfolders | Content downloaded | P m10 | 
| Download downloaded file | No downlaod, only display | P m10 |  
| Cancel download file | File not downloaded | P m10 |  |  | 
| Cancel download folder | Remaining content not downloaded | P m10 |  |  | 
| Connection lost | Correct message | P m10 |  |  | 
| Send (not downloaded)  | Downloaded first, then Send | P m10 |  |  | 
| File Firewall | Correct error | P m10 |  |
|**Av. offline**||||||
| File as av.offline | File synced | P m10 | 
| Folder as av.offline | Folder synced | P m10 | 
| Folder with subfolders as av.offline | Folder synced | P m10 |
| Several files as av.offline | Files synced | P m10 | 
| Several folders as av.offline | Folders synced | P m10 | 
| Add content to av. offline folder| Folder synced | P m10 | 
| Edit content of av. offline | Content synced | P m10 | 
| Edit content in server & app of av. offline | Conflict | P m10 | | |
| Solve conflict with local | local version uploaded, remote deleted | P m10 | | |
| Solve conflict with remote | remote version downloaded, local deleted | P m10 | | |
| Solve conflict with both | both synced | P m10 | | |
|**File operations**||||||
| Move one file | Moved to target| P m10 | FIXED 301: Fails with redirections| | 
| Move one folder | Moved to target| P m10 | FIXED 301: Fails with redirections| | 
| Move one folder to itself | Correct error | P m10 | | | 
| Move several items | Moved correctly | P m10 | FIXED 301: Fails with redirections| | 
| Move without connection| Correct error | P m10| | | 
| Copy one file | Copied to target| P m10 | FIXED 301: Fails with redirections| | 
| Copy one folder | Copied to target| P m10| FIXED 301: Fails with redirections | | 
| Copy one folder to itself | Correct error | P m10 | | | 
| Copy several items | Copied correctly | P m10 | FIXED 301: Fails with redirections| | 
| Copy without connection| Correct error | P m10 | | | 
| Delete one file | Deleted | P m10 | | | 
| Delete one folder | Deleted | P m10 | | | 
| Delete several items | Deleted correctly | P m10 | | | 
| Delete without connection| Correct error | P m10 | | | 
| Rename one file | Renamed | F m10 | Fails with redirections| | 
| Rename one folder | Renamed | F m10 | Fails with redirections| | 
| Rename without connection| Correct error | P m10 | | | 
| Create folder | Created |  P m10| | | 
| Create folder without connection| Correct error | P m10 | | | 
|**Sharing**||||||
| Public link | Works properly | P m10 | | 
| Share file with user | File shared | P m10 | | |   
| Share folder with user | Folder shared | P m10 | | |  
| Share file with group | File shared | P m10 | | |  
| Share folder with group | Folder shared | P m10 | | |  
| Share folder with create permission | Folder shared with create permission (check others are not) |  P m10| | |  
| Share folder with edit permission | Folder shared with edit permission (check others are not) | P m10 | ||  
| Share folder with delete permission | Folder shared with delete permission (check others are not) |  P m10| | | 
| Share folder with reshare permission | Folder shared with reshare permission (check others are not) | P m10 | | | 
| Share folder with all permissions | Folder shared with all permission | P m10 | | | 
| Share folder with no permissions | Folder shared with no permission| P m10 | | | 
| Share file with edit permissions | File shared with edit permission| P m10 | | | 
| Share file with reshare permissions | File shared with reshare permission| P m10 | | | 
| Share file with all permissions | File shared with all permission | P m10 | | | 
| Share file with no permissions | File shared with no permission| P m10 | | | 
| Federated share | Content shared | P m10 | | | 
| Unshare | Content unshared | P m10 | | | 
| Create Public share default | Correctly created | P m10 | | | 
| Create Public share name | Correctly created | P m10 | | | 
| Create Public share expiration | Correctly created | P m10 | FIXED: Enables password | | 
| Create Public share password | Correctly created | P m10 | | | 
| Create Public share expiration + password | Correctly created | P m10 | | | 
| Create Public share download/view | Correctly created | P m10 | | | 
| Create Public share download/view/upload | Correctly created |  P m10| | | 
| Create Public share upload only | Correctly created |  P m10| | | 
| Update Public share name | Correctly updated | P m10 | | | 
| Update Public share expiration | Correctly updated | P m10 | FIXED: Enables password| | 
| Update Public share password | Correctly updated | P m10 | | | 
| Update Public share expiration + password | Correctly updated | P m10 | FIXED: Password not disabled | | 
| Update Public share download/view | Correctly updated | P m10 | | | 
| Update Public share download/view/upload | Correctly updated | P m10 | | | 
| Update Public share upload only | Correctly updated | P m10 | | | 
| Remove Public share| Correctly deleted | P m10 | | | 


| Title | Procedure |  Expected Result | Result | Comments |
| :---: | :-------- | :--------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard  | Install the app from scratch  | Welcome wizard shown and correctly displayed | P m10 m9
| **Detect Auth Method**  |   |  |
| Basic Auth | Input a basic auth URL | User and password field shown | P m10 m9
| OAuth2 | Input an OAuth2 URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m10 m9
| OIDC | Input an OIDC URL | User and password field not shown. Connected to Browser using chrome custom tabs | P m10 m9
| **Basic Auth** |   |  |
| Log in Portrait | 1. Create a user<br>2. Log in owncloud enter a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m10 m9 | AUTO
| Log in Landscape | 1. Create a user<br>2. Log in owncloud by typing a correct url<br>3. Type username + password  | Access to the app. Displayname (not the username) | P m10 m9
| Wrong url | Log in owncloud by typing an incorrect url (such as  .serverurl.es) | It's not possible to access to owncloud. An error is shown | P m10 m9| AUTO
| Empty credentials | 1. Type a correct url and let credentials empty | Log in button is hidden |P m10 m9 | AUTO
| Credentials error are detected | 1 Correct url<br>2. Log in owncloud with incorrect user or password |  Credential error is shown |P m10 m9 | AUTO
| Username/Passwd with special character | 1. Create a user whose id is: e@some.es and the password: $h<br>2. Log in owncloud by typing a correct url<br>3. Type username + password,  | It's possible to access to owncloud | P m10 m9 | AUTO
| Upercase url | Type a correct URL in uppercase.  | It's possible to access to owncloud | P m10 m9 | 
| With blanks | Set some blanks after and before user name | Correct access | P m10 m9 | AUTO
| LDAP with UID | Login with an LDAP user, that uses as id the UID | Correct access | P m10
| Change certificate | 1. Login in https server with a non-accepted cert<br>2. Try to upload content before accepting the certificate | 1. A pop up is raised to warn the user of the cert and asking him to accept<br>2. Error shown in uploads view | P m10 m9
| Edit credentials | 1. Login in an basic auth account<br>2. In server change the password | App shows error of credentials. After inputting the new ones, request work | P m10
| URL with trailing slash | 1. Add a trailing slash to an correct URL | URL is correctly accepted | P m10 m9
| URL of server older than 10 | Add correct URL of a 9.x server | Server can not be connected | P m10 m9
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m10 m9
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m10 m9
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m10 m9
| Remove token | 1\. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m10 m9
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed | P m10 m9
| Log in incorrect | Log in OIDC server with incorrect credentials | Correct error message, Login not succeded | P m10 m9
| Refresh token | Wait until token expires and perform some actions | Token is refreshed and user keep on using the app | P m10 m9
| Logout | Logout in a open and active OIDC session | Moved to login view| NA | |
| **Redirections** |   |  |
| Actions on a redirect servers (301) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m10 | FIXED: unknown error
| Actions on a redirect servers (302) | 1. Log in no self signed servers<br>2. Create a folder<br>3. Upload a file<br>4. Share a file by link<br>5. Share a file with another user | All actions OK | P m10 | FIXED: unknown error
| **Accounts manager** |   |  |
| Create a new basic account from accounts manager<br>| Create a new account| Account is created and is visible in accounts manager | P m10 m9
| Create a new OAuth2 account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m10 m9
| Create a new OIDC account from accounts manager<br>| Create a new account<br>| Account is created and is visible in accounts manager | P m10 m9
| Create a new account without connection to the internet<br>| Create a new account without connection to the internet<br>| There must be an adequate error message | P m10 m9
| Create a new account without connection to the server | Create a new account without connection to the server | There must be an adequate error message | P m10 m9
|Multiaccount | Having connection, login with another auth method (basic, oauth2) | Both accounts must be ready to use | P m10 m9
| Create a new account, but it is an existing one. |1. There is an account whith a user in one server<br>2. Try to create the same account | A error: "An account for the same user and server already exists in the device" | P m10 m9
| Edit and change the password | Edit the account (Change the password for an incorrect one)| It is not possible, credentials error | P m10 m9
| Remove accounts | 1. Remove an account from Accounts manager<br>2. Remove all accounts from Accounts manager | 1. Account is not in account manager. List of servers shown, you can select other one.<br>2. List of servers shown, you can add a new account | P m10 m9
| Remove account from server | 1. Remove an account from server<br>2. In app, pull to refresh | Auth fail is shown and the possibility to change to another attached account | P m10 m9
| **User quota** |   |  |
| Default/Unlimited | Set aun user with default/unlimited quota | No limite is displayed | P m10 m9
| 5GB | Set quota to 5GB | Quota is correctly dispplayed in drawer with correct progress bar | P m10 m9
| Other | Set quota to Other value, for example , 1500 MB | Quota is correctly dispplayed in drawer with correct progress bar | P m10 m9
| 0 mB | Set Qouta to Other, and set 0 MB | "No storage information available" | P m10 m9
| **Uploads** | One device  |  |
| Upload a File | Upload a file from oC | The file is uploaded and correctly managed in uploads view. Check notification correct | P m10 m7
| Upload a very big file | Upload a file > 500 MB  from oC | The file is uploaded and correctly managed in uploads view | P m10 m7
| Upload several Files | Upload several files from oC, come of them with special characters and in different folders | The files are uploaded and correctly managed in uploads view | P m10 m7
| Upload a file from an external app | Upload a file from external app (google drive, dropbox...) | The files are uploaded and correctly managed in uploads view | P m10 m7
| Upload several files from an external app | Upload a file from external app | The files are uploaded and correctly managed in uploads view |P m10 m7
| Upload more than 30 | Upload more than 30 files| Only the last 30 are displayed in uploaded list |P m10 m7
| Cancel uploads | 1. Upload some files<br>2. Cancel some of them before finishing | The cancelled are not uploaded and the uploaded are correctly stored. Checking the uploads view |P m10 m7
| Clear lists | 1. Upload a huge amount of files<br>2. When some of them are uploaded, switch the device connection off<br>3. Open the menu and tap on "clear succesfull"<br>4. Switch the device connection on and on menu, tap on "retry failed"<br>5. Switch again the device connection off<br>6. Open the menu and tap on "clear failed"<br>7. Switch the device connection on and select new files to upload. Wait until they are finished<br>8. Tap on menu and "Clear all finished" | 2. Current uploads are moved to failed (check error message is correct)<br>3. Uploaded section is cleared<br>4. Failed are moved to current<br>5. Current are move to failed  (check error message is correct)<br>6. Failed section is cleared<br>8. View is cleared |P m10 m7
| Instant uploads | 1. Enable instant uploads (of video and image) and close the app<br>2. Take a video and image<br>3. Take another picture<br>4. Switch off the device<br>| Open the device after 5 minutes, images and videos are uploaded maximum after 15 minutes  | P m10 m7
| Upload from camera | Select upload from camera with only one camera app and take a pic | Pic uploaded to the correct folder | P m10 m7
| bigfilechunking true | 1. Select upload a file to a server with the capability `bigfilechunking true`  and `chunking>=1.0` (oC10) | Pic uploaded with chunking NG (MKCOL, PUT, PUT, PUT, MOVE)| P m10 m7
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | Pic uploaded with a single PUT | P m10 m7
| **Upload from external** |   |  |
| Open files with external apps | Open different kind of files in oC (txt, pdf, doc, xls...) with an external app, for example excel or word | Files are downloaded (if not) and correctly opened. They can not be updated | P m10
| Send text | Copy text and share it with oC | A txt file is created with the copied text | P m10
| **Av. offline** |   |  |
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath) | File is downloaded | P m10 m9
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded | P m10 m9
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded | P m10 m9
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |P m10 m9
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed |P m10 m9
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |P m10 m9
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync |P m10 m9
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine |P m10 m9
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |P m10 m9
| Modify external app closed | 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |P m10 m9
| Modify external app opened | 1. Set a txt file as. av offline (or a folder that contains it).2. With an external editor, or other client, modify the file | file is uploaded to the server in maximum 15 minutes, just browsing to the containing folder |P m10 m9
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. |P m10 m9
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed |P m10 m9
| **Miscellanous** |   |  |
| Avatar | 1. In web, set an avatar to the user|  Check in app that the avatar is correctly displayed in drawer and account manager | P m10 m9
| **Upgrade** |   |  |
| Upgrade from 2.15 | Install 2.15 version and then, upgrade to the current one | App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed| P m9 m7
| Upgrade from 2.14.2 | Install 2.14.2 version and then, upgrade to the current one | App correctly upgraded, accounts are not missed, settings are not missed, download and av. offline are not missed|

