## Smoke test


**Server version**: <br>
**Device & iOS version**: <br>
**iOS app version**: 


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login basic | Login in a server with basic auth | It is possible to access  | |
| Login OAuth2 | Login in a server with OAuth2  | It is possible to access  | |
| New folder | Select to create a new folder |The folder is created with the correct name| | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature)
| Rename | Rename an existing folder|  Folder is renamed with the new name | | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature) 
| Move | 1. Open the card of a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/move.feature)
| Copy | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)
| Duplicate | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/duplicate.feature)
| Delete | 1. Open the card of a folder<br>2. Select Delete | Item deleted|  | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/delete.feature)
| Upload  Files| Select several files from Document provider to upload to oC | Files are uploaded  | | 
| Upload Albums | Select several images and videos from Albums to upload to oC | Images and videos are uploaded  | | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/uploads.feature)
| Download | Tap to download a file | The file is downloaded and marked with green arrow| 
| Av Offline | Open the card of a file to set as Av Offline | The file is downloaded and set as Av Offline  | | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature)
| Av Offline folder | Open the card of a folder to unset as Av Offline | The folder and all its content is downloaded and set as Av Offline | | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) 
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)
| Link  | Create a link over a file and a folder | Links are correctly created| | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature)