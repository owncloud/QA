### Take Photo/Video inside the app

#### PR: [https://github.com/owncloud/ios-app/pull/707](https://github.com/owncloud/ios-app/pull/707)

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**View**|
| Portrait | In the file list, open the '+' menu | Take Photo/Video option is there | P m13 t13 |  |
| Landscape | In the file list, open the '+' menu | Take Photo/Video option is there | P m13 t 13|  |
|**Photo**|
| Root | Select Take Photo/Video option in root folder<br>Take a photo | Pic is uploaded to root folder | P m13 t13| FIXED: not working in HEIC |
| Non-Root | Select Take Photo/Video option in non-root folder<br>Take a photo | Pic is uploaded to the correct folder | P m13 t13 |  |
| JPG | In Settings, enable `Convert heic to jpg`<br>Select Take Photo/Video option<br>Take a photo | Pic is uploaded in jpg format | P m13 t13 |  |
| Retake | Select Take Photo/Video option<br>Take a photo<br>Select `Retake`<br>Take another photo<br>Accept | Only second photo is uploaded  | P m13 t13|  |
|**Video**|
| Root | Select Take Photo/Video option in root folder<br>Take a video | Video is uploaded to root folder | P m13 t13 |  |
| Non-Root | Select Take Photo/Video option in non-root folder<br>Take a video | Video is uploaded to the correct folder | P m13 t13 |  |
| Retake | Select Take Photo/Video option<br>Take a video<br>Select `Retake`<br>Take another video<br>Accept | Only second video is uploaded  | P m13 t13 |  |
