###  Toolbar, Drawer and Account Manager

#### Pr: https://github.com/owncloud/android/pull/1556

Devices: Galaxy Note 4 v6, Huawei 6P v7, Nexus10 v5, Nevus9 v6

Server: 9.1.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Drawer**||||||
| 1 | Old Options | Open the drawer | The old options "All files", "Uploads" and "Settings" are correctly displayed and work properly | P m6 m7 t5|  |
| 2 | Add Account | 1. Open Drawer Accounts section<br>2. Add a new account | Account appears in drawer  | P m6 m7 t5| SOLVED: First account appears twice |
| 3 | Add multiple accounts | 1. Open Drawer Accounts section<br>2. Add several accounts until scroll is needed| All accounts appear | P m7 t5|  |
| 4 | Switch accounts | 1. Open Drawer Accounts section<br>2. Add several accounts<br>3. Switch from an account to another one| Accounts are correctly loaded | P m7 t5 |  |
|**Drawer view**||||||
| 5 | Files view | Open Drawer in Files view| Drawer is correctly displayed in both orientations | P m7 t5 | Pics preview does not have drawer |
| 6 | Uploads view | Open Drawer in Uploads view| Drawer is correctly displayed in both orientations| P m7 t5|  |
| 7 | Settings view | Try to open Drawer in Files view | No drawer available in both orientations|  P m7 t5|  |
| 8 | File preview | Try to open Drawer in Files preview | Drawer is correctly displayed in both orientations| P m7 t5|  |
|**Account Manager**||||||
| 9 | Add Account | 1. Open "Manage Accounts" section<br>2. Add a new account | Account appears in drawer | P m7 t5|  |
| 10 | Change Password | 1. Open "Manage Accounts" section<br>2. In server, change the password of an account<br>3. Tap on the key icon and set an invalid password<br>4. Tap again on the key and set the new correct password | 3. Login view, and "Wrong password" is set<br>4. New Password is set | P m7 t5|  |
| 11 | Delete  account | 1. Open "Manage Accounts" section<br>2. Delete one  | Account is deleted from accounts and drawer | P m7 t5|  | 
| 12 | Delete all accounts | 1. Open "Manage Accounts" section<br>2. Delete all accounts  | Add Account is shown and redirects to login view| P m7 t5| SOLVED: Empty account list makes crash |
|**Avatar**||||||
| 13 | Add avatar | 1. Login an account<br>2. In server, add a new avatar | avatar is shown in app (drawer and accounts manager) | P m7 t6 | Avatars are inherited |
| 14 | Change avatar | 1. Perform previous test case<br>2. In server, change the avatar | new avatar is shown in app (drawer and accounts manager) | P m7 t6 | Avatar is not updated |
| 15 | Remove avatar | 1. Perform previous test case<br>2. In server, delete the avatar | default avatar is shown | P m7 t6 | Avatar is not removed |
| 16 | Upper avatars (two accounts)  | 1. Add two accounts<br>2. Tap on avatar<br>3. Delete first account | 1. Avatar of not current is shown in the upper side of the drawer<br>2. Account is switched<br>3. No avatars are shown upper in the drawer | P m7 t6|  |
| 17 | Upper avatars (more than two accounts)  | 1. From previous test case, add more accounts<br>2. Delete first account | 1. The first two accounts show the avatar<br>2. The avatars of the first two accounts (but the current one) are now shown | P m7 t6|  |
|**External actions**||||||
| 18 | Remove account | 1. Remove account in server side<br>2. Try to perform any action | Login view | P m7 t5| BACKLOG: Account removed -> blocking in login view |
| 19 | Change display name | Change displayname in server side | In drawer and account manager is shown the display name | P m7 t5 |  |
|**Toolbar (regression)**||||||
| 20 | Background color | Change toolbar background color | Color is correct | P m7 t5 | Take care with the white color  |
| 21 | Multiselect one file options | Long press to select one file | Correct options: share, download(open with and sync if it is downloaded), rename, move, copy, remove, send, av off, details | P m7 t5|  |
| 22 | Multiselect several files options | Long press to select several files | Correct options: sync/downl, move, copy, remove, av off | P m7 t5|  |
| 23 | Multiselect one folder options  | Long press to select one folder | Correct options: share, sync/downl, rename, move, copy, remove | P m7 t5|  |
| 24 | Multiselect several folders options  | Long press to select several folders | Correct options: sync/downl, move, copy, remove| P m7 t5|  |
| 26 | Multiselect mixed options | Long press to select files and folders | Correct options: sync/downl, move, copy, remove | P m7 t5|  |
|**Special servers**||||||
| 27 | Redirected server| Add a account of a redirected server | Account is correctly displayed and handled in drawer and account manager | P m7 t5 |  |
| 28 | Shibboleth server| Add a account of a shibboleth server | Account is correctly displayed and handled in drawer and account manager | P m7 t5 |  |
|**Upgrade**||||||
| 29 | Upgrade from previous version | 1. Install previous version<br>2. Set some accounts<br>3. Upgrade app | Accounts are correctly shown in drawer and in accounts manager | P m7 t5 |  |