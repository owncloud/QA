### Remove


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Remove**||||||
| Remove non-downloaded file | 1. Select a file from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES`| File removed from list. Check in web |  |  |
| Remove downloaded file locally | 1. Download a file by clicking on it<br>2. Select the file from the list by long pressing on it<br>3. In 3-dot-button, select `Remove`<br>4. Select `LOCAL ONLY`| File is still in list without the download green badge<br>Check in web that file is not removed<br>Check in internal storage that file was removed from there (Android Studio's Device File Explorer will help with app in debug build) |   |  |
| Remove downloaded file from server| 1. Select a downloaded file from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES` | File removed from list<br>Check in web that file was removed<br>Check in internal storage that file was removed from there (Android Studio's Device File Explorer will help with app in debug build)  |  |  |
| Remove non-downloaded folder | 1. Select a non-downloaded folder from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES`| Folder removed from list. Check in web |  |  |
| Remove downloaded folder locally | 1. Download a folder by long pressing on it and clicking on rounded arrows button<br>2. Select again the folder by long pressing<br>3. In 3-dot-button, select `Remove`<br>4. Select `LOCAL ONLY`| Folder is still in list and all its content with the green badge<br>Check in web that folder is not removed<br>Check in internal storage that folder's content was removed from there (Android Studio's Device File Explorer will help with app in debug build) |   |  |
| Remove downloaded folder from server| 1. Select a downloaded folder from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES` | Folder removed from list<br>Check in web that folder was removed<br>Check in internal storage that folder was removed from there (Android Studio's Device File Explorer will help with app in debug build)  |  |  |
|**Errors**||||||
| Remove item no connection | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES` | Error: `Removal failed because device is not connected to a network` |  |  |
| Remove item no server connection | 1. Switch server off<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Remove`<br>4. Select `YES` | Error: `Removal failed because an error occurred while connecting to the server` |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Remove`<br>4. Select `YES` | Error: `System in maintenance mode` |   |  |