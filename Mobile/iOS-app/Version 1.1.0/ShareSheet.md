###  Share Sheet

#### Pr: https://github.com/owncloud/ios-app/pull/445

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Apps to share**|||||
| Safari | Share content from Safari | ownCloud option is there | P m12 t12 |  |  |
| Photos | Share content from Photos | ownCloud option is there | F m12 t12 | ownCloud not there  | Next iteration |
| Pages | Share content from Pages | ownCloud option is there | P m12 t12 |  |  |
| Files App | Share content from Files App | ownCloud option is there | P m12 t12 |  |  |
|**One account**|||||
| View | Open the share sheet from an external app | Correct view in both orientations | P m12 |  |  |
| Root | Save an external file in the root | File correctly saved | P m12 |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m12 |  |  |
| Create folder root | Save an external file in a folder created on root folder | File correctly saved | P m12 |  |  |
| Create folder non-root | Save an external file in a folder created on non-root folder | File correctly saved | P m12 |  |  |
| Several files | Save several external files in oC | Files correctly saved | F m12 t12 | Next iteration |  |
|**Several accounts**|||||
| View | Open the share sheet from an external app | Correct view in both orientations (all accounts are there)  | P m12 |  |  |
| Root | Save an external file in the root folder | File correctly saved | P m12 |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m12 |  |  |
| Create folder root | Save an external file in a folder created on root folder | File correctly saved | P m12 |  |  |
| Create folder non-root | Save an external file in a folder created on non-root folder | File correctly saved | P m12 |  |  |
| Share with passcode/Face id | Save an external file in a folder created on non-root folder, with security enabled in the app | First, passcode/face id is asked, then share sheet appears. File correctly saved | P m12 |  |  |
| Several files | Save several external files in oC selecting one account | Files correctly saved | F m12 t12 | Next iteration |  |
|**File extensions**|||||
| pdf | Share a pdf with an oC account | Files correctly saved | P m12 |  |  |
| txt | Share a txt with an oC account | Files correctly saved | P m12 |  |  |
| doc | Share a doc with an oC account | Files correctly saved |  |  |  |
| pages | Share a pages with an oC account. This is bundled file, important to check | Files correctly saved | P m12 |  |  |
| xls | Share a xls with an oC account | Files correctly saved | F m12 |  |  |
| zip | Share a zip with an oC account | Files correctly saved |  |  |  |
| image | Share a image with an oC account | Files correctly saved | P m12 |  |  |
| video | Share a video with an oC account | Files correctly saved | F m12 | Open the app, not the share sheet  |  |
| non-openable | Share a file with no extension or not openable with an oC account | Files correctly saved | F m12 | xls not opened |  |
|**Error handling**|||||
| Non existent target folder | Remove/Move the target folder before submitting | Correct error | P m12 |  |
| Renamed target folder | Rename the target folder before submitting | Correct error | P m12 |  |  |
| Conflicting name folder | Create a folder in the picker with an existing name | Correct error   | P m12 |  |
| No network connection | Share a file with no internet connection | Queued | P m12 |  |  |
| No server connection | Share a file with a server in maintenance mode | Queued | P m12 |  |  |