###  BUG: File is unfavourited when is edited

#### Pr: https://github.com/owncloud/android/pull/1673

Devices:

Server: 

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Edit Favourite | 1. Set a file as favourite<br>2. Long press to open the file with an external app<br>3. Edit and save the file| File is edited and keeps on being favourite|  |  |
|**Regression**||||||
| 2 | Move Favourite | 1. Set a file as favourite<br>2. Long press to move the file to another location | File is moved and keeps on being favourite|  |  |
| 3 | Copy Favourite | 1. Set a file as favourite<br>2. Long press to copy the file to another location| File is copied and keeps on being favourite|  |  |
| 4 | Rename Favourite | 1. Set a file as favourite<br>2. Long press to rename the file| File is renamed and keeps on being favourite|  |  |
| 5 | No connection | 1. Set a file as favourite<br>2. Switch the device connection off<br>3. Edit the file locally<br>4. Switch the device connection on | 3. File is locally updated and keeps on being favourite<br>4. File is uploaded and keep on being favourite |  |  |
