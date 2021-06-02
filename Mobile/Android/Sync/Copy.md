#### Copy 

#### PRs: 

Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Actions**||||||
| Copy file  | 1. Select a file to copy<br>2. Select a correct target location | File copied to the new location |   |  |
| Copy folder | 1. Select a folder that contains subfolders with files inside to copy <br>2. Select a correct location | Folder copied moved to the new location, including all subfolders and content inside |  | |
| Copy file to same location | 1. Select a file to copy<br>2. Select as location the current location | File is copied with (2) in the name, and in the same location |  |  |
| Copy folder to same location | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location | Folder and its content is duplicated |  |  |
| Copy to other location with same name | 1. Select an item to copy<br>2. Create in the location folder an item with the same name as the original<br>3. Copy | Item is copied with a (2) at the end of the name |  |  |
| Modified | 1. In app, download a txt file<br>2. In server, modify the file<br>3. In app, copy the file to another location | Item is copied with the latest downloaded version |  |  |
|**Errors**||||||
| Copy folder to itself | 1. Select a folder to copy<br>2. Select as location the folder itself | Not allowed, error message displayed |  |   
| Copy folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed |  |   |
| Copy to inexistent location | 1. Select an item to copy<br>2. Select a correct location<br>3. Before submitting, remove the target location in webUI or other client | Error message |  |  |
