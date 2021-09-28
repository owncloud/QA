### Lock delay 


#### PR: https://github.com/owncloud/android/pull/3344

**Devices**: Pixel2 v11<br>
**Server**: 10.8


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**View**||||
| Portrait | 1. Open `Settings`<br>2. Enable passcode | 1. New option to look the application is greyed out<br>2. Available with 4 options: immediately, 1 minute, 5minutes, 30 minutes | P m11 |  |
| Landscape | 1. Open `Settings`<br>2. Enable passcode | 1. New option to look the application is greyed out<br>2. Available with 4 options: immediately, 1 minute, 5minutes, 30 minutes | P m11 |  |
|**Immediately**||||
| Passcode after 5 secs | 1. Enable passcode<br>2. Reopen the app after 5 seconds | Passcode asked | P m11 |  |
| Pattern after 5 secs | 1. Enable pattern<br>2. Reopen the app after 5 seconds | Pattern asked | P m11 |  |
| Biometrical after 5 secs | 1. Enable biometrical<br>2. Reopen the app after 5 seconds | Biometrical asked | P m11 |  |
|**1 minute**||||
| Passcode after 5 secs | 1. Enable passcode<br>2. Reopen the app after 5 seconds | Passcode not asked | P m11 |  |
| Pattern after 5 secs | 1. Enable pattern<br>2. Reopen the app after 5 seconds | Pattern not asked |  |  |
| Biometrical after 5 secs | 1. Enable biometrical<br>2. Reopen the app after 5 seconds | Biometrical not asked |  |  |
| Passcode after 30 secs | 1. Enable passcode<br>2. Reopen the app after 30 seconds | Passcode not asked | F m11 | Passcode asked |
| Pattern after 30 secs | 1. Enable pattern<br>2. Reopen the app after 30 seconds | Pattern not asked |  |  |
| Biometrical after 30 secs | 1. Enable biometrical<br>2. Reopen the app after 30 seconds | Biometrical not asked |  |  |
| Passcode after 50 secs | 1. Enable passcode<br>2. Reopen the app after 50 seconds | Passcode not asked | F m11 |  |
| Pattern after 50 secs | 1. Enable pattern<br>2. Reopen the app after 50 seconds | Pattern not asked |  |  |
| Biometrical after 50 secs | 1. Enable biometrical<br>2. Reopen the app after 50 seconds | Biometrical not asked |  |  |
| Passcode after +1 min | 1. Enable passcode<br>2. Reopen the app after +1 min | Passcode asked |  |  |
| Pattern after +1 min | 1. Enable pattern<br>2. Reopen the app after +1 min| Pattern asked |  |  |
| Biometrical after +1 min | 1. Enable biometrical<br>2. Reopen the app after +1 min | Biometrical asked |  |  |
|**5 minutes**||||
| Passcode after 1min | 1. Enable passcode<br>2. Reopen the app after 1min | Passcode not asked |  |  |
| Pattern after 1min | 1. Enable pattern<br>2. Reopen the app after 1min | Pattern not asked |  |  |
| Biometrical after 1min| 1. Enable biometrical<br>2. Reopen the app after 1min | Biometrical not asked |  |  |
| Passcode after 3mins | 1. Enable passcode<br>2. Reopen the app after 3mins | Passcode not asked |  |  |
| Pattern after 3mins | 1. Enable pattern<br>2. Reopen the app after 3mins | Pattern not asked |  |  |
| Biometrical after 3mins | 1. Enable biometrical<br>2. Reopen the app after 3mins | Biometrical not asked |  |  |
| Passcode after +5 min | 1. Enable passcode<br>2. Reopen the app after +1 min | Passcode asked |  |  |
| Pattern after +5 min | 1. Enable pattern<br>2. Reopen the app after +1 min| Pattern asked |  |  |
| Biometrical after +5 min | 1. Enable biometrical<br>2. Reopen the app after +1 min | Biometrical asked |  |  |
|**30 minutes**||||
| Passcode after 15min | 1. Enable passcode<br>2. Reopen the app after 15min | Passcode not asked |  |  |
| Pattern after 15min | 1. Enable pattern<br>2. Reopen the app after 15min | Pattern not asked |  |  |
| Biometrical after 15min| 1. Enable biometrical<br>2. Reopen the app after 15min | Biometrical not asked |  |  |
| Passcode after +30mins | 1. Enable passcode<br>2. Reopen the app after +30mins | Passcode asked |  |  |
| Pattern after +30mins | 1. Enable pattern<br>2. Reopen the app after +30mins | Pattern asked |  |  |
| Biometrical after +30mins | 1. Enable biometrical<br>2. Reopen the app after +30mins | Biometrical asked |  |  |

