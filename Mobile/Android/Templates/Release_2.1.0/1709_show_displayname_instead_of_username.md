###  Show displayname instead of username 

#### Pr: https://github.com/owncloud/ios/pull/1709 

Devices:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | Account list | 1. In server, set a display name different to the user name<br>2. In app, open Settings view  |  Display name is shown instead of username |  |  |
| 2 | Drawer | 1. In server, set a display name different to the user name<br>2. In app, select an account and in file view, open the drawer |  Display name is shown instead of user name |  |  |
| 3 | Special Characters | 1. In server, set a display name with special characters<br>2. In app, select an account and in file view, open the drawer |  Display name is shown instead of username |  |  |
| 4 | Change display name | In server, change the display name for a user | Changed display name is shown in settings view and in drawer |  |  |
| 5 | Multiaccount | 1. In server, set a display name different to the user name for several users<br>2. In app, login with several accounts<br>3. Change from one account to another |  2. Display name is shown instead of user name in all accounts<br>3. In drawer, the display name changes|  |  |
| 6 | External app | 1. In app, login with several accounts<br>2. In a external app, share  any content with owncloud| A popup is raised to choose the account to upload. Display name is shown |  |  |
| 7 | Uploads view | 1. In app, login with several accounts<br>2. Upload any content| In Uploads view, the account info is shown with the display name. |  |  |
| 8 | Shibboleth server | 1. In server, set a display name different to the user name<br>2. In app, open Settings view  |  Display name is shown instead of username |  |  |
| 9 | Upgrade version| 1. Install in mobile device the previous version of the app<br>2. Set displayname for different users<br>3. Install this version |  Display name is correctly shown instead of username |  |  |
