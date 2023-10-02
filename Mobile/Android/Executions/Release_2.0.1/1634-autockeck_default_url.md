###  Autocheck URL (related to oB) 

#### Pr: https://github.com/owncloud/android/pull/1634

Devices: Newxus 5, Nexus 10

Server: 9.0.1RC2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Hardcoded URL   |  1. Install the app with a harcoded URL<br>2. Open the app |   The connection is automatically checked | P m6, t5| |
| 2 | Not Hardcoded URL  |  1. Install the app without harcoded URL<br>2. Open the app | All works properly (connection checked after URL is input) | P m6, t5| |