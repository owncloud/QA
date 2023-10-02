###  Bug: Don't allow to remove passcode without entering it. 

#### Pr: https://github.com/owncloud/android/pull/1296 

Devices: Phone Galaxy Nexus v4, Tablet Nexus9 v6

Server: 8.2.2


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:--------: | :------------- | :------------- | :-------------- | :-----: | :------
**Bug disabling**|
| 1 | Not disabled Passcode  |  1. Passcode enabled<br>2. Tap on "Settings" and disable checkbox about Passcode without entering it<br> 3. Kill the app<br>4. Enter again in the app |  Passcode is required  | P m4 t6
| 2 | Disabled Passcode  |  1. Passcode enabled<br>2. Tap on "Settings" and disable checkbox about Passcode entering it<br> 3. Kill the app<br>4. Enter again in the app |  Passcode is not required  | P m4 t6

