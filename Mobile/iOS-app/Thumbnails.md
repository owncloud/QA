#### Thumbnails 

#### PRs: https://github.com/owncloud/ios-app/pull/32<br>


Device/s: iPhoneX v11 <br>
Server: 10.0.8

Number of tests: 14<br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: |
|**Formats**||||||
| JPG | Check non-downloaded JPG thumbnails | Correctly displayed | P m11 |  |
| PNG | Check non-downloaded PNG thumbnails | Correctly displayed | P m11 |  |
| BMP | Check non-downloaded BMP thumbnails | Correctly displayed | P m11 |  |
| GIF | Check non-downloaded GIF thumbnails | Correctly displayed | P m11 |  |
| SVG | Check non-downloaded SVG thumbnails | Correctly displayed | NA | Not displayed |
| TIFF | Check non-downloaded TIFF thumbnails | Correctly displayed | NA | Not displayed |
|**Orientations**||||||
| Portrait | Check thumbnails in portrait | Correctly displayed | P m11 |  |
| Landscape | Check thumbnails in landscape | Correctly displayed | P m11 |  |
|**Actions**||||||
| Scroll down | Scroll down in file list to display more pics | Thumbnail correctly displayed | P m11 |  |
| Scroll up | Check thumbnails in portrait | Correctly displayed | P m11 |  |
| Browse forward | Check thumbnails in portrait | Correctly displayed | P m11 |  |
| Browse back | Check thumbnails in portrait | Correctly displayed | P m11 |  |
|**Non-connection**||||||
| Server | Remove connection to the server | Correctly displayed the downloaded | P m11 |  |
|**Server**||||||
| OAuth2 | Check the format cases in a OAuth2 server | Correctly displayed the downloaded | P m11 |  |
