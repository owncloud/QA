### Camera uploads + picker


#### PR: https://github.com/owncloud/android/pull/3293

**Devices**: Pixel2 v11<br>
**Server**: 10.7


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----: | :---------
|**Install**||||
| Install from scratch | 1. Install app from scratch<br>2. Add an account<br>3. Open `Settings` and enable camera uploads for videos and pictures | Correct camera location by default | P m11 m7 | FIXED: old camera location
|**Android picker**||||
| Picker pictures| 1. Enable auto uploads pictures<br>2. Open `Camera folder(required)`<br>3. Select a correct camera folder| 2. Document provider is opened<br>3. Correct path in `Settings`  | P m11 m7
| Picker videos| 1. Enable auto uploads videos<br>2. Open `Camera folder(required)`<br>3. Select a correct camera folder| 2. Document provider is opened<br>3. Correct path in `Settings`   | P m11 m7
|**Pictures**||||
| Default target| 1. Enable auto uploads pictures and let the default folder (`/CameraUploads`), that does not exist in the account<br>2. Take a picture| Picture uploaded after maximum 15 minutes to `/CameraUploads` after showing a notification with the upload to be done. No local copy in the oC folder | P m11
| New target folder | 1. Enable auto uploads pictures and set a different target folder<br>2. Take a picture| Picture uploaded after maximum 15 minutes to the correct path after showing a notification with the upload to be done. No local copy in the oC folder| P m11 m7
| Different camera app | 1. Enable auto uploads pictures and set a different camera app (f.ex, open camera or another one)<br>2. Take a picture with the new camera<br>3. Take a picture with the built-in camera| 2. Picture uploaded after maximum 15 minutes to the correct folder after showing a notification | P m11 m7
| From SDcard| 1. Enable auto uploads pictures and set as source a SD card location<br>2. Take a picture with the camera | Picture uploaded after maximum 15 minutes to the correct folder after showing a notification with the upload to be done.| P m6 | 
|**Videos**||||
| Default target| 1. Enable auto uploads videos and let the default folder (`/CameraUploads`), that does not exist in the account<br>2. Take a video| Video uploaded after maximum 15 minutes to `/CameraUploads` after showing a notification with the upload to be done. No local copy in the oC folder | P m11 m7
| New target folder | 1. Enable auto uploads video and set a different target folder<br>2. Take a video| Video uploaded after maximum 15 minutes to the correct path after showing a notification with the upload to be done. No local copy in the oC folder| P m11 m7
| Different camera app | 1. Enable auto uploads videos and set a different camera app (f.ex, open camera or another one)<br>2. Take a video with the new camera<br>3. Take a video with the built-in camera| 2. Video uploaded after maximum 15 minutes to the correct folder. No local copy in the oC folder<br>3. Video never uploaded| P m11 m7
| From SDcard| 1. Enable auto uploads videos and set as source a SD card location<br>2. Take a video with the camera | Video uploaded after maximum 15 minutes to the correct folder after showing a notification with the upload to be done.| P m6 | 
|**Notifications**||||
| Enable pictures from scratch | 1. Install from scratch<br>2. Enable auto uploads pictures | Notification about bad path pointing to Settings| P m11 m7 | FIXED: Points to Uploads
| Enable video from scratch | 1. Install from scratch<br>2. Enable auto uploads videos | Notification about bad path pointing to Settings| P m11 m7 | FIXED: Points to Uploads
| Many pictures notification | 1. Enable auto uploads pictures<br>2. Take 10 pictures with the camera| Pictures uploaded after maximum 15 minutes to the correct folder after showing a notification that includes 10 pictures to be synced.| P m11 m7
| Many videos notification | 1. Enable auto uploads videos<br>2. Take 10 videos with the camera| Videos uploaded after maximum 15 minutes to the correct folder after showing a notification that includes 10 videos to be synced.| P m11 m7
|**Regression**||||
| Auto uploads pictures| 1. Enable auto uploads pictures and close the app<br>2. Take 20 pictures| Pictures are uploaded after 15 minutes  | P m11 m7 | FIXED: Repetitions
| Auto uploads videos| 1. Enable auto uploads videos and close the app<br>2. Take 5 videos| Videos are uploaded after 15 minutes  | P m11 m7 | FIXED: Repetitions
| Select move or copy| 1. Enable auto uploads of pictures<br>2. In "Original file will be", select move<br>3. Take a picture<br>4. In "Original file will be", select copy<br>5. Take a picture| 3. The original is not stored in device<br>5. The original is stored in device and in app | P m11 m7
|**Upgrade**||||
| Upgrade both enabled | 1. Install previous version and enable camera uploads for videos and pictures<br>2. Upgrade to the current<br>3. Click on notification<br>4. Select correct camera folder<br>5. Take pictures and videos | 2. User is notified that the camera path is wrong and must be updated<br>3. Redirected to `Settings`> `Auto upload pictures`<br>5. Pictures and videos uploaded | P m11 m7
| Upgrade only pictures | 1. Install previous version without enabling camera uploads for videos and enabling for pictures<br>2. Upgrade to the current<br>3. Click on notification | 2. User is notified that the camera path is wrong and must be updated<br>3. Redirected to `Settings`> `Auto upload pictures` | P m7
| Upgrade only videos | 1. Install previous version without enabling camera uploads for pictures and enabling for videos<br>2. Upgrade to the current<br>3. Click on notification | 2. User is notified that the camera path is wrong and must be updated<br>3. Redirected to `Settings`> `Auto upload video` | P m11
| Upgrade both disabled | 1. Install previous version without enabling camera uploads for videos and pictures<br>2. Upgrade to the current | Everything ok, nothing happens: camera uploads keeps disabled. No notifications | P m11 m7