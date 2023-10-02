#### Upload (Spaces)

#### PRs: 

Devices: Samsung A51, Android 12  <br>
Server: 10.11


---

To execute only in custom spaces

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Manual Upload**||||||
| Upload one root | 1. Open FAB in root folder and select `Files`<br>2. Select one file from any provider | File is uploaded to root.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
| Upload one non-root | 1. Open FAB in non-root folder and select `Files`<br>2. Select one file from any provider | File is uploaded to non-root.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
| Upload a very big file | 1. Open FAB and select `Files`<br>2. Select one file from any provider which size is bigger than 500MB | File is uploaded.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section| P m12 | Slow...|
| Upload 10 Files | 1. Open FAB and select `Files`<br>2. Select 10 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of 10 files uploaded to the correct place with correct sizes in the `Uploaded` section | P m12 | |
| Upload 40 files | 1. Open FAB and select `Files`<br>2. Select 40 files from any provider. | Files are uploaded to the correct location.<br>Uploads view shows the list of files uploaded to the correct place with correct sizes in the `Uploaded` section | P m12 | | |
| Cancel uploads | 1. Set to upload 10 files<br>2. Cancel 5 of them before finishing in the uploads view with the (x) button | Only the 5 not-cancelled uploads are finished. | F m12 | https://github.com/owncloud/android/issues/3814
|**Upload from Camera**||||||
| Upload root personal | 1. Open FAB in root folder of personal space and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
| Upload non-root personal | 1. Open FAB in non-root folder of personal space and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to non-root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
| Upload root no-personal | 1. Open FAB in root folder of custom space and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
| Upload non-root no-personal | 1. Open FAB in non-root of custom space folder and select `Picture from Camera`<br>2. Take one picture| Picture is uploaded to non-root.<br>Uploads view shows the picture uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
|**Upload external (only personal)**||||||
| Photos app | 1. Open Photos app<br>2. Share some pictures with oC, selecting a correct account, space and target folder | Pictures are correctly uploaded to the selected account, space and folder.<br>Uploads view shows the pictures uploaded to the correct location with correct size in the `Uploaded` section| P m12  |  |
| Text | 1. Open a browser<br>2. Select text in any web and share it with oC<br>3. Select correct account, space, folder and file name | Txt file is correctly uploaded to the selected account, space and folder.<br>Uploads view shows the file uploaded to the correct location with correct size in the `Uploaded` section|  P m12 |  |
|**Auto Uploads (only personal)**||||||
| Pictures | 1. Enable auto uploads for pictures in Settings<br>2. Kill the app<br>3. With the camera app, take some pictures | Pictures are correctly uploaded to the correct location after maximum 15 mins<br>Uploads view shows the pictures uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading, and disappers after it finishes.|  P m12 |  |
| Videos | 1. Enable auto uploads for videos in Settings<br>2. Kill the app<br>3. With the camera app, take some videos | Videos are correctly uploaded to the correct location after maximum 15 mins<br>Uploads view shows the videos uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading, and disappers after it finishes.|  P m12 |  |
|**Document provider**||||||
| Copy from other provider | 1. Open `Files` and a select a different provider that oC<br>2. Select one file<br>3. Copy the file to oC | File is uploaded to oC.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.|  NA |  |
| Create new | 1. Open an app with SAF integration and create a new file (MS Office, f. ex.)<br>2. Save it in oC using Document Provider| File is uploaded to oC.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.| NA  |  |
|**Conflicts**||||||
| Keep local | 1. Modify a txt file local and remotelly at the time<br>2. Select `local` to fix the conflict | File is uploaded to oC and local version replaces remote version.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.| P m12   |  |
| Keep both | 1. Modify a txt file local and remotelly at the time<br>2. Select `both` to fix the conflict | Local file is uploaded to oC and local version replaces remote version.<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section.<br>Notification appears while uploading and disappers after it finishes.| P m12   |  |
|**Open with**||||||
| Open with | 1. Select a file and `Open with` option<br>2. Open file with any editor installed in device<br>3. Save changes<br>4. In oC app, browse to containing folder | File is uploaded to oC<br>Uploads view shows the file uploaded to the correct place with correct size in the `Uploaded` section| P m12  |  |
|**Upload view lists**||||||
| Clear Uploaded | 1. Upload some files<br>2. Clear the Uplaoded list when the files have been uploaded | Uploaded list cleared | P m12
| Clear Failed | 1. Upload a bunch of files<br>2. Remove the device connection while the files are being uploaded<br>3. Clear list | 2. Files are moved to Failed<br>3. List cleared | P m12
| Retry Failed | 1. Upload several files<br>2. Remove the device connection while the files are being uploaded<br>3. Retry | 2. Files are moved to Failed<br>3. Files are retried and moved to Current | P m12
| Cancel Failed | 1. Upload several files<br>2. Remove the device connection while the files are being uploaded<br>3. Remove some of the failed with the trashbin icon<br>4. Recover device connection<br>5. Retry | 2. Files are moved to Failed<br>5. Only non-cancelled files are retried, and moved to Current<br>In the target folder, only are uploaded the non-cancelled files. | P m12
| Account deleted | 1. Upload some files<br>2. Switch to another account and upload more files<br>3. Remove one of the accounts | All uploads from the removed account are removed from uploads view.<br>All uploads from the remaining account keep in the upload view | P m12
|**Errors**||||||
| Lack of internet connection | 1. Remove connection from device<br>2. Upload a file| Upload enqueued<br>Correct account and location in `Uploads`view<br>Error in notification  | P m12
| Connection lost | 1. Upload a big file<br>2. Remove connection from device | Upload enqueued<br>Error in notification  | F m12 | Unknown error
| Server down | 1. Switch server off<br>2. Upload a file| Upload fails<br>Failed upload in `Failed` section of uploads view with `Connection error` <br>Error in notification | F m12 | Unknown error
| Maintenance mode | 1. Set server in maintenance mode<br>2. Upload a file| Upload fails<br>Failed upload in `Failed` section of uploads view with `Server unavailable`<br>Error in notification  | NA (oCIS)<br>P m12 (oC10) | 
| Deleted Folder | 1. Create a new folder and browse to it<br>2. Upload a file to that folder as target<br>3. Before submitting the upload: in web UI or other client, delete de target folder | Failed upload in `Failed` section of uploads view with `Folder error`<br>Error in notification | F m12| Unknown error in uploads view, malformed server config in notification
| Disabled Space (manual) | 1. Enter in a space and select some files to upload manually without submitting<br>2. In web, disable space<br>3. Submit the upload in the app | Error message<br>Failed upload in `Failed` section of uploads view with `Folder error`<br>Error in notification | F m12 | Conflict in uploads view, error im destination folder in notification
| Lack of permissions | 1. Share a folder with the current user, without any permission<br>2. Upload a file into the shared folder | Upload fails<br>Failed upload in `Failed` section of uploads view with `Permission error`<br>Error in notification  | F m12 (known)| [issue](https://github.com/owncloud/android/issues/3823)
| Account disabled | 1. In the admin dashboard, go to Users and disable the account<br>2. Upload a file to the account | Upload fails<br>Failed upload in `Failed` section of uploads view with `Credentials error`<br>Error in notification  | F m12 | Sometimes credentials errors, Sometimes unknown error
| Out of quota | 1. Upload several files that exceed the space quota| Failed uploads in `Failed` section of uploads view with `Insufficient quota` | F m12 | Non-accurate error
|**Automatic Retries**||||||
| Internet connection | 1. Upload a big file<br>2. Before the upload finishes, remove internet connection<br>3. Recover connection | 2. Upload fails<br>3. Upload is automatically retried | P m12  
| Recover wifi | 1. In Settings, enable auto uploads for pictures with `only Wifi` option enabled<br>2. Remove wifi connection from device (use cellular connection)<br>3. Take a picture and wait max 15 mins<br>4. Recover wifi| 3. Upload enqueued<br>4. Upload is automatically retried |  P m13
