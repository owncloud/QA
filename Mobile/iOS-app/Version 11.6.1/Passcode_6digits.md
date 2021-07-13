#### Passcode 6 digits

#### PRs: https://github.com/owncloud/ios-app/pull/1000

Device/s: iPhoneXR v14.6, iPadAir2 v13.4 <br>
Server: 10.7



---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------: | 
|**View**||||||
| Enable Passcode portrait | 1. Enable passcode | Option 4digits/6digits is displayed| P m14 t13  | FIXED: crash in iPad
| Enable Passcode landscape | 1. Enable passcode | Option 4digits/6digits is displayed| P m14 t13| FIXED: crash in iPad | 
|**Passcode 6 digits**||||||
| Enable Passcode | 1. Enter correct passcode twice<br>2. Reopen the app | 1. Passcode stored<br>2. Passcode asked | P m14 t13 |  | 
| Cancel Enable Passcode | 1. Enable Passcode in Settings view<br>2. Cancel before enter passcode<br>3. Reopen the app | 2. Passcode disabled<br>3. Passcode not asked | P m14  t13| | |
| Incorrect Passcode | Enter incorrect passcode when re-type. Check both orientations | Error displayed | P m14 t13|  | 
| Disable Passcode | 1. Disable Passcode in Settings view<br>2. Reopen the app | 1. Passcode is asked before being disabled<br>2. Passcode not asked | P m14  t13 | | |
| Cancel Disable Passcode | 1. Disable Passcode in Settings view<br>2. Cancel before enter the passcode<br>3. Reopen the app | 2. Passcode enabled<br>3. Passcode asked | P m14 t13| | |
| Files app | Enter the passcode and open Files App | 6 digit passcode asked | P m14 t13| | |
|**Passcode 4 digits (regression)**||||||
| Enable Passcode | 1. Enter correct passcode twice<br>2. Reopen the app | 1. Passcode stored<br>2. Passcode asked | P m14 t13  |  | 
| Cancel Enable Passcode | 1. Enable Passcode in Settings view<br>2. Cancel before enter passcode<br>3. Reopen the app | 2. Passcode disabled<br>3. Passcode not asked | P m14 t13| | |
| Incorrect Passcode | Enter incorrect passcode when re-type. Check both orientations | Error displayed | P m14 t13|  | 
| Disable Passcode | 1. Disable Passcode in Settings view<br>2. Reopen the app | 1. Passcode is asked before being disabled<br>2. Passcode not asked | P m14 t13 | | |
| Cancel Disable Passcode | 1. Disable Passcode in Settings view<br>2. Cancel before enter the passcode<br>3. Reopen the app | 2. Passcode enabled<br>3. Passcode asked | P m14 t13 | | |
| Files app | Enter the passcode and open Files App | 6 digit passcode asked | P m14 t13 | | |
|**Number of digits**| No negatives|||||
| requiredPasscodeDigits = 0<br>maximumPasscodeDigits = 0 | Enable passcode | Nothing happens | P m14 t13 | FIXED: Crash |  | |
| requiredPasscodeDigits = 0<br>maximumPasscodeDigits = 4 | Enable passcode | Select 4 digits| P m14 t13 |  | | |
| requiredPasscodeDigits = 1<br>maximumPasscodeDigits = 8 | Enable passcode | Select 4, 6 ,8 digits | P m14  t13|  | | |
| requiredPasscodeDigits = 4<br>maximumPasscodeDigits = 4 | Enable passcode | No selection, 4 digits are asked | P m14 t13| | |
| requiredPasscodeDigits = 8<br>maximumPasscodeDigits = 16 | Enable passcode | Select 8, 10, 12, 14, 16 digits | P m14 t13 | FIXED: Starting from 4 | |
| requiredPasscodeDigits = 8<br>maximumPasscodeDigits = 50 | Enable passcode | Select from 8 to 50, 2 by 2 | P m14 t13 | FIXED: Starting from 4 | |
| requiredPasscodeDigits = 25<br>maximumPasscodeDigits = 100 | Enable passcode | select from 25 to 100, 2 by 2 | P m14 t13 | FIXED: Starting from 4 | |
| requiredPasscodeDigits = 8<br>maximumPasscodeDigits = 4 | Enable passcode | 8 digits are asked | P m14 m13 ||  | |
|**Brute force protection (regression)**||||||
| After 3 attempts | with 6 digit passcode enabled, reopen the app and make three failed attemps | App locked | P m14 t13 | | |
|**Upgrade**||||||
| Different number of digits| 1. Set passcode with 4 digits<br>2. In `AppLockManager.swift`, set `.requiredPasscodeDigits: 6`<br>3. Reinstall the app| After unlocking with 4-digit passcode, a new 6-digit passcode is asked and stored| P m14 t13| | |
| Same number of digits| 1. Set passcode with 6 digits<br>2. In `AppLockManager.swift`, set `.requiredPasscodeDigits: 6`<br>3. Reinstall the app| After unlocking with 6-digit passcode, no new passcode is asked| P m14 t13| | |
| Face ID| 1. Set passcode with 4 digits and enable Face ID<br>2. In `AppLockManager.swift`, set `.requiredPasscodeDigits: 6`<br>3. Reinstall the app| After unlocking with face ID, a new 6-digit passcode is asked and stored| P m14 t13 | | |
| From latest version | 1. Install previous version<br>2. Enable passcode<br>3. Upgrade to current | Correctly upgraded, 4 digit passcode works properly| P m14 t13 | | |