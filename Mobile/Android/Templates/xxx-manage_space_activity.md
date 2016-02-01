###  Bug: Clearing app data removes passcode 

#### Pr: https://github.com/owncloud/android/pull/XXX 


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------ | :------------- | :------------- | :-------------- | :----- | :------
| 1 | Clear data with passcode   | 1. Set a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is required | 
| 2 | Crear data without passcode   | 1. Unset a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is not required | 

