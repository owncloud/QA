###  Branding text color status bar 

#### Pr: https://github.com/owncloud/ios/pull/659 

Devices: iPhone6 v9.3.2, iPad Air v8.4

Server: v9.0.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Login View**||||||
| 1 | Color = White   |  Open the app - Login view | Text color white | P m9 t8 |  |
| 2 | Color = Black   |  Open the app - Login view | Text color black | P m9 t8 |  |
|**No Login View Colour = White**||||||
| 3 | Settings view   |  Open the settings view | Text color white | P m9 t8|  |
| 4 | Files view   |  Open the files view | Text color white | P m9 t8|  |
| 5 | Shared links view   |  Open the shared links view | Text color white | P m9 t8|  |
| 6 | Preview view   |  Open the preview view | Text color white | P m9 t8|  |
| 7 | Share view   |  Open the share view | Text color white | P m9 |  |
| 8 | Upload view   |  Open the uploads view | Text color white | P m9 |  |
| 9 | Uploader view   |  Open the uploader view from an external app | Text color white | F m9 | Appears in black (won't fix FTM) |
| 10 | Uploading file   |  1. Edit a txt file from server side<br>2. In app, pull down and tap on the file to upgrade it | Text color white | P m9 F t8 | SOLVED: In iPad, upload text does not appear. The text remains if the updating takes less than 1sec|
|**No Login View Colour = Black**||||||
| 11 | Settings view   |  Open the settings view | Text color black | P m9 t8 |  |
| 12 | Files view   |  Open the files view | Text color black | P m9 t8|  |
| 13 | Shared links view   |  Open the shared links view | Text color black | P m9 t8|  |
| 14 | Preview view   |  Open the preview view | Text color black | P m9 t8|  |
| 15 | Share view   |  Open the share view | Text color black | P m9 |  |
| 16 | Upload view   |  Open the upload view | Text color black | P m9 |  |
| 17 | Uploader view   |  Open the uploader view from an external app | Text color black | P m9 |  |
| 18 | Uploading file   |  1. Edit a txt file from server side<br>2. In app, pull down and tap on the file to upgrade it | Text color black | P m9 F t8| SOLVED: In iPad, upload text does not appear. The text remains if the updating takes less than 1sec |

