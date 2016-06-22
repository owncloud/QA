###  Text editor 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Text preview |  1. Open a txt file<br>2. Change orientation  | 1. On top right corner appears the option "Edit".<br> 2. Option is correctly displayed |  |  |
| 2 | No-text preview |  Open a no-txt file (doc, xls, pdf...)  | 1. On top right corner does not appear the option "Edit". |  |  |
| 3 | Edit view |  1. Open a txt file and tap on "Edit" <br>2. Change orientation  | 1. Buttons cancel and done are shown. The name of the file is shown on the title. Tab bar is not shown<br> 2. View is correctly displayed |  |  |
|**Text edition**||||||
| 4 | Edit text |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 5 | Edit without changes |  1. Open edit view<br>2. Do not edit the content<br>3. Tap on "Done" | Content is not uploaded and file view is shown with old modification date |  |  |
| 6 | Cancel edition |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Cancel" | Content is not uploaded (check in server) and file view is shown with old modification date |  |  |
| 7 | Cancel without changes |  1. Open edit view<br>2. Do not edit the content<br>3. Tap on "Cancel" | Content is not uploaded (check in server) and file view is shown with old modification date |  |  |
|**External actions**||||||
| 8 | Delete file |  1. Open edit view<br>2. In server, delete the file<br>3. Tap on "Done" | File oes not appear in file view |  |  |
| 9 | Conflicts |  1. Open edit view<br>2. In server, edit the file<br>3. Tap on "Done" | Conflict is detected|  |  |
| 10 | No connection |  1. Switch the device connection off<br>2. Open edit view<br>3. Tap on "Done"<br>4. Switch the connection on | 3. File is queued until connection is restablished<br>4. File is uploaded|  |  |
| 11 | Changed credentials |  1. Open edit view<br>2. Edit the file<br>3. In server, change the credentials<br>4. Tap on "Done"<br> | Credentials are required and after that, the file is uploaded|  |  |
| 12 | No permission |  1. Share a txt file without edit permissions (by link or internal)<br>2. With the sharee, edit the file<br>3. Tap on "Done" | File is not updated because a lack of permissions|  |  |
|**Special servers**||||||
| 13 | Shibboleth |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 14 | Shibboleth expiration|  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" after the session expires | Credentiasl are requiered and after that, content is uploaded (check in server) and file view is shown with new modification date |  |  |
| 15 | Redirect server |  1. Open edit view<br>2. Edit the content<br>3. Tap on "Done" | Content is uploaded (check in server) and file view is shown with new modification date |  |  |