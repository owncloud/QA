###  Display Name

#### Pr: https://github.com/owncloud/ios-app/pull/273

Devices: iPhoneX v12<br>
Server: 10.0.10

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Regular username**|||||
| Bookmark List with display name - Bookmark list | Create an account of a user with display name | Displayname correct displayed in Bookmark list| P m12 |  |  |
| Bookmark List without display name - Bookmark list | Create an account of a user without display name | Username displayed in Bookmark list | P m12 |  |  |
| Bookmark List with display name  - file list| Create an account of a user with display name | Displayname correct displayed in Bookmark list | P m12 |  |  |
| Bookmark List without display name  - File list| Create an account of a user without display name | Username displayed in file list| P m12 |  |  |
| Display name with blanks | Open bookmark view and file view | Username displayed correctly| P m12 |  |  |
| Display name with special characteres | Open bookmark view and file view | Username displayed correctly| P m12 |  |  |
| Display name changed | 1. In web, change the display name | In app, display name is correctly changed| P m12 | Need to kill the app.  |  |
|**LDAP**|||||
| Bookmark List with display name - Bookmark list | Create an account of a user with display name | Displayname correct displayed in Bookmark list| P m12 |  |  |
| Bookmark List without display name - Bookmark list | Create an account of a user without display name | Username displayed in Bookmark list | P m12 |  |  |
| Bookmark List with display name  - file list| Create an account of a user with display name | Displayname correct displayed in Bookmark list | P m12 |  |  |
| Bookmark List without display name  - File list| Create an account of a user without display name | Username displayed in file list| P m12 |  |  |
| Display name with blanks | Open bookmark view and file view | Username displayed correctly| P m12 |  |  |
| Display name with special characteres | Open bookmark view and file view | Username displayed correctly| P m12 |  |  |
| Display name changed | 1. In web, change the display name | In app, display name is correctly changed| P m12 |  |  |