### Security in Settings

#### PR: [https://github.com/owncloud/android/pull/4871](https://github.com/owncloud/android/pull/4871)

**Server(s)**: oCIS 8.0.4<br>
**Device(s)**: Xiaomi Redmi Note 13, Android 15. Samsung Galaxy Tab A2, Android 15<br>
**Execution date**: 25/05/2026<br>
**Tester**: jrecio<br>
**Context**: <br>

**Every test case checked with orientation changes**


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Passcode lock - set up**||||
| Passcode enabled | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice correctly<br>3. Don't activate biometric security<br>4. Kill the app and open it again | 2. Correctly stored, no feedback message<br>4. Passcode asked | P m15 t15 | [FIXED](https://github.com/owncloud/android/pull/4871#issuecomment-4534047559)<br>[FIXED](https://github.com/owncloud/android/pull/4871#issuecomment-4556075944)
| Passcode enable + cancel | 1. Click on `Passcode lock` to enable<br>2. Cancel before entering the second time by clicking the back arrow on the top<br>3. Close the app<br>4. Open the app | Passcode not asked | P m15 t15 |
| Passcode wrong 2nd attempt | 1. Click on `Passcode lock` to enable<br>2. Enter passcode<br>3. Second time, enter a different one | Error: The passcodes are not the same | P m15 t15 |
| Disable passcode | 1. With passcode enabled, click on `Passcode lock` to disable<br>2. Enter current passcode<br>3. Close the app<br>4. Open the app<br> | Passcode is not asked | P m15 t15 |
| Disable passcode + cancel | 1. With passcode enabled, click on `Passcode lock` to disable<br>2. When asked to enter the current passcode, cancel before entering by clicking the back arrow on the top<br>3. Close the app<br>4. Open the app| Passcode is asked | P m15 t15 |
|**Passcode lock protection**||||
| Passcode correct | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it<br>3. Enter correct passcode| App unlocked  | P m15 t15
| Passcode incorrect | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it<br>3. Enter incorrect passcode| Error: Incorrect passcode<br>App locked. No way no unlock it till correct passcode is entered  | P m15 t15
| Brute force protection | 1. Enable passcode and enter correct passcode to lock the app<br>2. Kill the app and open it again<br>3. Enter wrong passcode 3 times<br>4. Enter another wrong passcode<br>5. Keep entering wrong passcodes several times | 3. Wait 3 seconds to enter new attempts<br>4. Wait 5 seconds to enter new attempts<br>5. Every wrong attempt, time to wait for a new one increases | P m15 t15 | [FIXED](https://github.com/owncloud/android/pull/4871#issuecomment-4554410308)
|**Passcode lock - Number of digits**||||
| Less that 4 digits | 1. In `setup.xml` file, set `passcode_digits` with any value lower than `4`, for example `1`<br>2. Build the app and install it<br>3. In Settings > Security, enable `Passcode lock` | 4-digit passcode is asked  | P m15 t15 |
| 4 digits | 1. In `setup.xml` file, set `passcode_digits` with `4`<br>2. Build the app and install it<br>3. In Settings > Security, enable `Passcode lock` | 4-digit passcode is asked  | P m15 t15 |
| 6 digits | 1. In `setup.xml` file, set `passcode_digits` with `6`<br>2. Build the app and install it<br>3. In Settings > Security, enable `Passcode lock` | 6-digit passcode is asked  | P m15 t15 |
|**Pattern lock - set up**||||
| Pattern enabled | 1. Click on `Pattern lock` to enable<br>2. Enter same pattern twice correctly<br>3. Don't activate biometric security<br>4. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Pattern asked | P m15 t15 |
| Pattern enable + cancel | 1. Click on `Pattern lock` to enable<br>2. Cancel before entering the second time<br>3. Close the app<br>4. Open the app | Pattern not asked | P m15 t15 |
| Pattern wrong 2nd attempt | 1. Click on `Pattern lock` to enable<br>2. Enter pattern<br>3. Second time, enter a different one | Error: The patterns are not the same | P m15 t15 |
| Disable pattern | 1. With pattern enabled, click on `Pattern lock` to disable<br>2. When it's asked to enter the current pattern, enter it<br>3. Close the app<br>4. Open the app<br> | Pattern is not asked | P m15 t15 |
| Disable pattern + cancel | 1. With pattern enabled, click on `Pattern lock` to disable<br>2. When asked to enter the current pattern, cancel before entering by clicking the back arrow on the top<br>3. Close the app<br>4. Open app again | Pattern is asked | P m15 t15 |
|**Pattern lock protection**||||
| Pattern correct | 1. Enable pattern and enter correct pattern to lock the app<br>2. Kill the app and open it<br>3. Enter correct pattern| App unlocked  | P m15 t15 |
| Pattern incorrect | 1. Enable pattern and enter correct pattern to lock the app<br>2. Kill the app and open it<br>3. Enter incorrect pattern| Error: Incorrect pattern<br>App locked. No way no unlock it till correct pattern is entered  | P m15 t15 |
|**Biometrical**||||
| Cancel biometrical passcode | 1. Click on `Passcode lock` to enable<br>2. Enter same code twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app<br>6. Cancel biometrical | Passcode asked | P m15 | tab with no biometrical support |
| Cancel biometrical pattern | 1. Click on `Pattern lock` to enable<br>2. Enter same pattern twice <br>3. Activate biometric security<br>4. Kill the app<br>5. Open the app<br>6. Cancel biometrical | Pattern asked | P m15 | tab with no biometrical support |
|**Uploads**||||
| Upload from camera | 1. Enable any security method (passcode/pattern/biometrical)<br>2. In list of files, click on FAB<br>3. Click on `Picture from camera`<br>4. Take a picture and submit | Security method not asked | P m15 t15 |
| Upload from external app | 1. Enable any security method (passcode/pattern/biometrical)<br>2. Open an external app, like `Photos` or `Gallery`<br>3. Select some files and share them with ownCloud | Security method asked | P m15 t15 |
|**Lock enforced (branding option)**||||
| Lock enforced - choose method I | 1. In `setup.xml` file, set `lock_enforced` with value `1`<br>2. Build the app and install it<br>3. Select `Passcode lock`<br>4. Before entering passcode, kill the app several times and reopen it  | 3. Passcode asked<br>4. No way to reach the login view without entering correct passcode twice | P m15 t15 |
| Lock enforced - choose method II | 1. In `setup.xml` file, set `lock_enforced` with value `1`<br>2. Build the app and install it<br>3. Select `Pattern lock`<br>4. Before entering pattern, kill the app several times and reopen it  | 3. Pattern asked<br>4. No way to reach the login view without entering correct pattern twice | P m15 t15 |
| Lock enforced - passcode | 1. In `setup.xml` file, set `lock_enforced` with value `2`<br>2. Build the app and install it<br>3. Before entering passcode, kill the app several times and reopen it  | 2. Passcode asked<br>3. No way to reach the login view without entering correct passcode twice | P m15 t15 |
| Lock enforced - pattern | 1. In `setup.xml` file, set `lock_enforced` with value `3`<br>2. Build the app and install it<br>3. Before entering pattern, kill the app several times and reopen it  | 2. Pattern asked<br>3. No way to reach the login view without entering correct pattern twice | P m15  t15|
|**Device protection (branding option)**||||
| Device protection | 1. In device settings, enable a security method like pin, fingerprint or face id<br>2. In `setup.xml` file, set `device_protection` with value `true`<br>3. Build the app and install it<br>4. Open the app | It's not required to set passcode or pattern | P m15 t15|
| No device passcode/print + passcode | 1. In device settings, disable all security methods like pin, fingerprint, face id...<br>2. In `setup.xml` file, set `device_protection` with value `true`<br>3. Build the app and install it<br>4. Open the app<br>5. Select passcode and enter passcode correctly twice | 4. Dialog to choose passcode or pattern<br>5. Passcode can not be disabled in settings | P m15 t15|
| No device passcode/print + pattern | 1. In device settings, disable all security methods like pin, fingerprint, face id...<br>2. In `setup.xml` file, set `device_protection` with value `true`<br>3. Build the app and install it<br>4. Open the app<br>5. Select pattern and enter pattern correctly twice | 4. Dialog to choose passcode or pattern<br>5. Pattern can not be disabled in settings | P m15 t15|

