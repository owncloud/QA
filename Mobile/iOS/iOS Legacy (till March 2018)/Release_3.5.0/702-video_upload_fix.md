###  BUG: Video upload fix 

#### Pr: https://github.com/owncloud/ios/pull/702

Devices: iPhone6S v9.1, iPadAir v8.4

Server: v9.1beta2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------: | :---- | :-------------- | :----: | :-------------- |
| 1 | Root | Upload a file in root folder |  Video is uploaded and can be played (check in server side) | P m9 t8|  |
| 2 | No Root | Upload a file in a no-root folder |  Video is uploaded and can be played (check in server side) | P m9 t8|  |
| 3 | Instant upload | 1. Upload a video<br>2. Enable instant uploads and take a pic |  Both are uploaded and can be played (check in server side)| P m9 t8|  |
| 4 | Conflict I | 1. Upload a video<br>2. Upload again thesame video<br>3. Solve the conflict with overwrite |  Video is overwritten and can be played (check in server side)| P m9 t8|  |
| 5 | Conflict II | 1. Upload a video<br>2. Upload again thesame video<br>3. Solve the conflict with rename |  Video is renamed and can be played (check in server side)| P m9 t8 |  |
| 6 | Multiaccount | In several accounts upload some videos |  Videos are uploaded correctly and can be played (check in server side)| P m9 t8|  |
| 7 | Background | Upload a huge video and wait until background is active.   |  Video is uploaded and can be played (check in server side)| P m9 t8 |  |
|**Special servers**|One device|||||
| 8 | Redirect | Upload a video |  Video is uploaded and can be played (check in server side)| P m9 |  |
| 9 | Shibboleth | Upload a video |  Video is uploaded and can be played (check in server side)| P m9 |  |