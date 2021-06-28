### Camera uploads + picker


#### PR: https://github.com/owncloud/android/pull/

**Devices**: <br>
**Server**: 


Test Case | Steps | Expected Result | Result | Related Comment
| :------ | :---- | :-------------- | :----- | :---------
|**Install**||||
| Install from scratch | 1. Install app from scratch<br>2. Add an account<br>3. Open `Settings` and enable camera uploads for videos and pictures | Correct camera location by default |
|**Android picker**||||
| Picker pictures| 1. Enable auto uploads pictures<br>2. Open `Camera folder(required)`<br>3. Select a correct camera folder| 2. Document provider is opened<br>3. Correct path in settings  |
| Picker videos| 1. Enable auto uploads videos<br>2. Open `Camera folder(required)`<br>3. Select a correct camera folder| 2. Document provider is opened<br>3. Correct path in settings   |
|**Pictures**||||
| Default target| 1. Enable auto uploads pictures and let the default folder (`/CameraUploads`), that does not exist in the account<br>2. Take a picture| Picture uploaded after maximum 15 minutes to `/CameraUploads` after showing a notification with the upload to be done |
| New target folder | 1. Enable auto uploads pictures and set a different target folder<br>2. Take a picture| Picture uploaded after maximum 15 minutes to the correct path |
| Different camera app | 1. Enable auto uploads pictures and set a different camera app (f.ex, open camera or another one)<br>2. Take a picture with the new camera<br>3. Take a picture with the built-in camera| 2. Picture uploaded after maximum 15 minutes to the correct folder<br>3. Picture never uploaded|
|**Videos**||||
| Default target| 1. Enable auto uploads videos and let the default folder (`/CameraUploads`), that does not exist in the account<br>2. Take a video| Video uploaded after maximum 15 minutes to `/CameraUploads` after showing a notification with the upload to be done |
| New target folder | 1. Enable auto uploads video and set a different target folder<br>2. Take a video| Video uploaded after maximum 15 minutes to the correct path after showing a notification with the upload to be done|
| Different camera app | 1. Enable auto uploads videos and set a different camera app (f.ex, open camera or another one)<br>2. Take a video with the new camera<br>3. Take a video with the built-in camera| 2. Video uploaded after maximum 15 minutes to the correct folder after showing a notification with the upload to be done<br>3. Video never uploaded|
|**Notifications**||||
| Many pictures notification | 1. Enable auto uploads pictures<br>2. Take 10 pictures with the camera| 2. Pictures uploaded after maximum 15 minutes to the correct folder after showing a notification that includes 10 pictures to be synced|
| Many videos notification | 1. Enable auto uploads videos<br>2. Take 10 videos with the camera| 2. Videos uploaded after maximum 15 minutes to the correct folder after showing a notification that includes 10 videos to be synced|
| Many items notification | 1. Enable auto uploads videos and pictures<br>2. Take 10 videos and pictures with the camera| 2. Everything uploaded after maximum 15 minutes to the correct folder after showing a notification that includes 20 items to be synced|
|**Regression**||||
| Only wifi| 1. Enable auto uploads pictures and only with wifi<br>2. Using 3G/4G, take a picture<br>3. When wifi is back, take another picture | 2. The picture is not uploaded and no error is notified<br>3. The picture is upload after 15 mins maximum |
| Select move or copy| 1. Enable auto uploads of pictures<br>2. In "Original file will be", select move<br>3. Take a picture<br>4. In "Original file will be", select copy<br>5. Take a picture| 3. The original is not stored in device<br>5. The original is stored in device and in app |
|**Upgrade**||||
| Upgrade both enabled | 1. Install previous version and enable camera uploads for videos and pictures<br>2. Upgrade to the current<br>3. Click on notification | User is notified that the camera path is wrong and must be updated<br>3. Redirected to `Settings` |
| Upgrade only pictures | 1. Install previous version without enabling camera uploads for videos and enabling for pictures<br>2. Upgrade to the current<br>3. Click on notification | 2. User is notified that the camera path is wrong and must be updated<br>3. Redirected to `Settings`> `Auto upload pictures` |
| Upgrade only videos | 1. Install previous version without enabling camera uploads for pictures and enabling for videos<br>2. Upgrade to the current<br>3. Click on notification | 2. User is notified that the camera path is wrong and must be updated<br>3. Redirected to `Settings`> `Auto upload video` |
| Upgrade both disabled | 1. Install previous version without enabling camera uploads for videos and pictures<br>2. Upgrade to the current | Everything ok, nothing happens: camera uploads keeps disabled. No notifications |