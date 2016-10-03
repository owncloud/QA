###  Toolbar, Drawer and Account Manager

#### Pr: https://github.com/owncloud/android/pull/1556



---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Drawer**||||||
| 1 | Old Options | Open the drawer | The old options "All files", "Uploads" and "Settings" are correctly displayed and work properly |  |  |
| 2 | Add Account | 1. Open Drawer Accounts section<br>2. Add a new account | Account appears in drawer  |  |  |
| 3 | Add multiple accounts | 1. Open Drawer Accounts section<br>2. Add several accounts until scroll is needed| All accounts appear |  |  |
| 4 | Switch accounts | 1. Open Drawer Accounts section<br>2. Add several accounts<br>3. Switch from an account to anothe one| New account is loaded |  |  |
|**Account Manager**||||||
| 5 | Add Account | 1. Open "Manage Accounts" section<br>2. Add a new account | Account appears in drawer |  |  |
| 6 | Change Password | 1. Open "Manage Accounts" section<br>2. In server, change the password of an account<br>3. Tap on the key icon and set an invalid password<br>4. Tap again on the key and set the new correct password | 3. Login view, and "Wrong password" is set<br>4. New Password is set |  |  |
| 7 | Delete  account | 1. Open "Manage Accounts" section<br>2. Delete one  | Account is deleted from accounts and drawer |  |  | 
| 8 | Delete all accounts | 1. Open "Manage Accounts" section<br>2. Delete all accounts  | Add Account is shown |  |  |
|**Avatar**||||||
| 9 | Add avatar | 1. Login an account<br>2. In server, add a new avatar | avatar is shown in app (drawen and accounts manager) |  |  |
| 10 | Change avatar | 1. Perform previous test case<br>2. In server, change the avatar | new avatar is shown in app (drawen and accounts manager) |  |  |
| 11 | Remove avatar | 1. Perform previous test case<br>2. In server, delete the avatar | default avatar is shown |  |  |
|**External actions**||||||
| 12 | Remove account | 1. Remove account in server side<br>2. Try to perform any action | Login view |  |  |
| 13 | Change display name | 1. Change displayname in server side | In drawer and account manager is shown the display name |  |  |

