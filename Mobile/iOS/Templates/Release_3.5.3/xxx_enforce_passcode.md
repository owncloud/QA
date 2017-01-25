###  Enforce passcode 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Install & Upgrade**||||||
| 1 | Install from scratch | With the passcode enforced, install the app from scratch | Passcode is required, before the login view. Can not be cancelled. Check the view in both orientations |  |
| 2 | Upgrade without previous passcode | 1. Install a older version<br>2. Passcode disabled<br>3. Upgrade the app enforcing the passcode| Passcode is required and can not be cancelled |  |
| 3 | Upgrade with previous passcode | 1. Install a older version<br>2. Passcode enabled<br>3. Upgrade the app enforcing the passcode| New passcode is not required, only typing the existing one |  |
| 4 | Upgrade without passcode | 1. Install enforcing the passcode<br>2. Upgrade the app without enforcing the passcode| 1. Passcode is required and set<br>2. Passcode can be disabled in settings view |  |
| 5 | Reopen | 1. Open the app for first time after enforcing the passcode<br>2. Close the app or switch to another app<br>3. Open again the app | Passcode is required |  |
|**View**||||||
| 6 | Settings | Open Settings view | "Change Passcode" button appears. Check in both orientations  |  |
| 7 | Touch ID | Open Settings view | The touch id option is visible if device has it. Check in both orientations |  |
|**Change passcode**||||||
| 8 | Correct old passcode | 1. Install or upgrade the app with passcode enforced<br>2. In Settings, change the passcode<br>3. Type the correct old passcode<br>4. Type new passcode correctly both times it is asked<br>5. Minimize the app and open it again| 1. Passcode is set<br>3. New passcode is required<br>4. New passcode is set<br>5. Passcode works properly |  |
| 9 | Incorrect old passcode | 1. Install or upgrade the app with passcode enforced<br>2. In Settings, change the passcode<br>3. Type an incorrect old passcode| 1. Passcode is set<br>3. App shows a correct error message and passcode is not allowed to be changed|  |
| 10 | Cancel old passcode | 1. Install or upgrade the app with passcode enforced<br>2. In Settings, change the passcode<br>3. Cancel the input of the old passcode<br>4. Minimize the app and open it again| 1. Passcode is set<br>3. Go to settings<br>4. Old passcode gives access |  |  |
| 11 | Cancel new passcode | 1. Install or upgrade the app with passcode enforced<br>2. In Settings, change the passcode<br>3. Type a correct old passcode<br>4. Cancel the process<br>5. Minimize the app and open it again| 1. Passcode is set<br>3. New passcode is required<br>4. Return to settings view<br>5. The app is opened with the old passcode |  |  |
| 12 | Incorrect second passcode | 1. Install or upgrade the app with passcode enforced<br>2. In Settings, change the passcode<br>3. Type the correct old passcode<br>4. Type new passcode, but second time a different<br>5. Minimize the app and open it again| 1. Passcode is set<br>3. New passcode is required<br>4. Error displayed<br>5. Old passcode gives access |  |
| 13 | Cancel second passcode | 1. Install or upgrade the app with passcode enforced<br>2. In Settings, change the passcode<br>3. Type a correct old passcode<br>4. Cancel the process in the second input<br>5. Minimize the app and open it again| 1. Passcode is set<br>3. New passcode is required<br>4. Return to settings view<br>5. The app is opened with the old passcode |  |  |
|**Passcode enabled**||||||
| 14 | Login view | 1. Open Login view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 15 | Settings view | 1. Open Settings view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 16 | Uploads view | 1. Open Uploads view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 17 | Shared links view | 1. Open Shared links view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 18 | Files view | 1. Open Files view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 19 | Share view | 1. Open Share view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 20 | Txt file view | 1. Open Txt file view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 21 | File preview view | 1. Open file preview view<br>2. Minimize the app<br>3. Open the app  | Passcode is required |  |
| 22 | Share with oC view | Open an external app and share a file with oC| Passcode is required |  |
| 23 | Document provider | Open an external app and open a oC file| Passcode is required |  |
| 24 | No wifi | Reopen the app without wifi connection | Passcode is required |  |
|**Multiaccount**||||||
| 25 | Multiaccount | 1. Login in several accounts with passcode enforced<br>2. Perform steps from 14. to 24. in different accounts<br>3. Go to Settings view  | 2. Passcode is always asked.<br>3. Passcode can not be disabled. |  |  |
