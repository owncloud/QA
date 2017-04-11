###  Status.php hidden 

#### Pr: https://github.com/owncloud/android/pull/1936 

Devices: Huawei 6P v7

Server: v10.0, 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----: | :------- | :---- | :-------------- | :----: | :-------------- |
|**hidden status.php**||||||
| 1 | Login | Login in the app | Login correct | F m7 | Shib crashes in expiration|
| 2 | Refresh in root | Refresh the app in root folder | Correct refresh | P m7 |  |
| 3 | Share with users 8.1 | Share with users in version 8.1 | Not posible | NA | Server with status |
| 4 | Sync account | Sync the whole account | Sync finishes correctly | P m7 |  |
|**visible status.php**||||||
| 5 | Login | Login in the app | Login correct | F m7 | shib crashes in expiration |
| 6 | Refresh in root | Refresh the app in root folder | Correct refresh | P m7 |  |
| 7 | Share with users 8.1 | Share with users in version 8.1 | Not posible | NA |  |
| 8 | Sync account | Sync the whole account | Sync finishes correctly | P m7 |  |

