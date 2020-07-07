### Migration from Legacy

#### Pr: https://github.com/owncloud/ios-app/pull/660

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Basic Auth Server**|||||
| URL | Install old app and autenthicate with basi auth<br>Install new app | URL correctly migrated | | | |
| Account (credentials) | Install old app and autenthicate with basic auth<br>Install new app | Account correctly migrated | | | |
| Settings - passcode | Install old app and autenthicate with basic auth<br>Install new app | Passcode correctly migrated | | | |
| Settings - auto uploads | Install old app and autenthicate with basic auth<br>Install new app | Auto uploads correctly migrated | | | |
| To OAuth2 | Install old app and autenthicate with basic auth<br>Enable OAuth2 in server<br>Install new app | URL correctly migrated to OAuth2 | | | |
|**OAuth Server**|||||
| URL | Install old app and autenthicate with OAuth2<br>Install new app | URL correctly migrated | | | |
| Account (credentials) | Install old app and autenthicate with OAuth2<br>Install new app | Account correctly migrated | | | |
| Settings - passcode | Install old app and autenthicate with OAuth2<br>Install new app | Passcode correctly migrated | | | |
| Settings - auto uploads | Install old app and autenthicate with OAuth2<br>Install new app | Auto uploads correctly migrated | | | |
| To basic | Install old app and autenthicate with OAuth2<br>Disable OAuth2 in server<br>Install new app | URL correctly migrated to basic | | | |
|**SAML Server**|||||
| URL | Install old app and autenthicate with SAML auth<br>Install new app | URL correctly migrated | | | |
| Account (credentials) | Install old app and autenthicate with SAML auth<br>Install new app | Account correctly migrated | | | |
| Settings - passcode | Install old app and autenthicate with SAML auth<br>Install new app | Passcode correctly migrated | | | |
| Settings - auto uploads | Install old app and autenthicate with SAML auth<br>Install new app | Auto uploads correctly migrated | | | |
