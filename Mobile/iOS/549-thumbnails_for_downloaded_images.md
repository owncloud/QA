
###  Thumbnails for downloaded images 

#### Pr: https://github.com/owncloud/ios/pull/549

Devices: iPhone6 v9

Server version: 8.2.2

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
**Image Formats**|
1| JPG/JPEG| Download a JPG file | Thumbnail is shown|P m9
2| PNG| Download a PNG file | Thumbnail is shown|P m9
3| GIF| Download a GIF file | Thumbnail is shown|P m9
4| TIFF| Download a TIFF file | Thumbnail is shown|P m9
**Actions**|
5|Download file| 1. Upload an image file<br>2. Download the file (change orientation)|1. No Thumbnail<br>2. Thumbnail is visible| P m9
6|Download folder| 1. Upload an large amount of image files in a folder<br>2. Swipe to download the whole folder |All thumbnails are correcly shown| P m9
7|Move file| 1. Download an image<br>2. Move the file to another folder|1. Thumbnail is visible<br>2. Thumbnail is visible in the new location| P m9
8|Rename file| 1. Download an image<br>2. Rename the file using special characeters|1. Thumbnail is visible<br>2. Thumbnail is visible with the new name | P m9
9|Duplicated name| 1. Download an image<br>2. Rename another image with the same name in other folder and download it <br>|1. Thumbnail is visible<br>2. Both thumbnails are correct| P m9
10|Overwrite file| 1. Download an image<br>2. Upload another image with the same name in the folder<br>3. Solve the conflict with "overwrite"|1. Thumbnail is visible<br>2. A conflict is detected<br>3. The thumbnail of the new image is visible|F m9|Overwritting an image does not update the thumbnail
11|Rename file (conflict)| 1. Download an image<br>2. Upload another image with the same name in the folder<br>3. Solve the conflict with "rename" and download it|1. Thumbnail is visible<br>2. A conflict is detected<br>3. Both thumbnails are visible|P m9
12|Delete file locally| 1. Download an image<br>2. Delete the file from the device|1. Thumbnail is visible<br>2. Thumbnail is not visible|P m9
13|Share file|1. Download an image<br>2. Share the image to another user<br>3. Login with this user and download the image|1. Thumbnail is visible<br>3. Thumbnail is visible for the sharee
14|Favourite file|1. Set an image as favourite|Thumbnail is visible
15|Update favourite|1. Set an image as favourite<br>2. From the web, upload another one with the same name overwriting the first one|The thumbnail in device is updated
16|Favourite folder|1. Create a new folder and upload a large amount of images<br>2. Set the folder as favourite|All thumbnails are shown
17|Cancel Download|1. Create a new folder and upload a large amount of images<br>2. Swipe to download the folder<br>3. Cancel the downloading|Only the downloaded images show their thumbnail
18|Cancel Favourite|1. Create a new folder and upload a large amount of images<br>2. Swipe to set the folder as favourite<br>3. Cancel the favourite|Only the downloaded images show their thumbnail
**Multiaccount**|
19|Multiaccount| 1. Download some images in different accounts and change from one to another|Thumbnails are correctly shown in all accounts
20|Multiaccount| 1. Upload and download some image files in a folder call "folder1"<br>2. Change to account2<br> 3.Upload and download some image files in a folder call "folder1"  <br>4. Change the account to the first one|1. Thumbnails of account 1 are visible correctly<br>3. Thumbnails of account 2 are visible correctly<br>4. Thumbnails of account 1 keep on being correct
**Shibboleth**|
21|Shibb server|1. Login in a Shibboleth server<br>2. Download some images|The thumbnails are correctly shown

