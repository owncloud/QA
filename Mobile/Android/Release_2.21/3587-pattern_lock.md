###  Pattern lock

#### Pr: https://github.com/owncloud/android/pull/3587

Devices: Nexus 6P v7, Pixel2 v11. Nexus C Simulator Android11

Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------: | 
|**View**|||||||
| Portrait | Open Settings View | Option is correctly displayed | P m7 m11 t11 |  |
| Landscape | Open Settings View | Option is correctly displayed | P m7 m11  t11 |  |
|**Actions**|||||||
| Correct pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter the correct pattern | App unlocked | P m7 m11 t11|  |
| Incorrect pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter an incorrect pattern | App locked | P m7 m11 t11|  |
| Cancelled pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on back arrow<br>3. Open the app | Pattern not asked | P m7 m11 t11 |  |
| Disable pattern | 1. Enable pattern <br>2. Tap on the option to disable<br>3. Enter the correct pattern<br>4. Close and open the app  | Pattern is not asked | P m7 m11 t11 |  |
| Disable pattern II | 1. Enable pattern <br>2. Tap on the option to disable<br>3. Enter an incorrect pattern<br>4. Close and open the app  | Pattern is asked | F m7 m11 t11| Repeated after back arrow. No regression, to fix in other issue |
| Disable pattern III | 1. Enable pattern <br>2. Tap on the option to disable<br>3. Before entering the pattern, kill the app<br>4. Open the app  | Pattern is asked | P m7 m11 t11 |  |
|**Passcode**|||||||
| One option from passcode | 1. Enable passcode<br>2. Enable Pattern lock | Not posible | P m7 m11 t11 |  | Improvable message in snackbar
| One option from pattern | 1. Enable pattern<br>2. Enable Passcode | Not posible | P m7 m11 t11  |  |
|**External**|||||||
| Share with oC | 1. Enable pattern<br>2. From other app, try to share content with oC | Pattern asked | P m7 m11 t11 |  |
| Send text to oC | 1. Enable pattern<br>2. From other app, select text and share with oC | Pattern asked | P m7 m11 t11 |  |
|**Clean data**|||||||
| Pattern not cleaned | 1. Set Pattern<br>2. In device settings, clean data of the app<br>3. Open app| Pattern remains | P m7 m11 t11 |  |