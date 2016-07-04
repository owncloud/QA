###  Available Offline Folders 

#### Pr: https://github.com/owncloud/android/pull/1698 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Menu Option**||||||
| 1 | Menu option | Long press on a folder | The option "Av. offline" appears |  |  |
|**View**||||||
| 2 | Portrait | Set a folder as available offline| The yellow arrow with a bar underneath is set  |  |  |
| 3 | Landscape | Set a folder as available offline| The yellow arrow with a bar underneath is set  |  |  |
| 4 | List View | Set a folder as available offline| The yellow arrow with a bar underneath is set  |  |  |
| 5 | Grid View | Set a folder as available offline| The yellow arrow with a bar underneath is set  |  |  |
|**Actions**||||||
| 5 | Empty | Set an empty folder as av. offline | The yellow arrow with a bar underneath is set  |  |  |
| 5 | Not Empty | Set an non empty folder as av. offline | All the content is downloaded and the yellow arrow is set in the folder and all the content  |  |  |
| 5 | Deep structure | Set as av. offline a folder that has a deep structure of folders into | All the content is downloaded and the yellow arrow is set in the folder and all the content into it |  |  |
| 5 | Not root | Set a folder that is not on root as av. offline | All the content is downloaded and the yellow arrow is set in the folder and all the content into |  |  |
| 5 | Upload files| 1. Set a folder as av. offline<br>2. Upload some files into it | The uploaded files becomes av. offline and is uploaded to the server |  |  |
| 5 | Upload folder| 1. Set a folder as av. offline<br>2. Create a folder into it | The new folder is av. offline|  |  |
| 5 | File into uploaded| From previous test case, create or upload files into that folder | This new content is av. offline|  |  |
| 5 | Upgrade | 1. Set a folder as av. offline<br>2. Upgrade a file into the folder | The file is automatically updated to the server  |  |  |
| 5 | Upgrade deep | 1. Set a folder that contains a folder structure as av. offline<br>2. Upgrade a file into a deep folder | The file is automatically updated to the server |  |  |
| 5 | Rename av. offline | 1. Set a folder as av. offline<br>2. Rename the folder | The folder is renamed (check in server) and keeps on being av. off. |  |  |
| 5 | Rename content | 1. Set a folder as av. offline<br>2. Rename files/folders contained  | All renamed content keeps on being av. offline |  |  |
| 5 | Move av .offline | 1. Set a folder as av. offline<br>2. Move the folder to anocther location| The folder is moved (check in server) and keeps on being av. off. as all the content |  |  |
| 5 | Move content from av. offline | 1. Set a folder as av. offline<br>2. Move some content from av. off. folder to another location (not av. off.)  | In the new location, the content is not av. off. |  |  |
| 5 | Move content to av. offline | 1. Set a folder as av. offline<br>2. Move some content into the av. off. folder from another location | The moved content becomes av. offline |  |  |
| 5 | Unset av. offline| 1. Unset a folder as av. offline | The yellow arrow disappears in the folder and all the content. The content has the green tick (downloaded) |  |  |
| 5 | Unset one file | 1. Unset as av. offline a file into a av. off. folder | Action can not be performed |  |  |
| 5 | Unset some files | 1. Unset as av. offline some files into a av. off. folder | Action can not be performed |  |  |
| 5 | Unset one folder | 1. Unset as av. offline a folder into a av. off. folder | Action can not be performed |  |  |
| 5 | Unset some folders | 1. Unset as av. offline some folders into a av. off. folder | Action can not be performed |  |  |
| 5 | Delete locally  | Delete locally an av. offline folder| Action can not be performed |  |  |
| 5 | Delete  | Delete an av. offline folder | Folder is deleted (check in server)|  |  |
| 5 | Delete content locally  | Delete locally some content (files and/or folders) into an av. off. folder| Action can not be performed |  |  |
| 5 | Delete content from server | Delete from server some content (files and/or folders) into an av. offline folder | Content is deleted (check in server)|  |  |
|**External Actions**||||||
|**Errors**||||||
|**Special Servers**||||||