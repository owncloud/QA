###  Branding text color status bar 

#### Pr: https://github.com/owncloud/ios/pull/659 

Devices: 

Server: 

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Login View**||||||
| 1 | Color = White   |  Open the app - Login view | Text color white |  |  |
| 2 | Color = Black   |  Open the app - Login view | Text color black |  |  |
|**No Login View Colour = White**||||||
| 3 | Settings view   |  Open the settings view | Text color white |  |  |
| 4 | Files view   |  Open the files view | Text color white |  |  |
| 5 | Shared links view   |  Open the shared links view | Text color white |  |  |
| 6 | Preview view   |  Open the preview view | Text color white |  |  |
| 7 | Share view   |  Open the share view | Text color white |  |  |
| 8 | Upload view   |  Open the uploads view | Text color white |  |  |
| 9 | Uploader view   |  Open the uploader view from an external app | Text color white |  | Appears in black |
| 10 | Uploading file   |  1. Edit a txt file from server side<br>2. In app, pull down and tap on the file to upgrade it | Text color white |  | In iPad, upload text does not appear|
|**No Login View Colour = Black**||||||
| 11 | Settings view   |  Open the settings view | Text color black |  |  |
| 12 | Files view   |  Open the files view | Text color black |  |  |
| 13 | Shared links view   |  Open the shared links view | Text color black |  |  |
| 14 | Preview view   |  Open the preview view | Text color black | |  |
| 15 | Share view   |  Open the share view | Text color black | P m9 |  |
| 16 | Upload view   |  Open the upload view | Text color black | P m9 |  |
| 17 | Uploader view   |  Open the uploader view from an external app | Text color black | P m9 |  |
| 18 | Uploading file   |  1. Edit a txt file from server side<br>2. In app, pull down and tap on the file to upgrade it | Text color black | P m9 F t8| In iPad, upload text does not appear |