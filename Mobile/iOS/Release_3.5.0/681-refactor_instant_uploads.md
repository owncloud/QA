###  Refactor Instant Uploads 

#### Pr: https://github.com/owncloud/ios/pull/681 

Devices: iPhone6 v9, iPad Air v8.4

Server: 9.1beta


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**User notifications**||||||3
| 1 | View - Enable instant uploads | 1. In settings, disable location services<br>2. In app, enable "Instant uploads"  | Any notification is shown | P m9 t8|  |
| 2 | View - Ask enable loc. services | 1. From previous test case, enable "Background instant uploads" | Enable location services in device is requested | P m9 t8| SOLVED: Switch enabled although location services are disabled |
|**Background disabled**||||||
| 3 | App alive - one pic | 1. Leave the app<br>2. Take a pic before three minutes<br>3. Open the app | Pic was uploaded when it was taken| P m9 t8|  |
| 4 | App closed/background - one pic | 1. Kill the app<br>2. Take a pic<br>3. Open the app| 2. Pic is not uploaded<br>3. Pic is uploaded | P m9 t8|  |
| 5 | App alive - some pics | 1. Leave the app <br>2. Take some pics before three minutes<br>3. Open the app | Pics were uploaded when they were taken| P m9 t8|  |
| 6 | App closed/background - some pics | 1. Kill the app<br>2. Take some pics<br>3. Open the app| 2. Pics are not uploaded<br>3. Pics are uploaded | P m9 t8|  |
|**Background enabled**||||||
| 7 | App alive - one pic | 1. Leave the app<br>2. Take a pic before three minutes<br>3. Open the app | Pic was uploaded when it was taken| P m9 t8|  |
| 8 | App closed/background - one pic | 1. Kill the app<br>2. Take a pic<br>3. Restart location services | 2. Pic is not uploaded<br>3. Pic is uploaded | P m9 t8|  |
| 9 | App alive - some pics | 1. Leave the app <br>2. Take some pics before three minutes<br>3. Open the app | Pics were uploaded when they were taken| P m9 t8|  |
| 10 | App closed/background - some pics | 1. Kill the app<br>2. Take some pics<br>3. Restart location services | 2. Pics are not uploaded<br>3. Pics are uploaded | P m9 t8|  |
