###  Share option federated shares v9.1 

#### Pr: https://github.com/owncloud/ios/pull/1752 

Devices: Nexus 5 v5.0.1, Nexus 9 v6

Server: v9.1, v9.0, v8.2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**View**||||||
| 1 | Switch button version 9.1 | 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server<br>3. Tap on (>) | A switch button "Can share" is displayed (check in both orientations) | P m5 t6|  |
| 2 | Switch button version < 9.1 | 1. Login in server 9.0 or 8.2<br>2. Share a file and a folder with a user in another server<br>3. Tap on (>) | A switch button "Can share" is not displayed (check in both orientations) | P m5 t6|  |
|**Share with users from 9.1**||||||
| 3 | 9.1 --> 9.1 with share permission| 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server 9.1<br>3. Tap on (>) and enable "Can share"<br>4. In server, accept the share<br>5. In app, re-share the content with a user in the same server<br>6. In app, re-share the content with a user in another server|4. The file/folder appear in file list<br>5. Content can be shared, the sharee see the file<br>6. Content can be shared, the sharee see the file after accepting it | P m5 t6| SOLVED: Can Share disable by default for folders |
| 4 | 9.1 --> 9.1 without share permission| 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server 9.1<br>3. Tap on (>) and disable "Can share"<br>4. In server, accept the share<br>5. In app, re-share the content with a user in the same server<br>6. In app, re-share the content with a user in another server|4. The file/folder appear in file list<br>5. Content is not shared<br>6. Content is not shared after accepting it | P m5 t6|  |
| 5 | 9.1 --> v<9.1 with share permission| 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server 9.0 or 8.2<br>3. Tap on (>) and enable "Can share"<br>4. In server, accept the share<br>5. In app, re-share the content with a user in the same server<br>6. 5. In app, re-share the content with a user in another server|4. The file/folder appear in file list<br>5. Content can be shared, the sharee see the file<br>6. Content can be shared, the sharee see the file after accepting it | P m5 t6| SOLVED: Can Share disables Can Edit |
| 6 | 9.1 --> 9.0 without share permission| 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server 9.0 or 8.2<br>3. Tap on (>) and disable "Can share"<br>4. In server, accept the share<br>5. In app, re-share the content with a user in the same server<br>6. 5. In app, re-share the content with a user in another server|4. The file/folder appear in file list<br>5. Content is not shared<br>6. Content is not shared after accepting it | P m5 t6|  |
| 7 | 9.1 --> 8.2 without share permission| 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server 9.0 or 8.2<br>3. Tap on (>) and disable "Can share"<br>4. In server, accept the share<br>5. In app, re-share the content with a user in the same server<br>6. 5. In app, re-share the content with a user in another server|4. The file/folder appear in file list<br>5. Content is shared (feature!!)<br>6. Content is shared after accepting it(feature!!) | P m5 t6|  |
|**Share by link from 9.1**||||||
| 8 | Share permission | 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server<br>3. Tap on (>) and enable "Can share"<br>4. In server, accept the share<br>5. In app, re-share the content by link|4. The file/folder appear in file list<br>5. Content can be shared, the link works| P m5 t6|  |
| 9 | No share permission| 1. Login in server 9.1<br>2. Share a file and a folder with a user in another server<br>3. Tap on (>) and disable "Can share"<br>4. In server, accept the share<br>5. In app, share the content by link|4. The file/folder appear in file list<br>5. Content is not shared | P m5 t6|  |
|**Previous behaviour**||||||
| 10 | 9.0/8.2 share with users| 1. Login in server 9.0/8.2<br>2. Share a file and a folder with a user in another server<br>3. In server, accept the share<br>4. In app, re-share the content user in the same server<br>5. In app, re-share the content with a user in another server|2. Check in privileges view that the option "Can Share" does not appear<br>3. The file/folder appear in file list<br>4. Resharing allowed<br>5. Resharing allowed | P m5 t6| In 8.2 can not be checked due a regression bug |
| 11 | 9.0/8.x share by link  | 1. Login in server 9.0/8.x<br>2. Share a file and a folder with a user in another server<br>3. In server, accept the share<br>4. In app, re-share the content by link|3. The file/folder appear in file list<br>4. Resharing allowed| P m5 t6| In 8.2 can not be checked due a regression bug |
