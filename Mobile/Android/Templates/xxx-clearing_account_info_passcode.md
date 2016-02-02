###  Bug: Clearing app data removes passcode 

#### Pr: https://github.com/owncloud/android/pull/XXX 

Devices:

Server: 


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:--------: | :------------- | :------------- | :-------------- | :----- | :------
| 1 | Clear data with passcode   | 1. Set a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is required. All data (accounts, files, settings...) are removed | 
| 2 | Clear data without passcode   | 1. Unset the passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is not required. All data (accounts, files, settings...) are removed | 
| 3 | Multiaccount | 1. Set the passcode in the app<br>2. Add several accounts to the list<br>3. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 4. Enter the app | The passcode is not required. All data (accounts, files, settings...) are removed | 