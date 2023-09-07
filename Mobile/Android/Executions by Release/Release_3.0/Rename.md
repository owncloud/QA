#### Rename 

#### PRs: 

Devices: Samsung A51, Android 12 <br>
Server: oCIS 2.0.0-rc1, 10.11.0


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Actions**||||||
| Rename non-downloaded file  | 1. Select a file to rename<br>2. Enter a correct name | File renamed. Check in server| P m12  |  |
| Rename downloaded file  | 1. Select a downloaded file to rename<br>2. Enter a correct name | File renamed. Check in server and internal storage| P m12  |  |
| Rename folder | 1. Select a folder that contains subfolders with files inside to rename<br>2. Enter a correct name | Folder renamed. Action does not affect its content | P m12 | |
|**Errors**||||||
| Rename item no connection | 1. Remove device connection<br>2. Select an item to rename | Correct error message | P m12 |  |
| Rename item no server connection | 1. Put server down<br>2. Select an item to rename | Correct error message | P m12 |  |
| Maintenance mode | 1. Put server in maintenance mode<br>2. Select an item to rename | Correct error message |  |  |
| Empty name | 1. Select a folder to rename<br>2. Enter empty name | Not allowed | P m12  |   
| Max length folder name | 1. Select a folder to rename<br>2. Enter a 249 character name<br>3. Enter a 250 character name | 2. Allowed<br>3. Not allowed | P m12 |  
| Max length file name | 1. Select a file to rename<br>2. Enter a 245 character name<br>3. Enter a 246 character name (extension is part of the name) | 2. Allowed<br>3. Not allowed | P m12 |   
| Forbidden character \"/\" | 1. Select a folder to rename<br>2. Enter a name that contains \"/\" | Not allowed, forbidden character. Error message | P m12 |   |
| Forbidden character \"\\" | 1. Select a folder to rename<br>2. Enter a name that contains \"\\" | Not allowed, forbidden character. Error message | P m12 |   |
| Rename existing name | 1. Select an item to rename<br>2. Enter as name an existing name in the same location | Not allowed. Error message | P m12 |  |
| Rename inexistent item | 1. Select an item to rename<br>2. Enter a correct name<br>3. Before submitting, remove the item in webUI or other client | Error message | P m12 |  |
