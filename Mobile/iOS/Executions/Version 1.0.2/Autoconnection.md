###  Autoconnection to the last account

#### Pr: https://github.com/owncloud/ios-app/pull/425

Devices: iPhoneX v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**One account**||||||
| From scratch  | Install the app and create an account | Correct login | P m12 t12 |  |  |
| One account | Add one account<br>Close the app<br>Open the app | list of accounts is not displayed. Direct to list of files | P m12 t12 | |
|**Several accounts**||||||
| Several accounts | Add several accounts<br>Close the app after every of them  | Last account is opened | P m12 t12 |
| With lock | Add several accounts ad enable passcode lock<br>Close the app after every of them  | Last account is opened after unlocking| P m12 t12 |
|**Upgrade**||||||
| Upgrade from latest version | Add several accounts in previpus version<br>Close the app<br>Upgrade to the new one  | List of accounts displayed, since the latest acceded is not stored yet | P m12 t12 |