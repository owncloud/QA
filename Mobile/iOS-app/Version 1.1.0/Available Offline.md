###  Available Offline

#### Pr: https://github.com/owncloud/ios-app/pull/445

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|||||
| File | Open the card for a file | Av offline option is there |  |  |  |
| Folder | Open the card for a folder | Av offline option is there |  |  |  |
|**File**|||||
| Set | Set a file as av. offline | File is downloaded (check in Manage options). Icon is correctly set (check in both orientations) |  |  |  |
| Unset | 1. Unset a file as av. offline<br>2. Wipe all the files in Manage options | File is not downloaded. Icon is removed (check in both orientations) |  |  |  |
|**Folder** |  |  |
| Set a folder as av. offline in card | 1. Swipe over a folder<br>2. Set as av. offline | All the content of the folder is downloaded. Correct icon on everything | 
| Set the content of a folder as av. offline | 1. Browse a folder<br>2. Set as av. offline | All the content of the folder is downloaded. Correct icon on everything | 
| Set a folder with subfolders as av. offline | 1. Swipe over a folder which contains a deep structure of subfolders with special characters<br>2. Set as av. offline | All the content of the folder and subfolders is downloaded  and marked| 
| Set a folder (not in root) as av. offline | 1. Swipe over a folder that is not in root folder<br>2. Set as av. offline  | All the content of the folder is downloaded | 
| Unset as av. offline a folder into an av. offline folder | 1. Swipe over a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | 
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | 
| Add into av. offline | Add some content into an av. offline folder | Content is downloaded and sync | 
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine | 
| Rename av. offline | Rename av. offline folder | Correctly renamed. Content keeps av. offline | 
| Cancel | 1. Set as av. offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | 
| Delete locally | Try to delete locally an av. offline folder | Action can not be performed | 
|**External Actions**||||||
| Update file | 1. From external app, modify a file | Check in app that the av. offline file is updated | |  |
| Move content to av. offline | 1. Set a folder as av. offline<br>2. In server, move some content into the av. off. folder from another location | Check in app that the moved content becomes av. offline | |  |
| Move content from av. offline | 1. Set a folder as av. offline<br>2. In server, move some content from the folder to another location | Check in app that the content is not av. off. |  |  |
| Modify files | 1. Set a folder as av. offline<br>2. In server, modify some files into the av. off. folder in different deep levels | Check in app that the files have changed | |  |
| Delete | 1. Set a folder as av. off.<br>2. Delete from server or another client | The folder is deleted | |  |
| Delete subfolder | 1. Set a folder as av. off.<br>2. Delete from server or another client a subfolder  | The subfolder is deleted | |  |
| Multiaccount | 1. In two different account, set some folder as av. off.<br>2. In app, set one of them as active.<br>3. In server side, upload some content into an av. off. folder of the non active<br>4. In app, change the account | The av. off. folder is upgraded with the uploaded content | |  |
| Delete account server| 1. Set a folder as av. off.<br>2. While it is downloading, in server delete the account| Downloads cancelled | |  |
| **Av. offline shortcut** |  |  |
| Empty | Open quick access av. offline with no av. offline content | Correct placeholder |  |  |
| Add av offline | Set several files and folders in different levels as av. offline | They appear correctly in quick access |  |  |
| Remove av offline | Unset several files and folders in different levels as av. offline | They do not appear in quick access anymore |  |  |
| Remove from quick access | Open quick access and remove some content av. offline | They do not appear in quick access anymore. Content is not av. offline |  |  |
| Remove all from quick access | Open quick access and remove all v. offline content from there | They do not appear in quick access anymore (placeholder set). Content is not av. offline |  |  |
|**Errors**||||||
| No internet connection | 1. Switch the device connection off<br>2. Set a folder as av. off<br>3. Switch the device connection on |2. The folder is marked as av. off<br>3.All the content is downloaded and set as av.offline |  |  |
| No server connection | 1. Switch the server off<br>2. Set a folder as av. off<br>3. Switch the server on |2. The folder is marked as av. off<br>3.All the content is downloaded and set as av.offline |  |  |
| Lost connection | 1. Set a folder as av. off.<br>2. Switch the connection off<br>3. Switch the connection on | The download of the content resumes |  |  |
|**Unused local copies**||||||
| View | 1. Open Settings<br>2. Option "Delete unused local copies" | Correct View in both orientations |  |  |
| After 1 minute | 1. Set the option "after 1 minute"<br>2. Download a file and set content ad av. offline | After 1 minute, local copy is deleted for the non av. offline. Av. offline keeps in the device|  |  |
| After 15 minutes | 1. Set the option "after 15 minutes"<br>2. Download a file | After 15 minutes, local copy is deleted for the non av. offline. Av. offline keeps in the device |  |  |
