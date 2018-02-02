#### Fix migration

#### Pr: https://github.com/owncloud/ios/pull/1020


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**basic -> basic**||||||
| 1 | Migration on | 1. Install app and set some settings<br>2. Migrate to new URL | Credentials asked in new account. All settings OK |  |  |
| 2 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens |  |  |
| 3 | Migration on - redirected with subfolder |  1. Install app and set some settings<br>2. Migrate to new redirected URL | Credentials asked in new account. All settings OK |  |  |
|**saml -> saml**||||||
| 4 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL  | Credentials asked in new account. All settings OK |  |  |
| 5 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens |  |  |
|**saml -> basic**||||||
| 6 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL  | Credentials asked in new account. All settings OK |  |  |
| 7 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL | Anything happens |  |  |
|**basic -> saml**||||||
| 8 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL | Credentials asked in new account. All settings OK |  |  |
| 9 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens |  |  |