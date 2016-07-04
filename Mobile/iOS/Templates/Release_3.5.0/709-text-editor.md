###  Text editor 

#### Pr: https://github.com/owncloud/ios/pull/709


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Text preview |  1. Open a text file file (txt, rtf, css, py, xml, js)<br>2. Change orientation  | 1. On top right corner appears the option "Edit".<br> 2. Option is correctly displayed |  |  |
| 2 | No-text preview |  Open a no-txt file (doc, xls, pdf...)  | 1. On top right corner does not appear the option "Edit". |  |  |
| 3 | Edit view |  1. Open a txt file and tap on "Edit" (iPad shows a pencil) <br>2. Change orientation  | 1. Buttons cancel and done are shown. The name of the file is shown on the title. Tab bar is not shown<br> 2. View is correctly displayed |  |  |
|**Text edition**||||||
| 4 | Edit text |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 5 | Edit without changes |  1. Open edit view<br>2. Do not edit the content<br>3. Tap on "Done" | Content is not uploaded and file view is shown with old modification date |  |  |
| 6 | Cancel edition |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Cancel" | Content is not uploaded (check in server) and file view is shown with old modification date |  |  |
| 7 | Cancel without changes |  1. Open edit view<br>2. Do not edit the content<br>3. Tap on "Cancel" | Content is not uploaded (check in server) and file view is shown with old modification date |  |  |
| 8 | Consecutive changes |  Edit a file several times | Content is uploaded (check in server) and file view is shown with old modification date. Uploads view shows all the times that the file was chamged |  |  |
|**External actions**||||||
| 9 | Deleted file |  1. Open edit view<br>2. In server, delete the file<br>3. Tap on "Done" | File is upload correctly |  |  |
| 10 | Renamed file |  1. Open edit view<br>2. In server, rename the file<br>3. Tap on "Done" | File is uplaoded with the original name. The renamed one appears as not downloaded |  |  |
| 11 | Moved file |  1. Open edit view<br>2. In server, move the file<br>3. Tap on "Done" | File is uplaoded with the original name. The moved one appears as not downloaded |  |  |
| 12 | Updated file |  1. In server, update the file<br>2. In app, tap on the file<br>3. Edit the file while it is downloaded | Can not be edited |  |  |
| 13 | Conflicts |  1. Open edit view<br>2. In server, edit the file<br>3. Tap on "Done" | Conflict is detected|  |  |
| 14 | No connection |  1. Switch the device connection off<br>2. Open edit view<br>3. Tap on "Done"<br>4. Switch the connection on | 3. File is queued until connection is restablished<br>4. File is uploaded|  |  |
| 15 | Changed credentials |  1. Open edit view<br>2. Edit the file<br>3. In server, change the credentials<br>4. Tap on "Done"<br> | Credentials are required in uploads view|  |  |
| 16 | No permission |  1. Share a txt file without edit permissions (by link or internal)<br>2. With the sharee, edit the file<br>3. Tap on "Done" | Error in uploads view. File is not updated because a lack of permissions|  |  |
|**Special servers**||||||
| 17 | Shibboleth |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 18 | Shibboleth expiration|  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" after the session expires | Error in uploads view. Credentials are requiered and after that, content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 19 | Redirect server |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |