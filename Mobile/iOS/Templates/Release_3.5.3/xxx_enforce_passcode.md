###  Enforce passcode 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Install & Upgrade**||||||
| 1 | Install from scratch | With the passcode enforced, install the app from scratch | Passcode is required, before the login view. Check the view in both orientations |  |
| 2 | Upgrade without previous passcode | 1. Install a older version<br>2. Passcode disabled<br>3. Upgrade the app enforcing the passcode| Passcode is required |  |
| 3 | Upgrade with previous passcode | 1. Install a older version<br>2. Passcode enabled<br>3. Upgrade the app enforcing the passcode| New passcode is not required, only typing the existing one |  |
| 4 | Upgrade without passcode | 1. Install enforcing the passcode<br>2. Upgrade the app without enforcing the passcode| 1. Passcode is required and set<br>2. Passcode can be disabled in settings view |  |
| 5 | Reopen | 1. Open the app for first time after enforcing the passcode<br>2. Close the app or switch to another app<br>3. Open again the app | Passcode is required |  |
|**View**||||||
| 6 | Settings | Open Settings view | The passcode option is not visible or freezed. Can not be disabled |  |
| 7 | Touch ID | Open Settings view | The touch id option is visible if device has it |  |
|**Passcode enabled**||||||
| 8 | Login view | 1. Open Login view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 9 | Settings view | 1. Open Settings view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 10 | Uploads view | 1. Open Uploads view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 11 | Shared links view | 1. Open Shared links view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 12 | Files view | 1. Open Files view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 13 | Share view | 1. Open Share view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 14 | Txt file view | 1. Open Txt file view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 15 | File preview view | 1. Open file preview view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 16 | Share with oC view | 1. Open an external app and share a file woth oC<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
|**Multiaccount**||||||
| 17 | Multiaccount | 1. Login in several accounts with passcode enforced<br>2. Perform steps from 6. to 16. in different accounts<br>3. Go to Settings view  | 2. Passcode is always asked.<br>3. Passcode can not be disabled. |  |  |

