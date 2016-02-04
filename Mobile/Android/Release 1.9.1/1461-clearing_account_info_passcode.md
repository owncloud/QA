###  Bug: Clearing app data removes passcode 

#### Pr: https://github.com/owncloud/android/pull/1461

Devices: MotorolaE v4.4.4 (m4a), HTC one v4.3 (m4b), Tablet Nexus9 v6 (t9), Nexus5 v5 (m5), Samsung Galaxy SIII v4.1.2 (m4c)

Server: 8.2.2


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:--------: | :------------- | :------------- | :-------------- | :-----: | :------
| 1 | From scratch | 1. Install the app <br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data | The app works correctly | P m4a m4b t9 m5 m4c
| 2 | Clear data with passcode (http server)| 1. Set a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is required. All data (settings, database) are removed | F m4a m4b t9 m5 m4c| SOLVED: Settings are not cleared. App crash in a pic is opened when clearing
| 3 | Clear data with passcode (https server)| 1. Set a passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data. <br> 3. Enter the app | The passcode is required. All data (settings, database, server certificates) are removed | P m4a m4b t9 m5 m4c| If certificate is not trusted -> clearing avoids navigation
| 4 | Clear data without passcode   | 1. Unset the passcode in the app<br>2. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data.<br> 3. Enter the app | The passcode is not required. All data (settings, database, server certificates) are removed | P m4a m4b t9 m5 m4c| 
| 5 | Multiaccount | 1. Set the passcode in the app<br>2. Add several accounts to the list<br>3. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data.<br> 4. Enter the app | The passcode is required. All data (settings, databases, server certificates) are removed | P m4a m4b t9 m5 m4c| After clearing, pins to the first server in the list
| 6 | Clear data response | 1. Go to Settings > Apps > ownCloud > Storage > Manage Space and clear data (huge account). | While it is being cleared, a message is shown  | NOT REPRODUCEABLE | Clear data process takes little time 