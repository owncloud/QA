###  Available Offline Folders 

#### Pr: https://github.com/owncloud/android/pull/1698 

Device: Galaxy Note 4 v6

Server: v9.1.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Menu Option**||||||
| 1 | Menu option | Long press on a folder | The option "Av. offline" appears | P m6 |  |
|**View**||||||
| 2 | Portrait | Set a folder as available offline| The yellow arrow with a bar underneath is set  |  F m6 | If it is shared, loses the icon |
| 3 | Landscape | Set a folder as available offline| The yellow arrow with a bar underneath is set  | P m6 |  |
| 4 | List View | Set a folder as available offline| The yellow arrow with a bar underneath is set  | P m6 |  |
| 5 | Grid View | Set a folder as available offline| The yellow arrow with a bar underneath is set  | P m6 |  |
|**Actions**||||||
| 6 | Empty | Set an empty folder with special characters as av. offline | The yellow arrow with a bar underneath is set  | P m6 |  |
| 7 | Not Empty | Set an non empty folder with special characters as av. offline | All the content is downloaded and the yellow arrow is set in the folder and all the content  | P m6 | SOLVED: Pull down = lost  av. off.|
| 8 | Multiselection | Set several folders as av. offline | All the content is downloaded and the yellow arrow is set in all folders and all the content  | P m6 |  |
| 9 | Deep structure | Set as av. offline a folder that has a deep structure of folders into | All the content is downloaded and the yellow arrow is set in the folder and all the content into it | P m6 | SOLVED: Browsing back lose av. offline |
| 10 | Not root | Set a folder that is not on root as av. offline | All the content is downloaded and the yellow arrow is set in the folder and all the content into | P m6 |  |
| 11 | Cancel | 1. Set a folder as av. off<br>2. Cancel | The downloaded files remains as downloaded. Others do not | F m6 | Cancel does not remove av. offline |
| 12 | Upload files| 1. Set a folder as av. offline<br>2. Upload some files into it | The uploaded files becomes av. offline and is uploaded to the server | P m6 |  |
| 13 | Upload folder| 1. Set a folder as av. offline<br>2. Create a folder into it | The new folder is av. offline| P m6 |  |
| 14 | File into uploaded| From previous test case, create or upload files into that folder | This new content is av. offline| P m6 |  |
| 15 | Modify | 1. Set a folder as av. offline<br>2. Modify a file into the folder | The file is automatically modified and uploaded to the server  | P m6 |  |
| 16 | Modify deep | 1. Set a folder that contains a folder structure as av. offline<br>2. Modify a file into a deep folder | The file is automatically uploaded to the server | P m6 |  |
| 17 | Rename av. offline | 1. Set a folder as av. offline<br>2. Rename the folder | The folder is renamed (check in server) and keeps on being av. off. | P m6 |  |
| 18 | Rename content | 1. Set a folder as av. offline<br>2. Rename files/folders contained  | All renamed content keeps on being av. offline | P m6 |  |
| 19 | Move av .offline | 1. Set a folder as av. offline<br>2. Move the folder to another location| The folder is moved (check in server) and keeps on being av. off. as all the content | P m6 |  |
| 20 | Move content from av. offline | 1. Set a folder as av. offline<br>2. Move some content from av. off. folder to another location (not av. off.)  | In the new location, the content is not av. off. | P m6 |  |
| 21 | Move content to av. offline | 1. Set a folder as av. offline<br>2. Move some content into the av. off. folder from another location | The moved content becomes av. offline | P m6 |  |
| 22 | Unset av. offline| 1. Unset a folder as av. offline | The yellow arrow disappears in the folder and all the content. The content has the green tick (downloaded) | P m6 |  |
| 23 | Unset one file | 1. Unset as av. offline a file into a av. off. folder | Action can not be performed | P m6 |  |
| 24 | Unset some files | 1. Unset as av. offline some files (deeper) into a av. off. folder | Action can not be performed | P m6 |  |
| 25 | Unset one folder | 1. Unset as av. offline a folder into a av. off. folder | Action can not be performed | P m6 |  |
| 26 | Unset some folders | 1. Unset as av. offline some folders  into a av. off. folder | Action can not be performed | P m6 |  |
| 27 | Set - Unset | 1. Set a folder (not root) as av. offline<br>2. Set the parent as av. off.<br>3. Unset the folder in 1. as av. off<br>4. Unset the parent as av. off. | 3. Action can not be performed<br>4. Folder is not av. off, and all its content (including folder of 1.) is not av. off. | P m6 |  |
| 28 | Delete locally  | Delete locally an av. offline folder| Action can not be performed | P m6 |  |
| 29 | Delete  | Delete an av. offline folder | Folder is deleted (check in server)| P m6 |  |
| 30 | Delete content locally  | Delete locally some content (files and/or folders) into an av. off. folder| Action can not be performed | P m6 |  |
| 31 | Delete content  | Delete some content (files and/or folders) into an av. offline folder | Content is deleted (check in server)| P m6 |  |
| 32 | Multiaccount | In different accounts, set several folders as av. off.| The folders are all av. offline and all the content is downloaded | P m6 |  |
| 33 | Multiaccount II | 1. In two different account, create a folder with the same name and upload content into.<br>2. Set only one of them as av. off.| Only one is av. off, the other not. | P m6 |  |
| 34 | Background | 1. Set a folder with huge content as av. offline<br>2. Lock the device and wait at least three minutes<br>3. Open the app| The folder is av. offline and all the content is downloaded | P m6 |  |
| 35 | Kill app | 1. Set a folder as av. offline<br>2. Kill the app<br>3. Open again the app | The folder is av. offline and its content keeps downloading | P m6 |  |
|**External Actions**||||||
| 36 | Move content to av. offline | 1. Set a folder as av. offline<br>2. In server, move some content into the av. off. folder from another location | Check in app that the moved content becomes av. offline | P m6 |  |
| 37 | Move content from av. offline | 1. Set a folder as av. offline<br>2. In server, move some content from the folder to another location | Check in app that the content is not av. off. | P m6 |  |
| 38 | Modify files | 1. Set a folder as av. offline<br>2. In server, modify some files into the av. off. folder in different deep levels | Check in app that the files have changed | P m6 |  |
| 39 | Conflict - local version | 1. Set a folder as av. offline<br>2. Switch wifi off<br>3. In server and app, modify a txt file<br>4. Solve the conflict with local version | 4. Conflict appears<br>5. Check in app and server the correct version | P m6 |  |
| 40 | Conflict - server version | 1. Set a folder as av. offline<br>2. Switch wifi off<br>3. In server and app, modify a txt file<br>4. Solve the conflict with server version | 4. Conflict appears<br>5. Check in app and server the correct version | P m6 |  |
| 41 | Conflict - both versions | 1. Set a folder as av. offline<br>2. Switch wifi off<br>3. In server and app, modify a txt file<br>4. Solve the conflict with both versions | 4. Conflict appears<br>5. Both versions are stored | P m6 |  |
| 42 | Delete | 1. Set a folder as av. off.<br>2. Delete from server or another client | The folder is deleted | P m6 |  |
| 43 | Delete subfolder | 1. Set a folder as av. off.<br>2. Delete from server or another client a subfolder  | The subfolder is deleted | P m6 |  |
| 44 | Multiaccount | 1. In two different account, set some folder as av. off.<br>2. In app, set one of the as active.<br>3. In server side, upload some content into an av. off. folder<br>4. In app, change the account | The av. off. folder is upgraded with the uploaded content | P m6 |  |
| 45 | Delete account server| 1. Set a folder as av. off.<br>2. While it is downloading, in server delete the account| Downloads cancelled | P m6 |  |
|**Errors**||||||
| 46 | No internet connection | 1. Switch the device connection off<br>2. Set a folder as av. off<br>3. Switch the device connection on |2. The folder is marked as av. off<br>3.All the content is downloaded and set as av.offline | P m6 |  |
| 47 | No server connection | 1. Switch the server off<br>2. Set a folder as av. off<br>3. Switch the server on |2. The folder is marked as av. off<br>3.All the content is downloaded and set as av.offline | P m6 |  |
| 48 | Lost connection | 1. Set a folder as av. off.<br>2. Switch the connection off<br>3. Switch the connection on | The download of the content resumes | P m6 |  |
| 49 | Changed credentials | 1. Set a folder as av. off.<br>2. While it is downloading, in server change the credentials| The new credentials are input and the download keeps on | P m6 |  |
| 50 | Permissions | 1. User1 shares a folder with User2 that includes a file.txt file  without permission<br>2. User2 sets the folder as av. off.<br>3. Edit txt and modify them, using the Document Provider<br>4. Open the app<br>5. Refresh the folder where the txt is stored | A permission error is raised | F m6 | Each refresh adds a failed update in uploads view |
|**Special Servers**||||||
| 51 | Redirect | Login in a redirected server and set a folder with several subfolders as av. offline| Folder and all content becomes av. off. | F m6 | Error message is shown |
| 52 | Shibboleth autoprov. | Login in a shibboleth server with autoprov. and set a folder with several subfolders as av. offline| Folder and all content becomes av. off. | P m6 |  |
| 53 | Shibboleth SSO | Login in a shibboleth server with SSO and set a folder with several subfolders as av. offline| Folder and all content becomes av. off. | P m6 |  |
| 54 | Shibboleth expiration | 1. Login in a shibboleth server.<br>2. Set a folder as av. off.<br>3. Session expires<br>4. Enter credentials | Downloads keep on | P m6 |  |