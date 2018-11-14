#### Open In 

#### PRs: https://github.com/owncloud/ios-app/pull/146

Devices: <br>
Server: 

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait | 3-dot-button in file list in portrait | Correct view of the menu in portrait | | | |
| Landscape | 3-dot-button in file list in landscape | Correct view of the menu in portrait | | | |
|**Actions**||||||
| Upload photo in root | Select "Upload from photo library"<br>Select one pic| File is uploaded in root folder| | |
| Upload photo in non-root | Select "Upload from photo library" in a non-root folder<br>Select one pic| File is uploaded in non-root folder| | |
| Upload non-downloaded file in root | Select "Upload file"<br>Select one file| File is uploaded in root folder| | |
| Upload non-downloaded file in non-root | Select "Upload file" in a non-root folder<br>Select one file| File is uploaded in non-root folder| | |
| Upload downloaded file in root | Select "Upload file"<br>Select one file| File is uploaded in root folder| | |
| Upload downloaded file in non-root | Select "Upload file" in a non-root folder<br>Select one file| File is uploaded in non-root folder| | |
| Upload a very big file | Select "Upload file" in a non-root folder<br>Select one very big file| File is uploaded | | |
|**Issues**||||||
| No connection | Remove connection from device<br>Select "Upload Photo" | Not posible, lack of connection | | |
| Server not reached | Select "Upload Photo"<br>Switch server off before it finishes| Downloaded cancelled after timeout | | |
| Connection lost | Select "Upload"<br>Remove connection from device before it finishes| Upload cancelled | | |
| Folder removed | Select "Upload" within a folder<br>Remove the folder from web UI before confirming| Can not upload the file | | |
