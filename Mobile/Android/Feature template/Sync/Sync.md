#### Sync 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

### List of files
 
| Test Case | Steps | Expected | Result | Related Comment / Defect  | 
| :-------- | :---- | :------- | :----: | :------------------------ | 
|**View**||||||
| Top bar | Open list of files | Top bar includes: <br>- Hamburger button (root folder)<br>- Back arrow button (non root folder)<br>- `ownCloud` label<br>- Lens icon to filter<br>- Avatar (root folder)<br>- Sharing icon (non root folder)<br>- 3-dot-button (non root folder) <br>- Selector for sorting types<br>- Grid/List view selector|  |  |
| Bottom bar | Open list of files | Bottom bar includes: <br>- Files (oC10)<br>-  Personal (oCIS)<br>- Links (oC10)<br>- Uploads<br>- Offline<br>- Shares (oCIS)<br>- Spaces (oCIS) |  |  |
| View body | Open list of files | List of files and folders match. Check with web  |  |  |
| Empty list of files | Open list of files of an empty folder | `No files in here` placeholder message  |  |  |
|**Top bar actions**||||||
| Hamburger | Click on hamburger button | Sidebar menu opened  |  |  |
| Search | 1. Click on lens icon<br>2. Enter some different strings | 1. Top bar shows the `Search this folder` message to enter the pattern<br>2. Check that the list of files is filtered, showing only the items which name match with the input  |  |  |
| Empty Search | 1. Click on lens icon<br>2. Enter a string that does not match with any item in the list | `No files in here` placeholder message |  |  |
| Cancelled Search | 1. Click on lens icon<br>2. Enter a string that matches with some items in the list<br>3. Click on `x` to cancel<br>4. Click again on `x` | 2. List filtered with the pattern<br>3. All files listed with no filters<br>4. Filter field is closed and `ownCloud` displayed again |  |  |
| Avatar | Click on avatar button | `Manage accounts` view displayed|  |  |
| Sort by name | 1. Click on sorting selector<br>2. Choose "Name &uarr;" <br>3. Choose "Name &darr;"| 2. List sorted by name ascending without obeying files and folders<br>3. List sorted by name descending without obeying files and folders |  |  | 
| Sort by date | 1. Click on sorting selector<br>2. Choose "Date &uarr;" <br>3. Choose "Date &darr;"| 2. List sorted by date ascending (oldest first)<br>3. List sorted by date descending (newest first) |  |  | 
| Sort by size | 1. Click on sorting selector<br>2. Choose "Size &uarr;" <br>3. Choose "Size &darr;"| 2. List sorted by size ascending (smallest first)<br>3. List sorted by date descending (biggest first) |  |  |
| Grid/List | 1. Click on grid/list selector<br>2. Click again on grid/list selector| 1. Files in grid mode in all accounts and subfolders<br>2. Files in list mode in all accounts and subfolders |  |  |  

### Sync operations

| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Copy**||||||
| Copy non-downloaded file | 1. Select a non downlaoded file from the list by long pressing on it<br>2. In 3-dot-button, select `Copy`<br>3. Select a correct target location (including space in case of oCIS account) | File in the new location and not removed from original location.<br>Check in web that items were correctly copied to the correct location. |   |  |
| Copy downloaded file  | 1. Download a file by clicking on it<br>2. Select the file by long pressing on it<br>3. In 3-dot-button, select `Copy`<br>4. Select a correct target location (including space in case of oCIS account) | File in the new location (not downloaded) and not removed from original location (downloaded).<br>Check in web that items were correctly copied to the correct location.<br>Check in internal storage that original file is still downloaded and copied file is not (Android Studio's Device File Explorer will help with app in debug build)|   |  |
| Copy non-downloaded folder | 1. Select a folder that contains subfolders with files from the list by long pressing on it<br>2. Select a correct location (including space in case of oCIS account) | Folder in the new location and not removed from original location.<br>Check in web that items were correctly copied to the correct location.|   |  |
| Copy downloaded folder | 1. Download a folder with subfolders and files by long pressing on it and then, clicking on sync button (circle arrow) on the top<br>2. Select the downloaded folder again, and in 3-dot-button, select `Copy`<br>3. Select a correct location (including space in case of oCIS account) | Folder with files and subfolders inside copied to the new location (not downloaded) and not removed from original location (downloaded).<br>Check in web that items were correctly copied to the correct location.<br>Check in internal storage that original folder is still downloaded and copied folder is not (Android Studio's Device File Explorer will help with app in debug build) |  |  |
| Copy item to same location | 1. Select any item by long pressing on it<br>2. In 3-dot-button, select `Copy`<br>3. Select as location the current location of the item | File is copied adding (1) to its name |  |  |
| Copy to other location with same name | 1. Select any item by long pressing on it<br>2. Using web or other client, create in the target folder an item with the same name as the original<br>3. In 3-dot-button, select `Copy`<br>4. Select the target folder that contains the item with same name | Item is copied with a (1) at the end of the name |  |  |
|**Copy - Errors**||||||
| Copy item no connection | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Copy`<br>3. Select a correct target location | Error: `Device is not connected to a network` |  |  |
| Copy item no server connection | 1. Switch server off<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Copy`<br>4. Select a correct target location | Error: |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Copy`<br>4. Select a correct target location | Error: `System in maintenance mode` |   |  |
| Copy folder to itself | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Copy`<br>3. Select as target location the same folder | Error: `It's not posible to copy a folder into a descendant` |   |   
| Copy folder to a descendant | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Copy`<br>3. Select as target folder any subfolder that is inside the selected folder | Error: `It's not posible to copy a folder into a descendant` |  |  |
| Copy to inexistent location | 1. Select any item from the list by long pressing on it<br>2. In 3-dot-button, select `Copy`<br>3. In web or other client, remove the intended target folder<br>4. Select as target folder the removed folder (still appears in the app) | Error: `An error occurred in the destination folder` |  |  |
|**Move**||||||
| Move non-downloaded file | 1. Select a non downlaoded file from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select a correct target location | File in the new location and removed from original location.<br>Check in web that items were correctly moved to the correct location. |   |  |
| Move downloaded file | 1. Download a file by clicking on it<br>2. Select the file by long pressing on it<br>3. In 3-dot-button, select `Move `<br>4. Select a correct target location  | File in the new location (not downloaded) and removed from original location.<br>Check in web that items were correctly moved to the correct location.<br>Check in internal storage that original file was removed, and moved file is downloaded (Android Studio's Device File Explorer will help with app in debug build)|   |  |
| Move non-downloaded folder | 1. Select a folder that contains subfolders with files from the list by long pressing on it<br>2. Select a correct location | Folder is in the new location and is removed from original location.<br>Check in web that items were correctly moved to the correct location.|   |  |
| Move downloaded folder | 1. Download a folder with subfolders and files by long pressing on it and then, clicking on sync button (circle arrow) on the top<br>2. Select the downloaded folder again, and in 3-dot-button, select `Move `<br>3. Select a correct location | Folder with files and subfolders inside is moved to the new location (not downloaded) and removed from original location.<br>Check in web that items were correctly moved to the correct location.<br>Check in internal storage that folder is removed from original location and downloaded in the target location (Android Studio's Device File Explorer will help with app in debug build) |  |  |
|**Move - Errors**||||||
| Move item no connection | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select a correct target location | Error: `Device is not connected to a network` |  |  |
| Move item no server connection | 1. Switch server off<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Move`<br>4. Select a correct target location | Error: |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Move`<br>4. Select a correct target location | Error: `System in maintenance mode` |   |  |
| Move item to same location | 1. Select any item by long pressing on it<br>2. In 3-dot-button, select `Move `<br>3. Select as target the current location of the item | Error: `The file exists already in the destination folder` |  |  |
| Move to other location with same name | 1. Select any item by long pressing on it<br>2. Using web or other client, create in the target folder an item with the same name as the original<br>3. In 3-dot-button, select `Move `<br>4. Select the target folder that contains the item with same name | Error: `An error occurred in the destination folder` |  |  |
| Move folder to itself | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select as target location the same folder | Error: `It's not posible to move a folder into a descendant` |   |   
| Move folder to a descendant | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. Select as target folder any subfolder that is inside the selected folder | Error: `It's not posible to move a folder into a descendant` |  |  |
| Move to inexistent location | 1. Select any item from the list by long pressing on it<br>2. In 3-dot-button, select `Move`<br>3. In web or other client, remove the intended target folder<br>4. Select as target folder the removed folder (still appears in the app) | Error: `An error occurred in the destination folder` |  |  |
|**Remove**||||||
| Remove non-downloaded file | 1. Select a file from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES`| File removed from list. Check in web |  |  |
| Remove downloaded file locally | 1. Download a file by clicking on it<br>2. Select the file from the list by long pressing on it<br>3. In 3-dot-button, select `Remove`<br>4. Select `LOCAL ONLY`| File is still in list without the download green badge<br>Check in web that file is not removed<br>Check in internal storage that file was removed from there (Android Studio's Device File Explorer will help with app in debug build) |   |  |
| Remove downloaded file from server| 1. Select a downloaded file from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES` | File removed from list<br>Check in web that file was removed<br>Check in internal storage that file was removed from there (Android Studio's Device File Explorer will help with app in debug build)  |  |  |
| Remove non-downloaded folder | 1. Select a non-downloaded folder from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES`| Folder removed from list. Check in web |  |  |
| Remove downloaded folder locally | 1. Download a folder by long pressing on it and clicking on rounded arrows button<br>2. Select again the folder by long pressing<br>3. In 3-dot-button, select `Remove`<br>4. Select `LOCAL ONLY`| Folder is still in list and all its content with the green badge<br>Check in web that folder is not removed<br>Check in internal storage that folder's content was removed from there (Android Studio's Device File Explorer will help with app in debug build) |   |  |
| Remove downloaded folder from server| 1. Select a downloaded folder from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES` | Folder removed from list<br>Check in web that folder was removed<br>Check in internal storage that folder was removed from there (Android Studio's Device File Explorer will help with app in debug build)  |  |  |
|**Remove - Errors**||||||
| Remove item no connection | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Remove`<br>3. Select `YES` | Error: `Removal failed because device is not connected to a network` |  |  |
| Remove item no server connection | 1. Switch server off<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Remove`<br>4. Select `YES` | Error: `Removal failed because an error occurred while connecting to the server` |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Remove`<br>4. Select `YES` | Error: `System in maintenance mode` |   |  |
|**Rename**||||||
| Rename non-downloaded file | 1. Select a file from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a correct name | File renamed in list. Check in web |  |  |
| Rename downloaded file  | 1. Download a file by clicking on it<br>2. Select the file from the list by long pressing on it<br>3. In 3-dot-button, select `Rename`<br>4. Enter a correct name | File renamed in list. Check in web. Check in internal storage that file was renamed (Android Studio's Device File Explorer will help with app in debug build)|  |  |
| Rename folder | 1. Select a folder with subfolders from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a correct name | Folder renamed in list. Check in web |  | |
|**Rename - Errors**||||||
| Rename item no connection | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a correct name | Error: `Rename could not be completed because device is not connected to a network` |  |  |
| Rename item no server connection | 1. Switch server off<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Rename`<br>4. Enter a correct name| Error: `Rename could not be completed because an error occurred while connecting to the server` |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by long pressing on it<br>3. In 3-dot-button, select `Rename`<br>4. Enter a correct name | Error: `System in maintenance mode` |   |  |
| Empty name | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter empty name | Error: `Rename could not be completed because file name cannot be empty` |  |   
| Max length folder name | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a 249 character name<br>3. Enter a 250 character name | 3. Allowed<br>4. Error: `Rename could not be completed because file name cannot be that long` |  |  
| Max length file name | 1. Select a folder from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a 249 character name<br>3. Enter a 250 character name (extension is part of the name) | 3. Allowed<br>4. Error: `Rename could not be completed because file name cannot be that long`  | |   
| Forbidden character \"/\" | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a name that contains \"/\" | Error: `Rename could not be completed because file name contains at least one forbidden character `|  |   |
| Forbidden character \"\\" | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter a name that contains \"\\" | Error: `Rename could not be completed because file name contains at least one forbidden character ` |   |   |
| Rename existing name | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>3. Enter as name an existing name in the same location | Error: `Rename could not be completed because file already exists` |  |  |
| Rename inexistent item | 1. Select an item from the list by long pressing on it<br>2. In 3-dot-button, select `Rename`<br>2. Enter a correct name<br>3. Before submitting, remove the item in web or other client<br>4. Submit the renaming | Error: `Rename could not be completed because it was not found` |   |  |
|**Create folder**||||||
| New folder in root | 1. Open FAB in list of files, root folder<br>2. Select `New folder`<br>3. Enter a correct name | Folder created in root folder. Check in web |  |  |
| New folder in non-root | 1. Open FAB in list of files, non-root folder<br>2. Select `New folder`<br>3. Enter a correct name | Folder created in non-root folder. Check in web |  |  |
| New folder - empty | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Let empty name | `OK` not clickable |  |  |
| New folder - existing name | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Enter a name of an existing folder in the current folder | Error: `The resource you tried to create already exists` |  |  |
| New folder - long name | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Enter a name longer than 255 characters | Error: `Folder could not be created because folder name could not be that long` |  |  |