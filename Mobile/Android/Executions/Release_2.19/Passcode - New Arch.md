### Passcode view - New Architecture


#### PR: https://github.com/owncloud/android/pull/3341

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.8

owncloudApp/src/main/java/com/owncloud/android/ui/activity/PassCodeActivity.kt
numberOfPassInputs


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| View Portrait | Enter in Passcode view | Correct view | P m11 m7| 
| View Landscape | Enter in the Passcode view  | Correct view | P m11 m7| 
| Passcode enabled |1. Enable passcode entering it twice correctly<br>2. Kill the app and open it again | 1. Correctly stored, no feedback message<br>2. Passcode asked | P m11 m7 | FIXED: Softkeyboard is vanished
| Passcode enable cancel | 1. Enable passcode<br>2. Cancel before entering the second time<br>3. Enter the app | Passcode not asked | P m11 m7
| Passcode enable kill app | 1. Enable passcode<br>2. Kill the app before entering the second time<br>3. Enter the app | Passcode not asked | P m11 m7
| Passcode bad 2nd attempt | 1. Enable passcode<br>2. Enter passcode<br>3. Second time, enter a different one | Correct error message | P m11 m7
| Disable passcode | 1. Select to disable passcode<br>2. When it's asked to enter the current passcode, enter it<br>3. Leave the app<br>4. Open the app<br> | Passcode is not asked anymore | P m11 m7
| Disable passcode cancel | 1. Select to disable passcode<br>2. When asked to enter the current passcode, cancel before entering<br>3. Reopen the app again<br>| Passcode is asked | P m11 m7
| Disable passcode killing | 1. Select to disable passcode<br>2. When asked to enter the current passcode, kill the before entering<br>3. Reopen the app again<br>| Passcode is asked | P m11 m7
| Passcode security | 1. With passcode enabled, go to device settings and clear data<br>2. Open the app<br>| Passcode is asked | P m11 m7
