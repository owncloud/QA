###  Instant Uploads II

#### PR: https://github.com/owncloud/ios-app/pull/714

Devices: iPhoneXR v13.4, iPadAir2 v13.4 <br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|||||
| Settings | Open Settings view -> Media Upload | Instant upload options are there and correct in both orientations with all the background options | P m13 t13 |  |  |
|**One account - Images**|||||
| Root folder | Select the root folder<br>Take two pics | Both pics are uploaded to the root folder |  P m13  t13 |  |  |
| Non-Root folder | Select a non-root folder<br>Take two pics | Both pics are uploaded to the folder | P m13  t13 |  |  |
| Switch to other | Select a new folder as before<br>Take two pics | Both pics are uploaded to the new target folder | P m13  t13 |  |  |
| Rename target folder | In the app, rename the target folder<br>Take two pics | Both pics are uploaded to the new named folder | NA | Infinite loop of notification about non existing target. Cancel one by one.-> will be checked in message loop |  |
| Move target folder | In the app, move the target folder<br>Take two pics | Both pics are uploaded to the moved folder | NA | Infinite loop of notification about non existing target. Cancel one by one. -> will be checked in message loop |  |
| Remove target folder | In the app, remove the target folder<br>Take two pics | Both pics are not uploaded?  | NA | Infinite loop of notification about non existing target. Cancel one by one. -> will be checked in message loop |  |
| Select no account |Install the app from scratch and enable pics instant uploads<br> Take two pics | Should not be posible | P m13  t13|  |  |
| Select no target folder |Install the app from scratch and enable pics instant uploads, selecting an account<br> Take two pics | Not posible, forced to set a path| P m13 t13|  |  |
| Disable | After enabling and taking some pics, disable the feature<br>Take some pics<br>Enable again the feature<br>Take more pics | Only the pictures that were taken with the feature enabled were uploaded, other ones were ignored | P m13  t13|  |  |
|**One account - Videos**|||||
| Root folder | Select the root folder<br>Take two videos | Both videos are uploaded to the root folder | P m13  t13|   |  |
| Non-Root folder | Select a non-root folder<br>Take two videos | Both videos are uploaded to the folder | P m13  t13|  |  |
| Switch to other | Select a new folder as before<br>Take two videos | Both videos are uploaded to the new target folder | P m13  t13|  |  |
| Rename target folder | In the app, rename the target folder<br>Take two videos | Both videos are uploaded to the new named folder | NA | Infinite loop of notification about non existing target. Cancel one by one. -> will be checked in message loop |  |
| Move target folder | In the app, move the target folder<br>Take two videos | Both videos are uploaded to the moved folder | NA | Infinite loop of notification about non existing target. Cancel one by one.  -> will be checked in message loop|  |
| Remove target folder | In the app, remove the target folder<br>Take two videos | Both videos are not uploaded?  | NA  | Infinite loop of notification about non existing target. Cancel one by one. -> will be checked in message loop|  |
| Select no account |Install the app from scratch and enable videos instant uploads<br> Take two videos | Not posible | P m13   t13|  |  |
| Select no target folder |Install the app from scratch and enable videos instant uploads, selecting an account<br> Take two videos | Not posible, forced to set a path| P m13  t13 |  |  |
| Disable | After enabling and taking some videos, disable the feature<br>Take some videos<br>Enable again the feature<br>Take more videos | Only the videos that were taken with the feature enabled were uploaded, other ones were ignored | P m13  t13 |  |  |
|**Pics & Videos**|||||
| Only pics | Enable instant upload for pics<br>Take some pics and videos<br>Enable the instant upload for videos | Only pics are uploaded | P m13  t13|  |  |
| Only videos | Enable instant upload for videos<br>Take some pics and videos<br>Enable the instant upload for pics | Only videos are uploaded | P m13  t13|  |  |
| Late enabling | Disable instant uploads for pics and videos<br>Take some pics and videos<br>Enable the instant upload for pics and videos |  Nothing is uploaded |  P m13  t13 |  |  |
|**Several accounts**|||||
| Upload to one | 1. Select one of several accounts and an existing folder for videos and pics<br>2. Take two pics and two videos | Both items are uploaded to the correct folder | P m13  t13|  |  |
| Upload to two | 1. Select one of several accounts and an existing folder for pics<br>2. Select another account and folder for videos<br>3. Take two pics and two videos| Every item is uploaded to the correct account and target folder | P m13  t13|  |  |
| Account removed | 1. Select one of several accounts and an existing folder<br>2. Remove the account from the device and take some pics/videos | Feature disabled | P m13  t13|   |  |
|**iCloud album**|||||
| Shared album | 1. Add a Shared Album to Photos app, and share with a different user<br>2. That user in the app, selects "Upload from photo library"<br>3. Select photos from shared album | Photos uploaded| P m13 |   |  |
|**Upgrade**|||||
|  Upgrade | 1.Install previous version<br>2. enable instant uploads with path<br>3. Upgrade to current one | Paths correct. Same path for video and photo by default | P m13 |   |  |