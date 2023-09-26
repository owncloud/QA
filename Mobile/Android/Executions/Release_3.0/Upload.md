#### Upload 


Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Upload**||||||
| Upload one root | 1. Open FAB in root folder and select `Files`<br>2. Select one file from any provider | File is uploaded to root.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|   |  |
| Upload one non-root | 1. Open FAB in non-root folder and select `Files`<br>2. Select one file from any provider | File is uploaded to non-root.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|  |  |
| Upload a very big file | 1. Open FAB and select `Files`<br>2. Select one file from any provider which size is bigger than 500MB | File is uploaded.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes. | | |
| Upload 1000 Files | 1. Open FAB and select `Files`<br>2. Select 1000 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of 1000 files uploaded to the correct place with correct sizes in the `Uploaded` section.<br>Notification appears while uploading and disappers after every of them finishes. |  | |
| Only wifi | 1. In Settings, enable auto uploads for pictures with `only Wifi` option enabled<br>2. Remove wifi connection from device<br>3. Take some pictures and wait max 15 mins<br>4. Restablish connection| 3. Uploads enqueued<br>4.Uploads resumed and finished  |  
| Charging | 1. In Settings, enable auto uploads for pictures with `Charging` option enabled<br>2. Remove wire from device<br>3. Take some pictures and wait max 15 mins<br>4. Restablish connection| 3. Uploads enqueued<br>4.Uploads resumed and finished  | 
| Only wifi & only charging | 1. In Settings, enable auto uploads for pictures with `only Wifi` and `Charging` options enabled<br>2. Remove wifi connection and wire from device<br>3. Take some pictures and wait max 15 mins<br>4. Restablish connection<br>5. Plug device to change| 3. Uploads enqueued<br>4. Uploads enqueued<br>5. Uploads resumed and finished  | 
| bigfilechunking false | 1. Select upload a file to a server with the capability `bigfilechunking false` (oCIS) | File uploaded with a single PUT | 
|**Upload view lists**||||||
| Clear Uploaded | 1. Upload some files<br>2. Clear the Uplaoded list when the files have been uploaded | Uploaded list cleared | 
| Clear Enqueued | 1. Upload a bunch of files<br>2. Remove the device connection before the files are being uploaded | Files are moved to Enqueued | 
| Clear Failed | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Clear list | 2. Files are moved to Failed<br>3. List cleared | 
| Retry Failed | 1. Upload several files<br>2. Remove the device connection while the files are being uploaded<br>3. Retry | 2. Files are moved to Failed<br>3. Files are retried and moved to Current | 
| Cancel In progress | 1. Upload a big file<br>2. Remove the upload before it finishes | File is not uploaded and does not appear in the target folder |  | 
| Cancel Failed | 1. Upload several files<br>2. Remove the device connection while the files are being uploaded<br>3. Remove some of the failed with the trashbin icon<br>4. Recover device connection<br>5. Retry | 2. Files are moved to Failed<br>5. Only non-cancelled files are retried, and moved to Current<br>In the target folder, only are uploaded the non-cancelled files. |  | 
| Cancel enqueued uploads | 1. Set to auto upload 10 files with "only wifi" restriction<br>2. Remove wifi connection<br>3. Cancel 5 of them with the (x) button in the enqueued list<br>3. Recover wifi connection | Only the 5 not-cancelled uploads are finished. |  | 
| Account deleted | 1. Upload some files<br>2. Switch to another account and upload more files<br>3. Remove one of the accounts | All uploads from the removed account are removed from uploads view.<br>All uploads from the remaining account keep in the upload view |
|**Errors**||||||
| Lack of internet connection | 1. Remove connection from device<br>2. Upload a file| Upload fails<br>Failed upload in `Failed` section of uploads view with `Connection error`<br>Error in notification  | 
| Server down | 1. Switch server off<br>2. Upload a file| Upload fails<br>Failed upload in `Failed` section of uploads view with `Connection error` <br>Error in notification | 
| Maintenance mode | 1. Set server in maintenance mode<br>2. Upload a file| Upload fails<br>Failed upload in `Failed` section of uploads view with `Server unavailable`<br>Error in notification  |  | 
| Deleted Folder | 1. Create a new folder and browse to it<br>2. Upload a file to that folder as target<br>3. Before submitting the upload: in web UI or other client, delete de target folder | Upload fails<br>Error is shown in a snackbar<br>Failed upload in `Failed` section of uploads view with `Folder error`<br>Error in notification |  | 
| Lack of permissions | 1. Share a folder with the current user, without any permission<br>2. Upload a file into the shared folder | Upload fails<br>Failed upload in `Failed` section of uploads view with `Permission error`<br>Error in notification  | | [issue](https://github.com/owncloud/android/issues/2653)
| Kill app | 1. Upload a big file<br>2. Before the upload finishes, kill the app | Upload fails<br>Failed upload in `Failed` section of uploads view with `App was terminated` | | 
| Account disabled | 1. In the admin dashboard, go to Users and disable the account<br>2. Upload a file to the account | Upload fails<br>Failed upload in `Failed` section of uploads view with `Credentials error`<br>Error in notification  | |
| Account deleted | 1. Upload several files<br>2. Before the uploads finish, remove the account from admin dashboard | Uploads done after the account removal fail<br>Failed uploads in `Failed` section of uploads view with `Unknown error` |  | 
|**Retries**||||||
| Internet connection | 1. Remove connection from device<br>2. Upload a big file<br>3. Before the upload finishes, remove internet connection<br>4. Recover connection | 3. Upload fails<br>4. Upload is automatically retried | 
| Recover wifi | 1. In Settings, enable auto uploads for pictures with `only Wifi` option enabled<br>2. Remove wifi connection from device (use cellular connection)<br>3. Take a picture and wait max 15 mins<br>4. Recover wifi| 3. Upload fails<br>4. Upload is automatically retried | 
|**OTHER UPLOADS**||||||
|**Upload from Camera**||||||
| Upload root | 1. Open FAB in root folder and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|   |  |
| Upload non-root | 1. Open FAB in non-root folder and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to non-root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|   |  |
|**Upload external**||||||
| Photos app | 1. Open Photos app<br>2. Share some pictures with oC, selecting a correct account and target folder | Pictures are correctly uploaded to the selected account and folder.<br>Uploads view shows the pictures uploaded to the correct location with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.| |  |
| Text | 1. Open a browser<br>2. Select text in any web and share it with oC<br>3. Select correct location and file name | Txt file is correctly uploaded to the selected account and folder.<br>Uploads view shows the file uploaded to the correct location with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|  | |
|**Auto Uploads**||||||
| Pictures | 1. Enable auto uploads for pictures in Settings<br>2. Kill the app<br>3. With the camera app, take some pictures | Pictures are correctly uploaded to the correct location after maximum 15 mins<br>Uploads view shows the pictures uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading, and disappers after it finishes.|  |  |
| Videos | 1. Enable auto uploads for videos in Settings<br>2. Kill the app<br>3. With the camera app, take some videos | Videos are correctly uploaded to the correct location after maximum 15 mins<br>Uploads view shows the videos uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading, and disappers after it finishes.|  |  |
|**Document provider**||||||
| Copy from other provider | 1. Open `Files` and a select a different provider that oC<br>2. Select one file<br>3. Copy the file to oC | File is uploaded to oC.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|   | |
| Create new | 1. Open an app with SAF integration and create a new file (MS Office, f. ex.)<br>2. Save it in oC using Document Provider| File is uploaded to oC.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|   | |