###  Security Enforced

#### Pr: https://github.com/owncloud/android/pull/3434

Devices: Nexus 6P v7, Pixel2 v11

Server: 10.8

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**passcode_enforced = true**|||||||
|**View**|||||||
| Portrait | Install app | Dialog to choose Passcode/Pattern is displayed | P m11 m7 |  |
| Landscape | Install app | Dialog to choose Passcode/Pattern is displayed | P m11 m7 |  |
|**Forced**|||||||
| App minimized | 1. Install app<br>2. Before setting the locking method, minimize the app<br>3. Open the app | Locking method dialog displayed | P m11 m7|  |
| App killed | 1. Install app<br>2. Before setting the locking method, kill the app<br>3. Open the app | Locking method dialog displayed | P m11 m7 |  |
| Change orientation | 1. Install app<br>2. Before setting the locking method, change device orientation | Locking method dialog displayed | P m11 m7 |  |
| Passcode not cancel | 1. Install app<br>2. Select Passcode as locking method | No way to cancel (no Cancel) button | P m11 m7 | FIXED: Cancel button is there |
| Pattern not cancel | 1. Install app<br>2. Select Pattern as locking method | No way to cancel (no Cancel) button | P m11 m7 | FIXED: Cancel button is there |
| Passcode + kill | 1. Install app<br>2. Set Passcode as locking method<br>3. Before submitting the passcode, kill the app<br>4. Open app | App is still locked | P m11 m7 |  |
| Passcode + minimize | 1. Install app<br>2. Set Passcode as locking method<br>3. Before submitting the passcode, minimize the app<br>4. Open app | App is still locked | P m11 m7 |  FIXED: App unlocked |
| Passcode + Go back | 1. Install app<br>2. Set Passcode as locking method<br>3. Before submitting the passcode, click triangle button to go back | No way to go back | P m11 m7 | FIXED: App unlocked |
| Pattern + kill | 1. Install app<br>2. Set Pattern as locking method<br>3. Before submitting the pattern, kill the app<br>4. Open app | App is still locked | P m11 m7 |  |
| Pattern + minimize | 1. Install app<br>2. Set Pattern as locking method<br>3. Before submitting the pattern, minimize the app<br>4. Open app | App is still locked | P m11 m7|  |
| Pattern + Go back | 1. Install app<br>2. Set Pattern as locking method<br>3. Before submitting the pattern, click triangle button to go back | No way to go back | P m11 m7  | FIXED: App unlocked |
|**Settings**|After installing||||||
| Passcode | 1. Select passcode<br>2. Enter correct passcode twice<br>3. Open Settings -> Security | Passcode is hidden, only biometrical displayed | P m11 m7 |  |
| Pattern | 1. Select pattern<br>2. Enter correct passcode twice<br>3. Open Settings -> Security | Pattern is hidden, only biometrical displayed | P m11 m7 | FIXED: Biometrical locked |
|**Migration**|||||||
| Enabled -> Disabled | 1. Set parameter to true in setup.xml<br>2. Set correct pattern/passcode in the app<br>3. Set parameter to false and reinstall | Locking method is still active, but now, is also visible in Settings -> Security. It can be manually disabled | P m11  |  |
| Disabled -> Enabled | 1. Set parameter to false in setup.xml<br>2. Open app<br>3. Set parameter to true and reinstall | Locking method is asked after installing. Option hidden in Settings | P m11 m7  |  |
| Enabled -> Enabled | 1. Set parameter to true in setup.xml<br>2. Open app<br>3. Set parameter to true and reinstall | Nothing asked after installing. Option hidden in Settings | P m11 m7 |  |
|**passcode_enforced = false**|||||||
| No locking | 1. Install app | Locking method dialog not displayed.<br>All methods available in Settings -> Security, and all disabled from scratch | P m11 m7|  |