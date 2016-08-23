###  Instant uploads based in observer (fix for Android 7) 

#### Pr: https://github.com/owncloud/android/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Instant Uploads Photo**|||||||
| 1 | Photos enabled |  1. Enable instant uploads for photos<br>2. Take some photos  | Photos are uploaded. Check the uploads view. |  |  |
| 2 | Photos disabled |  1. Disable instant uploads for photos<br>2. Take some photos  | Photos are not uploaded. Check the uploads view. |  |  |
| 3 | Upload path |  1. With the instant uploads enabled, change the upload path<br>2. Take a photo  | Photo is uploaded in the correct path. Check the uploads view. |  |  |
| 4 | Move |  1. With the instant uploads enabled, change to "Move to app folder"<br>2. Take a photo  | Photo is uploaded in the correct path and not stored in device storage. Check the uploads view. |  |  |
| 5 | Only wifi |  1. With the instant uploads enabled, change to "Only wifi"<br>2. Take a photo using mobile bandwidth<br>3. Connect the device to wifi coverage | 2. Photo is not uploaded<br>3. Photo is uploaded. Check the uploads view. |  |  |
|**Instant Uploads Video**|||||||
| 6 | Video enabled |  1. Enable instant uploads for videos<br>2. Take a video  | Video is uploaded. Check the uploads view. |  |  |
| 7 | Video disabled |  1. Disable instant uploads for videos<br>2. Take a video  | Video is not uploaded. Check the uploads view. |  |  |
| 8 | Upload path |  1. With the instant uploads enabled, change the upload path<br>2. Take some videos  | Videos are uploaded in the correct path. Check the uploads view. Check the uploads view. |  |  |
| 9 | Move |  1. With the instant uploads enabled, change to "Move to app folder"<br>2. Take a video  | Video is uploaded in the correct path and not stored in device storage. Check the uploads view. |  |  |
| 10 | Only wifi |  1. With the instant uploads enabled, change to "Only wifi"<br>2. Take a video using mobile bandwidth<br>3. Connect the device to wifi coverage | 2. Video is not uploaded<br>3. Video is uploaded. Check the uploads view. |  |  |
|**Instant Uploads Photo&Video**|||||||
| 11 | Several files |  1. With the instant uploads for photos and videos enabled, change to "Move to app folder"<br>2. Take some videos and photos consecutively | All content is correctly upload and moved to correct folders respectively. Check the uploads view. |  |  |
| 12 | Multiaccount |  1. Login in several accounts<br>2. With the instant uploads enabled, take videos and photos changing the active account | All content is correctly upload and moved to correct accounts respectively. Check the uploads view. |  |  |
|**Uploads (regresion)**|||||||
| 13 | Manual uploads |  1. Enable instant uploads<br>2. Upload some files manually<br>3. Disable instant uploads<br>4. Upload some files manually  | 2. Files are uploaded<br>4. Files are uploaded |  |  |