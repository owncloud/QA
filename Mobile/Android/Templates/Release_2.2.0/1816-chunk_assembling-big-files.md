###  Chunk assembling big files, increasing timeout

#### Pr: https://github.com/owncloud/android-library/pull/136



---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Size less 500 MB | 1. Upload a file whose size is less than 500MB | File is correctly uploaded|  |  |
| 2 | Size about 500 MB | 1. Upload a file whose size is about 500MB | File is correctly uploaded|  |  |
| 3 | Size about 1 GB | 1. Upload a file whose size is about 1GB | File is correctly uploaded|  |  |
| 4 | Size great than 2 GB | 1. Upload a file whose size is greater than 2GB | File is correctly uploaded|  |  |