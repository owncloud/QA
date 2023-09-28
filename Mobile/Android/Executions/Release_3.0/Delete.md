#### Delete 

#### PRs: 

Devices: Samsung A51, Android 12<br>
Server: oCIS 2.0.0-rc1, 10.11.0


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Actions**||||||
| Delete non-downloaded file  | 1. Select one non-downloaded file to delete| File removed from list. Check in server| P m12   |  |
| Delete downloaded file locally | 1. Select a downloaded file to delete<br>2. Select "local only" | File  in list without the download badge<br>File in server<br>File removed from internal storage | P m12  |  |
| Delete downloaded file from server | 1. Select a downloaded file to delete<br>2. Select "Yes" | File  removed from list<br>File not in server<br>File removed from internal storage | P m12  |  |
| Delete non-downloaded folder  | 1. Select one non-downloaded folder to delete| Folder removed from list. Check in server| P m12   |  |
| Delete downloaded folder locally | 1. Select a folder with downloaded content insisde to delete<br>2. Select "local only" | Folder in list. Content without the download badge<br>Folder in server<br>Folder content removed from internal storage |  P m12  |  |
| Delete downloaded folder from server | 1. Select a folder with downloaded content to delete<br>2. Select "Yes" | Folder removed from list<br>Folder not in server<br>Folder removed from internal storage |   P m12 |  |
|**Errors**||||||
| Delete item no connection | 1. Remove device connection<br>2. Select an item to delete | Correct error message | P m12 |  |
| Delete item no server connection | 1. Put server down<br>2. Select an item to delete | Correct error message | P m12 |  |
| Maintenance mode | 1. Put server in maintenance mode<br>2. Select an item to delete | Correct error message | P m12 |  |
| Delete item removed | 1. Select an item to delete<br>2. Before submitting, remove the original item in webUI or other client | Error message. List of files refreshed without the item | P m12 |  |
