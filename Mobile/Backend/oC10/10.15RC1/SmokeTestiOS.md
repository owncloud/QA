## Smoke test


**Server version**: 10.15-rc.1<br>
**Device & iOS version**: iPhone XR v17.5.1<br>
**iOS app version**: [12.2.1](https://github.com/owncloud/ios-app/tree/v12.2.1)


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  | Passed |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | Passed |
| New folder | Select to create a new folder |The folder is created with the correct name| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature)
| Rename | Rename an existing folder|  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature) 
| Move | 1. Open the card of a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/move.feature)
| Copy | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)
| Duplicate | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/duplicate.feature)
| Delete | 1. Open the card of a folder<br>2. Select Delete | Item deleted| Passed  | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/delete.feature)
| Upload  Files| Select several files from Document provider to upload to oC | Files are uploaded  | Passed | 
| Upload Albums | Select several images and videos from Albums to upload to oC | Images and videos are uploaded  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/uploads.feature)
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed
| Av Offline | Open the card of a file to set as Av Offline | The file is downloaded and set as Av Offline  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature)
| Av Offline folder | Open the card of a folder to unset as Av Offline | The folder and all its content is downloaded and set as Av Offline | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) 
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature)