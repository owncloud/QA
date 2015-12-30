###  Thumbnails for downloaded images 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server version:

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
**Actions**|
1|Download | 1. Upload an image file<br>2. Download the file (change orientation)|1. No Thumbnail<br>2. Thumbnail is visible
2|Download folder| 1. Upload an large amount of image files in a folder<br>2. Swipe to download the whole folder |All thumbnails are correcly shown
3|Move file| 1. Download an image<br>2. Move the file to another folder|1. Thumbnail is visible<br>2. Thumbnail is visible in the new location
4|Rename file| 1. Download an image<br>2. Rename the file using special characeters|1. Thumbnail is visible<br>2. Thumbnail is visible with the new name
5|Duplicated name| 1. Download an image<br>2. Rename another image with the same name in other folder and download it <br>|1. Thumbnail is visible<br>2. Both thumbnails are correct
6|Delete file locally| 1. Download an image<br>2. Delete the file from the device|1. Thumbnail is visible<br>2. Thumbnail is not visible
7|Share file|1. Download an image<br>2. Share the image to another user<br>3. Login with this user and download the image|1. Thumbnail is visible<br>3. Thumbnail is visible for the sharee
8|Favourite file|1. Set an image as favourite|Thumbnail is visible
9|Favourite folder|1. Create a new folder and upload a large amount of images<br>2. Set the folder as favourite|All thumbnails are shown
10|Cancel Download|1. Create a new folder and upload a large amount of images<br>2. Swipe to download the folder<br>3. Cancel the downloading|Only the downloaded images shown its thumbnail
11|Cancel Favourite|1. Create a new folder and upload a large amount of images<br>2. Swipe to set the folder as favourite<br>3. Cancel the favourite|Only the downloaded images shown its thumbnail
**Multiaccount**|
12|Multiaccount| 1. Upload and download some image files in a folder call "folder1"<br>2. Change to account2<br> 3.Upload and download some image files in a folder call "folder1"  <br>4. Change the account to the first one|1. Thumbnails of account 1 are visible correctly<br>3. Thumbnails of account 2 are visible correctly<br>4. Thumbnails of account 1 keep on being correct
