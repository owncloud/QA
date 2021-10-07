### Upload when charging


#### PR: https://github.com/owncloud/android/pull/3385

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.8



| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**View**||||
| Portrait Pictures | 1. Open Settings > Auto Upload Pictures | New section is visible at the bottom. Comment about how it works | P m11 m7 |  |
| Landscape Pictures | 1. Open Settings > Auto Upload Pictures | New section is visible at the bottom. Comment about how it works | P m11 m7|  |  |
| Portrait Videos | 1. Open Settings > Auto Upload Videos | New section is visible at the bottom. Comment about how it works | P m11 m7|  |  |
| Landscape Videos | 1. Open Settings > Auto Upload Videos | New section is visible at the bottom. Comment about how it works | P m11 m7|  |  |
|**Actions Pictures**||||
| Options not selected | 1. Enable Auto uploads pictures with "Charging" and "Only Wifi" options not selected<br>2. Take some pictures | Pictures uploaded  | P m11 m7|
| Options not selected + charging | 1. Enable Auto uploads pictures with "Charging" and "Only Wifi" options not selected<br>2. Take some pictures with device charging | Pictures uploaded  | P m11 m7  |
| Charging selected | 1. Enable Auto uploads pictures with only "Charging" option selected<br>2. Take some pictures (device not charging)<br>3. Plug the device in to charge it | 2. Pictures not uploaded<br>3. Pictures uploaded in maximum 15 mins | P m11 m7 | 
| Charging + Wifi selected | 1. Enable Auto uploads pictures with both "Charging" and "Wifi only" options selected (device under wifi)<br>2. Take some pictures (device not charging)<br>3. Plug the device in to charge it and take more pictures | 2. Pictures not uploaded<br>3. All pictures uploaded in maximum 15 mins | P m7 m11 | 
|**Regression Pictures**||||
| Wifi only | 1. Enable Auto uploads pictures with Only wifi option selected<br>2. Take some pictures under wifi | Pictures uploaded in maximum 15 mins | P m7 m11| 
| Wifi only  | 1. Enable Auto uploads pictures with Only wifi option selected<br>2. Take some pictures under 4G/5G and device charging<br>3. Move device to Wifi and take more pictures | 2. Pictures not uploaded<br>3. All pictures uploaded in maximum 15 mins | P m11 |  Tested with one device (1 sim)| 
|**Actions Videos**||||
| Options not selected | 1. Enable Auto uploads videos with "Charging" and "Only Wifi" options not selected<br>2. Take some videos | Videos uploaded  | P m7 m11 |
| Options not selected + charging | 1. Enable Auto uploads videos with "Charging" and "Only Wifi" options not selected<br>2. Take some videos with device charging | Videos uploaded  | P m11 m7 |
| Charging selected | 1. Enable Auto uploads videos with only "Charging" option selected<br>2. Take some videos (device not charging)<br>3. Plug the device in to charge it | 2. Videos not uploaded<br>3. Videos uploaded in maximum 15 mins | P m11 m7 | 
| Charging + Wifi selected | 1. Enable Auto uploads videos with both "Charging" and "Wifi only" options selected (device under wifi)<br>2. Take some videos (device not charging)<br>3. Plug the device in to charge it and take more videos | 2. Videos not uploaded<br>3. All pictur videos uploaded in maximum 15 mins | P m11 m7| 
|**Regression Videos**||||
| Wifi only | 1. Enable Auto uploads videos with "Only wifi" option selected<br>2. Take some videos under wifi | Videos uploaded in maximum 15 mins | P m11 m7 | 
| Wifi only  | 1. Enable Auto uploads videos with "Only wifi" option selected<br>2. Take some videos under 4G/5G and device charging<br>3. Move device to Wifi and take more videos | 2. Videos not uploaded<br>3. All videos uploaded in maximum 15 mins | P m11 | Tested with one device (1 sim)| 