###  Toolbar, Drawer and Account Manager

#### Pr: https://github.com/owncloud/android/pull/1556



---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Drawer**||||||
| 1 | Old Options | Open the drawer | The old options "All files", "Uploads" and "Settings" are correctly displayed and work properly |  |  |
| 2 | Add Account | 1. Open Drawer Accounts section<br>2. Add a new account | Account appears in drawer  |  |  |
| 3 | Add multiple accounts | 1. Open Drawer Accounts section<br>2. Add several accounts until scroll is needed| All accounts appear |  |  |
| 4 | Switch accounts | 1. Open Drawer Accounts section<br>2. Add several accounts<br>3. Switch from an account to another one| Accounts are correctly loaded |  |  |
|**Account Manager**||||||
| 5 | Add Account | 1. Open "Manage Accounts" section<br>2. Add a new account | Account appears in drawer |  |  |
| 6 | Change Password | 1. Open "Manage Accounts" section<br>2. In server, change the password of an account<br>3. Tap on the key icon and set an invalid password<br>4. Tap again on the key and set the new correct password | 3. Login view, and "Wrong password" is set<br>4. New Password is set |  |  |
| 7 | Delete  account | 1. Open "Manage Accounts" section<br>2. Delete one  | Account is deleted from accounts and drawer |  |  | 
| 8 | Delete all accounts | 1. Open "Manage Accounts" section<br>2. Delete all accounts  | Add Account is shown and redirects to login view|  |  |
|**Avatar**||||||
| 9 | Add avatar | 1. Login an account<br>2. In server, add a new avatar | avatar is shown in app (drawer and accounts manager) |  |  |
| 10 | Change avatar | 1. Perform previous test case<br>2. In server, change the avatar | new avatar is shown in app (drawer and accounts manager) |  |  |
| 11 | Remove avatar | 1. Perform previous test case<br>2. In server, delete the avatar | default avatar is shown |  |  |
| 12 | Upper avatars (two accounts)  | 1. Add two accounts<br>2. Tap on avatar<br>3. Delete first account | 1. Avatar of not current is shown in the upper side of the drawer<br>2. Account is switched<br>3. No avatars are shown upper in the drawer |  |  |
| 13 | Upper avatars (more than two accounts)  | 1. From previous test case, add more accounts<br>2. Delete first account | 1. The first two accounts show the avatar<br>2. The avatars of the first two accounts (but the current one) are now shown |  |  |
|**External actions**||||||
| 14 | Remove account | 1. Remove account in server side<br>2. Try to perform any action | Login view |  |  |
| 15 | Change display name | Change displayname in server side | In drawer and account manager is shown the display name |  |  |
|**Toolbar (regression)**||||||
| 16 | Background color | Change toolbar background color | Color is correct |  |  |
| 17 | Multiselect one file options | Long press to select one file | Correct options: share, download(open with and sync if it is downloaded), rename, move, copy, remove, send, av off, details |  |  |
| 18 | Multiselect several files options | Long press to select several files | Correct options: sync/downl, move, copy, remove, av off |  |  |
| 19 | Multiselect one folder options  | Long press to select one folder | Correct options: share, sync/downl, rename, move, copy, remove |  |  |
| 20 | Multiselect several folders options  | Long press to select several folders | Correct options: sync/downl, move, copy, remove|  |  |
| 21 | Multiselect mixed options | Long press to select files and folders | Correct options: sync/downl, move, copy, remove |  |  |
|**Special servers**||||||
| 22 | Redirected server| Add a account of a redirected server | Account is correctly displayed and handled in drawer and account manager |  |  |
| 23 | Shibboleth server| Add a account of a shibboleth server | Account is correctly displayed and handled in drawer and account manager |  |  |
|**Upgrade**||||||
| 24 | Upgrade from previous version | 1. Install previous version<br>2. Set some accounts<br>3. Upgrade app | Accounts are correctly shown in drawer and in accounts manager |  |  |