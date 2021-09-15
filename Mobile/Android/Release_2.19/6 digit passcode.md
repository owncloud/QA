### 6 Digit passcode (value in constant)


#### PR: https://github.com/owncloud/android/pull/3341

**Devices**: Pixel2 v11<br>
**Server**: 10.8

owncloudApp/src/main/java/com/owncloud/android/ui/activity/PassCodeActivity.kt
numberOfPassInputs


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**numberOfPassInputs = 4**||||
|  View | Open `Settings` and enable passcode | 4 gaps in the screen | P m11 m7 | FIXED: Crash when deleting
|  Save | Enter 4 digits twice | Passcode is correctly stored | P m11 m7 |
|  Bad 2nd attemp | Enter 4 digits the first time<br>Enter 4 different digits the second time| Error message | P m11 m7 |
|  Enter the app| After enabling passcode, close the app and enter again | 4 digits passcode is asked | P m11 m7 |
| Disable | Enter in `Settings` and disable passcode<br>Enter twice the correct passcode | Passcode is disabled<br>Not asked to enter in the app| P m11 m7 |
| Clear cache | After enabling passcode, enter in device settings and clear oC cache<br>Enter the correct passcode | Correctly cleared | P m11 m7 | FIXED: crashes after the 2nd clear
|**numberOfPassInputs = 6**||||
|  View | Open `Settings` and enable passcode | 6 gaps in the screen | P m11 m7 | FIXED: Crash when deleting
|  Save | Enter 6 digits twice | Passcode is correctly stored | P m11 m7 |
|  Bad 2nd attemp | Enter 6 digits the first time<br>Enter 6 different digits the second time| Error message | P m11 m7 |
|  Enter the app| After enabling passcode, close the app and enter again | 6 digits passcode is asked | P m11 m7 |
| Disable | Enter in `Settings` and disable passcode<br>Enter twice the correct passcode | Passcode is disabled<br>Not asked to enter in the app| P m11 m7 |
| Clear cache | After enabling passcode, enter in device settings and clear oC cache<br>Enter the correct passcode | Correctly cleared | P m11 m7 | FIXED: crashes after the 2nd clear
|**numberOfPassInputs = 10**||||
|  View | Open `Settings` and enable passcode | 10 gaps in the screen | P m11 m7 | FIXED: Crash when deleting
|  Save | Enter 10 digits twice | Passcode is correctly stored | P m11 m7 |
|  Bad 2nd attemp | Enter 4 digits the first time<br>Enter 10 different digits the second time| Error message | P m11 m7 |
|  Enter the app| After enabling passcode, close the app and enter again | 10 digits passcode is asked | P m11 m7 |
| Disable | Enter in `Settings` and disable passcode<br>Enter twice the correct passcode | Passcode is disabled<br>Not asked to enter in the app| P m11 m7 |
| Clear cache | After enabling passcode, enter in device settings and clear oC cache<br>Enter the correct passcode | Correctly cleared | P m11 m7 | FIXED: crashes after the 2nd clear