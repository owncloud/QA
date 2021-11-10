###  Pattern lock

#### Pr: https://github.com/owncloud/android/pull/3389

Devices: Nexus 6P v7

Server: 10.8

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| Portrait | Open Settings View | Option is correctly displayed | P m7  |  |
| Landscape | Open Settings View | Option is correctly displayed | P m7  | |
|**Actions**|||||||
| 3. Correct pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter the correct pattern | App unlocked | P m7  |  |
| Incorrect pattern | 1. Enable pattern lock and set a correct pattern<br>2. Leave the app<br>3. Open the app and enter an incorrect pattern | App locked | P m7 |  |
| Cancelled pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on Cancel<br>3. Open the app | Pattern not asked | P m7 |  |
| Disable pattern | 1. From 3, tap on the option to disable<br>2. Enter the correct pattern<br>3. Close and open the app  | Pattern is not asked | P m7 | |
| Disable pattern II | 1. From 3, tap on the option to disable<br>2. Enter an incorrect pattern<br>3. Close and open the app  | Pattern is asked | P m7 |  |
| Disable pattern III | 1. From 3, tap on the option to disable<br>2. Before entering the pattern, kill the app<br>3. Open the app  | Pattern is asked | P m7 |  |
| Cancelled disable pattern | 1. Enable pattern lock and set a correct pattern<br>2. Before the second time, tap on Cancel<br>3. Open the app | Pattern not asked | P m7  |  |
|**External**|||||||
| Share with oC | 1. Enable pattern<br>2. From other app, try to share content with oC | Pattern asked | P m7 |  |
| Send text to oC | 1. Enable pattern<br>2. From other app, select text and share with oC | Pattern asked | P m7  |  |
|**Clean data**|||||||
| Pattern not cleaned | 1. Set Pattern<br>2. In device settings, clean data of the app<br>3. Open app| Pattern remains | P m7 |  |