# Mobile

Server version:

```
Infinite Scale 6.6.1 Community 
```

### Android


**Device & Android version**: Xiaomi Redmi 13, Android 14<br>
**Android app version**: [v4.4.1](https://github.com/owncloud/android/releases/tag/v4.4.1)


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login OIDC | Login in an oCIS server, typing correct OIDC credentials | Access to account | Passed | |
| New folder | Open FAB and select to create a new folder with correct name|The folder is created with the correct name|  Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/createfolder.feature) |
| Rename | 1. Long press on a folder<br>Select Rename and type new name  |  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/rename.feature) |
| Move | 1. Long press on a folder<br>2. Select Move, and a new location | Folder is moved to the specified location | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/move.feature) |
| Copy | 1. Long press on a folder<br>2. Select Copy, and a location to copy to (including space) | The folder and all its content is copied in the location, and also remains in the original| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/copy.feature) |
| Delete | 1. Long press on a folder<br>2. Select Delete | Item deleted|  | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/delete.feature) |
| Sync | 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server| Passed |[AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/listfiles.feature)
| Upload  | Select 300 files from Document provider to upload to oC | Files are uploaded and visible in the list of files. All OK in uploads view  |  Passed 
| Upload from 3rd party app | Select 300 files from an external app like `Photos` and share them with oC | Files are uploaded and visible in the list of files. All OK in uploads view  |  Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/download.feature)|
| Preview | Tap to download a image, a txt, a video and an audio files | Files are downloaded and previewed correctly| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/listfiles.feature) |
| Open with | 1. Long press on a txt file<br>2. Select Open with<br>3. Edit the file with an external  editor and save it<br>4. Reopen oC | File is synced back to the server including the changes| Passed | Passed |
| Av Offline file| 1. Long press on a file<br>2. Select Av. offline | The file is downloaded and set as Av Offline with the purple tick | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature) |
| Av Offline folder | 1. Long press on a folder with subfolders and files inside<br>2. Select Av. offline<br>3. Add new content to the folder | 2. The folder and all its content is downloaded and set as Av Offline with the purple tick<br>3. New content is available offline | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/avoffline.feature)
| Share with user  | 1. Share a file and a folder with another user<br>2. In web, accept the shares | Both are correctly shared and visible by the recipient in Shares space | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/shares.feature) |
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/links.feature) |
| Spaces | In web, create some spaces that are visible for the user | List of spaces is visible in the app | Passed | [AUTO](https://github.com/owncloud/android-scenario-testing/tree/master/src/test/resources/io/cucumber/spaces.feature) |
| Open with web  | Open any file with an external app provider | File opened in browser with the proper app provider | Passed | Tested with all Collabora supported formats |
| Edit with web  | Open any file with an external app provider, edit the file, and save it | File synced with changes | Passed | Tested with all Collabora supported formats |
| Document Provider | 1. Add several accounts<br>2. Open any app with SAF support | All accounts are correctly listed and are browsable | Passed |  |

E2E Report: [https://reports.cucumber.io/reports/6f67dd52-adc9-4c29-8ecc-5258ad66839e](https://reports.cucumber.io/reports/6f67dd52-adc9-4c29-8ecc-5258ad66839e)

### iOS


**Device & iOS version**: iPhone XR, iOS 18.1<br>
**iOS app version**: [v12.3.1](https://github.com/owncloud/ios-app/releases/tag/untagged-170a411a08b61fa548d1)


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
| Login OIDC | Login in an oCIS server, typing correct OIDC credentials | Access to account | Passed | |
| New folder | Select to create a new folder |The folder is created with the correct name| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature)
| Rename | Rename an existing folder|  Folder is renamed with the new name | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature) 
| Move | 1. Open the card of a folder<br>2. Select Move, and a new location | Folder is moved to the specifield location | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/move.feature)
| Copy | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)
| Duplicate | 1. Open the card of a folder<br>2. Select Copy, and a location to copy to | The folder and all its content is copied in the location, and remains too in the original| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/duplicate.feature)
| Delete | 1. Open the card of a folder<br>2. Select Delete | Item deleted| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/delete.feature)
| Upload  Files| Select several files from Document provider to upload to oC | Files are uploaded  | Passed | 
| Upload Albums | Select several images and videos from Albums to upload to oC | Images and videos are uploaded  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/uploads.feature)
| Upload from 3rd party app | Select 300 files from an external app like `Gallery` and share them with oC | Files are uploaded and visible in the list of files. All OK in uploads view  |  Passed
| Download | Tap to download a file | The file is downloaded and marked with green arrow| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/previews.feature) |
| Preview | Tap to download a image, a txt, a video and an audio files | Files are downloaded and previewed correctly| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/tree/master/src/test/resources/io/cucumber/previews.feature) |
| Av Offline | Open the card of a file to set as Av Offline | The file is downloaded and set as Av Offline  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature)
| Av Offline folder | Open the card of a folder to unset as Av Offline | The folder and all its content is downloaded and set as Av Offline | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/avoffline.feature) 
| Share with user  | Share a file and a folder with another user | Both are correctly shared  | Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/shares.feature)
| Link  | Create a link over a file and a folder | Links are correctly created| Passed | [AUTO](https://github.com/owncloud/ios-scenario-testing/blob/master/src/test/resources/io/cucumber/links.feature)
| Open with web  | Open any file with an external app provider | File opened in browser with the proper app provider | Passed |Tested with all Collabora supported formats |
| Edit with web  | Open any file with an external app provider, edit the file, and save it | File synced with changes | Passed | Tested with all Collabora supported formats |
| Files Provider | 1. Add several accounts<br>2. Open any app with FP support | All accounts are correctly listed and are browsable | Passed  |  |

E2E Report: [https://reports.cucumber.io/reports/02bdc1e2-c52f-479d-8993-005a3e020f5d](https://reports.cucumber.io/reports/02bdc1e2-c52f-479d-8993-005a3e020f5d)

____


## Changelog items

Mobile apps don't support OCM and activity features yet. So, skipping those items.


## Regards

- Creating a new document in collaboration, i found cases like

```
        {
            "allow_creation": true,
            "app_providers": [
                {
                    "address": "com.owncloud.api.collaboration.CollaboraOnline",
                    "description": "Open office documents with Collabora",
                    "icon": "https://collabora.ocis.rolling.owncloud.works/favicon.ico",
                    "name": "CollaboraOnline",
                    "secure_view": false
                }
            ],
            "default_application": "OnlyOffice",
            "description": "Microsoft PowerPoint document",
            "ext": "pptx",
            "mime_type": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
            "name": "Microsoft PowerPoint"
        }
```

in which the `default_application` was not one of the providers, causing an error in creation time. This is only stethyc because the file is created and can be edited. As commented with Viktor via chat, it could be fixed with an env variable.

Related: https://github.com/owncloud/ocis/pull/10276
____

Removed resharing: https://github.com/owncloud/ocis/pull/8762

Android: Passed <br>
iOS: Passed

____

Hidden shares: https://github.com/owncloud/ocis/issues/7383

Android: not working, hidden share is always shown <br>
iOS: Passed

____

Secure View is not implemented in mobile clients yet, and not tested since there was no available environment to test it. After some attempts to create a backend, it doesn't work.
