###  Camera uploads

#### Pr: https://github.com/owncloud/android/pull/2097

Devices: Nexus5 v6

Server: 10.0.6

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**FAB**|||||||
| 1 | Portrait | Open FAB in portrait | Options are correctly displayed | P m6 t7 |  |
| 2 | Landscape | Open FAB in landscape | Options are correctly displayed | P m6 t7 |  |
|**Actions**|||||||
| 3 | Root folder | Take pictures in root folder | Pics are uploaded in root folder | P m6 t7| FIXED: File name not clear |
| 4 | Non root folder | Take pictures in a folder non-root | Pics are uploaded in the correct folder | P m6 t7|  |
| 5 | Retry | 1. Take picture<br>2. Tap on Retry  | Pic is not uploaded | P m6 t7 |  |
| 6 | No wifi connection | 1. Switch connection off<br>2. Take pic<br>3. Switch connection on  | 2. Pics are queued<br>3. Pics are uploaded | P m6 t7|  |
| 7 | No server connection | 1. Switch server off (or maintenance mode)<br>2. Take pic<br>3. Switch server on  | 2. Pics are queued<br>3. Pics are uploaded | P m6 t7|  |
| 8 | Deleted folder | 1. In app, browse to a folder<br>2. In webUI, remove the folder<br>3. Take pic | Pic is not uploaded due to a lack of target folder | P m6 t7| Check folder error |
| 9 | Renamed folder | 1. In app, browse to a folder<br>2. In webUI, rename the folder<br>3. Take pic | Pic is not uploaded due to a lack of target folder | P m6 t7| Check folder error |
| 10 | Moved folder | 1. In app, browse to a folder<br>2. In webUI, rename the folder<br>3. Take pic | Pic is not uploaded due to a lack of target folder | P m6 t7|  |
|**Regression**|||||||
| 11 | Upload files | Upload manually some files in different folders | Files are correctly uploaded | P m6 t7| FIXED: Option switched to move |