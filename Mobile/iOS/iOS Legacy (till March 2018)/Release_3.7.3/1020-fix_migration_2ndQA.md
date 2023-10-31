#### Fix migration

#### Pr: https://github.com/owncloud/ios/pull/1020

Devices: iPhone 6S Plus v11, iPhoneX

Server: 10.0.4, 10.0.6


---

Multiaccount & simple
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**basic -> basic**||||||
| 1 | Migration on | 1. Install app and set some settings<br>2. Migrate to new URL | Credentials asked in new account. All settings OK | P m11 |  |
| 2 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens | P m11 |  |
| 3 | Migration on - redirected with subfolder |  1. Install app and set some settings<br>2. Migrate to new redirected URL | Credentials asked in new account. All settings OK | P m11 |   |
|**saml -> saml**||||||
| 4 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL  | Credentials asked in new account. All settings OK | P m11 |  |
| 5 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens | P m11 |  |
|**saml -> basic**||||||
| 6 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL  | Credentials asked in new account. All settings OK | P m11 |  |
| 7 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL | Anything happens | NA | makes no sense. different settings |
|**basic -> saml**||||||
| 8 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL | Credentials asked in new account. All settings OK | P m11 |   |
| 9 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens | NA | makes no sense. different settings |