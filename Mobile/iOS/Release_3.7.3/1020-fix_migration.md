#### Fix migration

#### Pr: https://github.com/owncloud/ios/pull/1020

Devices: iPhone 6S Plus v11

Server: 10.0.4, 10.0.6


---

Multiaccount & simple
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**basic -> basic**||||||
| 1 | Migration on | 1. Install app and set some settings<br>2. Migrate to new URL | Credentials asked in new account. All settings OK | F m11 | Redirect if adding new account |
| 2 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens | P m11 |  |
| 3 | Migration on - redirected with subfolder |  1. Install app and set some settings<br>2. Migrate to new redirected URL | Credentials asked in new account. All settings OK | F m11 | From redirected to basic fails  |
|**saml -> saml**||||||
| 4 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL  | Credentials asked in new account. All settings OK | F m11 | Request failed (302) |
| 5 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens | P m11 |  |
|**saml -> basic**||||||
| 6 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL  | Credentials asked in new account. All settings OK | P m11 |  |
| 7 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL | Anything happens | NA | makes no sense. different settings |
|**basic -> saml**||||||
| 8 | Migration on |  1. Install app and set some settings<br>2. Migrate to new URL | Credentials asked in new account. All settings OK | F m11 | Request failed (302)  |
| 9 | Migration off |  1. Install app and set some settings<br>2. Migrate to new URL  | Anything happens | NA | makes no sense. different settings |
|**Regression**||||||
| 10 | Expiration mode |  Make a SAML session expire  | Redirection to login view and login correct | P m11 | |
| 10b | Expiration mode |  Make a OAuth2 session expire  | Redirection to login view and login correct | P m11 | Session expired message. Correct |
| 11 | Change credentials |  Change credentials of a user and perform any action | Redirection to login view and login correct | F m11 | Regression: bad error message |
| 12 | Login with different user |  Once session is expired, login with different user than the current | Correct error message | F m11 | Regression bug: no error message, login correct  |