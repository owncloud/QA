###  Resized images 

#### Pr: https://github.com/owncloud/android/pull/1599 

Devices: Nexus5 v6, Nexus 7 v4.3

Server: 9.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**List view**||||||
| 1 | Portrait  | Set the device in portrait and tap on a image |  The image is opened full-screen and is not downloaded (check in device storage). Change orientation in full screen  | F m6 t4| Bad preview |
| 2 | Landscape  | Set the device in landscape and tap on a image |  The image is opened full-screen and is not downloaded (check in device storage). Change orientation in full screen | F m6 t4| Bad preview |
|**Grid view**||||||
| 3 | Portrait  | Set the device in portrait and tap on a image |  The image is opened full-screen and is not downloaded (check in device storage). Change orientation in full screen  | F m6 t4| Bad preview |
| 4 | Landscape  | Set the device in landscape and tap on a image |  The image is opened full-screen and is not downloaded (check in device storage). Change orientation in full screen | F m6 t4| Bad preview |
|**Download option**||||||
| 5 | Option in menu | Tap on a non-downloaded image and on (...) menu | Option "Download" appears | P m6 t4 | |
| 6 | Option in menu | Tap on a downloaded image and on (...) menu | Option "Download" does not appear | P m6 t4 | |
|**Actions**||||||
| 7 | Download | 1. Tap on a image<br>2. Tap on menu to download|  The image is downloaded and the full screen view remains | P m6 t4 | |
| 8 | Available offline | 1. Tap on a not availabel offline image<br>2. Tap on menu to set the image as available offline|  The image is downloaded and the full screen view remains | | |
| 9 | Not Available offline | 1. Tap on a available offline image<br>2. Tap on menu to set the image as not available offline|  The image is remove from the device and the full screen view remains | | |
| 10 | Remove | 1. Tap on a image<br>2. In server or in another client, remove the image|  The image remains. If any action is tried to be performed, fails. | | |