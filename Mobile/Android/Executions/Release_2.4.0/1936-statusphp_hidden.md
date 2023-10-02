###  Status.php hidden 

#### Pr: https://github.com/owncloud/android/pull/1936 

Devices: Huawei 6P v7, Samsung Galaxy Tab S2 v5

Server: v10.0 (SAML), 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----: | :------- | :---- | :-------------- | :----: | :-------------- |
|**hidden status.php**||||||
| 1 | Login | Login in the app | Login correct | P m7 t5 | FIXED: Shib crashes in expiration|
| 2 | Refresh in root | Refresh the app in root folder | Correct refresh | P m7 t5|  |
| 3 | Share with users 8.1 | Share with users in version 8.1 | Not posible | NA | Server with status |
| 4 | Sync account | Sync the whole account | Sync finishes correctly | P m7 t5|  |
| 5 | Multiaccount | Sync an account. In SAML expire session | Correct behaviour | P m7 t5|  |
|**visible status.php**||||||
| 6 | Login | Login in the app | Login correct | P m7 t5 | FIXED: shib crashes in expiration |
| 7 | Refresh in root | Refresh the app in root folder | Correct refresh | P m7 t5|  |
| 8 | Share with users 8.1 | Share with users in version 8.1 | Not posible | P m7 t5|  |
| 9 | Sync account | Sync the whole account | Sync finishes correctly | P m7 t5|  |
| 10 | Multiaccount | Sync an account. In SAML expire session | Correct behaviour | P m7 t5|  |

