###  Passcode in 2FA auth servers 

#### Pr: https://github.com/owncloud/ios/pull/899


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**SAML server - Passcode not enforced**||||||
| 1 | From scratch without leaving| 1. Install the app<br>2. Login in the app  | Login process is completed  |  |  |
| 2 | From scratch leaving| 1. Install the app<br>2. Login in the app | Login process is completed | | |
| 3 | Session renewal without leaving| 1. Wait until session expires (passcode set previously)<br>2. Login in the app  | Login process is completed  |  |  |
| 4 | Session renewal leaving| 1. Wait until session expires (passcode set previously)<br>2. Login in the app | Login process is completed after passcode is required |  |  |
|**SAML server - Passcode enforced**||||||
| 5 | From scratch without leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app  | Login process is completed  |  |  |
| 6 | From scratch leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app. Leave the app in the middle of the process and enter again (change orientation) | Login process is completed after passcode is required |  |  |
| 7 | Session renewal without leaving| 1. Wait until session expires<br>2. Login in the app  | Login process is completed  |  |  |
| 8 | Session renewal leaving| 1. Wait until session expires<br>2. Login in the app. Leave the app in the middle of the process and enter again (change orientation)| Login process is completed |  |  |
|**2FA server - Passcode not enforced**||||||
| 9 | From scratch without leaving| 1. Install the app<br>2. First step<br>3. Second step without leaving the app  | Login process is completed  | |  |
| 10 | From scratch leaving| 1. Install the app<br>2. First step<br>3. Leave the app<br>4. Second step  | Login process is completed  |  |  |
| 11 | Session renewal without leaving| 1. Wait until session expires (passcode set previously)<br>2. First step<br>3. Second step without leaving the app  | Login process is completed  |  |  |
| 12 | Session renewal leaving| 1. Wait until session expires (passcode set previously)<br>2. First step<br>3. Leave the app<br>4. Second step  | Login process is completed after passcode is required |  | |
|**2FA server - Passcode enforced**||||||
| 13 | From scratch without leaving| 1. Install the app<br>2. Input passcode<br>3. First step<br>4. Second step without leaving the app  | 1. Passcode asked<br> 4.Login process is completed  | |  |
| 14 | From scratch leaving| 1. Install the app<br>2. Input passcode<br>3. First step<br>4. Leave the app (change orientation)<br>5. Second step  | 1. Passcode asked<br> 5.Login process is completed  |  |   |
| 15 | Session renewal without leaving| 1. Wait until session expires<br>2. First step<br>3. Second step without leaving the app  | 1. Passcode asked<br> 4.Login process is completed  |   |    |
| 16 | Session renewal leaving| 1. Wait until session expires<br>2. First step<br>3. Leave the app (change orientation)<br>4. Second step | 1. Passcode asked<br> 4.Login process is completed after passcode is required |  |   |
|**basic auth - Passcode not enforced**||||||
| 17 | From scratch without leaving| 1. Install the app<br>2. Login in the app  | Login process is completed  |  |  |
| 18 | From scratch leaving| 1. Install the app<br>2. Login in the app. Leave the app in the middle of the process and enter again (change orientation) | Login process is completed  |   |  |
|**basic auth - Passcode enforced**||||||
| 19 | From scratch without leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app  | Login process is completed  |   |  |
| 20 | From scratch leaving| 1. Install the app<br>2. Type the passcode<br>3. Login in the app. Leave the app in the middle of the process and enter again (change orientation) | Login process is completed  |   |  |