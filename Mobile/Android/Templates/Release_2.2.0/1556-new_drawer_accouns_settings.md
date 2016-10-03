###  Toolbar, Drawer and Account Manager

#### Pr: https://github.com/owncloud/android/pull/1556



---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Drawer**||||||
| 1 | Old Options | Open the drawer | The oldoptions "All files", "Uploads" and "Settings" are correctly displayed and work properly |  |  |
| 2 | Add Account | 1. Open Drawer Accounts section<br>2. Add a new account | Account appears in drawer  |  |  |
| 2 | Add multiple accounts | 1. Open Drawer Accounts section<br>2. Add several accounts until scroll is needed| All accounts appear |  |  |
| 3 | Delete other file | 1. Play a music file<br>2. Delete other file in the same folder | File keeps on being played |  |  |
| 4 | Delete folder | 1. Play a music file into a folder<br>2. Delete the containing folder | File is deleted and stops playing |  |  |
| 5 | Delete account | 1. Play a music file<br>2. Delete the containing account | File is deleted and stops playing |  |  |
| 6 | Uninstall the app | 1. Play a music file<br>2. Uninstall the app | File is deleted and stops playing |  |  |
|**Account Manager**||||||
| 2 | Add Account | 1. Open "Manage Accounts" section<br>2. Add a new account | Account appears in drawer |  |  |
| 2 | Change Password | 1. Open "Manage Accounts" section<br>2. In server, change the password of an account<br>3. Tap on the key icon and set an invalid password<br>4. Tap again on the key and set the new correct password | 3. Login view, and "Wrong password" is set<br>4. New Password is set |  |  |