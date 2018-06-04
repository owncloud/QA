#### Passcode 

#### PRs: https://github.com/owncloud/ios-app/pull/34

Device/s: iPhone6S Plus v11, iPadair2 v11 <br>
Server: 10.0.8 (not relevant)

Number of tests: 12<br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait | Passcode view in portrait | Correct view | P m11 t11 | | |
| Landscape | Passcode view in landscape | Correct view | F m11 t11 | Bad view | |
|**Passcode**||||||
| Enable Passcode | 1. Enter correct passcode twice<br>2. Reopen the app | 1. Passcode stored<br>2. Passcode asked | P m11 t11 | | |
| Cancel Enable Passcode | 1. Enable Passcode in Settings view<br>2. Cancel before enter passcode<br>3. Reopen the app | 2. Passcode disabled<br>3. Passcode not asked | P m11 t11 | | |
| Incorrect Passcode | Enter incorrect passcode when re-type. Check both orientations | Error displayed | P m11 t11 | |
| Disable Passcode | 1. Disable Passcode in Settings view<br>2. Reopen the app | 1. Passcode is asked before being disabled<br>2. Passcode not asked | P m11 t11 | | |
| Cancel Disable Passcode | 1. Disable Passcode in Settings view<br>2. Cancel before enter the passcode<br>3. Reopen the app | 2. Passcode enabled<br>3. Passcode asked | P m11 t11 | | |
|**Periocity**||||||
| Always | Open the app several times | Passcode always set | P m11 t11| | |
| 1 minute | 1. Open app<br>2. After 30 seconds, reopen the app<br>3. After 1:30 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | P m11 t11|  | |
| 5 minutes | 1. Open app<br>2. After 2 minutes, reopen the app<br>3. After 6 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | P m11 | | |
| 30 minutes | 1. Open app<br>2. After 20 minutes, reopen the app<br>3. After 40 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | P m11 | | |
|**Brute force protection**||||||
| After 3 attempts | Reopen the app and make three failed attemps | App locked | P m11 | | |