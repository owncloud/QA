###  Instant uploads based in observer (fix for Android 7) 

#### Pr: https://github.com/owncloud/android/pull/XXX 

Devices: Huawei 6P v7

Server: v9.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Instant Uploads Photo**|||||||
| 1 | Photos enabled |  1. Enable instant uploads for photos<br>2. Take some photos  | Photos are uploaded. Check the uploads view. | m7 |  |
| 2 | Photos disabled |  1. Disable instant uploads for photos<br>2. Take some photos  | Photos are not uploaded. Check the uploads view. | m7 |  |
| 3 | Photos enabled again |  1. From 2., enable again instant uploads<br>2. Take more photos  | Only new photos are uploaded. Check in uploads view  | m7 |  |
| 4 | Video |  1. Enable instant uploads for photos, but not for videos<br>2. Take a video | Video is not uploaded. Check in uploads view | m7 |  |
| 5 | Upload path |  1. With the instant uploads enabled, change the upload path<br>2. Take a photo  | Photo is uploaded in the correct path. Check the uploads view. | m7 |  |
| 6 | Move |  1. With the instant uploads enabled, change to "Move to app folder"<br>2. Take a photo  | Photo is uploaded in the correct path and not stored in device storage. Check the uploads view. | m7 |  |
| 7 | Only wifi |  1. With the instant uploads enabled, change to "Only wifi"<br>2. Take a photo using mobile bandwidth<br>3. Connect the device to wifi coverage | 2. Photo is not uploaded<br>3. Photo is uploaded. Check the uploads view. |  |  |
|**Instant Uploads Video**|||||||
| 8 | Video enabled |  1. Enable instant uploads for videos<br>2. Take a video  | Video is uploaded. Check the uploads view. | m7 |  |
| 9 | Video disabled |  1. Disable instant uploads for videos<br>2. Take a video  | Video is not uploaded. Check the uploads view. | m7 |  |
| 10 | Videos enabled again |  1. From 9., enable again instant uploads<br>2. Take more videos  | Only new videos are uploaded. Check in uploads view  |  |  |
| 11 | Photo |  1. Enable instant uploads for videos, but not for photos<br>2. Take a photo | Photo is not uploaded. Check in uploads view  |  |  |
| 12 | Upload path |  1. With the instant uploads enabled, change the upload path<br>2. Take some videos  | Videos are uploaded in the correct path. Check the uploads view. Check the uploads view. |  |  |
| 13 | Move |  1. With the instant uploads enabled, change to "Move to app folder"<br>2. Take a video  | Video is uploaded in the correct path and not stored in device storage. Check the uploads view. |  |  |
| 14 | Only wifi |  1. With the instant uploads enabled, change to "Only wifi"<br>2. Take a video using mobile bandwidth<br>3. Connect the device to wifi coverage | 2. Video is not uploaded<br>3. Video is uploaded. Check the uploads view. |  |  |
|**Instant Uploads Photo&Video**|||||||
| 15 | Several files |  1. With the instant uploads for photos and videos enabled<br>2. Take some videos and photos consecutively | All content is correctly upload to correct folders respectively. Check the uploads view. |  |  |
| 16 | Multiaccount |  1. Login in several accounts<br>2. With the instant uploads enabled, take videos and photos changing the active account | All content is correctly upload and moved to correct accounts respectively. Check the uploads view. |  |  |
|**Source Folder**|||||||
| 17 | View |  In Settings view, check the new option "Source Folder" is correctly displayed| The option is correctly displayed in portrait and landscape |  |  |
| 18 | Set folder | 1. Set a folder to be observed<br>2. Take photos and videos<br>3. Change to another folder<br>4. Take photos and videos| 2. Photos and videos are uploaded<br>3. Folder is correctly updated<br>4. Photos and videos are not uploaded |  |  |
| 19 | New camera app | 1. Install a new camera app that stores photos in a different folder into the device (for example, Camera MX)<br>2. Select that folder as source folder<br>3. Take some photos or videos with this new camera app<br>4. Take some photos and videos with the default camera app| 2. Source folder is correctly updated<br>3. Content is uploaded<br>4. Content is not uploaded|  |  |
|**Upgrade**|||||||
| 20 | Upgrade from previous version | 1. Install previous version<br>2. Enable instant uploads with several options<br>3. Upgrade the app| The set-up remains after upgrading the app |  |  |