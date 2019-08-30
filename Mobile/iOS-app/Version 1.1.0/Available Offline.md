###  Available Offline

#### Pr: https://github.com/owncloud/ios-app/pull/445

Devices: iPhone XS V12, iPad v12<br>
Server: 10.2.1

---

| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|||||
| File | Open the card for a file | Av offline option is there | P m12 t12 |  |  |
| Folder | Open the card for a folder | Av offline option is there | P m12 t12 |  |  |
|**File**|||||
| Set | Set a file as av. offline | File is downloaded (check in Manage options). Icon is correctly set (check in both orientations) | P m12 t12|  |  |
| Unset | 1. Unset a file as av. offline<br>2. Wipe all the files in Manage options | File is not downloaded. Icon is removed (check in both orientations) | P m12 t12|  |  |
|**Folder** |  |  |
| Set a folder as av. offline in card | 1. Swipe over a folder<br>2. Set as av. offline | All the content of the folder is downloaded. Correct icon on everything | P m12 t12 
| Set the content of a folder as av. offline | 1. Browse a folder<br>2. Set as av. offline using the three dt button| All the content of the folder is downloaded. Correct icon on everything | P m12 t12 | FIXED: Downloaded files are not set as av. offline
| Set a folder with subfolders as av. offline | 1. Swipe over a folder which contains a deep structure of subfolders with special characters<br>2. Set as av. offline | All the content of the folder and subfolders is downloaded  and marked| P m12 t12 | FIXED: Downloaded content not marked
| Set a folder (not in root) as av. offline | 1. Swipe over a folder that is not in root folder<br>2. Set as av. offline  | All the content of the folder is downloaded | P m12 t12 |  FIXED: Downloaded content not marked
| Unset as av. offline a folder into an av. offline folder | 1. Swipe over a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | P m12 t12
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | P m12 t12 | FIXED: Av. offline lost
| Add into av. offline | Add some content into an av. offline folder | Content is downloaded and sync | P m12 t12 | FIXED: If content is downloaded, no av. offline
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is not av.offine | P m12 t12
| Rename av. offline | Rename av. offline folder | Correctly renamed. Content keeps av. offline | P m12 t12 | FIXED: Content is not av. offline
| Av. offline inside av. offline | Create a folder inside an av. offline folder<br>Upload content inside the folder | Folder and its content are av. offline | P m12 t12 | FIXED: Content is not marked
| Cancel | 1. Set as av. offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | P m12 t12 | No way to cancel, ftm will keep this behaviour  
|**External Actions**||||||
| Move content to av. offline | 1. Set a folder as av. offline<br>2. In server, move some content into the av. off. folder from another location | Check in app that the moved content becomes av. offline | P m12 t12 |  |
| Move content from av. offline | 1. Set a folder as av. offline<br>2. In server, move some content from the folder to another location | Check in app that the content is not av. off. | P m12 t12 |  |
| Delete | 1. Set a folder as av. off.<br>2. Delete from server or another client | The folder is deleted | P m12 t12 |  |
| Delete subfolder | 1. Set a folder as av. off.<br>2. Delete from server or another client a subfolder  | The subfolder is deleted | P m12 t12 |  |
| Multiaccount | 1. In two different account, set some folder as av. off.<br>2. In app, set one of them as active.<br>3. In server side, upload some content into an av. off. folder of the non active<br>4. In app, change the account | The av. off. folder is upgraded with the uploaded content | P m12 |  |
| Remove space without Av. offline | Set some items as av. offline<br>Download some files<br>In list of servers, wipe local storage | Downloaded files are removed and marked as non-downloaded.<br>Av. offline content keeps downloaded | P m12 t12 | FIXED: Crash from other branch.  |
| Remove space with Av. offline | Set some items as av. offline<br>Download some files<br>In list of servers, wipe local storage | Downloaded files are removed and marked as non-downloaded.<br>Av. offline content is also removed | P m12 t12| FIXED: Crash from other branch. Everything deleted? Av. offline is there, fixed with new option |
| Remove space with Av. offline - Files app | Set some items as av. offline<br>In list of servers, wipe local storage with av. offline<br>Open Files app with the account | Content is not downloaded till app is open again | P m12 t12|  |
| Delete account server| 1. Set a folder as av. off.<br>2. While it is downloading, in server delete the account| Downloads cancelled | P m12 t12 |  |
| **Av. offline shortcut** |  |  |
| Empty | Open quick access av. offline with no av. offline content | Correct placeholder | P m12 t12 |  |
| Add av offline | Set several files and folders in different levels as av. offline | They appear correctly in quick access | P m12 t12  |  |
| Remove av offline | Unset several files and folders in different levels as av. offline | They do not appear in quick access anymore | P m12 t12 |  |
| Remove from quick access | Open quick access and remove some content av. offline | They do not appear in quick access anymore. Content is not av. offline | P m12 t12 | DONE: To improve, wording |
| Remove all from quick access | Open quick access and remove all v. offline content from there | They do not appear in quick access anymore (placeholder set). Content is not av. offline | P m12 t12| DONE: To improve, wording |
|**Errors**||||||
| No internet connection | 1. Switch the device connection off<br>2. Set a folder as av. off<br>3. Switch the device connection on |2. The folder is marked as av. off<br>3.All the content is downloaded and set as av.offline | P m12 t12 |  |
| No server connection | 1. Switch the server off<br>2. Set a folder as av. off<br>3. Switch the server on |2. The folder is marked as av. off<br>3.All the content is downloaded and set as av.offline | P m12 t12 |  |
| Lost connection | 1. Set a folder as av. off.<br>2. Switch the connection off<br>3. Switch the connection on | The download of the content resumes | P m12 t12 |  |
|**Conflicts**||||||
| File | 1. Set a folder as av. off.<br>2. Switch the connection off<br>3. Modify a file in app and in web UI<br>4. Switch the connection on | The download of the content resumes | NA | Not only av. offline - next issue |
|**Delete unused copies**||||
| View | Open Settings, and the "Delete unused local copies" section | Correct view in both orientations | P m12 t12 | FIXED: To improve with selectors |
| 1 minute | Download several files<br>Set 1 minute<br>Wait 1 minute or close the app | Content deleted | P m12 t12 |  |
| 15 minutes | Download several files<br>Set 15 minutes<br>Wait 15 minute or close the app | Content deleted | P m12 t12 |  |
| Av. offline | Download several files<br>Set several files and folders as av. offline<br>Set 1 minute<br>Wait 1 minute or close the app | Download content deleted<br>Av. offline content keeps downloaded | P m12 t12 |  |