# Mobile smoke test


**Server version**: 10.4.0RC3<br>
**OAuth2 version**: 0.4.3<br>

### Android

**Device & Android version**: Nexus, v8.0 <br>
**Android app version**: [2.14.2](https://github.com/owncloud/android/tree/oc-android-2.14.2)<br>


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/login.feature) |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | Passed | |
| New folder | Select to create a new folder |The folder is created with thecorrect name|  Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature) |
| Rename | Rename an exsisting folder|  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature) |
| Move | 1. Long press on a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed| [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature) |
| Copy | 1. Long press on a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed| [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber) |
| Delete | 1. Long press on a folder<br>2. Select Delete | Item deleted| Passed| [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature) |
| Sync | 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server| Passed
| Upload  | Select several files from Document provider to upload to oC | Files are uploaded  | Passed 
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed | |
| Av Offline | Long press to set as Av Offline a file | The file is downloaded and set as Av Offline with the purple tick | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) |
| Av Offline folder | Long press to unset an Av Offline a folder that contains subfolders<br>Add new content to the folder | The folder and all its content is downloaded and set as Av Offline with the purple tick<br>New content is availble offline | Passed
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/privateshare.feature) |
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/publicshare.feature) |


### iOS

**Device & iOS version**: iPhoneX, v13.3<br>
**iOS app version**: [1.3.0](https://github.com/owncloud/ios-app/tree/version_1.3.0)<br>

Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  | Passed |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | Passed |
| New folder | Select to create a new folder |The folder is created with the correct name|  Passed |
| Rename | Rename an exsisting folder|  Folder is renamed with the new name | Passed
| Move | 1. Open the card of a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed
| Copy | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed
| Duplicate | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed
| Delete | 1. Open the card of a folder<br>2. Select Delete | Item deleted| Passed 
| Upload  | Select several files from Document provider to upload to oC | Files are uploaded  | Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed 
| Av Offline | Open the card of a file to set as Av Offline | The file is downloaded and set as Av Offline with the purple tick | Passed
| Av Offline folder | Open the card of a folder to unset as Av Offline | The folder and all its content is downloaded and set as Av Offline with the purple tick | Passed
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed
| Link  | Create a link over a file and a folder | Links are correctly created| Passed

### iOS legacy

**Device & iOS version**: iPhoneX, v13.3<br>
**iOS-legacy app version**: [3.8.2](https://github.com/owncloud/ios-legacy/tree/version_3.8.2)<br>

Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  | Passed |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | Passed |
| New folder | Select to create a new folder |The folder is created with the correct name|  Passed |
| Rename | Rename an exsisting folder|  Folder is renamed with the new name | Passed
| Move | 1. Open the card of a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed
| Delete | 1. Open the card of a folder<br>2. Select Delete | Item deleted| Passed 
| Upload  | Select several files from Document provider to upload to oC | Files are uploaded  | Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed 
| Av Offline | Open the card of a file to set as Av Offline | The file is downloaded and set as Av Offline with the purple tick | Passed
| Av Offline folder | Open the card of a folder to unset as Av Offline | The folder and all its content is downloaded and set as Av Offline with the purple tick | Passed
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed | 
| Link  | Create a link over a file and a folder | Links are correctly created| Passed
