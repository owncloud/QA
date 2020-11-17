### Migration from Legacy

#### Pr: https://github.com/owncloud/ios-app/pull/660

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Basic Auth Server**|||||
| URL | Install old app and autenthicate with basi auth<br>Install new app | URL correctly migrated | P m13 | | |
| Account (credentials) | Install old app and autenthicate with basic auth<br>Install new app | Account correctly migrated | P m13 | | |
| Settings - passcode on | Install old app and autenthicate with basic auth<br>Install new app | Passcode correctly migrated | P m13 | | |
| Settings - passcode off | Install old app and autenthicate with basic auth<br>Install new app | Passcode disabled | P m13 | | |
| Settings - face id on | Install old app and autenthicate with basic auth<br>Install new app | Face ID correctly migrated | P m13 | | |
| Settings - face id off | Install old app and autenthicate with basic auth<br>Install new app | Face ID disabled | P m13 | | |
| Settings - instant uploads photos on | Install old app and autenthicate with basic auth<br>Install new app | instant uploads photos correctly migrated | P m13 | FIXED: Stucked | |
| Settings - instant uploads photos off | Install old app and autenthicate with basic auth<br>Install new app | instant uploads photos disabled | P m13 | | |
| Settings - instant uploads videos on | Install old app and autenthicate with basic auth<br>Install new app | instant uploads videos correctly migrated | P m13 | FIXED: Stucked | |
| Settings - instant uploads photos off | Install old app and autenthicate with basic auth<br>Install new app | instant uploads videos disabled | P m13 | | |
| To OAuth2 | Install old app and autenthicate with basic auth<br>Enable OAuth2 in server<br>Install new app | URL correctly migrated to OAuth2 | P m13 | | |
|**OAuth Server**|||||
| URL | Install old app and autenthicate with OAuth2<br>Install new app | URL correctly migrated | P m13 |   | |
| Account (credentials) | Install old app and autenthicate with OAuth2<br>Install new app | Account correctly migrated | P m13 |   | |
| Settings - passcode on | Install old app and autenthicate with OAuth2<br>Install new app | Passcode correctly migrated | P m13 |   | |
| Settings - passcode off | Install old app and autenthicate with OAuth2<br>Install new app | Passcode disabled | P m13 | | |
| Settings - instant uploads photos on | Install old app and autenthicate with OAuth2<br>Install new app | instant uploads photos correctly migrated | P m13 | FIXED: Stucked | |
| Settings - instant uploads photos off | Install old app and autenthicate with OAuth2<br>Install new app | instant uploads photos disabled | P m13 |   | |
| Settings - instant uploads videos on | Install old app and autenthicate with OAuth2<br>Install new app | instant uploads videos correctly migrated | P m13 | FIXED: Stucked| |
| Settings - instant uploads photos off | Install old app and autenthicate with OAuth2<br>Install new app | instant uploads videos disabled | P m13 |   | |
| Expired token | Install old app and autenthicate with OAuth2 auth<br>Wait till token expires<br>Install new app (without opening old app before!) | URL migrated and token renewed | P m13 |   | |
|**Basic + OAuth2**|||||
| URL | Install old app and autenthicate with OAuth2 and basic (adding two accounts)<br>Install new app | URLs correctly migrated | P m13 |   | |
| Account (credentials) | Install old app and autenthicate with OAuth2 and basic (two accounts)<br>Install new app | Accounts correctly migrated | P m13 |   | |
|**Multi**|||||
| Multiaccount + all Settings | Install old app and attach 5 accounts of different authentication methods<br>Enable settings: passcode, face id and instant uploads photos and videos<br>Install new app | Everything correctly migrated | P m13 |  | |
|**SAML Server**|||||
| URL | Install old app and autenthicate with SAML auth<br>Install new app | URL correctly migrated | P m13 | FIXED: Need to kill | |
| Account (credentials) | Install old app and autenthicate with SAML auth<br>Install new app | Account correctly migrated | P m13 | FIXED: Need to kill | |
| Settings - passcode on | Install old app and autenthicate with SAML auth<br>Install new app | Passcode correctly migrated | P m13 | FIXED: Need to kill | |
| Settings - passcode off | Install old app and autenthicate with SAML auth<br>Install new app | Passcode disabled | P m13 | FIXED: Need to kill | |
| Settings - instant uploads photos on | Install old app and autenthicate with SAML auth<br>Install new app | instant uploads photos correctly migrated | F m13 | FIXED: Need to kill | |
| Settings - instant uploads photos off | Install old app and autenthicate with SAML auth<br>Install new app | instant uploads photos disabled | P m13 | FIXED: Need to kill | |
| Settings - instant uploads videos on | Install old app and autenthicate with SAML auth<br>Install new app | instant uploads videos correctly migrated | F m13 | FIXED: Need to kill | |
| Settings - instant uploads photos off | Install old app and autenthicate with SAML auth<br>Install new app | instant uploads videos disabled | P m13 | FIXED: Need to kill | |
|**Both**|||||
| Both apps installed | Install old app<br>Install new app<br>Upgrade to current | New app upgraded<br>Old app remains | P t13 |  | |
