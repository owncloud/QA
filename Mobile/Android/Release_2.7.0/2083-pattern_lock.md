###  Pattern lock

#### Pr: https://github.com/owncloud/android/pull/2083

Devices: Nexus 6P v7, Nexus 10 v5

Server: 10.0

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| 1 | Portrait | Open Settings View | Option is correctly displayed | P m7 t5 |  |
| 2 | Landscape | Open Settings View | Option is correctly displayed | P m7 t5 | WONT: Cancel button at the right |
|**Actions**|||||||
| 3 | Correct pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter the correct pattern | App unlocked | P m7 t5 |  |
| 4 | Incorrect pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter an incorrect pattern | App locked | P m7 t5|  |
| 5 | Cancelled pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on Cancel<br>3. Open the app | Pattern not asked | P m7 t5 |  |
| 6 | Disable pattern | 1. From 3, tap on the option to disable<br>2. Enter the correct pattern<br>3. Close and open the app  | Pattern is not asked | P m7 t5 | FIXED: Improvable message |
| 7 | Disable pattern II | 1. From 3, tap on the option to disable<br>2. Enter an incorrect pattern<br>3. Close and open the app  | Pattern is asked | P m7 t5|  |
| 8 | Disable pattern III | 1. From 3, tap on the option to disable<br>2. Before entering the pattern, kill the app<br>3. Open the app  | Pattern is asked | P m7 t5|  |
| 9 | Cancelled disable pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on Cancel<br>3. Open the app | Pattern not asked | P m7 t5 |  |
|**Passcode**|||||||
| 10 | One option from passcode | 1. Enable passcode<br>2. Enable Pattern lock | Not posible | P m7 t5 |  | Improvable message in snackbar
| 11 | One option from pattern | 1. Enable pattern<br>2. Enable Passcode | Not posible | P m7 t5 | FIXED: Improvable message in snackbar |
|**External**|||||||
| 12 | Share with oC | 1. Enable pattern<br>2. From other app, try to share content with oC | Pattern asked | P m7 t5 |  |
| 13 | Send text to oC | 1. Enable pattern<br>2. From other app, select text and share with oC | Pattern asked | P m7 t5 |  |
|**Clean data**|||||||
| 14 | Pattern not cleaned | 1. Set Pattern<br>2. In device settings, clean data of the app<br>3. Open app| Pattern remains | P m7 t5|  |