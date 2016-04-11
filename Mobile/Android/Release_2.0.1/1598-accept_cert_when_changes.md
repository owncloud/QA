###  Certificate changes must alert the user 

#### Pr: https://github.com/owncloud/android/pull/1598

Device: Nexus 5 v5, Nexus7 v4.3

Server: v9

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Change cert  |  1. In server side, change the untrusted user cert<br>2. Log in the app with https | It is required to accept the cert | P m5 t4|  |
| 2 | Actions after accepting  |  1. From 1, accept the certificate and perform server actions (upload, download, move, rename, document provider, share...) | Actions are correctly managed | P m5 t4|  |
| 3 | Actions after denying  |  1. From 1, deny the certificate and perform server actions (upload, download, move, rename, document provider, share...) | Actions are not managed, accepting the cert is required | P m5 t4|  |
