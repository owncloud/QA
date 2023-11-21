# Mobile


**Server version**: [oCIS 3.0.1-beta.1](https://github.com/owncloud/ocis/tree/v3.1.0-beta.1)<br>

### Android

**Device & Android version**: Pixel2, Android 11 (REAL), Pixel 5, Android 12 (EMU)<br>
**Android app version**: [4.0](https://github.com/owncloud/android/releases/tag/oc-android-4.0)


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login OIDC | Login in an oCIS server, typing correct OIDC credentials | Access to account |  Passed| AUTO |
| New folder | Open FAB and select to create a new folder with correct name|The folder is created with the correct name| Passed  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature) |
| Rename | 1. Long press on a folder<br>Select Rename and type new name  |  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature) |
| Move | 1. Long press on a folder<br>2. Select Move, and a new location | Folder is moved to the specified location | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature) |
| Copy | 1. Long press on a folder<br>2. Select Copy, and a location to copy to (including space) | The folder and all its content is copied in the location, and also remains in the original| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/copy.feature) |
| Delete | 1. Long press on a folder<br>2. Select Delete | Item deleted| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature) |
| Sync | 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server| Passed |[AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/listfiles.feature)
| Upload  | Select 300 files from Document provider to upload to oC | Files are uploaded and visible in the list of files. All OK in uploads view  |  Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/download.feature)|
| Av Offline file| 1. Long press on a file<br>2. Select Av. offline | The file is downloaded and set as Av Offline with the purple tick | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) |
| Av Offline folder | 1. Long press on a folder with subfolders and files inside<br>2. Select Av. offline<br>3. Add new content to the folder | 2. The folder and all its content is downloaded and set as Av Offline with the purple tick<br>3. New content is available offline | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature)
| Share with user  | 1. Share a file and a folder with another user<br>2. In web, accept the shares | Both are correctly shared and visible by the recipient in Shares space | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/shares.feature) |
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/links.feature) |
| Spaces | 1. In web, create some spaces that are visible for the user | List of spaces is visible in the account | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/spaces.feature) |
| Document Provider | 1. Add several accounts<br>2. Open any app with SAF support | All accounts are correctly listed and are browsable | Passed |  |

### iOS

**Device & iOS version**: iPhone XR, iOS 16.5.1 (REAL), iPhone 14, iOS 16.5 (SIM)<br>
**iOS app version**: [12.0.2](https://github.com/owncloud/ios-app/releases/tag/v12.0.2)<br>

Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login OIDC | Login in an oCIS server, typing correct OIDC credentials | Access to account |  Passed|  AUTO |
| New folder | Open '+' and select to create a new folder with correct name|The folder is created with the correct name| Passed  | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature) |
| Rename | 1. Select an item by clicking on 3-dot-button<br>2. Select Rename and type new correct name  |  Item is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature) |
| Move | 1. Select an item by clicking on 3-dot-button<br>2. Select Move, and a new location | Folder is moved to the specified location | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature) |
| Copy | 1. Select a folder by clicking on 3-dot-button<br>2. Select Copy, and a location to copy to (including space) | The folder and all its content is copied to the location, and also remains in the original | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/copy.feature) |
| Duplicate | 1. Select a folder by clicking on 3-dot-button<br>2. Select Duplicate | The folder and all its content is duplicated in the current location, with the name adding `2`| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/duplicate.feature)
| Delete | 1. Select a folder by clicking on 3-dot-button<br>2. Select Delete and submit deletion | Item deleted |   Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature) |
| Upload Files| Select many files from File apps to upload to oC | Files are uploaded  | Passed | 
| Upload Albums | Select 300 images and videos from Albums to upload to oC | Images and videos are uploaded  | Passed
| Download | Tap to download a file | The file is downloaded and previewed |  Passed |
| Av Offline | 1. Select a folder by clicking on 3-dot-button<br>2. Select set as Av Offline file| The file is downloaded and set as Av Offline  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) 
| Av Offline folder | 1. Select a folder with subfolders inside by clicking on 3-dot-button<br>2. Select Av. offline<br>3. Add new content to the folder | 2. The folder and all its content is downloaded and set as Av Offline<br>3. New content is available offline | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature)
| Share with user  |  1. Select file and folder by clicking on 3-dot-button<br>2. Select Share and add new recipient<br>3. Recipient accepts the share | Both are correctly shared and visible by the recipient in Shares space   | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/shares.feature)
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/links.feature) |
| Spaces | 1. In web, create some spaces that are visible for the user | List of spaces is visible in the account | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/spaces.feature) |
| Files App | 1. Add several accounts<br>2. Open Files app | All accounts are correctly listed and are browsable | Passed |  |