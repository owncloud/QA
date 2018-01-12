###  Camera uploads

#### Pr: https://github.com/owncloud/android/pull/2062

Server: 10.0.3, 10.0.4

Devices: Galaxy Note 4 v6, Nexus 6P v7, Nexus 5X v8, Nexus 9 v7

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Wording**|||||||
| 1 | New feature wording | Open Settings view | Wording is correct | P m6 m7 m8| FIXED: Wording to improve |
|**Picture uploads enabled**|||||||
| 2 | Enabled - 1 pic | 1. Enable picture uploads<br>2. Take one pic | Pic is uploaded | P m6 m7 | FIXED: Not uploaded |
| 3 | Enabled - 5 pics | 1. Enable picture uploads<br>2. Take 5 pics | Pics are uploaded | P m6 m7 | FIXED: not uplaoded|
| 4 | Enabled - 15 pics | 1. Enable picture uploads<br>2. Take 15 pics | Pics are uploaded | P m7 m7|  |
| 5 | Enabled - 50 pics | 1. Enable picture uploads<br>2. Take 50 pics | Pics are uploaded | P m6 m8 |  |
| 6 | Enabled > 50 pics | 1. Enable picture uploads<br>2. Take > 50 pics | Pics are uploaded | P m6 m8|  |
| 7 | Switching option | 1. Enable picture uploads<br>2. Take some pics<br>3. Disable option<br>4. Take some pics<br>5. Enable option<br>6. Take some pics | 3. User is warned about videos aren't uploaded<br>4. Pics are never uploaded<br>6. Pics are uploaded  | P m8 t7 |   |
|**Video uploads enabled**|||||||
| 8 | Enabled - 1 video | 1. Enable video uploads<br>2. Take one video | Video is uploaded | P m7 t7|  |
| 9 | Enabled - 5 videos | 1. Enable video uploads<br>2. Take 5 videos | Videos are uploaded | P m6 t7|  |
| 10 | Enabled - 15 videos | 1. Enable video uploads<br>2. Take 15 videos | Videos are uploaded | P m7 t7 |  |
| 11 | Switching option | 1. Enable videos uploads<br>2. Take some videos<br>3. Disable option<br>4. Take some videos<br>5. Enable option<br>6. Take some videos | 3. User is warned about videos aren't uploaded<br>4. Videos are never uploaded<br>6. Videos are uploaded | P m8 t7 |  |
|**Mix set up**|||||||
| 12 | Picture Disabled + Video Enabled | Take some pics and videos | Only videos are uploaded | P m6 m8 |  |
| 13 | Picture Enabled + Video Disabled | Take some pics and videos | Only pics are uploaded | P m7 m8 |  |
| 14 | Both enabled | Take some pics and videos | All are uploaded | P m7 m6 |  |
| 15 | Both disabled | Take some pics and videos | No uploads | P m7 m6 |  |
| 16 | Switching option | 1. Enable videos and pics uploads<br>2. Take some videos and pics<br>3. Disable video<br>4. Take some videos and pics<br>5. Enable video and disable pics| 3. User warned about videos aren't uploaded. Pics are uploaded<br>5. User warned about pics aren't uploaded. Videos uploaded  | P m8 t7 |  |
|**Uploads list**|||||||
| 17 | Delete from list | 1. Take some pics/videos<br>2. When they are queued, switch connection off<br>3. Remove some of them from the upload list<br>4. Switch connection on | The remaining are uploaded. The deleted are never queued | P t7 m6 |  |
|**Camera folder**|||||||
| 18 | Other folder | 1. Set as camera folder a different one from the current<br>2. Take videos and pics | Nothing uploaded | P m6 t7 m8|  |
| 19 | Switch camera folder | 1. From previous case, switch to the camera folder<br>2. Take videos and pics | Only pics and videos after switching folder are uploaded, not the previous ones. | P m6 t7 m8|  |
|**Device operations**|||||||
| 20 | Kill app | 1. Kill the app after enabling instant uploads<br>2. After some time, take pics and videos<br>3. After some time, reopen the app | Check uploaded pics and videos| P m6 t7|
| 21 | Reboot device | 1. Enable instant uploads and close the app<br>2.Take pics and videos<br>3. Switch device off<br>4. Switch device on| Check uploaded pics and videos| P m6 m8 |  |  
|**Wifi/4G**|||||||
| 22 | Only wifi enabled | 1. Take pics and videos under 4G<br>2. After some time, enable wifi and take pics&videos<br> |1. Pics and videos queued<br>2. Pics and videos uploaded | P m7 m8 |  |
| 23 | Only wifi disabled | 1. Take pics and videos under 4G | Pics and videos uploaded| P m7 m8 | |
| 24 | Switch option | 1. Enable "only wifi"<br> 2. Take pics and videos under 4G<br>3. After some time, disable "only wifi" and take pics&videos<br> |2. Pics and videos queued<br>3. Pics and videos uploaded and previous keep queued | P m7 m8 |  |
| 25 | Mixed | 1. Enable "only wifi" for pics and disable for videos<br> 2. Take pics and videos under 4G | Pics queued and videos uploaded| P m7 m8|  |
| 26 | Mixed II | 1. Enable "only wifi" for videos and disable for pics<br> 2. Take pics and videos under 4G | Pics uploaded and videos queued| P m7 m8 |  |
|**Upload folder**|||||||
| 27 | Different upload folder | 1. Take pics and videos<br>2. Change upload folder in both pics and videos | Pics and videos uploaded to the correct folder | P t7 m8 |  |
|**Upgrade**|||||||
| 28 | Upgrade from latest version | 1. Install latest version<br>2. Upgrade to that one | Correct config in settings view | F t7 m8 | RESETED |