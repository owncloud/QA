### Security flags

#### Pr: https://github.com/owncloud/android/pull/3560

Devices: Pixel2 v11

Server: 10.9.1

---

Using vysor as mirror for the device

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Debug variant**| ||||||
| Login view | Open login view | View mirrored | P m11 |  |
| Edit Login view | Open edit login view | View mirrored |  P m11|  |
| Settings view | Open settings view | View mirrored | P m11 |  |
| File list view | Open login view | View mirrored | P m11 |  |
| Share view | Open share view | View mirrored | P m11 |  |
| Passcode view | Open passcode view to set a new passcode | View mirrored | P m11 |  |
| Pattern view | Open pattern view to set a new pattern | View mirrored | P m11 |  |
| Unlock Passcode view | 1. Enable passcode in settings<br>2. Quit the app and open again | Passcode asked<br>View mirrored | P m11 |  |
| Unlock Pattern view | 1. Enable pattern in settings<br>2. Quit the app and open again | Pattern asked<br>View mirrored | P m11 |  |
| Unlock Biometrical view | 1. Enable biometrical in settings<br>2. Quit the app and open again | Biometrical asked<br>View mirrored | F m11 | black screen |
| Biometrical dismissed view | 1. Enable biometrical in settings<br>2. Quit the app and open again<br>3. Cancel biometrical | 2. Biometrical asked<br>2. View mirrored<br>3. Patterb/Passcode view mirrored | P m11 |  |
|**Release variant**| ||||||
| Login view | Open login view | View black | P m11 |  |
| Edit Login view | Open edit login view | View black | P m11 |  |
| Settings view | Open settings view | View mirrored | P m11 |  |
| File list view | Open login view | View mirrored | P m11 |  |
| Share view | Open share view | View mirrored | P m11 |  |
| Passcode view | Open passcode view to set a new passcode | View black | P m11 |  |
| Pattern view | Open pattern view to set a new pattern | View black | P m11 |  |
| Unlock Passcode view | 1. Enable passcode in settings<br>2. Quit the app and open again | Passcode asked<br>View black | P m11 |  |
| Unlock Pattern view | 1. Enable pattern in settings<br>2. Quit the app and open again | Pattern asked<br>View black | P m11 |  |
| Unlock Biometrical view | 1. Enable biometrical in settings<br>2. Quit the app and open again | Biometrical asked<br>View black | P m11 |  |
| Biometrical dismissed view | 1. Enable biometrical in settings<br>2. Quit the app and open again<br>3. Cancel biometrical | 2. Biometrical asked<br>2. View mirrored<br>3. Patterb/Passcode view black | P m11 |  |