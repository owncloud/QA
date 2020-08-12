###  Share Sheet II

#### PR: https://github.com/owncloud/ios-app/pull/650

Devices: iPhoneXR v13.4, iPadAir v13<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Apps to share**|||||
| Safari | Share content from Safari | ownCloud option is there |  P m13 t13 |  |  |
| Photos | Share content from Photos | ownCloud option is there | P m13 t13 |   |
| Pages | Share content from Pages | ownCloud option is there | P m13 t13 |  |  |
| Files App | Share content from Files App | ownCloud option is there |  P m13 t13 |  |  |
|**One account**|||||
| View | Open the share sheet from an external app | Correct view in both orientations | P m13 t13 |  |  |
| Root | Save an external file in the root | File correctly saved |  P m13 t13 |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m13 t13  |  |  |
| Create folder root | Save an external file in a folder created on root folder | File correctly saved | P m13 t13  |  |  |
| Create folder non-root | Save an external file in a folder created on non-root folder | File correctly saved | P m13 t13 |  |  |
| Share text | In Safari, open a web page and select text<br>Share it with oC | Text saved in a text file | P m13 t13  | FIXED: Bad format |  |
| Share link | In Safari, open a web page and select a link<br>Share it with oC | Link saved correctly| P m13 t13  | |  |
| Share image | In Safari, open a web page and select an image onto a web<br>Share it with oC | Image saved correctly| P m13 t13  | |  |
| Share with passcode/Face id | Save an external file in a folder created on non-root folder, with security enabled in the app | First, passcode/face id is asked, then share sheet appears. File correctly saved | P m13 t13 |  |  |
| Several files | Save 100 external files in oC | Files correctly saved | P m13 t13  | FIXED: Content lost |  |
|**Several accounts**|||||
| View | Open the share sheet from an external app | Correct view in both orientations (all accounts are there)  | P m13 t13 |  |  |
| Root | Save an external file in the root folder | File correctly saved | P m13 t13 |  |  |
| Non root | Save an external file in non-root folder | File correctly saved | P m13 t13 |  |  |
| Create folder root | Save an external file in a folder created on root folder | File correctly saved | P m13 t13 |  |  |
| Create folder non-root | Save an external file in a folder created on non-root folder | File correctly saved | P m13 t13 |  |  |
| Share text | In Safari, open a web page and select text<br>Share it with oC after selecting an account| Text saved in a text file | P m13 t13  | FIXED: Bad format |  |
| Share link | In Safari, open a web page and select a link<br>Share it with oC after selecting an account| Link saved correctly| P m13 t13  | |  |
| Share image | In Safari, open a web page and select an image onto a web<br>Share it with oC after selecting an account | Image saved correctly| P m13 t13  | |  |
| Share with passcode/Face id | Save an external file in a folder created on non-root folder, with security enabled in the app | First, passcode/face id is asked, then share sheet appears. File correctly saved | P m13 t13 |  |  |
| Several files | Save 100 external files in oC selecting one account<br>Save same 100 files in a different account | Files correctly saved in both accounts | P m13 t13 | FIXED: Content lost |  |
|**File extensions**|||||
| pdf | Share a pdf with an oC account | Files correctly saved | P m13 t13|  |  |
| txt | Share a txt with an oC account | Files correctly saved | P m13 t13 |  |  |
| doc | Share a doc with an oC account | Files correctly saved | P m13 t13 |  |  |
| pages | Share a pages with an oC account. This is bundled file, important to check | Files correctly saved | P m13 |  |  |
| xls | Share a xls with an oC account | Files correctly saved | P m13 t13 |  |  |
| zip | Share a zip with an oC account | Files correctly saved | P m13 t13 |  |  |
| image | Share a image with an oC account | Files correctly saved | P m13 t13 |  |  |
| video | Share a video with an oC account | Files correctly saved |  P m13 t13 |   |  |
| non-openable | Share a file with no extension or not openable with an oC account | Files correctly saved |  P m13 t13 |  |  |
|**Error handling**| One device ||||
| Non existent target folder | Remove/Move the target folder before submitting | Correct error | P m13 |  |
| Renamed target folder | Rename the target folder before submitting | Correct error | P m13 |  |  |
| Conflicting name folder | Create a folder in the picker with an existing name | Correct error   | P m13  |  |
| No network connection | Share a file with no internet connection | Queued till connection is recovered | P m13 |  |  |
| No server connection | Share a file with a server in maintenance mode | Queued till connection is recovered | P m13 |  |  |