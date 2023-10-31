###  Certificate changes must alert the user 

#### Pr: https://github.com/owncloud/ios/pull/611

Device: iOS v8

Server: v9

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Change cert  |  1. In server side, change the user cert<br>2. Log in the app with https | It is required to accept the cert | P m8 |  |
| 2 | Actions after accepting  |  1. From 1, accept the certificate and perform server actions (upload, download, move, rename, document provider, share...) | Actions are correctly managed | P m8 |  |
| 3 | Actions after denying  |  1. From 1, deny the certificate and perform server actions (upload, download, move, rename, document provider, share...) | Actions are not managed, accepting the cert is required | P m8 | SOLVED: yellow arroy in favourites. Freezed if delete file |
|**Regression**||||||
| 4 | Regression | 1. Wait some minutes without performing any action<br>2. Refresh the file view or do some other action| No error from server is received | P m8 |  |
| 5 | Error handling | 1. Errors in share forms<br>|Errors are correct  | P m9 t8 |  |
