###  Document provider 

#### Pr: https://github.com/owncloud/android/pull/1368

Devices: Nexus9 v6, Nexus 5 v5.0.1, MotoE v4.4

Server: v9.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Non downloaded files**||||||
| 1 | txt file  |  Try to open a txt file in app with an external txt editor | File is opened  | P t6 m5 m4| TextEditor |
| 2 | pdf file  |  Try to open a pdf file in app with an external pdf reader | File is opened  | P t6 m5 m4| Adobe Acrobat Reader |
| 3 | doc file  |  Try to open a doc file in app with an external doc editor | File is opened  | P t6 m5 m4| Microsoft Word. OpenOffice |
| 4 | xls file  |  Try to open a xls file in app with an external xls editor | File is opened  | P t6 m5 m4| Microsoft Excel. OpenOffice |
| 5 | ppt file  |  Try to open a xls file in app with an external xls editor | File is opened  | P t6 m5 m4| Microsoft Excel. OpenOffice |
| 6 | image file  |  Try to open a image in app with an external image reader | File is opened  | P t6 m5 m4| Photo Editor |
| 7 | video file  |  Try to open a video file in app with an external video player | File is opened  | P t6 m5 m4| BSPlayerFree. VideoPlayer for Android |
| 8 | audio file  |  Try to open a audio file in app with an external media player | File is opened  | P t6 m5 m4| BSPlayerFree. VideoPlayer for Android |
|**Downloaded files**||||||
| 9 | txt file  |  Try to open a txt file in app with an external txt editor | File is opened  | P t6 m5 m4| TextEditor |
| 10 | pdf file  |  Try to open a pdf file in app with an external pdf reader | File is opened  | P t6 m5 m4| Adobe Acrobat Reader |
| 11 | doc file  |  Try to open a doc file in app with an external doc editor | File is opened  | P t6 m5 m4| Microsoft Word. OpenOffice |
| 12 | ppt file  |  Try to open a doc file in app with an external doc editor | File is opened  | P t6 m5 m4| Microsoft Word. OpenOffice |
| 13 | xls file  |  Try to open a xls file in app with an external xls editor | File is opened  | P t6 m5 m4| Microsoft Excel. OpenOffice. |
| 14 | image file  |  Try to open a image in app with an external image reader | File is opened  | P t6 m5 m4| Photo Editor |
| 15 | video file  |  Try to open a video file in app with an external video player | File is opened  | P t6 m5 m4 | BSPlayerFree. VideoPlayer for Android |
| 16 | audio file  |  Try to open a audio file in app with an external media player | File is opened  | P t6 m5 m4 | BSPlayerFree. VideoPlayer for Android |
|**Multiaccount**||||||
| 17 | Multiaccount  |  Try to open some files in app with an external app, havinf several accounts on app | Account and file can be chosen  | P t6 m5 m4| All available accounts are shown |