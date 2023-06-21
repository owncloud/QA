### Move

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 
 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Move**||||||
| Move non-downloaded file | 1. Select a non downlaoded file from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select a correct target location | File in the new location and removed from original location.<br>Check in web that items were correctly moved to the correct location. |   |  |
| Move downloaded file | 1. Download a file by clicking on it<br>2. Select the file by long pressing on it<br>3. In 3-dot-button, select `Move `<br>4. Select a correct target location  | File in the new location (not downloaded) and removed from original location.<br>Check in web that items were correctly moved to the correct location.<br>Check in internal storage that original file was removed, and moved file is downloaded (Android Studio's Device File Explorer will help with app in debug build)|   |  |
| Move non-downloaded folder | 1. Select a folder that contains subfolders with files from the list by long pressing on it<br>2. Select a correct location | Folder is in the new location and is removed from original location.<br>Check in web that items were correctly moved to the correct location.|   |  |
| Move downloaded folder | 1. Download a folder with subfolders and files by long pressing on it and then, clicking on sync button (circle arrow) on the top<br>2. Select the downloaded folder again, and in 3-dot-button, select `Move `<br>3. Select a correct location | Folder with files and subfolders inside is moved to the new location (not downloaded) and removed from original location.<br>Check in web that items were correctly moved to the correct location.<br>Check in internal storage that folder is removed from original location and downloaded in the target location (Android Studio's Device File Explorer will help with app in debug build) |  |  |
|**Errors**||||||
| Move item no connection | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select a correct target location | Error: `Device is not connected to a network` |  |  |
| Move item no server connection | 1. Switch server off<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Move`<br>4. Select a correct target location | Error: |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Move`<br>4. Select a correct target location | Error: `System in maintenance mode` |   |  |
| Move item to same location | 1. Select any item by long pressing on it<br>2. In 3-dot-button, select `Move `<br>3. Select as target the current location of the item | Error: `The file exists already in the destination folder` |  |  |
| Move to other location with same name | 1. Select any item by long pressing on it<br>2. Using web or other client, create in the target folder an item with the same name as the original<br>3. In 3-dot-button, select `Move `<br>4. Select the target folder that contains the item with same name | Error: `An error occurred in the destination folder` |  |  |
| Move folder to itself | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select as target location the same folder | Error: `It's not posible to move a folder into a descendant` |   |   
| Move folder to a descendant | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select as target folder any subfolder that is inside the selected folder | Error: `It's not posible to move a folder into a descendant` |  |  |
| Move to inexistent location | 1. Select any item from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. In web or other client, remove the intended target folder<br>4. Select as target folder the removed folder (still appears in the app) | Error: `An error occurred in the destination folder` |  |  |