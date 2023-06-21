### Uploads


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 

---

NOTE: Tests on `Auto Uploads` in `Settings` section
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Manual uploads**||||||
| Upload one root | 1. Open FAB in root folder and select `Files`<br>2. Select one file from any provider | File is uploaded to root (check in web)<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section |   |  |
| Upload one non-root | 1. Open FAB in non-root folder and select `Files`<br>2. Select one file from any provider | File is uploaded to non-root (check in web)<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section |  |  |
| Upload a very big file | 1. Open FAB and select `Files`<br>2. Select one file from any provider which size is bigger than 500MB | File is uploaded.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section | | |
| Upload 1000 Files | 1. Open FAB and select `Files`<br>2. Select 1000 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of 1000 files uploaded to the correct place with correct sizes in the `Uploaded` section|  | |
| Removed folder | 1. Browse into any folder inside the account<br>2. Open FAB and select `Files`<br>3. Select a file<br>4. Before submitting the selected file, remove the folder in web or any other client<br>5. Submit the file to upload | Containing folder is re-created and file is uploaded inside |  | |
|**Upload from Camera**||||||
| Upload root | 1. Open FAB in root folder and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section|   |  |
| Upload non-root | 1. Open FAB in non-root folder and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to non-root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section|   |  |
|**Upload external**||||||
| 3rd party - Single account | 1. In ownCloud app, set only one account<br>2. Open any other app that manage files (f. ex. `Photos` app)<br>3. Select one item to share with ownCloud<br>4. Select a correct target folder inside of the oC account, non root | Item is correctly uploaded to the selected folder inside of the account<br>Uploads view shows the pictures uploaded to the correct location with correct size in the `Uploaded` section|  |  |
| 3rd party - Multiaccount | 1. In ownCloud app, set three accounts<br>2. Open any other app that manage files (f. ex. `Photos` app)<br>3. Select one item to share with ownCloud<br>4. Select the first account and a correct target folder inside of it<br>5. Repeat with the other two accounts | Item is correctly uploaded to the selected folder inside of every account<br>Uploads view shows the pictures uploaded to the correct location inside every account with correct size in the `Uploaded` section|  |  |
| 3rd party - Multiple selection | 1. Open any app that manage files (f. ex. `Photos` app)<br>2. Select many items (more thatn 500) to share with ownCloud<br>4. Select one account and a correct target folder inside of it| All items are correctly uploaded to the selected folder inside of the account<br>Uploads view shows the pictures uploaded to the correct location inside of the account with correct size in the `Uploaded` section|  |  |
| Text - Single account | 1. In ownCloud app, set only one account<br>2. Open a web browser<br>3. Select some piece of text in any web<br>4. Share it with ownCloud<br>5. Select correct location<br>6. Enter a correct file name | Txt file is correctly uploaded to the selected  location<br>Uploads view shows the file uploaded to the correct location with correct size in the `Uploaded` section.|  | |
| Text - Multiple account | 1. In ownCloud app, set only one account<br>2. Open a web browser<br>3. Select some piece of text in any web<br>4. Share it with ownCloud<br>5. Select correct location<br>6. Enter a correct file name | Txt file is correctly uploaded to the selected  location<br>Uploads view shows the file uploaded to the correct location with correct size in the `Uploaded` section.|  | |
|**Document provider**||||||
| Copy from other provider | 1. Open `Files` app and a select a provider that is not ownCloud<br>2. Select one file from that provider<br>3. Copy the file and select ownCloud as target provider | File is uploaded to the selected location inside of oC.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section |   | |
| Move from other provider | 1. Open `Files` app and a select a provider that is not ownCloud<br>2. Select one file from that provider<br>3. Move the file and select ownCloud as target provider | File is uploaded to the selected location inside of oC.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section |   | |
| Copy from oC account | 1. Add two accounts to ownCloud app<br>2. Open `Files` app and a select a provider that is one of the ownCloud accounts<br>3. Select one file from that provider<br>3. Copy the file and select the other ownCloud account as target provider | File is uploaded to the selected location inside of ownCloud<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section |   | |
| Move from oC account | 1. Add two accounts to ownCloud app<br>2. Open `Files` app and a select a provider that is one of the ownCloud accounts<br>3. Select one file from that provider<br>3. Move the file and select the other ownCloud account as target provider | File is uploaded to the selected location inside of ownCloud<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section |   | |
| Create new | 1. Open an app with SAF integration and create a new file (MS Office, f. ex.)<br>2. Save it in ownCloud using Document Provider| File is uploaded to the correct location inside of ownCloud<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section  |  |  |
|**Uploads view**||||||
| Clear Uploaded | 1. Upload some files<br>2. Once files have been uploaded, click on `Clear` button on the `UPLOADED` list | `UPLOADED` list cleared | | |
| Connection removed while uploading | 1. Upload some files<br>2. Remove the device connection while the files are being uploaded<br>3. Recover connection | 2. Files not uploaded are moved to `ENQUEUED` (if they were in the queue) and `FAILED` (if they weren't enqueued) when connection was removed<br>3. Uploads are automatically resumed and moved to `ENQUEUED` | | |
| Remove Enqueued | 1. Upload some files<br>2. Remove the device connection while the files are being uploaded<br>3. Click on `x` of some files of the `ENQUEUED` list | Files are removed from `ENQUEUED` list | | | 
| Clear Failed | 1. Upload some files<br>2. Remove the device connection while the files are being uploaded<br>3. Click on `Clear` button on the `FAILED` list<br>4. Recover connction | 2. Files are moved to `FAILED`<br>3. `FAILED` List cleared<br>4. No files are uploaded (check in web) | | |
| Retry Failed auto | 1. Upload some files<br>2. Remove the device connection while the files are being uploaded<br>3. Recover device connection | 2. Files are moved to `FAILED` list<br>3. Files are automatically retried and moved to `ENQUEUED` and then to `CURRENT` | | |
| Retry Failed manual | 1. Upload some files<br>2. Switch server off while the files are being uploaded<br>3. Click on `RETRY` | 2. Files are moved to `FAILED` list<br>3. Files are retried and moved to `ENQUEUED` and then to `CURRENT` | | |
| Remove Failed | 1. Upload some files<br>2. Remove the device connection while the files are being uploaded<br>3. Click on trashbin of some files of the `FAILED` list | Files are removed from `FAILED` list | | | 
| Cancel Current | 1. Upload a big file<br>2. Click on `x` to remove the upload before it finishes | Upload removed from `CURRENT`list<br>File is not uploaded (check in web) | | |
| Cancel Failed | 1. Upload some files<br>2. Remove the device connection while the files are being uploaded<br>3. Remove some items from the `FAILED` list by clicking on the trashbin icon<br>4. Recover device connection | 2. Files are moved to `FAILED` list<br>4. Only non-cancelled files are  moved to `CURRENT` and uploaded<br>4. In the target folder, only are uploaded the non-cancelled files. |  | 
| Account deleted | 1. Add two accounts to the device<br>2. Upload some files to the first account<br>3. Switch to another account and upload some files<br>4. Remove one of the accounts from the device | All uploads of the removed account are removed from uploads view.<br>All uploads of the remaining account keep in the uploads view | | | 
|**Errors**||||||
| No connection | 1. Remove connection from device<br>2. Upload a file | File moved to `ENQUEUED` list without error | 
| Server down | 1. Switch server off<br>2. Upload a file| File moved to `ENQUEUED` list without error  |  
| Internet connection lost | 1. Upload a file<br>2. Remove connection from device before upload finishes | Uploads view error in `FAILED`: `Connection error`<br>Notification error: `An error occurred while connection to the server` | 
| Server connection lost | 1. Upload a file<br>2. Switch server off| Uploads view error in `FAILED`: `Connection error`<br>Notification error: `An error occurred in the network` | 
| Maintenance mode | 1. Set server in maintenance mode by using the oC command `occ maintenance:mode --on`<br>2. Upload a file| Uploads view error in `FAILED`: `Server is unavailable`<br>Notification error: `System in maintenance mode` |  | 
| Lack of permissions | 1. User1 shares a folder with user2, grating any edit permission<br>2. User2 tries to upload a file into the shared folder | Not posible, FAB is hidden | | |
| Account disabled | 1. In the admin dashboard, go to `Users` and disable current account<br>2. Upload a file to the disabled account | Uploads view error in `FAILED`: `Credentials error`<br>Notification error: `Upload failed, you need to login again`  | |
| Account deleted | 1. In the admin dashboard, go to `Users` and remove current account<br>2. Upload a file | Uploads view error in `FAILED`: `Unknown error`<br>Notification error: `Malformed server configuration` |  | 