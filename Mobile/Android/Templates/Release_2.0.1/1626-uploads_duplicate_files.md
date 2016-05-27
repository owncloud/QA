###  BUG: Uploading via share dialog duplicates the photo

#### Pr: https://github.com/owncloud/android/pull/1626

Devices: 

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Google Drive | Share a file from Google Drive | The file is upload to the server, but not remains locally |  |  |
| 2 | Dropbox | Share a file from Dropbox | The file is upload to the server, but not remains locally |  |  |
| 3 | One Drive | Share a file from One Drive | The file is upload to the server, but not remains locally |  |  |
| 4 | Downloads | Share a file from Downloads | The file is upload to the server, but not remains locally |  |  |
| 5 | Videos | Share a file from Videos | The file is upload to the server, but not remains locally |  |  |
| 6 | Photos | Share a file from Photos | The file is upload to the server, but not remains locally |  |  |