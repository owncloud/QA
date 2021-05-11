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
|**Errors**||||||
| Copy folder to itself | 1. Select a folder to copy<br>2. Select as location the folder itself | Not allowed, error message displayed |  |   
| Copy folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed |  |   |
| Copy file to same location | 1. Select a file to copy <br>2. Select as location the current location | File is duplicated |  |  |
| Copy folder to same location | 1. Select a folder that contains subfolders with files to copy <br>2. Select as location the current location | Folder and its content is duplicated |  |  |
| Copy to inexistent location | 1. Select an item to copy<br>2. Select a correct location<br>3. Before submitting, remove the target location in webUI or other client | Error message |  |  |
