### Automatic Removal


Server(s): oCIS5, oC10.14.0<br>
Device(s): Pixel2 v11, Samsung Tab A8 v13, Pixel 7 v14<br>
Execution date: 28/02/2024 - 05/03/2024<br>
Tester: jrecio <br>
Context: <br>




| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **UI** |   |  |
| Advanced | 1. Open `Settings` > `Advanced` | New option `Delete local copies` available, initially with `never` value. A short explanation about the feature should be visible as well. | P m11 t13 |  |
| Delete local copies | 1. Open `Settings` > `Advanced`<br>2. Open `Delete local copies` | Options available: `never`, `1 hour`, `12 hours`, `1 day`, `30 days`.   | P m11 t13 | FIXED: 24 hours or 1 day | 
| **Actions** |   |  |
| 1 hour | 1. Download several files in different accounts<br>2. Set as available offline several files and folders in different accounts<br>3. In `Delete local copies`, select `1 hour`<br>4. After 30 mins, download and set as av. offline more files and folders<br>5. Wait other 30 mins | After all the time, all downloaded files from step 2. are removed from local storage.<br>All the files downloaded in step 4. are still in local storage<br>All Available offline files from steps 2. and 4. are still available | P m14 | 
| 12 hours | 1. Download several files in different accounts<br>2. Set as available offline several files and folders in different accounts<br>3. In `Delete local copies`, select `12 hour`<br>4. After 5 hours, download and set as av. offline more files and folders<br>5. Wait other 7 hours | After all the time, all downloaded files from step 2. are removed from local storage.<br>All the files downloaded in step 4. are still in local storage<br>All Available offline files from steps 2. and 4. are still available | P m11 t13 | 
| 1 day | 1. Download several files in different accounts<br>2. Set as available offline several files and folders in different accounts<br>3. In `Delete local copies`, select `1 day`<br>4. After 7h, download and set as av. offline more files and folders<br>5. Wait other 17h | After all the time, all downloaded files from step 2. are removed from local storage.<br>All the files downloaded in step 4. are still in local storage<br>All Available offline files from steps 2. and 4. are still available | P m11 t13 | 
| never | 1. Download several files in different accounts<br>2. Set as available offline several files and folders in different accounts<br>3. In `Delete local copies`, select `never`<br>4. Wait 2 days | After 2 days, all downloaded files are still available in local storage. Available offline files are also still available | P t13| 
| Av. offline | 1. Set some files and folders as av. offline<br>2. In `Delete local copies`, select `1 hour`<br>4. Wait 2 hours<br>5. Unset the files and folders as av. offline withour deleting the local copy<br>6. Wait another hour | 4. Av. offline content is not deleted<br>5. Files and folder removed | P m11 t13| 
| No files | 1. Remove all downloaded and av. offline items, so, local storage is empty in several accounts<br>2. In `Delete local copies`, select `1 hour`<br>4. Wait 2 hours | Nothing happens, since there are no files to remove | P m11 | 
| No accounts | 1. Remove all accounts in the device<br>2. In `Delete local copies`, select `1 hour`<br>3. Wait 2 hours | Nothing happens, since there are no files to remove | P m11 | 
| Logs | 1. Enable logs in `Settings`<br>2. Generate some logs<br>3. In `Delete local copies`, select `1 hour`<br>4. Wait 1h | Logs are not removed from local storage | P m11 m14 t13 | 
| **Value change** |   |  |
| never -> 1 hour | 1. In `Delete local copies`, select `never`<br>2. Download several files in different accounts<br>3. Set as available offline several files and folders in different accounts<br>4. After 1h, select `1hour`<br>5. Wait 1h | All downloaded files are removed from local storage. Available offline files are still available | P t13 | 
| 1 hour -> 1 day | 1. In `Delete local copies`, select `1 hour`<br>2. Download several files in different accounts<br>3. Set as available offline several files and folders in different accounts<br>4. After 30 mins, select `1 day`<br>5. Wait 1h<br>6. Wait 1 day | 5. No files are removed from local<br>6. All downloaded files are removed from local storage. Available offline files are still available | P m11 | 
| 1 hour -> never | 1. In `Delete local copies`, select `1 hour`<br>2. Download several files in different accounts<br>3. Set as available offline several files and folders in different accounts<br>4. After 30 mins, select `never`<br>5. Wait 1h | No files are removed from local | P m11 | 
| **Active files** |   |  |
| Upload manually | 1. Select `1 hour` in Setting<br>2. Just before 1h, upload manually a very big file (system will try to remove it while uploading)  | File is being synced in that moment, it shouldn't be removed from tmp | NA | Not reproducible|
| Upload from 3rd party app | 1. Select `1 hour` in Setting<br>2. Just before 1h, share many files from a 3rd party app (system will try to remove it while uploading)  | Files being synced in that moment shouldn't be removed  from tmp | NA | Not reproducible|
| Auto uploads | 1. Select `1 hour` in Setting<br>2. Enable auto uploads for videos<br>3. Just 15 mins before, record a video with the camera in order to be uploaded at the time the cleaning worker runs  | Files being synced in that moment shouldn't be removed from tmp | NA | Not reproducible |
| Failed upload - Connection Enqueued | 1. Select `1 hour` in Setting<br>2. Remove device connection<br>3. Upload manually some files<br>4. Recover device connection<br>  | 3. Files are enqueued in uploads view<br>4. Files upladed correctly | P m11 t13 | 
| Image preview | 1. Select `1 hour` in Setting<br>2. Download a image and preview it<br>3. Keep it in the screen during 1h  | After 1h file is not locally removed | P m11|
| Txt preview | 1. Select `1 hour` in Setting<br>2. Download a text file and preview it<br>3. Keep it in the screen during 1h  | After 1h file is not locally removed | P m11 |
| Video preview | 1. Select `1 hour` in Setting<br>2. Download a video file and preview it during 1h  | After 1h file is not locally removed | P m11 |
| Audio preview | 1. Select `1 hour` in Setting<br>2. Download an audio file and preview it during 1h  | After 1h file is not locally removed | P m11 |
| Bunch | 1. Select `1 hour` in Setting<br>2. Download a bunch of files (more than 1000)<br>3. Wait 1h  | All the files are removed locally  | P m11 |
