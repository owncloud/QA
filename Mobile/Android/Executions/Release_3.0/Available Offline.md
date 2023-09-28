#### Available Offline 

#### PRs: 

Devices: Samsung A51,  Android 12<br>
Server: 10.11.1, oCIS 2.0.0-rc.1


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | File is downloaded with server latest version | P m12
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | All the content of the folder is downloaded with latest version | P m12 | 
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | All the content of the folder and subfolders is downloaded | P m12 | 
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Remove device connection | All the content of the folder is downloaded | P m12 | 
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed | P m12
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline | P m12 |
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync | P m12
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine | P m12 |
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app | P m12 | 
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. | F m12 | No way to do it
| Delete locally | Try to delete locally an av. offline item | Action can not be performed | P m12
|**Sync**|||||
| Sync download av. offline | 1. Set a txt file as av. offline<br>2. In server, modify the file<br>3. In app, refresh containing folder<br>4. Remove device connection<br>5. Open file in app | Check in web that the file was synced back to the server | P m12 | 
| Sync upload av. offline | 1. Set a txt file as av. offline<br>2. Open, edit and save the text file with a text editor, out of oC<br>3. In app, refresh containing folder<br>4. Open file in server | Check in web that the file was synced back to the server | P m12 | 
| Sync upload background av. offline | 1. Set a txt file as av. offline and kill the app<br>2. Open, edit and save the text file with a text editor, out of oC<br>3. Wait 15 minutes<br>4. Open file in server | Check in web that the file was synced back to the server | P m12 | 
| Sync external app | 1. Open an oC file with an external app that supports SAF (MS Word, for ex)<br>2. Modify the file and save| Check in web that the file was synced back to the server | P m12 | 
