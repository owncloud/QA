## Smoke test


**Server version**: <br>
**Device & Android version**: <br>
**Android app version**: 


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login Basic (oC10) | Login in an oC10 server, typing correct credentials | Access to account |  | AUTO |
| Login OAuth2 (oC10)| Login in an OAuth2 server, typing correct OAuth2 credentials | Access to account |  | |
| Login OIDC | Login in an oCIS server, typing correct OIDC credentials | Access to account |  | |
| New folder | Open FAB and select to create a new folder with correct name|The folder is created with the correct name|   | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature) |
| Rename | 1. Long press on a folder<br>Select Rename and type new name  |  Folder is renamed with the new name |  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature) |
| Move | 1. Long press on a folder<br>2. Select Move, and a new location | Folder is moved to the specified location |  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature) |
| Copy | 1. Long press on a folder<br>2. Select Copy, and a location to copy to (including space) | The folder and all its content is copied in the location, and also remains in the original|  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/copy.feature) |
| Delete | 1. Long press on a folder<br>2. Select Delete | Item deleted|  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature) |
| Sync | 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server|  |[AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/listfiles.feature)
| Upload  | Select 300 files from Document provider to upload to oC | Files are uploaded and visible in the list of files. All OK in uploads view  |  
| Download | Tap to download a file | The file is downloaded and marked with green arrow|  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/download.feature)|
| Preview | Tap to download a image, a txt, a video and an audio files | Files are downloaded and previewed correctly|  |  |
| Open with | 1. Long press on a txt file<br>2. Select Open with<br>3. Edit the file with an external  editor and save it<br>4. Reopen oC | File is synced back to the server including the changes|  |  |
| Av Offline file| 1. Long press on a file<br>2. Select Av. offline | The file is downloaded and set as Av Offline with the purple tick |  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) |
| Av Offline folder | 1. Long press on a folder with subfolders and files inside<br>2. Select Av. offline<br>3. Add new content to the folder | 2. The folder and all its content is downloaded and set as Av Offline with the purple tick<br>3. New content is available offline |  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature)
| Share with user  | 1. Share a file and a folder with another user<br>2. In web, accept the shares | Both are correctly shared and visible by the recipient in Shares space |  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/shares.feature) |
| Link  | Create a link over a file and a folder | Links are correctly created|  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/links.feature) |
| Spaces | In web, create some spaces that are visible for the user | List of spaces is visible in the app |  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/spaces.feature) |
| Document Provider | 1. Add several accounts<br>2. Open any app with SAF support | All accounts are correctly listed and are browsable |  |  |

