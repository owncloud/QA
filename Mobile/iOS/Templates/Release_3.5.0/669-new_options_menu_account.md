###  New options in account menu

#### Pr: https://github.com/owncloud/ios/pull/669

Devices: 

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
| 1 | Portrait  |  Open Settings View  |  Next to the account info appears a (...) menu with four options: "Edit credentials", "Clear cache", "Disconnect from server" and "Delete connection" |  |  |
| 2 | Landscape  |  Open Settings View |  Next to the account info appears a (...) menu with four options: "Edit credentials", "Clear cache", "Disconnect from server" and "Delete connection" |  |  |
|**Actions (one account)**||||||
| 3 |Edit Credentials| 1. In settings view, tap on (...) of one account and then in "Edit Credentials"|The Login view is displayed and the password can be edited | | |
| 4 |Disconnect|1. In settings view, tap on (...) and then in "Disconnect account"<br>2. Ttry to enter in the account| Password is required, and if it is input correctly, files view is shown|||
| 5 |Remove|1. In settings view, tap on (...) and then in "Remove account"| The account is removed from the account list|||
|**Clear cache (one account)**||||||
| 6 |Empty account|1. In Settings view, tap on (...) of an account that is empty<br>2. Select "Clear cache"| Nothing happens| | |
| 7 |Account with downloaded files|1. In Settings view, tap on (...) of an account with downloaded<br>2. Select "Clear cache"| All downloaded files are locally removed| | |
| 8 |Account without downloaded files|1. In Settings view, tap on (...) of an account that does not have downloaded files<br>2. Select "Clear cache"| Nothing happens| | |
|**Multiaccount**||||||
| 9 |Edit Credentials|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one account<br>3. Select "Edit credentials" and change the password| The password is changed. The other accounts can be login normally| | |
| 10 |Disconnect|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one account<br>3. Select "Disconnect"<br>4. Tap on the account in accounts list| The password is required. The other accounts can be login normally| | |
| 11 |Remove|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one account<br>3. Select "Remove"| The chosen account does not appear in accounts list. The other ones appear.| | |
| 12 |Clear cache|1. In Settings view, login in several accounts<br> 2. Tap on (...) of one or more accounts<br>3. Select "Clear cache" in the chosen ones| Downloaded files of the chosen accounts are locally removed. Downloaded files of the not chosen accounts remain in device.| | |
| 13 |Branding |1. Disable multiaccount as branding option<br>2. Login in an account| The options are accesible | | |