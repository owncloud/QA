### Uploads responsiveness

#### Pr: https://github.com/owncloud/ios-app/pull/504

Devices: iPhoneX v13.2 <br>
Server: 10.3

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Instant uploads**|||||
| Root folder images | Select the root folder<br>Take two pics | Both pics are uploaded to the root folder | P m13 |  |  |
| Non-Root folder images | Select a non-root folder<br>Take two pics | Both pics are uploaded to the folder | P m13 |  |  |
| Root folder videos | Select the root folder<br>Take two videos | Both videos are uploaded to the root folder | P m13 |  |  |
| Non-Root folder videos| Select a non-root folder<br>Take two videos | Both videos are uploaded to the folder | P m13 |  |  |
| Take many | Take more than 100 pics and folders | Everything correctly uploaded |  |  |  |
| App closed | With instant uplaods enabled and app closed, take videos and pics | Detected when the app comes to foreground (check status tab) | P m13 |  |   |
| Large video | With instant uplaods enabled, take a long video<br>Once it is detected, minimize the app | Video is uploaded in background | P m13  |  |  |
| Large video and many pics | With instant uplaods enabled, take a long video and then, many pictures<br>Once it is detected, minimize the app | Everything is uploaded in background | P m13 |  |  |
|**Files app**||||||
| Upload non-downloaded file in root | Select "Upload file"<br>Select one file| File is uploaded in root folder| P t13  | |
| Upload non-downloaded file in non-root | Select "Upload file" in a non-root folder<br>Select one file| File is uploaded in non-root folder| P t13 | |
| Upload downloaded file in root | Select "Upload file"<br>Select one file| File is uploaded in root folder| P t13  | |
| Upload downloaded file in non-root | Select "Upload file" in a non-root folder<br>Select one file| File is uploaded in non-root folder| P t13 | |
| Upload a very big file | Select "Upload file" in a non-root folder<br>Select one very big file| File is uploaded | P m13 | |
| Upload three files | Select "Upload file" in a non-root folder<br>Select three files| Files are uploaded in non-root folder| P t13 | |
| Upload a huge amount of files | Select "Upload file"<br>Select all files | Files are uploaded in non-root folder|  |  |
|**Photo library**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P t13  | HEIC does not show thumbnail|
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder|  P t13 | HEIC does not show thumbnail|
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder |  P t13 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P t13  | |
| Upload Multiple | Select "Upload from photo library"r<br>Select more than 100 items | Files are uploaded correctly y the selected target| F m13  | Stucked |
|**Issues**||||||
| No connection | Remove connection from device<br>Select "Upload Photo" | Not posible, lack of connection | |   |
| Server not reached | Select "Upload Photo"<br>Switch server off before it finishes| Downloaded cancelled after timeout |   | |
| Connection lost | Select "Upload"<br>Remove connection from device before it finishes| Upload cancelled |   |  |
| Folder removed | Select "Upload" within a folder<br>Remove the folder from web UI before confirming| Can not upload the file |  | |
