###  Clearer error message when user quota is exceeded 

#### Pr: https://github.com/owncloud/ios/pull/827

Device: iPhone 6S Plus v9.3, iPadAir v10

Server: 9.1 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Quota = 0MB |  1. For a user, set his quota = 0<br>2. Upload a file  | File is not uploaded and clear error is shown in uploads view (check in both orientations). Upload is set as failed| P m9 t10  |
| 2 | Quota = 50MB  | 1. For a user, set his quota = 50MB<br>2. Upload bunch of files which total size is greater than 50MB | Files are uploaded until quota is reached. After that, the remaining uploads fail with a correct error message (check in both orientations). Uploads are set as failed | P m9 t10|
| 3 | Retry fail |  From 2., tap on a failed upload.  | Error happens again. Upload is set as failed again| P m9 t10 |
| 4 | Retry sucessfully | 1. From 3., delete some content in the account.<br>2. Retry an upload by tapping  | Upload is succesful| P m9 t10  |
| 5 | Retry only by qouta | 1. From 2., delete some content in the account<br>2. Upload the same file twice, causing a conflict.<br>3. Retry the quota failed uploads by tapping  | Upload is retried, but the conflicts remain | P m9 t10 |
| 6 | Unlimited  | Upload a huge file | File is uploaded completely. Check in uploads view  | P m9 t10 |  |
| 7 | Multiaccount | 1. User1 uploads files over his quota<br>2. At the same time, user2 uploads files within his quota | Uploads from user1 fail and are set as failed. Uploads from user2 run. Correct error messages in uploads view.  | P m9 t10|  |
| 7 | Multiaccount retry| 1. User1 uploads files over his quota<br>2. At the same time, user2 uploads files over his quota as well<br>3. Tap on a user2 failed upload (after remove some contents)| Only uploads from user2 are retried  | P m9 t10|  |

