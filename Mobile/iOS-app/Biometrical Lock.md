#### Biometrical Lock 

#### PRs: https://github.com/owncloud/ios-app/pull/54

Device/s: iPhone 6S Plus v11, iPhoneX v11, iPadAir2 (without biometrical support) <br>
Server: 10.0.8

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**Biometrical not registered**||||||
| Not registered | Open Settings view and enable passcode | Touch ID/Face ID not registered | P m11 t11 | | |
| Device with no sensor | Open Settings view and enable passcode | Touch ID/Face ID not registered | P t11 | | |
|**Biometrical in device**||||||
| First time | After installing, enter in settings view | Passcode disabled and biometrical invisible | P m11 t11 |  |  |
| Enable Passcode | Enable Passcode in Settings view | Correct label (Touch ID / Face ID) displayed | P m11 t11| | |
| Enable biometrical | After enabling passcode, enable biometrical<br> Reopen the app | Biometrical asked | P m11 t11 | Passcode asked  |  |
| Incorrect finger | Reopen the app<br>Use a non-registered finger | Acces not granted | P m11 t11 |  |  |
| Cancel biometrical | Cancel biometrical when it is asked | Passcode asked | P m11 t11 | FIXED: Redundant options in the dialog | |
| Failed passcode | Cancel biometrical when it is asked<br>Enter incorrect passcode 3 times | Passcode asked when time expired. Biometrical not asked | P m11 t11 | | |
| Removed fingers | With biometrical enabled, remove all registered fingers from device | Biometrical is gone from settings | F m11 t11 | `No entities are enrolled` | |
|**Periocity**||||||
| Always | Open the app several times | Biometrical always set | P m11 t11 | | |
| 1 minute | 1. Open app<br>2. After 30 seconds, reopen the app<br>3. After 1:30 minutes, reopen theapp | 1. Biometrical asked<br>2. Biometrical not asked<br>3. Biometrical asked | P m11 t11 | | |
| 5 minutes | 1. Open app<br>2. After 2 minutes, reopen the app<br>3. After 7 minutes, reopen theapp | 1. Biometrical asked<br>2. Biometrical not asked<br>3. Biometrical asked | P m11 t11 | | |
| 30 minutes | 1. Open app<br>2. After 20 minutes, reopen the app<br>3. After 40 minutes, reopen the app | 1. Biometrical asked<br>2. Biometrical not asked<br>3. Biometrical asked | P m11 t11 | | |    