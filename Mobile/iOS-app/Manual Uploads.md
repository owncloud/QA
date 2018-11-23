#### Manual uploads

#### PRs: https://github.com/owncloud/ios-app/pull/146

Devices: iPhoneX v12<br>
Server: 10.0.10

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait | 3-dot-button in file list in portrait | Correct view of the menu in portrait | P m12 t12 | | |
| Landscape | 3-dot-button in file list in landscape | Correct view of the menu in portrait | P m12 t12| | |
|**Permission**||||||
| Accept | Install app from scratch and try to upload. Accept permission asked by system to access camera roll | List of albums opened | P m12 | | |
| Decline | Install app from scratch and try to upload. Decline permission asked by system to access camera roll | List of albums not opened | P m12 | | |
|**Actions photo library**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder | P m12 | HEIC does not show thumbnail|
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder| P m12 | HEIC does not show thumbnail|
| Upload video in root | Select "Upload from photo library"<br>Select one video| File is uploaded in root folder | P m12 | |
| Upload video in non-root | Select "Upload from photo library" in a non-root folder<br>Select one video| File is uploaded in non-root folder| P m12 | |
|**Actions files app (one file)**||||||
| Upload non-downloaded file in root | Select "Upload file"<br>Select one file| File is uploaded in root folder| P m12 | |
| Upload non-downloaded file in non-root | Select "Upload file" in a non-root folder<br>Select one file| File is uploaded in non-root folder| F m12 | pages makes crashes|
| Upload downloaded file in root | Select "Upload file"<br>Select one file| File is uploaded in root folder| P m12 | |
| Upload downloaded file in non-root | Select "Upload file" in a non-root folder<br>Select one file| File is uploaded in non-root folder| P m12 | |
| Upload a very big file | Select "Upload file" in a non-root folder<br>Select one very big file| File is uploaded | F m12 | |
|**Actions multiselection files**||||||
| Upload three files | Select "Upload file" in a non-root folder<br>Select three files| Files are uploaded in non-root folder| P m12 | |
| Upload a huge amount of files | Select "Upload file"<br>Select all files | Files are uploaded in non-root folder| | |
| Cancel upload| Select "Upload file"<br>Select several files<br>Cancel the upload |  Uploadcancelled| | |
|**Issues**||||||
| No connection | Remove connection from device<br>Select "Upload Photo" | Not posible, lack of connection | | |
| Server not reached | Select "Upload Photo"<br>Switch server off before it finishes| Downloaded cancelled after timeout | | |
| Connection lost | Select "Upload"<br>Remove connection from device before it finishes| Upload cancelled | | |
| Folder removed | Select "Upload" within a folder<br>Remove the folder from web UI before confirming| Can not upload the file | | |
