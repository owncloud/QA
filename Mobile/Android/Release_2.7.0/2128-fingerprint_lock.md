###  Fingerprint lock

#### Pr: https://github.com/owncloud/android/pull/2128 

Devices: Nexus 5X v8, Nexus10 v5, Nexus 6P v7

Server: 10.0.7


---

 
| Test ID | Test Case|  Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Setting option**||||||
| 1 | Portrait | Open settings view | Fingreprint option is shown and initially disabled | P m8  m7|  |
| 2 | Landscape | Open settings view | Fingreprint option is shown and initially disabled  | P m8 m7|  |
| 3 | Device with no fingerprint | Open settings view | Fingreprint option is not shown (both orientations)  | P t5 |  |
| 4 | Device with fingerprint and no fingers registered| Open settings view | Fingreprint option is not shown (both orientations)  | P m8 m7| Option appears as disabled|
|**Fingerprint registered**||||||
| 5 | Passcode | 1. Enable passcode<br>2. Enable fingerprint<br>3. Close and open the app | Fingerprint is asked and unlocks the app  | P m8 m7|  |
| 6 | Passcode + cancel | 1. Enable passcode<br>2. Enable fingerprint<br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Passcode is asked  | P m8 m7|  |
| 7 | Pattern lock | 1. Enable pattern lock<br>2. Enable fingerprint<br>3. Close and open the app | Fingerprint is asked and unlocks the app  | P m8 m7|  |
| 8 | Pattern lock + cancel | 1. Enable pattern lock<br>2. Enable fingerprint<br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Pattern lock is asked  | P m8 m7|  |
| 9 | Passcode disabled | 1. Enable passcode + fingerprint<br>2. Disable passcode | Fingerprint is disabled  | P m8 m7|  |
| 10 | Pattern lock disabled | 1. Enable pattern lock + fingerprint<br>2. Disable pattern lock | Fingerprint is disabled  | P m8 m7|  |
| 11 | Incorrect finger | 1. Enable passcode lock + fingerprint<br>2. Close and open the app<br>3. Input a non-registered finger | App remains locked until correct fingerprint is detected | P m8 m7|  |
| 12 | Fingerprint removed | 1. Enable pattern lock + fingerprint<br>2. Remove all fingerprints from Android system<br>3. Close and open the app | 2. Fingerprint is disabled in app<br>3. Pattern lock asked  | P m8 m7| FIXED: No fingers and fingerprint asked |
|**Externals**||||||
| 13 | Share with oC | 1. Enable passcode lock + fingerprint<br>2. Share content from an external app with oC | Fingerprint is asked  | P m8 m7|  |
| 14 | Send copied text with oC | 1. Enable passcode lock + fingerprint<br>2. Send copied text from an external app with oC | Fingerprint is asked  | P m8 m7|  |
| 15 | Remove files in settings| 1. Enable passcode lock + fingerprint<br>2. Go to Android settings and remove local date and cache | Fingerprint is asked  | P m8 m7| FIXED: Fingerprint removed |

