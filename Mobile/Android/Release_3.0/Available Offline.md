#### Available Offline 

#### PRs: 

Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
| Set a file as av. offline | 1. Long press on a file<br>2. Set as av. offline (down arrow with a line underneath) | File is downloaded with server latest version |
| Set a folder as av. offline | 1. Long press on a folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded with latest version |
| Set a folder with subfolders as av. offline | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder and subfolders is downloaded |
| Set a folder (not in root) as av. offline | 1. Long press on a folder that is not in root folder<br>2. Set as av. offline (down arrow with a line underneath) | All the content of the folder is downloaded |
| Unset as av. offline a folder into an av. offline folder | 1. Long press on a folder which contains a deep structure of subfolders with content and special characters<br>2. Set as av. offline (down arrow with a line underneath)<br>3. Try to unset as av offline some of the content into the av. offline folder | Action can not be performed |
| Move av. offline | Move an av. offline folder to another location | Folder keeps on being av. offline |
| Move/Copy into av. offline | Move some content into an av. offline folder | Content is downloaded and sync |
| Move/Copy from av. offline | Move some content from an av. offline folder to another folder that is not av. offline | Content is downloaded but not av.offine |
| Modify av. offline| 1. Set a txt file as. av offline (or a folder that contains it).<br>2. Close the app<br>3. With an external editor, modify the file | file is uploaded to the server in maximum 15 minutes, without opening the app |
| Cancel | 1. Set as av.offline a folder with huge content<br>2. During the download, cancel it | The content already downloaded remains downloaded. The folder is not av. offline. |
| Delete locally | Try to delete locally an av. offline item | Action can not be performed |
