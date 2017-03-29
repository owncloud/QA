###  Doze adapt 

#### Pr: https://github.com/owncloud/android/pull/1927 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | One download | 1. Download a file<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Download is resumed (not immediatly)    |  |  |
| 2 | Several download | 1. Download somes files/folders<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Downloads are resumed (not immediatly) |  |  |
| 3 | One upload | 1. Upload a big file<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Upload is resumed (not immediatly)    |  |  |
| 4 | Several uploads | 1. Upload somes files<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads are resumed (not immediatly) |  |  |
| 5 | Instant uploads | 1. Take some pics with instant uploads enabled<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads are performed  |  |  |
| 6 | Share with oC | 1. Share content from an external app<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads are performed  |  |  |
| 7 | Uploads&Downloads | 1. Upload and download somes files<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads and downloads are resumed (not immediatly) |  |  |