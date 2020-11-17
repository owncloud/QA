### Authentication migration

#### Pr: https://github.com/owncloud/ios-app/pull/682

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.0.4

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Basic Auth Server**|||||
| Change password - Continue offline | 1. Login in a basic auth account<br>2. In web, change the password<br>3. Select "Continue offline" | Account available, but no operations can be performed | P m13 t13 | | |
| Change password - Sign in | 1. Login in a basic auth account<br>2. In web, change the password<br>3. Select "Sign in" | Prompted to enter the new password of the account | P m13 t13| | |
| Turn OAuth2 out of the app | 1. Enable OAuth2 in server while you are not inside the account | Prompted to OAuth2| F m13| Nothing happens -> https://github.com/owncloud/ios-app/issues/43| |
| Turn OAuth2 inside the app | 1. Enable OAuth2 in server while you are inside the account |Prompted to OAuth2 |F m13 | Nothing happens -> https://github.com/owncloud/ios-app/issues/43 | |
| Change certificate | 1. In server, change server certificate | Review connection dialog is prompted | P m13 t13 | FIXED: Infinite loop, you've to kill |
| Change certificate + OAuth2  | 1. Enable OAuth2 in server<br>2. Change server certificate inside the app | Review connection dialog + Oauth2 prompt | P m13 t13 | FIXED; Infinite loop in review connection, no OAuth2 prompted | |
|**OAuth2 Server**|||||
| Turn basic out of the app on | 1. Enable basic (disabling OAuth2) in server while you are not inside the account | Prompted to basic auth | P m13 t13 | Logged in the web | |
| Turn basic inside of the app on | 1. Enable basic (disabling OAuth2) in server while you are inside the account | Prompted to basic auth | P m13 t13 | Logged in the web | |
| Change certificate | 1. Change server certificate inside the app | Certificate dialog is prompted  |P m13 t13 | FIXED: Infinite loop | |
| Change certificate + Basic  | 1. Enable basic (disabling OAuth2) in server<br>2. Change server certificate inside the app | Certificate dialog is prompted | P m13 t13 | FIXED: Infinite loop| |