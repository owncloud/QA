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
|**Regression**||||||
| 10 | Expiration mode |  Make a SAML session expire  | Redirection to login view and login correct |  |  |
| 11 | Change credentials |  Change credentials of a user and perform any action | Redirection to login view and login correct |  |  |
| 12 | Login with different user |  Once session is expired, login with different user than the current | Correct error message |  |  |