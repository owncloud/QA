### PDF View improvements

#### PR: https://github.com/owncloud/ios-app/pull/813

Devices: iPhoneXR v14.2, iPadAir v13, iOS12 simulator<br>
Server: 10.5

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- |
| Non-Full screen portrait | Open PDF file<br>Tap on the screen | PDF is shown in full screen mode | F m14 t13 | Thumbnails view take some time to appear. In 13, thumbnails do not appear |  
| Non-Full screen landscape | Open PDF file<br>Tap on the screen<br>Change orientation | PDF is shown in full screen mode | P m14 F m13 |In 13, thumbnails do not appear  |   
| Full screen portrait | Open PDF file<br>Tap on the screen | PDF is shown in full screen mode | P m14 t13 | |  
| Full screen landscape | Open PDF file<br>Tap on the screen<br>Change orientation | PDF is shown in full screen mode | P m14 t13 | |  
| Full screen through the file | Open PDF file<br>Tap on the screen<br>Swipe to pass through the file | PDF is shown correctly in full screen across the file | P m14 t13 | |  
| Thumbnails portrait | Open PDF file<br>Navigate through thumbnails | Correct navigation. Thumbnails on the bottom | P m14 t13 | |  
| Thumbnails landscape | Open PDF file<br>Rotate and navigate through thumbnails | Correct navigation. Thumbnails on the right | P m14 F t13| In iPad should appear on the right, not in the bottom| |   
| iOS12 | Open PDF file | Thumbnails always on the bottom. Full screen not available.| F s12 |  | |  