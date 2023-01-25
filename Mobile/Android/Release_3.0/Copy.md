#### Copy 

#### PRs: 

Devices: Samsung A51, Android12 <br>
Server: 10.11.0, oCIS 2.0.0-rc1


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Actions**||||||
| Copy non-downloaded file  | 1. Select a file to copy<br>2. Select a correct target location | File copied to the new location. Check in server the correct location | F m12  | Ugly error |
| Copy downloaded file  | 1. Select a downloaded file to copy<br>2. Select a correct target location | File copied to the new location. Check in server and in internal storage the correct location | F m12  | Ugly error  |
| Copy non-downloaded folder | 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location | Folder copied moved to the new location, including all subfolders and content inside | F m12 | Ugly error |
| Copy downloaded folder | 1. Select a folder that contains subfolders with files (everything downloaded) inside to copy <br>2. Select a correct location | Folder copied to the new location, including all subfolders and content inside. Check the new location in server and internal storage | F m12 | Ugly error |
| Copy file to same location | 1. Select a file to copy<br>2. Select as location the current location | File is copied with (2) in the name, and in the same location | P m12 |  |
| Copy folder to same location | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location | Folder and its content is duplicated | P m12 |  |
| Copy to other location with same name | 1. Select an item to copy<br>2. Create in the location folder an item with the same name as the original<br>3. Copy | Item is copied with a (2) at the end of the name | P m12 |  |
| Modified | 1. In app, download a txt file<br>2. In app, copy the file to another location | Item is copied and not downloaded in the target location | P m12 | Ugly error to improve |
|**Errors**||||||
| Copy item no connection | 1. Remove device connection<br>2. Select an item to copy | Correct error message | P m12 |  |
| Copy item no server connection | 1. Put server down<br>2. Select an item to copy | Correct error message | P m12 |  |
| Maintenance mode | 1. Put server in maintenance mode<br>2. Select an item to copy | Correct error message | P m12 |  |
| Copy folder to itself | 1. Select a folder to copy<br>2. Select as location the folder itself | Not allowed, error message displayed | P m12 |   
| Copy folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed | P m12 |   |
| Copy to inexistent location | 1. Select an item to copy<br>2. Select a correct location<br>3. Before submitting, remove the target location in webUI or other client | Error message | P m12 |  |
