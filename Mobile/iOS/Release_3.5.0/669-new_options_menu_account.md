###  New options in account menu

#### Pr: https://github.com/owncloud/ios/pull/669

Devices: iPhone6 v9.3.2, iPad Air v8.4

Server: v9.0.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Portrait  |  Open Settings View  |  Next to the account info appears a (...) menu with three options: "Edit credentials", "Clear cache", and "Remove account" | P m9  |  |
| 2 | Landscape  |  Open Settings View |  Next to the account info appears a (...) menu with three options: "Edit credentials", "Clear cache", and "Remove account" | P m9 |  |
|**Actions (one account)**||||||
| 3 |Edit Credentials| 1. In settings view, tap on (...) of one account and then in "Edit Credentials"|The Login view is displayed and the password can be edited | P m9 F t8 | Edit Credentials does nothing|
| 4 |Remove account|1. In settings view, tap on (...) and then in "Remove account"| The account is removed from the account list| P m9||
|**Clear cache (one account)**||||||
| 5 |Empty account|1. In Settings view, tap on (...) of an account that is empty<br>2. Select "Clear cache"| Nothing happens| P m9 | |
| 6 |Account with downloaded files|1. In Settings view, tap on (...) of an account with downloaded<br>2. Select "Clear cache"| All downloaded files are locally removed| P m9 | |
| 7 |Account without downloaded files|1. In Settings view, tap on (...) of an account that does not have downloaded files<br>2. Select "Clear cache"| Nothing happens| P m9 | |
| 8 |Account with favourite files|1. In Settings view, tap on (...) of an account that has favourite files<br>2. Select "Clear cache"| All the file are removed but the favourites| P m9 | |
|**Multiaccount**||||||
| 9 |Edit Credentials|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one account<br>3. Select "Edit credentials" and change the password| The password is changed. The other accounts can be login normally| P m9 F t8| Edit Credentials does nothing|
| 10 |Remove account|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one account<br>3. Select "Remove account"| The chosen account does not appear in accounts list. The other ones appear.| P m9 | |
| 11 |Clear cache|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one or more accounts<br>3. Select "Clear cache" in the chosen ones| Downloaded files of the chosen accounts are locally removed, but the favourite ones. Downloaded files of the not chosen accounts remain in device.| P m9 | |
| 12 |Branding |1. Disable multiaccount as branding option<br>2. Login in one account| The (...) menu and the options are accesible | P t8 | |