###  Fingerprint lock

#### Pr: https://github.com/owncloud/android/pull/2128 


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Setting option**||||||
| 1 | Portrait | Open settings view | Fingreprint option is shown and initially disabled |  |  |
| 2 | Landscape | Open settings view | Fingreprint option is shown and initially disabled  |  |  |
| 3 | Device with no fingerprint | Open settings view | Fingreprint option is not shown (both orientations)  |  |  |
| 4 | Device with fingerprint and no fingers registered| Open settings view | Fingreprint option is not shown (both orientations)  |  |  |
|**Fingerprint registered**||||||
| 5 | Passcode | 1. Enable passcode<br>2. Enable fingerprint<br>3. Close and open the app | Fingerprint is asked and unlocks the app  |  |  |
| 6 | Passcode + cancel | 1. Enable passcode<br>2. Enable fingerprint<br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Passcode is asked  |  |  |
| 7 | Pattern lock | 1. Enable pattern lock<br>2. Enable fingerprint<br>3. Close and open the app | Fingerprint is asked and unlocks the app  |  |  |
| 8 | Pattern lock + cancel | 1. Enable pattern lock<br>2. Enable fingerprint<br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Pattern lock is asked  |  |  |
| 9 | Passcode disabled | 1. Enable passcode + fingerprint<br>2. Disable passcode | Fingerprint is disabled  |  |  |
| 10 | Pattern lock disabled | 1. Enable pattern lock + fingerprint<br>2. Disable pattern lock | Fingerprint is disabled  |  |  |
| 11 | Incorrect finger | 1. Enable passcode lock + fingerprint<br>2. Close and open the app<br>3. Input a non-registered finger | App remains locked until correct fingerprint is detected |  |  |
| 12 | Fingerprint removed | 1. Enable pattern lock + fingerprint<br>2. Remove all fingerprints from Android system<br>3. Close and open the app | 2. Fingerprint is disabled in app<br>3. Pattern lock asked  |  |  |
|**Externals**||||||
| 13 | Share with oC | 1. Enable passcode lock + fingerprint<br>2. Share content from an external app with oC | Fingerprint is asked  |  |  |
| 14 | Send copied text with oC | 1. Enable passcode lock + fingerprint<br>2. Send copied text from an external app with oC | Fingerprint is asked  |  |  |
| 15 | Open with an external app | 1. Enable passcode lock + fingerprint<br>2. With an extenal app, open some oC content| Fingerprint is asked  |  |  |
| 16 | Remove files in settings| 1. Enable passcode lock + fingerprint<br>2. Go to Android settings and remove local date and cache | Fingerprint is asked  |  |  |

