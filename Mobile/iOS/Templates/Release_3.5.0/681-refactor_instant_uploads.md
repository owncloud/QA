###  Refactor Instant Uploads 

#### Pr: https://github.com/owncloud/ios/pull/681 

Devices:

Server:


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----- | :-------------- |
|**User notifications**||||||
| 1 | View - Enable instant uploads | 1. In settings, disable location services<br>2. In app, enable "Instant uploads"  | Any notification is shown |  |  |
| 2 | View - Ask enable loc. services | 1. From previous test case, enable "Background instant uploads" | Enable location services in device is requested |  |  |
|**Background disabled**||||||
| 3 | App alive - one pic | 1. Leave the app<br>2. Take a pic before three minutes<br>3. Open the app | Pic was uploaded when it was taken|  |  |
| 4 | App closed/background - one pic | 1. Kill the app<br>2. Take a pic<br>3. Open the app| 2. Pic is not uploaded<br>3. Pic is uploaded |  |  |
| 5 | App alive - some pics | 1. Leave the app <br>2. Take some pics before three minutes<br>3. Open the app | Pics were uploaded when they were taken|  |  |
| 6 | App closed/background - some pics | 1. Kill the app<br>2. Take some pics<br>3. Open the app| 2. Pics are not uploaded<br>3. Pics are uploaded |  |  |
|**Background enabled**||||||
| 7 | App alive - one pic | 1. Leave the app<br>2. Take a pic before three minutes<br>3. Open the app | Pic was uploaded when it was taken|  |  |
| 8 | App closed/background - one pic | 1. Kill the app<br>2. Take a pic<br>3. Restart location services | 2. Pic is not uploaded<br>3. Pic is uploaded |  |  |
| 9 | App alive - some pics | 1. Leave the app <br>2. Take some pics before three minutes<br>3. Open the app | Pics were uploaded when they were taken|  |  |
| 10 | App closed/background - some pics | 1. Kill the app<br>2. Take some pics<br>3. Restart location services | 2. Pics are not uploaded<br>3. Pics are uploaded |  |  |
