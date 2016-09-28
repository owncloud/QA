###  Chunk assembling big files, increasing timeout

#### Pr: https://github.com/owncloud/android-library/pull/136

Devices: Samsung Galaxy Note 4, Nexus7 v4.3

Server: 9.1.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Size less 500 MB | 1. Upload a file whose size is less than 500MB | File is correctly uploaded| P m6 |  |
| 2 | Size about 500 MB | 1. Upload a file whose size is about 500MB | File is correctly uploaded| P m6 |  |
| 3 | Size about 1 GB | 1. Upload a file whose size is about 1GB | File is correctly uploaded| P t4 |  |
| 4 | Size great than 2 GB | 1. Upload a file whose size is greater than 2GB | File is correctly uploaded|  |  |