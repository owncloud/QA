###  Passcode in 2FA auth servers 

#### Pr: https://github.com/owncloud/ios/pull/899

Devices: iPhone 6Plus v10.1.1, iPAd Air v10.3.1, iPhone6S Plus v9.3.2

Server: v10, v9.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**SAML server - Passcode not enforced**||||||
| 1 | From scratch without leaving| 1. Install the app<br>2. Login in the app  | Login process is completed  | P m10 t10 |  |
| 2 | From scratch leaving| 1. Install the app<br>2. Login in the app | Login process is completed | P m10 t10 | FIXED: Touch id and passcode both asked |
| 3 | Session renewal without leaving| 1. Wait until session expires (passcode set previously)<br>2. Login in the app  | Login process is completed  | P m10 t10 |  |
| 4 | Session renewal leaving| 1. Wait until session expires (passcode set previously)<br>2. Login in the app | Login process is completed after passcode is required | P m10 t10 | FIXED: Touch id and passcode both asked |
|**SAML server - Passcode enforced**||||||
| 5 | From scratch without leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app  | Login process is completed  | P m10 t 10 |  |
| 6 | From scratch leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app. Leave the app in the middle of the process and enter again (change orientation) | Login process is completed after passcode is required | P m10 t10 | FIXED: Different behaviour |
| 7 | Session renewal without leaving| 1. Wait until session expires<br>2. Login in the app  | Login process is completed  | P m10 t10 |  |
| 8 | Session renewal leaving| 1. Wait until session expires<br>2. Login in the app. Leave the app in the middle of the process and enter again (change orientation)| Login process is completed | P m10 t10 |  |
|**2FA server - Passcode not enforced**||||||
| 9 | From scratch without leaving| 1. Install the app<br>2. First step<br>3. Second step without leaving the app  | Login process is completed  | P m10 t10 m9|  |
| 10 | From scratch leaving| 1. Install the app<br>2. First step<br>3. Leave the app<br>4. Second step  | Login process is completed  | P m10 t10 m9 |  |
| 11 | Session renewal without leaving| 1. Wait until session expires (passcode set previously)<br>2. First step<br>3. Second step without leaving the app  | Login process is completed  | NA | Expiration time too large |
| 12 | Session renewal leaving| 1. Wait until session expires (passcode set previously)<br>2. First step<br>3. Leave the app<br>4. Second step  | Login process is completed after passcode is required | NA | Expiration time too large |
|**2FA server - Passcode enforced**||||||
| 13 | From scratch without leaving| 1. Install the app<br>2. Input passcode<br>3. First step<br>4. Second step without leaving the app  | 1. Passcode asked<br> 4.Login process is completed  | P m10 t10 m9|  |
| 14 | From scratch leaving| 1. Install the app<br>2. Input passcode<br>3. First step<br>4. Leave the app (change orientation)<br>5. Second step  | 1. Passcode asked<br> 5.Login process is completed  | P m10 t10 m9| FIXED: Passcode not required after 2nd factor |
| 15 | Session renewal without leaving| 1. Wait until session expires<br>2. First step<br>3. Second step without leaving the app  | 1. Passcode asked<br> 4.Login process is completed  | NA |  Expiration time too large |
| 16 | Session renewal leaving| 1. Wait until session expires<br>2. First step<br>3. Leave the app (change orientation)<br>4. Second step | 1. Passcode asked<br> 4.Login process is completed after passcode is required | NA | Expiration time too large |
|**basic auth - Passcode not enforced**||||||
| 17 | From scratch without leaving| 1. Install the app<br>2. Login in the app  | Login process is completed  | P m10 t10|  |
| 18 | From scratch leaving| 1. Install the app<br>2. Login in the app. Leave the app in the middle of the process and enter again (change orientation) | Login process is completed  | P m10 t 10 |  |
|**basic auth - Passcode enforced**||||||
| 19 | From scratch without leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app  | Login process is completed  | P m10 t10 |  |
| 20 | From scratch leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app. Leave the app in the middle of the process and enter again (change orientation) | Login process is completed  | P m10 t10 |  |