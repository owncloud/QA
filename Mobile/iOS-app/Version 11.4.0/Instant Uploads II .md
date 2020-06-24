###  Instant Uploads II

#### PR: https://github.com/owncloud/ios-app/pull/714

Devices: iPhoneXR v13.4 <br>
Server: 10.4.1

---

These cases to be executed with `Cellular transfers` enabled:
 
 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|||||
| Settings | Open Settings view -> Media Upload | Instant upload options are there and correct in both orientations with all the background options | P m13 |  |  |
|**One account - Images**|||||
| Root folder | Select the root folder<br>Take two pics | Both pics are uploaded to the root folder |  P m13  |  |  |
| Non-Root folder | Select a non-root folder<br>Take two pics | Both pics are uploaded to the folder | P m13  |  |  |
| Switch to other | Select a new folder as before<br>Take two pics | Both pics are uploaded to the new target folder | P m13  |  |  |
| Rename target folder | In the app, rename the target folder<br>Take two pics | Both pics are uploaded to the new named folder | F m13 | Infinite loop of notification about non existing target. Cancel one by one. |  |
| Move target folder | In the app, move the target folder<br>Take two pics | Both pics are uploaded to the moved folder | F m13 | Infinite loop of notification about non existing target. Cancel one by one.  |  |
| Remove target folder | In the app, remove the target folder<br>Take two pics | Both pics are not uploaded?  |  F m13 | Infinite loop of notification about non existing target. Cancel one by one.  |  |
| Select no account |Install the app from scratch and enable pics instant uploads<br> Take two pics | Should not be posible | P m13 |  |  |
| Select no target folder |Install the app from scratch and enable pics instant uploads, selecting an account<br> Take two pics | Not posible, forced to set a path| P m13 |  |  |
| Disable | After enabling and taking some pics, disable the feature<br>Take some pics<br>Enable again the feature<br>Take more pics | Only the pictures that were taken with the feature enabled were uploaded, other ones were ignored |  |  |  |
|**One account - Videos**|||||
| Root folder | Select the root folder<br>Take two videos | Both videos are uploaded to the root folder | P m13 |   |  |
| Non-Root folder | Select a non-root folder<br>Take two videos | Both videos are uploaded to the folder | P m13 |  |  |
| Switch to other | Select a new folder as before<br>Take two videos | Both videos are uploaded to the new target folder | P m13 |  |  |
| Rename target folder | In the app, rename the target folder<br>Take two videos | Both videos are uploaded to the new named folder | F m13 | Infinite loop of notification about non existing target. Cancel one by one.  |  |
| Move target folder | In the app, move the target folder<br>Take two videos | Both videos are uploaded to the moved folder | F m13  | Infinite loop of notification about non existing target. Cancel one by one.  |  |
| Remove target folder | In the app, remove the target folder<br>Take two videos | Both videos are not uploaded?  | F m13  | Infinite loop of notification about non existing target. Cancel one by one. |  |
| Select no account |Install the app from scratch and enable videos instant uploads<br> Take two videos | Not posible | P m13  |  |  |
| Select no target folder |Install the app from scratch and enable videos instant uploads, selecting an account<br> Take two videos | Not posible, forced to set a path| P m13  |  |  |
| Disable | After enabling and taking some videos, disable the feature<br>Take some videos<br>Enable again the feature<br>Take more videos | Only the videos that were taken with the feature enabled were uploaded, other ones were ignored |   |  |  |
|**Pics & Videos**|||||
| Only pics | Enable instant upload for pics<br>Take some pics and videos<br>Enable the instant upload for videos | Only pics are uploaded |  |  |  |
| Only videos | Enable instant upload for videos<br>Take some pics and videos<br>Enable the instant upload for pics | Only videos are uploaded |  |  |  |
| Late enabling | Disable instant uploads for pics and videos<br>Take some pics and videos<br>Enable the instant upload for pics and videos |  Nothing is uploaded |    |  |  |
|**Several accounts**|||||
| Upload to one | 1. Select one of several accounts and an existing folder for videos and pics<br>2. Take two pics and two videos | Both items are uploaded to the correct folder |  |  |  |
| Upload to two | 1. Select one of several accounts and an existing folder for pics<br>2. Select another account and folder for videos<br>3. Take two pics and two videos| Every item is uploaded to the correct account and target folder | |  |  |
| Account removed | 1. Select one of several accounts and an existing folder<br>2. Remove the account from the device and take some pics/videos | Feature disabled |  |   |  |
|**Background tasks**|||||
| Background refresh | With instant uplaods enabled, background refresh enabled and app closed, take videos and pics | After some time (not deterministic), content must be uploaded |  | |  |
| Background location | With instant uplaods enabled, background refresh enabled and location information enabled and app closed, take videos and pics | After some time (not deterministic), content must be uploaded. Change the location can help (not deterministic) |  | |  |
| Notifications | With instant uplaods enabled, background refresh enabled and location information enabled, notifications enabled and app closed, take videos and pics | After some time (not deterministic), content must be uploaded and notification pops up to notify the upload was succesfully completed |  | |  


____

These cases to be executed with `Cellular transfers` disabled or depending on the test case:

| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Cellular switch**|||||
| Photo Upload global setting | 1. In Settings -> Cellular, disable cellular access<br>2. Take photos under cellular connection | Content not uploaded |  |  |
| Photo Upload setting | 1. In Settings -> Cellular, enable cellular access and disable Photo Uploads<br>2. Take photos and videos under cellular connection | Photos not uploaded<br>Videos uploaded |  |  |
| Video Upload global setting | 1. In Settings -> Cellular, disable cellular access<br>2. Take videos under cellular connection | Content not uploaded |  |  |
| Video Upload setting | 1. In Settings -> Cellular, enable cellular access and disable Video Uploads<br>2. Take photos and videos under cellular connection | Videos not uploaded<br>Photos uploaded |  |  |
| Disable all | 1. In Settings -> Cellular, disable global setting<br>2. Take photos and videos under cellular connection  | Videos not uploaded<br>Photos not uploaded |  |  |