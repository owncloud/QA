#### Move 

#### PRs: 

Devices: <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Actions**||||||
| Move file  | 1. Select a file to move<br>2. Select a correct target location | File moved to the new location (removed from original location)|   |  |
| Move folder | 1. Select a folder that contains subfolders with files inside to move<br>2. Select a correct location | Folder moved to the new location, including all subfolders and content inside (removed from original location)|  | |
| Move to same location | 1. Select an item to move<br>2. Select as location the current location | Item is created with (2) in the name, and in the same location |  |  |
| Move to other location with same name | 1. Select an item to move<br>2. Create in the location folder an item with the same name as the original<br>3. Move | Item is moved with a (2) at the end of the name |  |  |
|**Errors**||||||
| Move folder to itself | 1. Select a folder to move<br>2. Select as location the folder itself | Not allowed, error message displayed |  |   
| Move folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed |  |   |
| Moved item removed | 1. Select an item to move<br>2. Select a correct location<br>3. Before submitting, remove the original file in webUI or other client | Error message. List of files refreshed without the item |  |  |
| Move to inexistent location | 1. Select an item to move<br>2. Select a correct location<br>3. Before submitting, remove the target location in webUI or other client | Error message. List of files refreshed without the item |  |  |
