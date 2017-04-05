###  Doze adapt 

#### Pr: https://github.com/owncloud/android/pull/1927 

Devices: Nexus10 v5, Huawei 6P v7

Server: v9.1, v10


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | One download | 1. Download a file<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Download is resumed (not immediatly) | P t5 m4 F m7| Notifications -> crash |
| 2 | Several download | 1. Download somes files/folders<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Downloads are resumed (not immediatly) | P t5 m4 F m7| v7:Downloads not resumed |
| 3 | One upload | 1. Upload a big file<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Upload is resumed (not immediatly)  |  P t5 m4 m7 | Not always resumed |
| 4 | Several uploads | 1. Upload somes files<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads are resumed (not immediatly) | P t5 m4 F m7 | v7: Not all are resumed |
| 5 | Instant uploads | 1. Take some pics with instant uploads enabled<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads are performed  | P t5 F m7 | Not resumed |
| 6 | Share with oC | 1. Share content from an external app<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads are performed  | P t5 |  |
| 7 | Uploads&Downloads | 1. Upload and download somes files<br>2. Switch the screen off and set device in idle mode<br>3. Wait a while<br>4. Switch the screen on| Uploads and downloads are resumed (not immediatly) | P t5 |  |
| 8 | No connection | 1. Upload a file<br>2. Switch connection off<br>3. Remove failed in uploads view<br>4. Turn the screen off<br>5. Turn the screen off| Nothing happens | P t5 |  |
| 9 | Switch device off | 1. Upload a file<br>2. Switch device off<br>3. Switch the device on| Nothing happens | P t5 |  |