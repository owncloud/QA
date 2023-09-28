#### Security in Settings

#### PR: 

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||
| View  | 1. Open `Settings`<br>2. Click on `Security` | Sections available:<br>- Passcode Lock<br>- Pattern Lock<br>- Biometric Lock (disabled by default)<br>- Lock application (disabled by default)<br>- Lock access from document provider<br>- Touches with other windows<br> All of them in both orientations |  | 
|**Passcode lock - set up**||||
| Passcode enabled | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice correctly<br>3. Don't activate biometric security<br>4. Kill the app and open it again | 2. Correctly stored, no feedback message<br>4. Passcode asked | 
| Passcode enable + cancel | 1. Click on `Passcode lock` to enable<br>2. Cancel before entering the second time by clicking the back arrow on the top<br>3. Close the app<br>4. Open the app | Passcode not asked |
| Passcode enable + kill app | 1. Click on `Passcode lock` to enable<br>2. Kill the app before entering the second time<br>3. Open the app | Passcode not asked |
| Passcode wrong 2nd attempt | 1. Click on `Passcode lock` to enable<br>2. Enter passcode<br>3. Second time, enter a different one | Error: The passcodes are not the same |
| Disable passcode | 1. With passcode enabled, click on `Passcode lock` to disable<br>2. Enter current passcode<br>3. Close the app<br>4. Open the app<br> | Passcode is not asked |
| Disable passcode + cancel | 1. With passcode enabled, click on `Passcode lock` to disable<br>2. When asked to enter the current passcode, cancel before entering by clicking the back arrow on the top<br>3. Close the app<br>4. Open the app| Passcode is asked |
| Disable passcode + kill | 1. With passcode enabled, click on `Passcode lock` to disable<br>2. When asked to enter the current passcode, kill the app before entering<br>3. Close the app<br>4. Open the app | Passcode is asked |
| Device clearing data | 1. With passcode enabled, go to Device Settings > Apps > ownCloud > Storage/Cache<br>2. Clear data and storage<br>3. Open the app | Passcode is asked, not reset after cleaning | 
|**Passcode lock protection**||||
| Passcode correct | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it<br>3. Enter correct passcode| App unlocked  | 
| Passcode incorrect | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it<br>3. Enter incorrect passcode| Error: Incorrect passcode<br>App locked. No way no unlock it till correct passcode is entered  | 
| Brute force protection | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it again<br>3. Enter wrong passcode 3 times<br>4. Enter another wrong passcode<br>5. Keep entering wrong passcodes several times | 3. Wait 3 seconds to enter new attempts<br>4. Wait 5 seconds to enter new attempts<br>5. Every wrong attempt, time to wait for a new one increases | 
|**Passcode lock - Number of digits**||||
| Less that 4 digits | 1. In `setup.xml` file, set `passcode_digits` with any value lower than `4`, for example `1`<br>2. Build the app and install it<br>3. In Settings > Security, enable `Passcode lock` | 4-digit passcode is asked  | 
| 4 digits | 1. In `setup.xml` file, set `passcode_digits` with `4`<br>2. Build the app and install it<br>3. In Settings > Security, enable `Passcode lock` | 4-digit passcode is asked  | 
| 6 digits | 1. In `setup.xml` file, set `passcode_digits` with `6`<br>2. Build the app and install it<br>3. In Settings > Security, enable `Passcode lock` | 6-digit passcode is asked  | 
|**Pattern lock - set up**||||
| Pattern enabled | 1. Click on `Pattern lock` to enable<br>2. Enter same pattern twice correctly<br>3. Don't activate biometric security<br>4. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Pattern asked | 
| Pattern enable + cancel | 1. Click on `Pattern lock` to enable<br>2. Cancel before entering the second time<br>3. Close the app<br>4. Open the app | Pattern not asked |
| Pattern wrong 2nd attempt | 1. Click on `Pattern lock` to enable<br>2. Enter pattern<br>3. Second time, enter a different one | Error: The patterns are not the same |
| Disable pattern | 1. With pattern enabled, click on `Pattern lock` to disable<br>2. When it's asked to enter the current pattern, enter it<br>3. Close the app<br>4. Open the app<br> | Pattern is not asked |
| Disable pattern + cancel | 1. With pattern enabled, click on `Pattern lock` to disable<br>2. When asked to enter the current pattern, cancel before entering by clicking the back arrow on the top<br>3. Close the app<br>4. Open app again | Pattern is asked | 
| Disable pattern + kill | 1. With pattern enabled, click on `Pattern lock` to disable<br>2. When asked to enter the current pattern, kill the app before entering<br>3. Close the app<br>4. Open the app| Pattern is asked |
| Device clearing data | 1. With pattern enabled, go to Device Settings > Apps > ownCloud > Storage/Cache<br>2. Clear data and storage<br>3. Open the app | Pattern is asked, not reset after cleaning | 
| Both at the same time | 1. With passcode enabled, try to enable pattern<br>2. With pattern enabled, try to enable passcode| Error: Pattern and passcode locks cannot be enabled at the same time |
|**Pattern lock protection**||||
| Pattern correct | 1. Enable pattern and enter correct pattern to lock the app<br>2. Kill the app and open it<br>3. Enter correct pattern| App unlocked  | 
| Pattern incorrect | 1. Enable pattern and enter correct pattern to lock the app<br>2. Kill the app and open it<br>3. Enter incorrect pattern| Error: Incorrect pattern<br>App locked. No way no unlock it till correct pattern is entered  | 
|**Biometrical**||||
| Biometrical with passcode | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app| Biometrical asked | 
| Biometrical with pattern | 1. Click on `Pattern lock` to enable<br>2. Enter same pattern twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app| Biometrical asked | 
| Only Biometrical  | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice correctly<br>3. Don't activate biometric security<br>4. In Settings, enable `Biometric lock`<br> 5. Kill the app<br>6. Open the app | Biometrical asked | 
| Disable biometrical + passcode | 1. With `Passcode lock` and `Biometrical lock` enabled, click on `Biometrical lock` to disable<br>2. Kill the app<br>3. Open the app| Passcode asked<br>Biometrical not asked | 
| Disable biometrical + pattern | 1. With `Pattern lock` and `Biometrical lock` enabled, click on `Biometrical lock` to disable<br>2. Kill the app<br>3. Open the app| Pattern asked<br>Biometrical not asked | 
| Cancel biometrical passcode | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app<br>6. Cancel biometrical | Passcode asked | 
| Cancel biometrical pattern | 1. Click on `Pattern lock` to enable<br>2. Enter same pattern twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app<br>6. Cancel biometrical | Pattern asked | 
|**Uploads**||||
| Upload from camera | 1. Enable any security method (passcode/pattern/biometrical)<br>2. In list of files, click on FAB<br>3. Click on `Picture from camera`<br>4. Take a picture and submit | Security method not asked |
| Upload from external app | 1. Enable any security method (passcode/pattern/biometrical)<br>2. Open an external app, like `Photos` or `Gallery`<br>3. Select some files and share them with ownCloud | Security method asked | 
|**Lock application**||||
| View | Click on `Lock application` | Options:<br>- Immediately<br>- After 1 minute<br>- After 5 minutes<br>- After 30 minutes |  |  |
| Immediately | 1. Enable pattern lock<br>2. Click on `Lock application`<br>3. Set `Immediately` <br>4. Kill the app<br>5. Open the app immediately | Pattern lock asked | |  |
| 1 minute | 1. Enable passcode lock<br>2. Click on `Lock application`<br>3. Set `After 1 minute`<br>4. Kill the app<br>5. Open the app immediately<br>6. Close the app and open after 1 minute | 5. Passcode lock not asked<br>6. Passcode lock asked  |  |  |
| 5 minutes | 1. Enable passcode lock<br>2. Click on `Lock application`<br>3. Set `After 5 minutes`<br>4. Kill the app<br>5. Open the app immediately<br>6. Close the app and open after 5 minutes | 5. Passcode lock not asked<br>6. Passcode lock asked  |  |  |
| 30 minutes | 1. Enable pattern lock<br>2. Click on `Lock application`<br>3. Set `After 30 minutes`<br>4. Kill the app<br>5. Open the app immediately<br>6. Close the app and open after 30 minutes | 5. Pattern lock not asked<br>6. Pattern lock asked  |  |  |
|**Lock delay enforced (branding option)**||||
| Enforced Immediately | 1. In `setup.xml` file, set `lock_delay_enforced` with value `1`<br>2. Build the app and install it<br>3. Open Settings > Security | `Lock application` is greyed out (not editable) with value `Immediately` |  |
| Enforced 1min | 1. In `setup.xml` file, set `lock_delay_enforced` with value `2`<br>2. Build the app and install it<br>3. Open Settings > Security | `Lock application` is greyed out (not editable) with value `1 minute` |  |
| Enforced 5min | 1. In `setup.xml` file, set `lock_delay_enforced` with value `3`<br>2. Build the app and install it<br>3. Open Settings > Security | `Lock application` is greyed out (not editable) with value `5 minutes` |  |
| Enforced 30min | 1. In `setup.xml` file, set `lock_delay_enforced` with value `4`<br>2. Build the app and install it<br>3. Open Settings > Security | `Lock application` is greyed out (not editable) with value `30 minutes` |  |
|**Lock enforced (branding option)**||||
| Lock enforced - choose method I | 1. In `setup.xml` file, set `lock_enforced` with value `1`<br>2. Build the app and install it<br>3. Select `Passcode lock`<br>4. Before entering passcode, kill the app several times and reopen it  | 3. Passcode asked<br>4. No way to reach the login view without entering correct passcode twice |  |
| Lock enforced - choose method II | 1. In `setup.xml` file, set `lock_enforced` with value `1`<br>2. Build the app and install it<br>3. Select `Pattern lock`<br>4. Before entering pattern, kill the app several times and reopen it  | 3. Pattern asked<br>4. No way to reach the login view without entering correct pattern twice |  |
| Lock enforced - passcode | 1. In `setup.xml` file, set `lock_enforced` with value `2`<br>2. Build the app and install it<br>3. Before entering passcode, kill the app several times and reopen it  | 2. Passcode asked<br>3. No way to reach the login view without entering correct passcode twice |  |
| Lock enforced - pattern | 1. In `setup.xml` file, set `lock_enforced` with value `3`<br>2. Build the app and install it<br>3. Before entering pattern, kill the app several times and reopen it  | 2. Pattern asked<br>3. No way to reach the login view without entering correct pattern twice |  |
|**Lock access from document provider**||||
| Enabled | 1. Enable passcode lock<br>2. Enable `Lock access from document provider`<br>3. Open app that supports Document Provider<br>4. Open sidemenu in that app<br>5. Click on the ownCloud account to browse through  | 4. ownCloud as `Locked`<br>5. Not posible because locking |  |  |
| Disabled | 1. Enable pattern lock<br>2. Disable `Lock access from document provider`<br>3. Open app that supports Document Provider<br>4. Open sidemenu in that app<br>5. Click on the ownCloud account to browse through  | It is posible to check every folder's content |  |  |
| Enabled -> Disabled | 1. Enable passcode lock<br>2. Enable `Lock access from document provider`<br>3. Open app that supports Document Provider<br>4. Try to browse through the account in Document Provider<br>5. Disable `Lock access from document provider`<br>6. Try to browse through the account in Document Provider | 4. Locked<br>6. It is posible to check every folder's content  |  |  |
| Disabled -> Enabled |  1. Enable pattern lock<br>2. Disable `Lock access from document provider`<br>3. Open app that supports Document Provider<br>4. Try to browse through the account in Document Provider<br>5. Enable `Lock access from document provider`<br>6. Try to browse through the account in Document Provider | 4. It is posible to check every folder's content<br>6. Locked |  |  | |
|**Touches**||||
| Touches enabled | 1. Enable the option `Touches woth other visible windows`<br>2. Click on `YES` to enable<br>2. Install Twilight app (or any other app that modulates screen light) and enable it | It is posible to click over items in the oC app  | 
| Touches disabled | 1. Disable the option `Touches woth other visible windows`<br>2. Install Twilight app (or any other app that modulates screen light) and enable it | It is posible to click over items in the oC app  | 
