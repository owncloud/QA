###  Prevent screenshots via MDM

#### Pr: https://github.com/owncloud/android/pull/3627

Devices: Pixel5 v12

Server: 10.9.1

---

Steps for every test:

1. Install app in work profile
2. Open TestDPC and Load default configuration (`allow_screenshots_configuration` = true)
3. Take screenshot in oC app (every test in specific view)
4. Open TestDPC and set `allow_screenshots_configuration` = false
5. Take screenshot in oC app (every test in specific view)

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------: | 
|**Take screenshots**|||||||
| Login View |  | 3. Screenshot not taken<br>5. Screenshot not taken | P m12 |  |
| Settings View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Passcode View |  | 3. Screenshot not taken<br>5. Screenshot not taken | P m12 |  |
| Pattern View |  | 3. Screenshot not taken<br>5. Screenshot not taken | P m12 |  |
| Biometrical View (auth) |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Auto Uploads View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| More View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Privacy View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Files View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Shares View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Public Share View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Private Share View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Uploads View |  | 3. Screenshot taken<br>5. Screenshot not taken |  P m12|  |
| New folder View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Image View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
| Txt View |  | 3. Screenshot taken<br>5. Screenshot not taken | P m12 |  |
|**Parameter priority**|||||||
| MDM true | Set parameter to true in MDM and false in `setup.xml`| Screenshots allowed but passcode, pattern and login view| P m12 |  |
| MDM false | Set parameter to false in MDM and true in `setup.xml` | Screenshots allowed | P m12 |  |
| no MDM, setup false |   Remove parameter from MDM and set false in `setup.xml` | Screenshots not allowed  | P m12 |
| no MDM, setup true  | Remove parameter from MDM and set true in `setup.xml` | Screenshots allowed  | P m12 |