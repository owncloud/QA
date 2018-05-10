#### Passcode 

#### PRs: <br>
https://github.com/owncloud/ios-app/pull/34

Device/s: <br>
Server: 

Number of tests: <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----- | :------------------------- | :-------: |
|**View**||||||
| Portrait | Passcode view in portrait | Correct view | | | |
| Landscape | Passcode view in landscape | Correct view | | | |
|**Passcode**||||||
| Enable Passcode | 1. Enter correct passcode twice<br>2. Reopen the app | 1. Passcode stored<br>2. Passcode asked | | | |
| Cancel Enable Passcode | 1. Enable Passcode in Settings view<br>2. Cancel before enter passcode<br>3. Reopen the app | 2. Passcode disabled<br>3. Passcode not asked | | | |
| Incorrect Passcode | Enter incorrect passcode when re-type. Check both orientations | Error displayed | | |
| Disable Passcode | 1. Disable Passcode in Settings view<br>2. Reopen the app | 1. Passcode is asked before being disabled<br>2. Passcode not asked | | | |
| Cancel Disable Passcode | 1. Disable Passcode in Settings view<br>2. Cancel before enter the passcode<br>3. Reopen the app | 2. Passcode enabled<br>3. Passcode asked | | | |
|**Periocity**||||||
| Always | Open the app several times | Passcode always set | | | |
| 1 minute | 1. Open app<br>2. After 30 seconds, reopen the app<br>3. After 1:30 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | | | |
| 5 minutes | 1. Open app<br>2. After 2 minutes, reopen the app<br>3. After 6 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | | | |
| 30 minutes | 1. Open app<br>2. After 20 minutes, reopen the app<br>3. After 40 minutes, reopen theapp | 1. Passcode asked<br>2. Passcode not asked<br>3. Passcode asked | | | |