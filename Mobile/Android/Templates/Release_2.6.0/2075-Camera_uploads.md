###  Camera uploads

#### Pr: https://github.com/owncloud/android/pull/2075

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**FAB**|||||||
| 1 | Portrait | Open FAB in portrait | Options are correctly displayed |  |  |
| 2 | Landscape | Open FAB in landscape | Options are correctly displayed |  |  |
|**Actions**|||||||
| 3 | Root folder | Take pictures in root folder | Pics are uploaded in root folder |  |  |
| 4 | Non root folder | Take pictures in a folder non-root | Pics are uploaded in the correct folder |  |  |
| 5 | Retry | 1. Take picture<br>2. Tap on Retry  | Pic is not uploaded |  |  |
| 6 | No wifi connection | 1. Switch connection off<br>2. Take pic<br>3. Switch connection on  | 2. Pics are queued<br>3. Pics are uploaded |  |  |
| 7 | No server connection | 1. Switch server off (or maintenance mode)<br>2. Take pic<br>3. Switch server on  | 2. Pics are queued<br>3. Pics are uploaded |  |  |
| 8 | Deleted folder | 1. In app, browse to a folder<br>2. In webUI, remove the folder<br>3. Take pic | Pic is not uploaded due to a lack of target folder |  |  |
| 9 | Renamed folder | 1. In app, browse to a folder<br>2. In webUI, rename the folder<br>3. Take pic | Pic is uploaded correctly |  |  |
| 10 | Moved folder | 1. In app, browse to a folder<br>2. In webUI, rename the folder<br>3. Take pic | Pic is not uploaded due to a lack of target folder |  |  |
|**Regression**|||||||
| 11 | Upload files | Upload manually some files in different folders | Files are correctly uploaded |  |  |