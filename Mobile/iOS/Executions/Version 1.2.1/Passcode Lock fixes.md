#### Passcode Lock fixes

#### PRs: https://github.com/owncloud/ios-app/pull/591

Device/s: iPhone XS iOS12, iPhone6S iOS12 (touchId) iPhoneX iOS13, iPadOS13  <br>
Server: 10.3.2


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Passcode**||||||
| Enable Passcode | 1. Enter correct passcode twice<br>2. Reopen the app | 1. Passcode stored<br>2. Passcode asked | P m12 m13 t13|  |  |
| Cancel Enable Passcode | 1. Enable Passcode in Settings view<br>2. Cancel before enter passcode<br>3. Reopen the app | 2. Passcode disabled<br>3. Passcode not asked | P m12 m13 t13| | |
| Incorrect Passcode | Enter incorrect passcode when re-type.  | Error displayed |P m12 m13 t13 |  |  |
| Disable Passcode | 1. Disable Passcode in Settings view<br>2. Reopen the app | 1. Passcode is asked before being disabled<br>2. Passcode not asked | P m12 m13 t13| | |
| Cancel Disable Passcode | 1. Disable Passcode in Settings view<br>2. Cancel before enter the passcode<br>3. Reopen the app | 2. Passcode enabled<br>3. Passcode asked | P m12 m13 t13| | |
|**Biometrical in device**||||||
| First time | After installing, enter in settings view | Passcode disabled and biometrical invisible | P m12 m13 |  |  |
| Enable Passcode | Enable Passcode in Settings view | Correct label (Touch ID / Face ID) displayed | P m12 m13 | | |
| Enable biometrical | After enabling passcode, enable biometrical<br> Reopen the app | Biometrical asked | P m12 m13 |   |  |
| Failed biometrical | Set an incorrect biometrical when it is asked<br>Enter incorrect passcode 3 times | Passcode asked when time expired. Biometrical not asked, only passcode | P m13 m12 | | |
|**Periodicity**||||||
| Always | Open the app several times | Passcode always set | P m12 m13 t13 | | |
| 1 minute | 1. Open app<br>2. After 30 seconds, reopen the app<br>3. After 1:30 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | P m12 m13 t13|  | |
| 5 minutes | 1. Open app<br>2. After 2 minutes, reopen the app<br>3. After 6 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | P m12 m13 t13| | |
|**Brute force protection**||||||
| After 3 attempts | Reopen the app and make three failed attemps | App locked | P m12 m13 | | |
|**iPad**||||||
| Multiple window | 1. Open multiple window<br>2. Reopen the app | Passcode asked | P t13 | | |