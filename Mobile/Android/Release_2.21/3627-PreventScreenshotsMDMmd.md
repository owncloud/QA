###  Prevent screenshots via MDM

#### Pr: https://github.com/owncloud/android/pull/3627

Devices: Nexus 6P v7, Pixel5 v12. 

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
|**Release build**|||||||
| Login View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Settings View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Passcode View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Pattern View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Biometrical View (auth) |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Auto Uploads View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| More View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Privacy View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Files View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Shares View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Public Share View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Private Share View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Uploads View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| New folder View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Image View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
| Txt View |  | 3. Screenshot taken<br>5. Screenshot not taken |  |  |
|**Debug build**|||||||
| Login View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Settings View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Passcode View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Pattern View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Biometrical View (auth) |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Auto Uploads View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| More View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Privacy View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Files View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Shares View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Public Share View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Private Share View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Uploads View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| New folder View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Image View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |
| Txt View |  | 3. Screenshot taken<br>5. Screenshot taken |  |  |