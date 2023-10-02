### Spaces - operations

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>



| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**List items in custom space**||||
| Root empty | 1. Enter in custom space of oCIS account, with no content inside<br>2. Set grid mode | 1. Empty view placeholder displayed in both orientations. Image space and title displayed above the list. Space name on the top bar<br>2. Empty view placeholder displayed in both orientations.|  |  |
| Root non empty | 1. Enter in custom space of oCIS account, with content inside.<br>2. Set grid mode | 1. Content displayed in both orientations. Space image and title dislayed above the list. Compare content with server<br>2. Content displayed in both orientations. Compare with server |  |  |
| Non-root empty | 1. Enter in custom space of oCIS account.<br>2. In web, create new folder<br>3. In app, browse to the folder | Empty view placeholder displayed in both orientations | |  |
| Non-root non empty | 1. Enter in custom space of oCIS account.<br>2. In web, create new folder and add some content inside<br>3. In app, browse to the folder | Content displayed in both orientations. Compare with server |  |  |
| Long name and description | 1. Using the web, set a very long title and subtitle for a space<br>2. Open the space in the app | Long title and subtitle displayed on the top of the root in a proper way (...)|  |  |
| Deep structure | 1. Enter in custom space of oCIS account.<br>2. In web, create new folder structure A/B/C/D/E/F and add files and folders inside every depth-level<br>3. In app, browse through the folder structure | Content displayed in both orientations. Compare with server   |  | |
| Footer root | 1. Enter in custom space of oCIS account.<br>2. In web, add two files and two folders to root | App shows correct footer: `2 files, 2 folders` |  |  |
| Footer non-root | 1. Enter in personal space of oCIS account.<br>2. In web, create a new folder and add two files and two folders inside | App shows correct footer inside the folder: `2 files, 2 folders` |  |  |
| Refresh root | 1. Enter in custom space of OCIS account<br>2. In web, add new content to root folder<br>3. In app, pull to refresh in root<br>4. In web remove content from root folder<br>5. In app, pull to refresh in root | 3. New items displayed in root<br>5. Items removed from root | | |
| Refresh non-root | 1. Enter in custom space of OCIS account<br>2. In web, add new content to non-root folder<br>3. In app, pull to refresh in non-root<br>4. In web remove content from non-root folder<br>5. In app, pull to refresh in non-root | 3. New items displayed in non-root<br>5. Items removed from non-root | | | 
| Switch space | 1. Enter in a custom space of oCIS account, with content inside.<br>2. Click on Spaces tab on the bottom bar<br>3. Select another space<br>4. Switch to personal | 1. Content of the space displayed<br>2. List of spaces displayed<br>3. Content of the space displayed<br>4. Content of personal displayed|  |  |
|**Transfers**||||||
| Upload one root | 1. Open a custom space in oCIS account<br>2. Open FAB in root folder and select `Files`<br>3. Select one file from any provider | File is uploaded to root.<br>Uploads view shows the file uploaded to the correct place (including space) with correct size in the `Uploaded` section|  |  |
| Upload one non-root | 1. Open a custom space in oCIS account<br>2. Open FAB in non-root folder and select `Files`<br>3. Select one file from any provider | File is uploaded to non-root.<br>Uploads view shows the file uploaded to the correct place (including space) with correct size in the `Uploaded` section|  |  |
| Upload a very big file | 1. Open a custom space in oCIS account<br>2. Open FAB and select `Files`<br>3. Select one file from any provider which size is bigger than 500MB | File is uploaded.<br>Uploads view shows the file uploaded to the correct place (including space) with correct size in the `Uploaded` section|  |  |
| Upload 10 Files | 1. Open a custom space in oCIS account<br>2. Open FAB and select `Files`<br>3. Select 10 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of 10 files uploaded to the correct place (including space) with correct sizes in the `Uploaded` section | | |
| Upload 100 files | 1. Open a custom space in oCIS account<br>2. Open FAB and select `Files`<br>3. Select 100 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of files uploaded to the correct place (including space) with correct sizes in the `Uploaded` section |  | | |
| Download Single file | 1. Open a custom space in oCIS account<br>2. Click on a single file to download | Details/Preview view is displayed with the download progress bar<br>File downloaded showing the green badge next to the thumbnail<br>`Download success` notification shown when download finishes |  | |
| Download Folder with subfolders | 1. Open a custom space in oCIS account<br>2. Select a folder that contains files and subfolders by long pressing on it<br>3. Click on sync button (circle arrow)  | All files inside (including ones inside subfolders) downloaded showing the green badge next to the thumbnail<br>One notification of success for every downloaded file | | |
|**Basic operations**||||||
| New folder | 1. Open a custom space in oCIS account<br>2. Open FAB in list of files<br>3. Select `New folder`<br>4. Enter a correct name<br>5. Click `OK`| Folder created in root folder of the space. Check in web |  |  |
| Rename | 1. Open a custom space in oCIS account<br>2. Select a file from the list by clicking on the 3-dot-button and click on `Rename`<br>3. Enter a correct name<br>4. Click `OK` | File renamed in list of the space. Check in web |  |  |
| Copy folder | 1. Open a custom space in oCIS account<br>2. Select a folder that contains subfolders with files from the list by clicking on the 3-dot-button and click on `Copy`<br>3. Select a correct location (a different space in case of oCIS account) | Folder in the new location, not removed from original location.<br>Check in web that items were correctly copied to the correct location.|   |  |
| Move folder | 1. Open a custom space in oCIS account<br>2. Select a folder that contains subfolders with files from the list by clicking on the 3-dot-button and click on `Move`<br>3. Select a correct location inside the space | Folder is in the new location, and removed from original location.<br>Check in web that items were correctly moved to the correct location.|   |  |
| Remove file | 1. Open a custom space in oCIS account<br>2. Select a file from the list by clicking on the 3-dot-button and click on `Remove`<br>3. Select `YES`| File removed from list in space. Check in web |  |  |