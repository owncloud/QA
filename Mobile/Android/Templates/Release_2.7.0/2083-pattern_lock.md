###  Pattern lock

#### Pr: https://github.com/owncloud/android/pull/2083
---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| 1 | Portrait | Open Settings View | Option is correctly displayed |  |  |
| 2 | Landscape | Open Settings View | Option is correctly displayed |  |  |
|**Actions**|||||||
| 3 | Correct pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter the correct pattern | App unlocked |  |  |
| 4 | Incorrect pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter an incorrect pattern | App locked |  |  |
| 5 | Cancelled pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on Cancel<br>3. Open the app | Pattern not asked |  |  |
| 6 | Disable pattern | 1. From 3, tap on the option to disable<br>2. Enter the correct pattern<br>3. Close and open the app  | Pattern is not asked |  |  |
| 7 | Disable pattern II | 1. From 3, tap on the option to disable<br>2. Enter an incorrect pattern<br>3. Close and open the app  | Pattern is asked |  |  |
| 8 | Disable pattern III | 1. From 3, tap on the option to disable<br>2. Before entering the pattern, kill the app<br>3. Open the app  | Pattern is asked |  |  |
| 9 | Cancelled disable pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on Cancel<br>3. Open the app | Pattern not asked |  |  |
|**Passcode**|||||||
| 10 | One option from passcode | 1. Enable passcode<br>2. Enable Pattern lock | Not posible |  |  |
| 11 | One option from pattern | 1. Enable pattern<br>2. Enable Passcode | Not posible |  |  |
|**External**|||||||
| 12 | Share with oC | 1. Enable pattern<br>2. From other app, try to share content with oC | Pattern asked |  |  |
|**Clean data**|||||||
| 13 | Pattern not cleaned | 1. Set Pattern<br>2. In device settings, clean data of the app<br>3. Open app| Pattern remains |  |  |