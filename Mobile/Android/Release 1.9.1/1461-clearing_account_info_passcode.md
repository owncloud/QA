###  Bug: Clearing app data removes passcode 

#### Pr: https://github.com/owncloud/android/pull/1461

Devices: MotorolaE v4.4.4 (m4a), HTC one v4.3 (m4b)

Server: 8.2.2


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:--------: | :------------- | :------------- | :-------------- | :-----: | :------
| 1 | From scratch | 1. Install the app <br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data | The app works correctly
| 2 | Clear data with passcode (http server)| 1. Set a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is required. All data (settings, database) are removed | P m4a m4b | SOLVED: Settings are not cleared
| 3 | Clear data with passcode (https server)| 1. Set a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is required. All data (settings, database, server certificates) are removed | P m4a m4b | If certificate is not trusted -> clearing avoids navigation
| 4 | Clear data without passcode   | 1. Unset the passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data.<br> 3. Enter the app | The passcode is not required. All data (settings, database, server certificates) are removed | P m4a m4b | 
| 5 | Multiaccount | 1. Set the passcode in the app<br>2. Add several accounts to the list<br>3. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data.<br> 4. Enter the app | The passcode is required. All data (settings, databases, server certificates) are removed | P m4a m4b | After clearing, pins to the first server in the list
