# Release

### Regression test against oCIS 5.0.0-beta


**Device/s**: Pixel 2 Android 11 <br>
**Server**: oCIS 5.0.0-beta.1

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


**Set as NA those tests that involve only the Android client. For this execution <br>**
**are only relevant tests that involve server (oCIS).**


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Welcome Wizard**|
| Welcome  wizard | Install the app from scratch | Welcome wizard shown and all slides correctly displayed | NA
| **Basic Auth** |   |  |
| Correct credentials | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username and password<br>4. Click on "Log in" | List of files displayed  |   NA |  | 
| Wrong credentials | 1. Enter correct URL of server with basic auth<br>2. Click on right arrow<br>3. Enter correct username and incorrect password<br>4. Click on "Log in" | Error: "Wrong username or password" | NA |  | 
| **OAuth2** |   |  |
| Correct credentials | 1. Enter correct URL of server with OAuth2<br>2. Set correct credentials in OAuth2 view (browser) | Callback to the app and list of files displayed | NA |  | 
| Refresh token | 1. Create a new OAuth2 session<br>2. Wait until token expires<br>3. Perform some actions | Token is refreshed (check in BD or proxy) and user keeps on using the app | NA| |
| Renewal OAuth2 token | 1. Enter correct URL of server with OAuth2 (check how to tweak it to set a shorter expiration time as defaults' 1h)<br>2. Enter correct credentials in browser and authorize<br>3. Wait till token expires<br>4. Perform any operations in the list of files | 2. List of files displayed<br>4. Operation is completed with no authentication/authorization errors. Check with mitmproxy or any other tool that the token endpoint was called| NA
| Revoke OAuth2 token | 1. Enter correct URL of server with OAuth2<br>2. Enter correct credentials in browser and authorize<br>3. In server dashboard, revoke the Android token<br>4. Perform any operation in list of files<br>5. Click on "Sign In" and enter correct credentals | 4. Error in list of files: "The access token has expired or become invalid. Sign again to gain access"<br>5. List of files displayed again. | NA |  |
| Logout  | 1. Complete authentication/authorization process in a OAuth2 server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA | Not done yet. |
| **OIDC** |   |  |
| Correct credentials | 1. Enter correct URL of server with OIDC<br>2. Set correct credentials in OAuth2 view (browser)<br>3. Authorize | Callback to the app and list of files displayed | P m11 |  | 
| Refresh token | 1. Create a new OAuth2 session<br>2. Wait until token expires<br>3. Perform some actions | Token is refreshed (check in BD or proxy) and user keeps on using the app | P m11 | |
| Logout  | 1. Complete authentication/authorization process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA | Not done yet. |
| **Accounts manager** |   |  |
| List of files | 1. Log in in a account<br>2. On the top right corner, click on the account avatar | Account Manager opened | NA |  |
| Drawer | 1. Log in a account<br>2. Open drawer by clicking the hamburger button<br>3. Click on the arrow inside the drawer to show the submenu<br>4. Click on `Manage accounts`| Account Manager opened | NA |  |
| Add new account | 1. Click on `Add account` option | Login View displayed with editable Server address field | NA |  |
| Edit Password (basic auth) | 1. Click on key button of an attached basic auth account<br>2. In server, modify the password of the account<br>3. Enter the old password in Login View<br>4. Enter the new password in Login View | 3. Error: Wrong username or password"<br>4. Connected and Login View displayed | NA |  |
| Edit OAuth2/OIDC | 1. Click on key button of an attached OAuth2/OIDC account<br>2. In server, modify the password of the account<br>3. Enter the old password in Login View<br>4. Enter the new password in Login View  | 1. Moved forward to the browser<br>3. Error in browser<br>4. Connected and Login View displayed | P m11 |  |
| Sync account content | 1. Add new account to the app<br>2. Without browsing, open Account Manager<br>3. Click on sync (rounded arrow button)<br>4. After some seconds, remove device connection<br>5. Click on account in the list to open it<br>6. Browse through all available folders | All folders are discovered and all content is listed  | P m11 |  |
| Delete one account from app | 1. Add several accounts to the app<br>2.Open Account Manager<br>3. Click on trashbin icon to delete one of them<br>4. Confirm deletion | Deleted account is not listed in Account Manager<br>Account not listed in device's Settings > Accounts   | NA |  |
| Delete one account from device | 1. Add several accounts to the app<br>2.Open device's Settings > Accounts<br>3. Remove account from there<br>4. Open Account manager in the app | Deleted account is not listed in Account Manager<br>Account not listed in device's Settings > Accounts   |  NA |  |
| **Spaces** |   |  |
| List spaces (oCIS) | 1. Log in an oCIS account with some spaces available<br>2. Click on spaces button on the bottom bar | Spaces listed with name, subtitle and image | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/spaces.feature) | |
| Update spaces (oCIS) | 1. Log in an oCIS account with some spaces available<br>2. Click on spaces button on the bottom bar<br>3. Using web client, add a new space and refresh view in the app<br>4. Using web client, remove an existing space and refresh view in the app<br> | 2. Spaces listed with name, subtitle and image<br>3. New space listed<br>4. Removed space not listed anymore | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/spaces.feature) | |
| **User quota** | TO DO  |  |
| Default/Unlimited | Set aun user with default/unlimited quota | No limite is displayed | P m11
| 5GB | Set quota to 5GB | Quota is correctly dispplayed in drawer with correct progress bar | P m11
| Other | Set quota to Other value, for example , 1500 MB | Quota is correctly displayed in drawer with correct progress bar | NA
| 0 mB | Set Qouta to Other, and set 0 MB | "No storage information available" | NA
| **Security** |   |  |
| Passcode enabled | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice correctly<br>3. Don't activate biometric security<br>4. Kill the app and open it again | 2. Correctly stored, no feedback message<br>4. Passcode asked | NA
| Disable passcode | 1. With passcode enabled, click on `Passcode lock` to disable<br>2. Enter current passcode<br>3. Close the app<br>4. Open the app<br> | Passcode is not asked | NA
| Brute force protection | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it again<br>3. Enter wrong passcode 3 times<br>4. Enter another wrong passcode<br>5. Keep entering wrong passcodes several times | 3. Wait 3 seconds to enter new attempts<br>4. Wait 5 seconds to enter new attempts<br>5. Every wrong attempt, time to wait for a new one increases | NA
| Pattern enabled | 1. Click on `Pattern lock` to enable<br>2. Enter same pattern twice correctly<br>3. Don't activate biometric security<br>4. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Pattern asked | NA
| Disable pattern | 1. With pattern enabled, click on `Pattern lock` to disable<br>2. When it's asked to enter the current pattern, enter it<br>3. Close the app<br>4. Open the app<br> | Pattern is not asked |NA
| Device clearing data | 1. With pattern enabled, go to Device Settings > Apps > ownCloud > Storage/Cache<br>2. Clear data and storage<br>3. Open the app | Pattern is asked, not reset after cleaning | NA
| Biometrical with passcode | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app| Biometrical asked | NA
| Upload from camera | 1. Enable any security method (passcode/pattern/biometrical)<br>2. In list of files, click on FAB<br>3. Click on `Picture from camera`<br>4. Take a picture and submit | Security method not asked |NA
| Upload from external app | 1. Enable any security method (passcode/pattern/biometrical)<br>2. Open an external app, like `Photos` or `Gallery`<br>3. Select some files and share them with ownCloud | Security method asked | NA
| Lock delay 1 minute | 1. Enable passcode lock<br>2. Click on `Lock application`<br>3. Set `After 1 minute`<br>4. Kill the app<br>5. Open the app immediately<br>6. Close the app and open after 1 minute | 5. Passcode lock not asked<br>6. Passcode lock asked  | NA |  |
| Lock access doc provider | 1. Enable passcode lock<br>2. Enable `Lock access from document provider`<br>3. Open app that supports Document Provider<br>4. Open sidemenu in that app<br>5. Click on the ownCloud account to browse through  | 4. ownCloud as `Locked`<br>5. Not posible because locking | NA |  |
| Change certificate | 1. Login in https server with a self-signed cert<br>2. After login, change the certificate in server<br>3. Refresh in the login view | Dialog is raised to warn the user of the certificate change and asking to accept |
| **Transfers** |   |  |
| Upload a very big file | 1. Open FAB and select `Files`<br>2. Select one file from any provider which size is bigger than 500MB | File is uploaded.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section | P m11 | |
| Upload 1000 Files | 1. Open FAB and select `Files`<br>2. Select 1000 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of 1000 files uploaded to the correct place with correct sizes in the `Uploaded` section| P m11 | |
| Upload from camera | 1. Open FAB in root folder and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section| P m11  |  |
| 3rd party - Multiple selection | 1. Open any app that manage files (f. ex. `Photos` app)<br>2. Select many items (more than 500) to share with ownCloud<br>4. Select one account and a correct target folder inside of it| All items are correctly uploaded to the selected folder inside of the account<br>Uploads view shows the pictures uploaded to the correct location inside of the account with correct size in the `Uploaded` section| P m11 |  |
| 3rd party - Multiaccount | 1. In ownCloud app, set three accounts<br>2. Open any other app that manage files (f. ex. `Photos` app)<br>3. Select one item to share with ownCloud<br>4. Select the first account and a correct target folder inside of it<br>5. Repeat with the other two accounts | Item is correctly uploaded to the selected folder inside of every account<br>Uploads view shows the pictures uploaded to the correct location inside every account with correct size in the `Uploaded` section| P m11  |  |
| Text - Multiple account | 1. In ownCloud app, set only one account<br>2. Open a web browser<br>3. Select some piece of text in any web<br>4. Share it with ownCloud<br>5. Select correct location<br>6. Enter a correct file name | Txt file is correctly uploaded to the selected  location<br>Uploads view shows the file uploaded to the correct location with correct size in the `Uploaded` section.| P m11 | |
| Download a big file | Click on a single file which size is greater than 500MB | File is downloaded after showing the progress<br>`Download success` notification shown when download finishes<br>File downloaded showing the green badge next to the thumbnail | P m11 | |
| Download 1000 | 1. Select a folder which contains 1000 files (create it with LLNL utility)<br>2. Click on sync button (circle arrow)| All files inside are downloaded<br>One notification of success for every downloaded file |  P m11| |
| Folder with subfolders | 1. Select a folder that contains files and subfolders by long pressing on it<br>2. Click on sync button (circle arrow)  | All files inside (including ones inside subfolders) downloaded showing the green badge next to the thumbnail<br>One notification of success for every downloaded file | P m11 | |
|**Auto uploads**|Preconditions:<br> 1. Enable `Picture/Video Uploads`<br>2. Set the correct `Camera folder` with the picture container from the camera app|||||
| Pictures upload | 1. Close the app<br>2. Take some pictures with the camera | With the app closed, check in web or another client that the taken pictures were enqueued and uploaded in 15 minutes | NA |  |
| Account | 1. With two (al least) accounts in device, click on `Account to upload pictures`<br>2. Select a different account to upload pictures<br>3. Close the app<br>4. Take some pictures with the camera | With the app closed, check in web or another client that the taken pictures were uploaded in 15 minutes to the correct account| NA |  |
| Path oC10 | 1. Click on `Picture upload path` after selecting oC10 account<br>2. Select a different folder to upload pictures in the selected account<br>3. Close the app<br>4. Take some pictures with the camera | With the app closed, check in web or another client that the taken pictures were uploaded in 15 minutes to the correct folder | NA |  |
| Path oCIS | 1. Click on `Video upload path` after selecting oCIS account<br>2. Select custom space<br>3. Select a different folder to upload videos in the selected account<br>4. Close the app<br>5. Take some videos with the camera | With the app closed, check in web or another client that the taken videos were uploaded in 15 minutes to the correct folder and space| NA |  |
| Camera folder | 1. Install another camera app in the device<br>2. Click on `Picture upload path`<br>3. Click on `Camera folder`and select the folder from the newest installed camera app<br>4. Take pictures with the installed camera app and with the built-in camera app<br>5. Wait 15 minutes| Only pictures taken with the newest installed camera app are enqueued and then, uploaded | NA |  |
| Videos upload | 1. Close the app<br>2. Take some videos with the camera | With the app closed, check in web or another client that the taken videos were enqueued and uploaded in 15 minutes | NA |  |
| Account | 1. With two (al least) accounts in device, click on `Account to upload videos `<br>2. Select a different account to upload videos<br>3. Close the app<br>4. Take some videos with the camera | With the app closed, check in web or another client that the taken videos were uploaded in 15 minutes to the correct account| NA |  |
| Path | 1. Click on `Video upload path`<br>2. Select a different folder to upload videos in the selected account<br>3. Close the app<br>4. Take some videos with the camera | With the app closed, check in web or another client that the taken videos were uploaded in 15 minutes to the correct folder | NA |  |
| Camera folder | 1. Install another camera app in the device<br>2. Click on `Video upload path`<br>3. Click on `Camera folder`and select the folder from the newest installed camera app<br>4. Take videos with the installed camera app and with the built-in camera app<br>5. Wait 15 minutes| Only videos taken with the newest installed camera app are enqueued and then, uploaded | NA |  |
| **Conflict handling** | TO DO  |  |
| Update file | 1. Create a txt file, and download it to the app<br>2. Update the file in the server or in another client<br>3. Tap on the file| The content is updated | P m11
| Update file - Conflict Server | 1. Create a txt file in non-root folder, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Server" | 5. Conflict is detected and marked in file and parent folder<br>6. Server version is downloaded to the device | P m11
| Update file - Conflict Device | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Device" | 5. Conflict is detected and notification shows it<br>6. Device version is uploaded to the server | P m11
| Update file - Conflict Both | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | 5. Conflict is detected and notification shows it<br>6. Device version is uploaded to the server and server version is downloaded | P m11 
| **Download and preview** |   |  |
| .txt | Download a txt file | The content is correctly displayed| [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/download.feature) | |
| .png | Download a png file | Image is correctly displayed| P m11 | |
| .jpg | Download a jpg file | Image is correctly displayed| P m11  | |
| .gif | Open a GIF file | GIF correctly reproduced in both orientations | P m11 
| Audio without coverart | Open a MP3 file that does not include cover| Music played and placeholder note displayed |P m11 
| Audio with coverart | Open a MP3 file that includes cover| Music played and cover displayed |P m11 
| Stream a video with https (trusted server) | 1. With a https server stream a video. Use the controls to move forward and backward and change orientation | Video is streamed correctly |P m11 
| Unsupported | Download a unsupported file (pdf, office...) | Menu to open in a different app is raised up| P m11  | |
| Open with | 1. Download a file<br>2. Select the option `Open with`<br>3. Select an app from the list<br>4. Edit the file and save | 3. Correctly opened<br>4. Correctly edited and synced with server| P m11 | |
| Open in web (oCIS) | 1. Click on 3-dot-button, and select `Open in <provider>` for any kind of file available to open in the server | File opened in browser| P m11 | |
| **Details view** |   |  |
| View | Open details view of a file | All info correctly displayed in both orientations | P m11 | |
| Downloaded file | 1. Click on 3-dot-button on a downlaoded file, and select `Details`<br>2. Click on thumbnail | File is displayed | P m11 | |
| Not Downloaded | 1. Click on 3-dot-button on a non-downlaoded file, and select `Details`<br>2. Click on thumbnail | File is downloaded and displayed |[AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/download.feature) | |
| **Av. offline** |   |  |
| Set a file as av. offline | 1. Select a file from the list by clicking on the 3-dot-button and click on Set as av. offline<br>2. Remove device connection | File is downloaded (fucsia badge) and previewed with server latest version | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) | |
| Set a folder as av. offline | 1. Select a file from the list by clicking on the 3-dot-button and click on Set as av. offline<br>2. Remove device connection | Folder is av. offline (fucsia badge)<br>All the content of the folder is downloaded (fucsia badge) and previewable with latest version | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) | 
| Move av. offline | Move an items that is not av. offline to another location in the account | Items are set as av. offline in the new location (fucsia badge) |[AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) | |
| Move/Copy into av. offline | Move some items that are not av. offline into an av. offline folder | Items are set as av. offline (fucsia badge) |[AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) | |
| Move/Copy from av. offline | Move some items from an av. offline folder to another folder that is not av. offline | Items are downloaded (green badge) but not av.offine | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) |  |
| Modify av. offline | 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | Modified file is uploaded to the server in maximum 15 minutes, without opening the app (check in web or other client) | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) |  |
| Unset as av. offline | 1. Select a file from the list by clicking on the 3-dot-button and click on Unset as av. offline | File and folder content is downloaded (green badge) but not av.offline | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) |  |
| Unset content in a folder | 1. Browse an av. offline folder with content inside<br>2. Click on 3-dot-button of any of the items inside | Not posible to unset as av. offline, option hidden | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) |  |
| Shortcut | 1. Set as av. offline two files and two folders<br>2. Click on av. offline shortcut in the bottom bar<br>3. Click on a file<br>4. Click on a folder | 2. All av. offline items are listed<br>3. File opened or previewed<br>4. Folder browsed | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) |  |
| **Basic sync operations**||||||
| Create folder | 1. Open FAB in list of files, root folder<br>2. Select `New folder`<br>3. Enter a correct name<br>4. Click `OK`| Folder created in root folder. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature) |  |
| Rename | 1. Select a file from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a correct name<br>3. Click `OK` | File renamed in list. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature) |  |
| Copy file | 1. Select a file from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a correct target location (including space in case of oCIS account) | File in the new location and not removed from original location.<br>Check in web that items were correctly copied to the correct location. | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)  |  |
| Copy folder | 1. Select a folder that contains subfolders with files from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a correct location (including space in case of oCIS account) | Folder in the new location and not removed from original location.<br>Check in web that items were correctly copied to the correct location.| [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) |  |
| Copy item to other space (oCIS) | 1. In oCIS account, select a file from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a different space that the current one<br>3. Select any location inside the space | File is correctlu copied inside the space. Check in web. | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)  |  |
| Move file | 1. Select a non downlaoded file from the list by clicking on the 3-dot-button and click on `Move` <br>2. Select a correct target location | File in the new location and removed from original location.<br>Check in web that items were correctly moved to the correct location. | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/move.feature)  |  |
| Move folder | 1. Select a folder that contains subfolders with files from the list by clicking on the 3-dot-button and click on `Move`<br>2. Select a correct location | Folder is in the new location and is removed from original location.<br>Check in web that items were correctly moved to the correct location.| [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/move.feature)   |  |
| Remove file | 1. Select a file from the list by clicking on the 3-dot-button and click on `Remove`<br>2. Select `YES`| File removed from list. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/delete.feature) |  |
| Remove folder | 1. Select a non-downloaded folder from the list by clicking on the 3-dot-button and click on `Remove`<br>2. Select `YES`| Folder removed from list. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/delete.feature) |  |
| **Document Provider** |   |  |
|**File**||||||
| Copy file to oC | From doc prov, copy a file to the same account, different location| Correct copied | NA |  |
| Copy several file to oC | From doc prov, copy several files to the same account, different location| Correct copied | NA|  |
| Copy file to oC other account | From doc prov, copy a file to other account| Correct copied |  NA |
| Copy several file to other location | From doc prov, copy several files to other location| Correct copied | NA |  |
| Copy a file to other location  in the same oC account| From doc prov, copy a files to other location in the same account | Correct copied |NA  |  |
| Copy a file from other location | From doc prov, copy files from other location to oC| Correctly copied | NA |  |
|**Folder**||||||
| Folder with subfolders oC | From doc prov, copy a folder with subfolders to the same account, different location| Correct copied | NA|  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Correct copied | NA | Not everything copied: https://github.com/owncloud/android/issues/2658 |
| Copy several folders to other location | From doc prov, copy several folders to other location| Correct copied | NA |  |
| Copy a folder from other location | From doc prov, copy a folder from other location to oC| Correctly copied | NA|  |
|**Create File** |   |  |
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | NA |   |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder |NA |   |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  |NA |   |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | NA|  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts  | NA |  |
|**Other operations**||||||
| Create folder | Create a new folder inside the document provider | Folder is created inside the oC account |  |  |  |
| Delete file | Delete a file in root folder and non-root folder | Files deleted correctly | |  |  |
| Delete folder | Delete a folder in root folder and non-root folder | Folders deleted correctly |  |  |  |
| Rename file | Rename a file in root folder and non-root folder | Files renamed correctly | |  |  |
| Rename folder | Rename a folder in root folder and non-root folder | Folders renamed correctly |  |  |  |
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | |   |  |
| **Public links** |   |  |
| Create link file |  1. Select a file from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Save | Check that link is listed in the share view. Check that the file in the file list of the app includes the link icon. Check in web that the link was created | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature) |  |
| Create link folder |  1. Select a folder from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Save | Check that link is listed in the share view. Check that the folder in the file list of the app includes the link icon. Check in web that the link was created | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature) |  |
| Multiple links | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` to create several links on the item<br>4. Save<br> repeat 3. and 4. 10 times to create 10 links over the same item | Check that all created links are listed in the share view. Check in web that the link list was created | P m11 |  |
| Link name (oC10) | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Add a name to the link, different of the default one, including special characters<br>5. Save | Check in web that the link was created with correct name | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature) |  |
| Password | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Enable `Password` and add new password<br>5. Save<br>6. Click on the chain icon to copy the link to the clipboard and paste it in a browser| 5. Check in web that the link was created with password enabled<br>6. Link is opened in the browser and password is asked | F m11 | Password mandatory!! |
| Expiration | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Enable `Expiration` and add date<br>5. Save | Check in web that the link was created with expiration date enabled with the correct date| [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature)
| Edit permission (folder)| 1. Over an existing link (folder) with all permissions, edit by using the pencil icon and revoke `Edit` | Check that sharee is not allowed to edit the item (opened with 3rd party app, error in uploads view) | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature)  |  |
| Remove link | 1. Create several links over the same item, no matter the link properties<br>2. Remove one of them by clickin on the trashbin icon in the list<br>3. Remove all of them  | 2. Check in web that the removed link is not listed anymore<br>3. Check in web that item does not have links anymore. Check that the item in the file list of the app includes the link icon | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature)
| **Share with users** |   |  |
| Share with one user| 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Users and Groups` section<br>4. Type username of an existing user | Check that sharee has access to the shared item in the list<br>Check that the item in the file list of the sharing user includes the share icon | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature) |  |
| Shared with one group| 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Users and Groups` section<br>4. Type group name of an existing group | Check that any sharee in the group has access to the shared item in the list<br>Check that the item in the file list of the sharing user includes the share icon | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature) |  | 
| Share without Edit (file) | 1. Select a file from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Users and Groups` section<br>4. Type username of an existing user<br>5. Click on pencil icon to edit and revoke `Edit` permission | Check that sharee has access to the shared item in the list. Check that sharee is not allowed to edit the file (opened with 3rd party app, error in uploads view) | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)   |  |
| Share without Create (folder) | 1. Select a folder from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Users and Groups` section<br>4. Type username of an existing user<br>5. Click on pencil icon to edit and revoke `Create` permission| Check that sharee has access to the shared folder in the list. Check that sharee is not allowed to upload new content to the folder (FAB hidden)  | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)   |  |
| Share without share permission | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Users and Groups` section<br>4. Type username of an existing user<br>5. Click on pencil icon to edit and revoke `Share` permission | Check that sharee has access to the shared item in the list. Check that sharee is not allowed to share the file with other users (share icon hidden) | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)    |  |
| Privileges inheritance | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Users and Groups` section<br>4. Type username of an existing user and revoking edit permissions<br>5. Sharee repeats the process and shares the item with a 3rd user, granting edit permissions | Error: `No permissions to execute this action` | NA  | Resharing not available |
| Delete | Over an existing share, click on the trashbin icon to remove all existing sharees | Check that sharees do not have access to the shared item<br>Check that the item in the file list of the sharing user does not include the share icon | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)  |  |
| **Private link** |   |  |
| Private link shared | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Click on the link on the top right corner<br2. Share it with another app  | Correctly shared  | P m11 | |
| **Upgrade** |   |  |
| Latest version | 1. Install the previous version adding three accounts of different types (basic, OAuth and OIDC), enabling all Settings, downloading some items and setting some items as av. offline in both accounts<br>2. Upgrade to the current version | `Release notes` shown and also linked in `Settings` as `What's new`.<br> App correctly upgraded: both accounts are there, settings correct, download and av. offline are correct | NA


Remove section share from outside
Add tests open with web - create new
svg to previews
Add more literals

AUTO Tests:  https://reports.cucumber.io/reports/3ea6e8b5-b71b-4586-80b5-f04f7afadc58

Reporte

- Icon for docxf (Android,iOS)
- Response in Android to the links privacy policy


# Changelog

#### [Depth infinity](https://github.com/cs3org/reva/pull/4278)

Created an oCIS5-beta.1 server with a deep folder structure with many items inside. 

**iOS**: iOS does the depth infinity check correctly, discovering the whole structure. <br>
**Android**: No depth infinity in Android yet


#### [Do not allow moves between shares](https://github.com/cs3org/reva/pull/4318) 

**iOS**: iOS app does not allow, showing the following error:

<screenshot>

Room for improvement: operation could be prevented to items in the share list (create issue)<br>

**Android**: Move operation is not allowed in oCIS' shares for Android yet

#### [Fix spaceID in meta endpoint response](https://github.com/cs3org/reva/pull/4341)

**iOS**: Fixed, available 12.1+<br>
**Android**: Fixed, available 4.2+

#### [Add url extension to mime type list](https://github.com/cs3org/reva/pull/4344)


**iOS**: .url files not detected as straigth-openable. Needs `Open In`<br>
**Android**: .url files not detected as straigth-openable. Needs `Open In`

