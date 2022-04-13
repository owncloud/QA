### Passcode improvements

#### PR: https://github.com/owncloud/android/pull/3582

Devices: Nexus 6P v7, Pixel 5 Android 12 <br>
Server: 10.9.1


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| Passcode enable cancel | 1. Enable passcode<br>2. Cancel before entering the second time<br>3. Enter the app | Passcode not asked | P m12 m7
| Passcode enable kill app | 1. Enable passcode<br>2. Kill the app before entering the second time<br>3. Enter the app | Passcode not asked |P m12 m7
| Passcode bad 2nd attempt | 1. Enable passcode<br>2. Enter passcode<br>3. Second time, enter a different one | Correct error message |P m12 m7
| Disable passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore |P m12 m7
| Disable passcode cancel | 1. Select to disable passcode<br>2. When asked to enter the current passcode, cancel before entering<br>3. Reopen the app again<br>| Passcode is asked |P m12 m7
| Disable passcode killing | 1. Select to disable passcode<br>2. When asked to enter the current passcode, kill the before entering<br>3. Reopen the app again<br>| Passcode is asked |P m12 m7
| Passcode security | 1. With passcode enabled, go to device settings and clear data<br>2. Open the app<br>| Passcode is asked | P m12 m7
| Passcode enforced | 1. `lock_enforced` true in `setup.xml`<br>2. Open the app<br>| Passcode is asked and no way to skip | P m12 m7
| 6 - digit Passcode | 1. `passcode_digits` == 6 in `setup.xml`<br>2. Open the app<br>| Passcode is asked with 6 digits | P m12 m7
