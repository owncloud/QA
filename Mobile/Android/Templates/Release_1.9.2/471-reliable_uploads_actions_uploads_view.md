### Uploads view

#### Pr: https://github.com/owncloud/android/pull/xxx

Devices:

Server version:

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:---------------|:-------------|-------------:|:----------:
|**Views**|||||
|1| New option in menu | 1. Swipe to display the main menu <br> 2. Change orientation of device | 1. An new option "Uploads" is displayed in the menu<br> 2. The view is correct in both orientations|||
|2| Empty upload menu |  1. Swipe to display the main menu after installing the app<br> 2. Tap on Uploads <br>| A message about "any uploads were performed yet" must be displayed. Changing orientation the message is correctly displayed. 
|3| Upload menu |  1. Swipe to display the main menu after performing a upload<br> 2. Tap on Uploads <br> 3. Change orientation of device| 2. Three sections are displayed: current , failed and uploaded. Also there are two options to clear: all and failed.<br> 3. The view is correct in both orientations|||
|**Uploads**||||
|4| Upload a file (copy)| 1. Tap to upload a file<br> 2. Select a file to upload choosing "copy"| 2. The file appears on menu "Current" while is uploaded and in "Uploaded" when the upload is finished (change orientation). File is correctly copied (remains in origin)
|5| Upload a file (move)| 1. Tap to upload a file<br> 2. Select a file to upload choosing "move" | 2. The file appears on menu "Current" while is uploaded and in "Uploaded" when the upload is finished (change orientation). File is correctly moved (deleted in origin)
|6| Upload info| 1. From the last two test cases, swipe to display the main menu<br> 2. Tap on Uploads <br>| 2. This info is displayed about the uploading: file name, destination path including the account name, size and relative date
|7| Progress bar| 1. Tap to upload a file<br> | The progress bar is correctly displayed and removed when the upload finishes
|8| Upload several files| 1. Tap in upload files<br>2. Select several files to upload, some of them with special characters and in different folders and in different levels | 2. All files appear on menu "Current" while are uploaded and in "Uploaded" when the upload are finished (changing orientation). Files are correctly uploaded
|9| Upload more than 30 files| 1. Tap in upload files<br> 2. Select more than 30 files to upload| 2. Only the last 30 appear on menu "Uploaded" when the upload are finished, sorted by time, the latest the first. All the progress bars are correctly handled (plot and removed)
|10| Cancel one upload| 1. Tap to upload a file<br> 2. Select a large file to upload <br> 3. Cancel the upload before finishing by tapping on the X button | 2. A (X) button on the right is diplayed during the uploading and the progress bar is displayed<br> 3. The upload is cancelled, the progress bar is removed, and the file is not uploaded
|11| Cancel several uploads| 1. Tap to upload files<br> 2. Select several files to upload <br> 3. Cancel the upload of some files before finishing| 2. A (X) button on right is diplayed during the uploading and the progress bar is displayed<br> 3. The cancelled files are not uploaded, the progress bar is removed, but the not cancelled are completely uploaded
|**Clear Uploads**||||
|12| Clear all| 1. Tap in upload files <br> 2. Select several files to upload<br> 3. Switch the device connection off<br> 4. Select files to upload<br> 5. Tap on "clear all"| 2. The files are correctly uploaded and shown in "Uploaded" section<br> 3. The files are not uploaded and shown in "Failed Uploaded" section<br> 4. Both lists are cleared
|13| Clear failed| 1. Repeat the four first steps of the last test case<br> 2. Tap on "clear failed"| The "Failed Uploads" list is cleared, but not the "Uploaded" list
|14| Clear cleared| 1. The view of uploads is cleared<br> 2. Tap on "clear failed" and "clear all"| Nothing happens
|**Failed Uploads**||||
|15| No internet connection| 1. Switch the device wifi connection off <br>2. Tap to upload a file<br> 3. Select a file (special characters) to upload<br> 4. Switch the wifi connection on and tap on retry | 3. The file appears on menu "Failed Uploads" with a retry button, a notification "Connection Error" is displayed.<br> 4. The file is uploaded and shown in "Uploaded" section
|16| No server connection| 1. Switch the server off <br>2. Tap to upload a file<br> 3. Select a file (special characters) to upload<br> 4. Switch server on and tap on retry | 3. The file appears on menu "Failed Uploads" with a retry button, a notification "Connection Error" is displayed.<br> 4. The file is uploaded and shown in "Uploaded" section
|17| Credential error | 1. Login with a user in oC<br>2. On server, change the password of the user<br> 3. Tap in upload and select a file<br> 4. Input the correct credentials<br> 5. Tap on failed upload| 3. The file appears on menu "Failed Uploads" with a retry button, the user is asked for the credentials<br> 5. The file is uploaded and shown in "Uploaded" section
|18| Folder error | 1. Tap in upload and select a file, selecting a location folder<br> 2. On server, delete this folder<br> 3. Tap on the file| The file appears on menu "Failed Uploads" with the error reason
|19| Conflict error | 1. Tap in upload and select a file <br> 2. Upload the same file again, in the same folder| 1. The file is uploaded<br> 2. The file appears on menu "Failed Uploads" with the error reason
|20| File error | 1. Tap to upload a file and not select it<br> 2. On server, delete the file<br> 3. Tap on the file| The file appears on menu "Failed Uploads" with the error reason
|21| Privileges error | 1. On server, share a folder with an user without permissions to edit<br> 2. Login with the sharee<br> 3. Upload a file into the shared folder| The file appears on menu "Failed Uploads" with the error reason
|22| Deleted account| 1. Tap to upload files<br> 2. Select several files to upload <br> 3. During the uploading, the account is removed from server<br> 4. Open the app in the uploads view with another user| The uploadings are cancelled (no file uploaded) and are shown in "Failed Uploads" section
|23| Closed app| 1. Tap to upload files<br> 2. Select several files to upload <br> 3. During the uploading, the app is closed<br> 4. Open the app in the uploads view| The uploadings are cancelled (no file uploaded) and are shown in "Failed Uploads" section
|**Multiaccount**||||
|24| Upload files| 1. Login in two accouts<br> 2. Select files to upload in both accounts | The files are correctly uploaded in each account and shown in the same list of uploads view
|**Instant Uploads**||||
|25| Upload a pic (copy)| 1. Enable "Instant picture upload" in settings menu<br> 2. Select "copy" as behaviour<br> 3. Take a pic| The file appears in upload view in "Current" and when it finishes, in "Uploaded". Pic is correctly copied (remains in origin)
|26| Upload a pic (move)| 1. Enable "Instant picture upload" in settings menu<br> 2. Select "move" as behaviour<br> 3. Take a pic| The file appears in upload view in "Current" and when it finishes, in "Uploaded". Pic is correctly moved (deleted in origin)
|27| Upload a video (copy)| 1. Enable "Instant video upload" in settings menu<br> 2. Select "copy" as behaviour<br> 3. Take a video| The file appears in upload view in "Current" and when it finishes, in "Uploaded". Video is correctly copied (remains in origin)
|28| Upload a video (move)| 1. Enable "Instant video upload" in settings menu<br> 2. Select "move" as behaviour<br> 3. Take a video| The file appears in upload view in "Current" and when it finishes, in "Uploaded". Video is correctly moved (deleted in origin)
|29| Upload folder| 1. Enable "Instant pic upload" in settings menu withou changing the upload folder<br> 2. Take some photos<br>| The pics are uploaded to default folder spite it was not created before.
|**Several Actions**||||
|30| Upload + Share| 1. Tap to upload a file<br> 2. Select File1 to upload<br>3. While it is being uploaded, share a File2 with users/groups | File1 appears in "Uploaded" when the upload is finished. File2 is accesible for the sharees
|31| Upload + Move| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, move a File2 to another location | File1 appears in "Uploaded" when the upload is finished. File2 is correctly moved to its new location (removed in origin)
|32| Upload + Copy| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, copy a File2 | File1 appears in "Uploaded" when the upload is finished. File2 is correctly copied (remains in origin).
|33| Upload + Delete| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, delete a File2 | File1 appears in "Uploaded" when the upload is finished. File2 is correctly removed.
|34| Upload + Rename| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, rename a File2 | File1 appears in "Uploaded" when the upload is finished. File2 is correctly renamed.
|35| Upload + Send| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, send a File2 to another app| File1 appears in "Uploaded" when the upload is finished. File2 is sent correctly.
|36| Upload + Favourite| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, set a File2 as favourite| File1 appears in "Uploaded" when the upload is finished. File2 is now favourite.
|37| Upload + Favourite update| 1. Set a text file as favourite<br> 2. Modify the text file by opening it with an external app<br>3. Save the changes| The file appears in "Uploaded" when the upload is finished.
|38| Upload + Sync| 1. In server, add files to a Folder1<br>2. In device, tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, long press in Folder1 and select "Synchronize"| File1 appears in "Uploaded" when the upload is finished. Folder2 is sync with server.
|39| Upload + Download| 1. Tap to upload a file<br> 2. Select a File1 to upload<br>3. While it is being uploaded, download a File2 | File1 appears in "Uploaded" when the upload is finished. File2 is correctly downloaded.
|40| Several Upload + Several Download| 1. Tap to upload a file<br> 2. Select several files to upload<br>3. While it is being uploaded, download several files | Uploaded and downloaded files are correctly managed.
|**Shibboleth**||||
|41| Upload | 1. Login in a Shibboleth server<br> 2. Upload a file (copy/move)<br> | File is correctly uploaded
|42| Upload several| 1. Login in a Shibboleth server<br> 2. Upload several file (copy/move) with special characeters<br> | Files are correctly uploaded 
|43| Upload + Expiration| 1. Login in a Shibboleth server<br> 2. Upload a large file (copy/move) in a moment close to the expiration time<br> 3. Session expires<br> 4. Retry the upload| 3. Credentials are requested<br> 4. File is uploaded
|44| Upload + Expirated| 1. Login in a Shibboleth server<br> 2. Upload a large file (copy/move) once the session is expired<br> 3. Login | 2. Credentials are requested<br> 3. File is not uploaded
|**Other Servers**||||
|45| Redirect | 1. Login in a redirect server<br> 2. Upload a file <br> | File is correctly uploaded
|46| Self Signed| 1. Login in a self signed server<br> 2. Upload a file <br> | File is correctly uploaded
|47| No Self Signed| 1. Login in a no self signed server<br> 2. Upload a file <br> | File is correctly uploaded