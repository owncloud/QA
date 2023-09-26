### Camera uploads fixed account

**PR**: https://github.com/owncloud/android/pull/3226

**Devices**: Pixel2 v11, Nexus 6P v7 <br>
**Server**: 10.7


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----: | :--------------- | 
|**View**||||||
| Portrait Pictures| Enter in the Settings view, Auto Upload Pictures, setting portrait orientation | Section `Account to upload` correctly displayed | P m11 m7 | 
| Portrait Videos| Enter in the Settings view, Auto Upload Videos, setting portrait orientation | Section `Account to upload` correctly displayed |  P m11 m7| 
| Landscape Pictures| Enter in the Settings view, Auto Upload Pictures, setting landscape orientation | Section `Account to upload` correctly displayed | P m11 m7 | 
| Landscape Videos| Enter in the Settings view, Auto Upload Videos, setting landscape orientation | Section `Account to upload` correctly displayed |P m11  m7 | 
| Enable Pictures | Enable Picture Uploads  | Account section is unlocked. Account is set by default | P m11 m7| 
| Picker Account Pictures | 1. Enable Picture Uploads<br>2. Tap on `Account to upload pictures`  | Picker shows the available accounts (in both orientations) | P m11 m7| 
| Picker Target Pictures | 1. Enable Picture Uploads<br>2. Tap on upload path  | Picker shows structure of the account correctly, starting by `\CameraUpload` folder |P m11  m7| 
| Enable Videos | Enable Video Uploads  | Account section is unlocked. Account is set by default | P m11 m7|
| Picker Account Videos | 1. Enable Video Uploads<br>2. Tap on `Account to upload pictures`  | Picker shows the available accounts (in both orientations) | P m11 m7|  
| Picker Target  Videos | Enable Picture Uploads<br>Tap on upload path  | Picker shows structure of the account correctly, starting by `\CameraUpload` folder (check also in server)| P m11 m7 | 
|**One account in device**||||||
|**Pictures**|||||
| Picture to default | 1. Enable Picture Uploads<br>2. Take a picture with the camera  | After max 15 mins, picture will be stored in `\CameraUpload` folder | P m11 m7 | 
| Switch location to root | 1. Enable Picture Uploads<br>2. Select `\` as upload path<br>3. Take a picture with the camera  | After max 15 mins, picture will be stored in `\` folder | P m11 m7 | 
| Switch location to other subfolder | 1. Enable Picture Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Take a picture with the camera  | After max 15 mins, picture will be stored in `\A\B\C\` folder | P m11 m7 | 
| Disable Pictures | 1. Enable Picture Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Enable wifi only<br>4. Change move/keep behaviour to move<br>5. Disable Picture uploads | Section is disabled.<br>Account is `Not Set`.<br>Upload path is `CameraUpload`.Only wifi and behaviour are not reset  | P m11 m7 | 
| Remove location | 1. Enable Picture Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Remove/rename/move folder `\A\B\C\`<br>4. Take some pictures | Target folder is recreated and pictures are uploaded there  | P m11 m7 | 
| Remove account warning | 1. Enable Picture Uploads<br>2. Go to Accounts manager and remove the account| Warning is displayed to let user know that the account is attached to auto uploads |  P m11 m7| 
| Remove account reset | 1. Enable Picture Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Go to Accounts manager and remove the account<br>4. Add again an account<br>5. Open Settings > Auto upload pictures  | 3. Auto uploads sections are hidden inside `Settings`<br>5. Auto uploads disabled. Account and path have default values | P m11 m7 | 
|**Videos**|||||
| Video to default | 1. Enable Video Uploads<br>2. Take a video with the camera  | After max 15 mins, video will be stored in `\CameraUpload` folder (check also in server)| P m11 m7| 
| Switch location to root | 1. Enable Video Uploads<br>2. Select `\` as upload path<br>3. Take a video with the camera  | After max 15 mins, video will be stored in `\` folder | P m11  m7| 
| Switch location to other subfolder | 1. Enable Video Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Take a video with the camera  | After max 15 mins, video will be stored in `\A\B\C\` folder | P m11 m7 | 
| Disable Videos | 1. Enable Video Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Enable wifi only<br>4. Change move/keep behaviour to move<br>5. Disable Video uploads | Section is disabled.<br>Account is `Not Set`.<br>Upload path is `CameraUpload`.Only wifi and behaviour are not reset  | P m11 m7 | 
| Remove location | 1. Enable Video Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Remove/rename/move folder `\A\B\C\`<br>4. Take some videos | Target folder is recreated and pictures are uploaded there| P m11  m7| 
| Remove account warning | 1. Enable Video Uploads<br>2. Go to Accounts manager and remove the account| Warning is displayed to let user know that the account is attached to auto uploads | P m11  m7| 
| Remove account reset | 1. Enable Video Uploads<br>2. Select `\A\B\C\` as upload path<br>3. Go to Accounts manager and remove the account<br>4. Add again an account<br>5. Open Settings > Auto upload videos | 3. Auto uploads sections are hidden inside `Settings`<br>5. Auto uploads disabled. Account and path have default values | P m11  m7| 
|**More than one account in device**||||||
|**Pictures**|||||
| Switch account picker | 1. Enable Picture Uploads<br>2. Select a different account<br>3. Open picker to select target | Correct folder structure displayed | P m11 m7 | 
| Switch account upload | 1. Enable Picture Uploads<br>2. Select a different account<br>3. Open picker  to select a target<br>4. Take a picture and wait max 15 mins | Picture uploaded to correct location | P m11 m7| 
| Remove account not selected | 1. Enable Picture Uploads<br>2. Go to Accounts manager and remove one account that is not selected as upload account | Nothing happens | P m11 m7 | 
| Remove account selected | 1. Enable Picture Uploads<br>2. Go to Accounts manager and remove the selected as upload account<br>3. Open Settings > Picture auto uploads | 2. Warning displayed<br>3. Auto uploads are disabled| P m11 m7| 
|**Videos**|||||
| Switch account picker | 1. Enable Video Uploads<br>2. Select a different account<br>3. Open picker to select target | Correct folder structure displayed | P m11  m7| 
| Switch account upload | 1. Enable Video Uploads<br>2. Select a different account<br>3. Open picker  to select a target<br>4. Take a video and wait max 15 mins | Video uploaded to correct location | P m11 m7|
| Remove account not selected | 1. Enable Video Uploads<br>2. Go to Accounts manager and remove one account that is not selected as upload account | Nothing happens | P m11 m7 | 
| Remove account selected | 1. Enable Video Uploads<br>2. Go to Accounts manager and remove the selected as upload account<br>3. Open Settings > Video auto uploads | 2. Warning displayed<br>3. Auto uploads are disabled| P m11 m7| 
|**Both**||||| 
| Switch account upload | 1. Enable Picture and Video Uploads<br>2. Select a different accounts in both<br>3. Open picker to select a correct target in both<br>4. Take pictures and videos and wait max 15 mins | Pictures uploaded to correct location<br>Videos uploaded to correct location | P m11 m7 |
| Remove account videos | 1. Enable Picture and Video Uploads<br>2. Set different account to upload for pictures and videos<br>3. Go to Accounts manager and remove the selected for videos<br>4. Open Settings > Video auto uploads<br>5. Open Settings > Picture auto uploads | 4. Auto uploads are disabled<br>5. Auto uploads enabled with the correct account| P m11 m7 | 
| Remove account pictures | 1. Enable Picture and Video Uploads<br>2. Set different account to upload for pictures and videos<br>3. Go to Accounts manager and remove the selected for pictures<br>4. Open Settings > Video auto uploads<br>5. Open Settings > Picture auto uploads | 4. Auto uploads enabled with the correct account<br>5. Auto uploads are disabled| P m11 m7| 