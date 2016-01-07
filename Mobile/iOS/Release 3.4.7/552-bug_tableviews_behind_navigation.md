###  Bug: Tableviews behind navigation 

#### Pr: https://github.com/owncloud/ios/pull/552

Devices: iPhone 6plus v8.4, iPad Air v9, iPhone 5s v9.1

Server version: 8.2.2

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :-----: | :------
**Upper bar**|
| 1 | Files view in root  |  Log into a account with a high number of files in root folder |  List of files is listed below the upper bar   | P m8 t9 m9
| 2 | Files view in not root  |  Log into a account with a high number of files in a folder which is not root |  List of files is listed below the upper bar   | P m8 t9 m9
| 3 | Uploads view - current  |  Tap to upload a high number of files  |  During the upload, list of files is listed below the upper bar in uploads view   | P m8 t9
| 4 | Uploads view - uploaded  |   Tap to upload a high number of files (can be used the same as last test case) | The list of uploaded is listed below the upper bar in uploads view | P m8 t9
| 5 | Shared links view |  Share a high number of files/folders by link | The list of shared links is listed below the upper bar in uploads view | P m8 t9
| 6 | Settings view |  Tap on "Settings" | The settings is listed below the upper bar in settings view | P m8 t9
**Footer**|
| 7 | Files view  |  Log into a account with a high number of files in a folder which is not root |  Footer is correct   | P m8 t9
| 8 | Uploads view |  Tap to upload a high number of files  |  Footer is correct   | P m8 t9
| 9 | Shared links view |  Share a high number of files/folders by link | Footer is correct | P m8 t9
| 10 | Settings view |  Tap on "Settings" and add several accounts | Footer is correct | P m8 t9
