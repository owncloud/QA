###  Biometric support

#### Pr: https://github.com/owncloud/android/pull/2775 

Devices: Pixel2 Android 10, Nexus 5 Android 5, Nexus 5X Android 8, Samsung S9 Android 9, Samsung tab Android 6

Server: 10.3.2

---

 
| Test Case|  Steps | Expected Result | Result | Related Comment |
| :------- | :----- | :-------------- | :----: | :-------------- |  
|**Setting option**||||||
| Portrait | Open settings view | Biometric option is shown and initially disabled | P m10 m9 m8 m7 t6|  |
| Landscape | Open settings view | Biometric option is shown and initially disabled  | P m10 m9 m8 m7 t6|  |
| Device with no biometric support | Open settings view in Android 5 device | Biometric option is not shown (both orientations)  | P m5 |  |
| Device with Biometric support and no items registered| Open settings view | Biometric option can not be enabled  | P m10 m9 m8 m7 t6 |  |
|**Fingerprint registered**||||||
| Passcode | 1. Enable passcode<br>2. Enable biometric<br>3. Close and open the app | Fingerprint is asked and unlocks the app  | P m10 m9 m8 m7 t6 |  |
| Passcode + cancel | 1. Enable passcode<br>2. Enable biometric <br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Passcode is asked  | P m10 F m9 m7 m8 t6|  |
| Pattern lock | 1. Enable pattern lock<br>2. Enable biometric <br>3. Close and open the app | Fingerprint is asked and unlocks the app  | P m10 m9 m8 m7 t6|  |
| Pattern lock + cancel | 1. Enable pattern lock<br>2. Enable biometric <br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Pattern lock is asked  | P m10 F m9 m7 m8 t6 |  |
| Passcode disabled | 1. Enable passcode + biometric <br>2. Disable passcode | Fingerprint is disabled  | P m10 m9 m8 m7 t6|  |
| Pattern lock disabled | 1. Enable pattern lock + biometric <br>2. Disable pattern lock | Fingerprint is disabled  | P m10 m9 m8 m7 t6 |  |
| Incorrect finger | 1. Enable passcode lock + biometric <br>2. Close and open the app<br>3. Input a non-registered finger | App remains locked until correct fingerprint is detected | P m10 m9 m8 m7 t6 |  |
| Fingerprint removed | 1. Enable pattern lock + biometric <br>2. Remove all fingerprints from Android system<br>3. Close and open the app | 2. Biometric is disabled in app<br>3. Pattern lock asked  | P m10 m9 m8 m7|   |
|**Face registered**||||||
| Passcode | 1. Enable passcode<br>2. Enable face id<br>3. Close and open the app | face id is asked and unlocks the app  |  |  |
| Passcode + cancel | 1. Enable passcode<br>2. Enable face id<br>3. Close and open the app<br>4. Cancel face id | 3. face id is asked<br>4. Passcode is asked  |  |  |
| Pattern lock | 1. Enable pattern lock<br>2. Enable face id<br>3. Close and open the app | Face id is asked and unlocks the app  |  |  |
| Pattern lock + cancel | 1. Enable pattern lock<br>2. Enable face id<br>3. Close and open the app<br>4. Cancel face id | 3. Face id is asked<br>4. Pattern lock is asked  |  |  |
| Passcode disabled | 1. Enable passcode + face id<br>2. Disable passcode | Face id is disabled  |  |  |
| Pattern lock disabled | 1. Enable pattern lock + face id<br>2. Disable pattern lock | Face id is disabled  |  |  |
| Incorrect face | 1. Enable passcode lock + fingerprint<br>2. Close and open the app<br>3. Input a non-registered face  | App remains locked until correct face is detected |  |  |
| Face removed | 1. Enable pattern lock + face id<br>2. Remove all faces from Android system<br>3. Close and open the app | 2. Biometric is disabled in app<br>3. Pattern lock asked  |  |   |
|**Externals**||||||
| Share with oC | 1. Enable passcode lock + biometric<br>2. Share content from an external app with oC | Biometric is asked  | P m10 m9 m8 m7 m6 |  |
| Send copied text with oC | 1. Enable passcode lock + biometric<br>2. Send copied text from an external app with oC | Biometric is asked  | P m10 m9 m8 m7 m6 |  |
| Remove files in settings| 1. Enable passcode lock + biometric<br>2. Go to Android settings and remove local date and cache | Biometric is asked  | P m10 m9 m8 m7 m6 |  |

