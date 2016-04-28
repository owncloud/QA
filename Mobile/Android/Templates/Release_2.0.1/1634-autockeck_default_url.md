###  Autocheck URL (related to oB) 

#### Pr: https://github.com/owncloud/android/pull/1634

Devices:

Server:


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Hardcoded URL   |  1. Install the app with a harcoded URL<br>2. Open the app |   The connection is automatically checked | | |
| 2 | Not Hardcoded URL  |  1. Install the app without harcoded URL<br>2. Open the app | All works properly (connection checked after URL is input) | | |