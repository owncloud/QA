#### Biometrical Lock 

#### PRs: https://github.com/owncloud/ios-app/pull/54

Device/s:  <br>
Server: 

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Biometrical not registered**||||||
| Not registered | Open Settings view and enable passcode | Touch ID/Face ID not registered | | | |
| Device with no sensor | Open Settings view and enable passcode | Touch ID/Face ID not registered | | | |
|**Biometrical in device**||||||
| First time | After installing, enter in settings view | Passcode disabled and biometrical invisible |  |  |  |
| Enable Passcode | Enable Passcode in Settings view | Correct label (Touch ID / Face ID) displayed |  | | |
| Enable biometrical | After enabling passcode, enable biometrical<br> Reopen the app | Biometrical asked |  |  |  |
| Incorrect finger | Reopen the app<br>Use a non-registered finger | Acces not granted |  |  |  |
| Cancel biometrical | Cancel biometrical when it is asked | Passcode asked | | | |
| Failed passcode | Cancel biometrical when it is asked<br>Enter incorrect passcode 3 times | ? | | | |
| Removed fingers | With biometrical enabled, remove all registered fingers from device | Biometrical is gone from settings | | | |
|**Periocity**||||||
| Always | Open the app several times | Biometrical always set | | | |
| 1 minute | 1. Open app<br>2. After 30 seconds, reopen the app<br>3. After 1:30 minutes, reopen theapp | 1. Biometrical asked<br>2. Biometrical not asked<br>3. Biometrical asked | | | |
| 5 minutes | 1. Open app<br>2. After 2 minutes, reopen the app<br>3. After 7 minutes, reopen theapp | 1. Biometrical asked<br>2. Biometrical not asked<br>3. Biometrical asked | | | |
| 30 minutes | 1. Open app<br>2. After 20 minutes, reopen the app<br>3. After 40 minutes, reopen the app | 1. Biometrical asked<br>2. Biometrical not asked<br>3. Biometrical asked | | | |