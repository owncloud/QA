###  Clearer error message when user quota is exceeded 

#### Pr: https://github.com/owncloud/android/pull/1886 

Devices: Galaxy Note 4 v6, Nwxus10 v5

Server: 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Quota = 0MB |  1. For a user, set his quota = 0<br>2. Upload a file  | File is not uploaded and clear error is shown in uploads view (check in both orientations) and in notification. Upload is set as failed | P m6 t5|
| 2 | Quota = 50MB  | 1. For a user, set his quota = 50MB<br>2. Upload bunch of files which total size is greater than 50MB | Files are uploaded until quota is reached. After that, the remaining uploads fail with a correct error message (check in both orientations) and in notification. Uploads are set as failed | P m6 t5|
| 3 | Retry fail |  From 2., tap on a failed upload.  | Error happens again. Upload is set as failed again| P m6 t5|
| 4 | Retry sucessfully | 1. From 3., delete some content in the account.<br>2. Retry an upload by tapping  | Upload is succesful| P m6 t5|
| 5 | Unlimited  | Upload a huge file | File is uploaded completely. Check in uploads view  | P m6 t5|  |
| 6 | Multiaccount | 1. User1 uploads files over his quota<br>2. At the same time, user2 uploads files within his quota | Uploads from user1 fail and are set as failed. Uploads from user2 run. Correct error messages in uploads view.  | P m6 t5|  |