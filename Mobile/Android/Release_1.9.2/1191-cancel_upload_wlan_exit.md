###  Cancel upload on wlan exit 

#### Pr: https://github.com/owncloud/android/pull/1191 


| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Wifi switched off|  1. With the wifi enabled, enable the option "instant uploads" and "Only Wifi"<br>2. Take some pictures<br>3. Before the pics have finished to be uploaded, switch the wifi off (to 3G or 4G) |  The pending uploads are cancelled  | P(m4,m6) |  |
| 2 | Wifi switched on|  1. From 1, switch again the wifi on<br> |  The pending uploads are not restarted  | P(m4,m6)  |  |
| 3 | Switch to wifi |  1. Enable the option "instant uploads" and "Only Wifi"<br>2. Switch the wifi off<br>3. Take some pictures<br>4. Switch the wifi on |  3. The pics are not uploaded<br>4. The pics are uploaded  | P(m4,m6) | |