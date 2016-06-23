###  Text editor 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Text preview |  1. Open a text file file (txt, rtf, css, py, xml, js)<br>2. Change orientation  | 1. On top right corner appears the option "Edit".<br> 2. Option is correctly displayed |  |  |
| 2 | No-text preview |  Open a no-txt file (doc, xls, pdf...)  | 1. On top right corner does not appear the option "Edit". |  |  |
| 3 | Edit view |  1. Open a txt file and tap on "Edit" <br>2. Change orientation  | 1. Buttons cancel and done are shown. The name of the file is shown on the title. Tab bar is not shown<br> 2. View is correctly displayed |  |  |
|**Text edition**||||||
| 4 | Edit text |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 5 | Edit without changes |  1. Open edit view<br>2. Do not edit the content<br>3. Tap on "Done" | Content is not uploaded and file view is shown with old modification date |  |  |
| 6 | Cancel edition |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Cancel" | Content is not uploaded (check in server) and file view is shown with old modification date |  |  |
| 7 | Cancel without changes |  1. Open edit view<br>2. Do not edit the content<br>3. Tap on "Cancel" | Content is not uploaded (check in server) and file view is shown with old modification date |  |  |
| 8 | Consecutive changes |  Edit a file several times | Content is uploaded (check in server) and file view is shown with old modification date. Uploads view shows all the times that the file was chamged |  |  |
|**External actions**||||||
| 9 | Deleted file |  1. Open edit view<br>2. In server, delete the file<br>3. Tap on "Done" | File does not appear in file view |  |  |
| 10 | Renamed file |  1. Open edit view<br>2. In server, rename the file<br>3. Tap on "Done" | File is uplaoded and is shown with the new name |  |  |
| 11 | Moved file |  1. Open edit view<br>2. In server, move the file<br>3. Tap on "Done" | File is uplaoded and is shown in the new location |  |  |
| 12 | Conflicts |  1. Open edit view<br>2. In server, edit the file<br>3. Tap on "Done" | Conflict is detected|  |  |
| 13 | No connection |  1. Switch the device connection off<br>2. Open edit view<br>3. Tap on "Done"<br>4. Switch the connection on | 3. File is queued until connection is restablished<br>4. File is uploaded|  |  |
| 14 | Changed credentials |  1. Open edit view<br>2. Edit the file<br>3. In server, change the credentials<br>4. Tap on "Done"<br> | Credentials are required and after that, the file is uploaded|  |  |
| 15 | No permission |  1. Share a txt file without edit permissions (by link or internal)<br>2. With the sharee, edit the file<br>3. Tap on "Done" | File is not updated because a lack of permissions|  |  |
|**Special servers**||||||
| 16 | Shibboleth |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 17 | Shibboleth expiration|  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" after the session expires | Credentiasl are requiered and after that, content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 18 | Redirect server |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |