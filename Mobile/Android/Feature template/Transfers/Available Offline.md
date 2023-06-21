#### Available Offline 


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | File is downloaded (fucsia badge) and previewed with server latest version | | |
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | Folder is av. offline (fucsia badge)<br>All the content of the folder is downloaded (fucsia badge) and previewable with latest version |  | 
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | Folder is av. offline (fucsia badge)<br>All the content of the folder and subfolders is downloaded (fucsia badge) and previewable |   | 
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | All the content of the folder is downloaded (fucsia badge)<br>Parent folders are not av. offline | | 
| Unset as av. offline a folder inside of an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | | |
| Move av. offline | Move an av. offline folder to another location that is not av. offline | Folder keeps av. offline condition | | |
| Move/Copy into av. offline | Move some items that are not av. offline into an av. offline folder | Items are set as av. offline (fucsia badge) | | |
| Move/Copy from av. offline | Move some items from an av. offline folder to another folder that is not av. offline | Items are downloaded (green badge) but not av.offine |  |  |
| Modify av. offline | 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | Modified file is uploaded to the server in maximum 15 minutes, without opening the app (check in web or other client) |  |  |
| Cancel | 1. Set as av.offline a folder with many items inside<br>2. During the process, cancel it by clicking on `x` | Items already downloaded stay as downloaded (green badge)<br>The folder is not av. offline (no fucsia badge) |  |  |
| Delete locally | 1. Click on an av. offline item<br>2. Clicl on `Remove` from list of operations | Action can not be performed |  |  |
| Unset file as. av offline | 1. Long press on an av. offline file<br>2. Select `Unset as available offline` | File is downloaded (green badge) and not av. offline anymore |  |  |
| Unset folder as. av offline | 1. Long press on an av. offline folder<br>2. Select `Unset as available offline` | Folder's content is downloaded (green badge)<br>Folder not av.offline anymore (no badge) |  |  |
|**Sync external**|||||
| Sync download av. offline | 1. Set a txt file as av. offline<br>2. In server, modify the file<br>3. In app, refresh containing folder<br>4. Remove device connection<br>5. Open file in app | File was synced with new content |  |  |
| Sync upload av. offline | 1. Set a txt file as av. offline<br>2. Use `Open with` to edit and save the text file with a text editor installed on device, out of ownCloud<br>3. In app, refresh containing folder<br>4. Open file in other client | Check in other client that the file was synced back to the server | | |
| Sync upload background av. offline | 1. Set a txt file as av. offline and kill the app<br>2. Use `Open with` to edit and save the text file with a text editor, out of ownCloud<br>3. Wait 15 minutes<br>4. Open file in other client | Check in other client that the file was synced back to the server |  |  |
| Sync external app | 1. Open an oC file with an external app that supports SAF (MS Word, for ex)<br>2. Modify the file and save| Check in web that the file was synced back to the server |  |  |
|**Shortcut**|||||
| No av. offline | 1. Open a account that does not contain av. offline items<br>2. Click on av. offline shortcut in the bottom bar | `No available offline files` |  |  |
| List of av. offline | 1. Set as av. offline two files and two folders<br>2. Click on av. offline shortcut in the bottom bar<br>3. Click on a file<br>4. Click on a folder | 2. All av. offline items are listed<br>3. File opened or previewed<br>4. Folder browsed |  |  |
| Unset as. av offline | 1. Set as av. offline two files and two folders<br>2. Click on av. offline shortcut in the bottom bar<br>3. Long press on one item and select `Unset as available offline`| Item removed from the shortcut list |  |  |