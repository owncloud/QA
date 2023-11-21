# Mobile smoke test


**Server version**: 10.8.0beta1<br>
**OAuth2 version**: 0.4.4<br>

### Android

**Device & Android version**: Google Pixel 2, Android11 <br>
**Android app version**:[2.18](https://github.com/owncloud/android/tree/oc-android-2.18)


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  |  Passed| [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/login.feature) |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | Passed |  | |
| New folder | Select to create a new folder |The folder is created with thecorrect name| Passed  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature) |
| Rename | Rename an exsisting folder|  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature) |
| Move | 1. Long press on a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature) |
| Copy | 1. Long press on a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/copy.feature) |
| Delete | 1. Long press on a folder<br>2. Select Delete | Item deleted| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature) |
| Sync | 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server| Passed |[AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/listfiles.feature)
| Upload  | Select several files from Document provider to upload to oC | Files are uploaded  |  Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/download.feature)|
| Av Offline | Long press to set as Av Offline a file | The file is downloaded and set as Av Offline with the purple tick | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) |
| Av Offline folder | Long press to unset an Av Offline a folder that contains subfolders<br>Add new content to the folder | The folder and all its content is downloaded and set as Av Offline with the purple tick<br>New content is availble offline | Passed
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/shares.feature) |
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/links.feature) |


### iOS

**Device & iOS version**: iPhone XR, iOS14.6<br>
**iOS app version**: [11.6.1](https://github.com/owncloud/ios-app/tree/version_11.6.1)<br>

Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  | Passed |[AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/login.feature)
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | Passed |
| New folder | Select to create a new folder |The folder is created with the correct name| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature)
| Rename | Rename an exsisting folder|  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature)
| Move | 1. Open the card of a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature)
| Copy | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/copy.feature)
| Duplicate | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/duplicate.feature)
| Delete | 1. Open the card of a folder<br>2. Select Delete | Item deleted|  Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature)
| Upload  Files| Select several files from Document provider to upload to oC | Files are uploaded  | Passed
| Upload Albums | Select several images and videos from Albums to upload to oC | Images and videos are uploaded  | Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow|  Passed
| Av Offline | Open the card of a file to set as Av Offline | The file is downloaded and set as Av Offline  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) 
| Av Offline folder | Open the card of a folder to unset as Av Offline | The folder and all its content is downloaded and set as Av Offline | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) 
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)
| Link  | Create a link over a file and a folder | Links are correctly created| Passed |[AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/links.feature)
