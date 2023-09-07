###  Trigger media scan

#### Pr: https://github.com/owncloud/android/pull/2613

Devices: Samsung S9 v9 (m9), Huawei P20 (m9') v9, Nexus 5X v8  <br>
Server: 10.2.1

---

 
| Test Case | Expected | Result | Related Comment / Bug link | 
| :-------- | :------- | :----: | :------------------------- | 
|**Images**||||||
| Download jpg | Gallery shows the image  | P m9 |  |  |  |
| Download png | Gallery shows the image  | P m9 |  |  |  |
| Download gif | Gallery shows the image  | P m9 |  |  |  |
| Download mp4 | Gallery shows the video  | P m9 |  |  |  |
| Download mov | Gallery shows the video  | F m9 | Non native in Android |  |  |
| Download avi | Gallery shows the video  | P m9 |  |  |  |
| Download flv | Gallery shows the video  | P m9 |  |  |  |
|**Downloads regression **||||||
| Download images | Correctly downloaded and previewed  | P m9' m8 |  |  |  |
| Download videos | Gallery shows the video  | P m9' m8 |  |  |  |
|**Wrap**||||||
| Wrap the app with MI and check downloads and uploads | Correctly done  | P m8 m9 | Fail when download images | Wrapped apps, gallery not updated |