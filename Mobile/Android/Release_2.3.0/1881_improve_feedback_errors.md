###  More specific errors in share view 

#### Pr: https://github.com/owncloud/android/pull/1881 

Devices: Galaxy Note 4 v6, Galaxy Tab S2 v5

Server: 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Certificate error**|||||||
| 1 | Change certificate | 1. In server, change the certificate<br>2. In device, upload some content | Specific error is shown in uploads view | P m6 t5| Error message improved |
| 2 | Certificate expires | Upload some content in a server which certificate is expired| Specific error is shown in uploads view | P m6 t5| Error message improved |
|**Toast to Snackbar**|||||||
| 3 | Share yourself| Try to share some content with yourself | A snackbar is shown instead a toast (check both orientations) | P m6 t5|  |
| 4 | No connectivity |  Switch the device connection off and try some actions | A snackbar is shown instead a toast (check both orientations) | P m6 t5|  |
| 5 | Remove |  Remove a file (not locally, also in server) | A snackbar is shown instead a toast (check both orientations) | P m6 t5|  |
| 6 | Lack of permission | Copy a file into a shared folder without permission | A snackbar is shown instead a toast (check both orientations) | P m6 t5|  |
|**HTTP error**|||||||
| 7 | Insufficient qouta | Try to upload files in an account with no enough qouta| The error is not known, but is shown the http error in the notification | P m6 t5|  |

