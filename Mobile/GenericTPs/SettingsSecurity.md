##Security in Settings


| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
| View Portrait | Enter in the Security section | Different sections available: Passcode Lock, Pattern Lock, Biometric Lock (disabled by default, if device supports it), and Touches with other windows (including a tip) |  | 
| View Landscape | Enter in the Security section | Different sections available: Passcode Lock, Pattern Lock, Biometric Lock (disabled by default), and Touches with other windows (including a tip) |  | 
| Passcode enabled |1. Enable passcode entering it twice correctly<br>2. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Passcode asked |P m11 m7 
| Passcode enable cancel | 1. Enable passcode<br>2. Cancel before entering the second time<br>3. Enter the app | Passcode not asked |
| Passcode enable kill app | 1. Enable passcode<br>2. Kill the app before entering the second time<br>3. Enter the app | Passcode not asked |
| Passcode bad 2nd attempt | 1. Enable passcode<br>2. Enter passcode<br>3. Second time, enter a different one | Correct error message |
| Disable passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore |
| Disable passcode cancel | 1. Select to disable passcode<br>2. When asked to enter the current passcode, cancel before entering<br>3. Reopen the app again<br>| Passcode is asked |
| Disable passcode killing | 1. Select to disable passcode<br>2. When asked to enter the current passcode, kill the before entering<br>3. Reopen the app again<br>| Passcode is asked |
| Passcode security | 1. With passcode enabled, go to device settings and clear data<br>2. Open the app<br>| Passcode is asked | 
| Pattern enabled | 1. Enable pattern entering it twice correctly<br>2. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Pattern asked |P m11 m7
| Pattern enable cancel | 1. Enable pattern<br>2. Cancel before entering the second time<br>3. Enter the app | Pattern not asked |
| Pattern bad 2nd attempt | 1. Enable pattern<br>2. Enter pattern<br>3. Second time, enter a different one | Correct error message |
| Disable pattern | 1. Select to disable pattern<br>2. When it's asked to enter the current pattern, enter it<br>3. Leave the app<br>4. Open the app<br> | Pattern is not asked anymore |
| Disable pattern cancel | 1. Select to disable patterb<br>2. When asked to enter the current passcode, cancel before entering<br>3. Reopen the app again<br>| Pattern is asked |P m11 m7
| Disable pattern killing | 1. Select to disable pattern<br>2. When asked to enter the current pattern, kill the before entering<br>3. Reopen the app again<br>| Pattern is asked |
| Pattern security | 1. With pattern enabled, go to device settings and clear data<br>2. Open the app<br>| Pattern is asked |
| Both at the same time | Try to enable pattern and passcode lock at the same time | Not posible, correct error |
| Biometrical handling| 1. Enable pattern<br>2. Disable pattern and enable passcode<br>3. Disable both pattern and passcode| 1. Biometrical enabled<br>2. Biometrical enabled<br>3. Biometrical disabled| 
| Biometrical unlock | 1. Register a finger<br>2. Enable pattern/passcode + biometrical<br>3. Leave the app and enter again<br>4. Repeat the process and cancel the biometrical when it is asked| 3. Biometrical asked<br>4. Passcode/Pattern asked | 
| Biometrical disabled | 1. Disable biometrical<br>2. Leave the app and enter again | Passcode/Pattern asked |
| Upload file from camera with security | With a security method enabled (pattern/passcode/biometrical), upload from camera | Security not asked |
| Upload file from external app with security | With a security method enabled (pattern/passcode/biometrical), upload from external app | Security asked | 
| Touches enabled | 1. Enable the option `Touches woth other visible windows`<br>2. Install Twilight app and enable it | It is posible to touch the oC app | 
| Touches disabled | 1. Disable the option `Touches woth other visible windows`<br>2. Install Twilight app and enable it | It is not posible to touch the oC app | 
