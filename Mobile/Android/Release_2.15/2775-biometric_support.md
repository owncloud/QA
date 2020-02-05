###  Biometric support

#### Pr: https://github.com/owncloud/android/pull/2775 

Devices: 

Server: 

---

 
| Test Case|  Steps | Expected Result | Result | Related Comment |
| :------- | :----- | :-------------- | :----- | :-------------- |  
|**Setting option**||||||
| Portrait | Open settings view | Biometric option is shown and initially disabled | |  |
| Landscape | Open settings view | Biometric option is shown and initially disabled  |  |  |
| Device with no biometric support | Open settings view in Android 5 device | Biometric option is not shown (both orientations)  |  |  |
| Device with Biometric supoprt and no items registered| Open settings view | Biometric option is not shown (both orientations)  |  |  |
|**Fingerprint registered**||||||
| Passcode | 1. Enable passcode<br>2. Enable fingerprint<br>3. Close and open the app | Fingerprint is asked and unlocks the app  |  |  |
| Passcode + cancel | 1. Enable passcode<br>2. Enable fingerprint<br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Passcode is asked  |  |  |
| Pattern lock | 1. Enable pattern lock<br>2. Enable fingerprint<br>3. Close and open the app | Fingerprint is asked and unlocks the app  |  |  |
| Pattern lock + cancel | 1. Enable pattern lock<br>2. Enable fingerprint<br>3. Close and open the app<br>4. Cancel fingerprint | 3. Fingerprint is asked<br>4. Pattern lock is asked  |  |  |
| Passcode disabled | 1. Enable passcode + fingerprint<br>2. Disable passcode | Fingerprint is disabled  |  |  |
| Pattern lock disabled | 1. Enable pattern lock + fingerprint<br>2. Disable pattern lock | Fingerprint is disabled  |  |  |
| Incorrect finger | 1. Enable passcode lock + fingerprint<br>2. Close and open the app<br>3. Input a non-registered finger | App remains locked until correct fingerprint is detected |  |  |
| Fingerprint removed | 1. Enable pattern lock + fingerprint<br>2. Remove all fingerprints from Android system<br>3. Close and open the app | 2. Fingerprint is disabled in app<br>3. Pattern lock asked  |  |   |
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
| Share with oC | 1. Enable passcode lock + biometric<br>2. Share content from an external app with oC | Biometric is asked  |  |  |
| Send copied text with oC | 1. Enable passcode lock + biometric<br>2. Send copied text from an external app with oC | Biometric is asked  |  |  |
| Remove files in settings| 1. Enable passcode lock + biometric<br>2. Go to Android settings and remove local date and cache | Biometric is asked  |  |  |

