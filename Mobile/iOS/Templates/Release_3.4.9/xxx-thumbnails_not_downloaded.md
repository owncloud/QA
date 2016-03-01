###  Thumbnails for not downloaded 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server:

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment |
:----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Image Formats**|||||
|1| JPG/JPEG| 1. From web, upload a JPG file<br>2. Open the app<br>3. Tap to download the file | 2. Thumbnail is shown<br>3. Thumbnail is shown|||
|2| PNG| 1. From web, upload aPNG file<br>2. Open the app<br>3. Tap to download the file | 2. Thumbnail is shown<br>3. Thumbnail is shown|||
|3| GIF| 1. From web, upload a GIF file<br>2. Open the app<br>3. Tap to download the file | 2. Thumbnail is shown<br>3. Thumbnail is shown|||
|4| TIFF| 1. From web, upload a TIFF file<br>2. Open the app<br>3. Tap to download the file | 2. Thumbnail is shown<br>3. Thumbnail is shown|||
|**Actions**|||||
|5|Load files| Upload an large amount of image files in a folder|All thumbnails are correcly shown|||
|6|Move file| 1. Upload a image<br>2. Move the image to another folder|1. Thumbnail is visible<br>2. Thumbnail is visible in the new location|||
|7|Rename file|  1. Upload a image<br>2. Rename the image using special characters|1. Thumbnail is visible<br>2. Thumbnail is visible with the new name|||
|8|Duplicated name| 1. Upload an image<br>2. Rename another image with the same name in other folder <br>|1. Thumbnail is visible<br>2. Both thumbnails are correct|||
|9|Overwrite file in mobile device| 1. Upload an image<br>2. Upload another image with the same name in the folder<br>3. Solve the conflict with "overwrite"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. The thumbnail of the new image is visible|||
|10|Overwrite file in server| 1. Switch the device connection off<br> 2. Upload an image to app<br>3. In server, upload another image with the same name<br>4. Switch the device connection on<br>5. Solve the conflict with "overwrite"|4. A conflict is detected<br>5. The thumbnail of device's version is visible|||
|11|Move and overwrite file| 1. Upload an image<br>2. Upload another image with the same name in another folder<br>3. Move one image to the folder in which is the another one<br>4. Solve the conflict with "overwrite"|2. Both thumbnails are visible<br>3. A conflict is detected<br>4. The thumbnail of the second image is visible|||
|12|Overwrite from a external app| 1. Upload an image<br>2. Upload another image from an external app with the same name<br>3. Solve the conflict with "overwrite"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. The thumbnail of the second image is visible|||
|13|Rename file (conflict)| 1. Upload an image<br>2. Upload another image with the same name in the folder<br>3. Solve the conflict with "rename"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. Both thumbnails are visible|||
|14|Delete file locally| 1. Upload an image<br>2. Download the image<br>3. Delete locally the image|1. Thumbnail is visible<br>2. Thumbnail is visible<br>3. Thumbnail is visible|||
|15|Share file|1. Upload an image<br>2. Share the image to another user<br>3. Login with this user|1. Thumbnail is visible<br>3. Thumbnail is visible for the sharee|||
|16|Favourite file|1. Set an image as favourite|Thumbnail is visible|||
|17|Update favourite|1. Set an image as favourite<br>2. From the web, upload another one with the same name overwriting the first one|The thumbnail in device is updated|||
|18|Favourite folder|1. Create a new folder and upload a large amount of images<br>2. Set the folder as favourite|All thumbnails are shown|||
|19|Cancel Download|1. Create a new folder and upload a large amount of images<br>2. Swipe to download the folder<br>3. Cancel the downloading| Thumbnails are shown independent whether the image was downloaded or not|||
|20|Cancel Favourite|1. Create a new folder and upload a large amount of images<br>2. Swipe to set the folder as favourite<br>3. Cancel the favourite| Thumbnails are shown independent whether the image was downloaded or not|||
|**Multiaccount**||||||
|21|Multiaccount| 1. Upload some images in different accounts and change from one to another|Thumbnails are correctly shown in all accounts|||
|22|Multiaccount| 1. Upload  some image files in a folder call "folder1"<br>2. Change to account2<br> 3.Upload some image files in a folder call "folder1"  <br>4. Change the account to the first one|1. Thumbnails of account 1 are visible correctly<br>3. Thumbnails of account 2 are visible correctly<br>4. Thumbnails of account 1 keep on being correct|||
|**Shibboleth**||||||
|23|Shibb server|1. Login in a Shibboleth server<br>2. Upload some images<br>3. Download some images|2. Thumbnails are correctly shown<br>3. Thumbnails are correctly shown|||
|**Cache**||||||
|24|Cache|1. Upload some images to different accounts<br>2. Move some images from a location to another one<br>3. Delete some images<br>4. Delete an account | Check in all the cases that the thumbnails are correctly managed in mobile's cache|||