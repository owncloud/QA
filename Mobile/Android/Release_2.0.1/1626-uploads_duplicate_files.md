###  BUG: Uploading via share dialog duplicates the photo

#### Pr: https://github.com/owncloud/android/pull/1626

Devices: Nexus5 v5, Nexus 7 v4.3

Server: 9.0.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Google Drive | Share a file from Google Drive | The file is upload to the server, but not remains locally | P m5 t4|  |
| 2 | Dropbox | Share a file from Dropbox | The file is upload to the server, but not remains locally | P m5 t4 |  |
| 3 | One Drive | Share a file from One Drive | The file is upload to the server, but not remains locally | P m5 t4|  |
| 4 | Downloads | Share a file from Downloads | The file is upload to the server, but not remains locally | P m5 t4|  |
| 5 | Photos | Share a file from Photos | The file is upload to the server, but not remains locally | P m5 t4 |  |