###  Improved OAuth2 flow

#### Pr: https://github.com/owncloud/ios-app/pull/459

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Regular flow**|||||
| Login | Login in a oAuth2 server | Token granted and correct operation hnadling | P m12 t12 |  |  |
| Renew | Wait till token expires<br>Perform any operation | token renewed | P m12 t12 |  |  |
|**Error handling**|||||
| Revoke token - ignore | With the oAuth2 session started, revoke token in UI dashboard | Session goes on offline | P m12 t12|  |  |
| Revoke token - sign in | With the oAuth2 session started, revoke token in UI dashboard | Re-authentication | P m12 t12 |  |  |
| Account disabled - OAuth2 | Disable account in server | Correct error | P m12 t12 | Asked for resign - Disabled in web  |  |
| Account disabled - basic | Disable account in server | Correct error | P m12 t12 |  |  |
| Account removed - OAuth2 | Remove account in server | Correct error | P m12 t12 |   |  |
| Account removed - basic | Remove account in server | Correct error | P m12 t12| FIXED: Bad message |  |
| Credentials changed - basic - ignore | Change credentials with an ongoing session and select ignore | Correct error  and work offline| P t12 m12 |  |  |
| Credentials changed - basic - sign in | Change credentials with an ongoing session and select sign in | Correct error and correct re-authentication | P t12 m12 |  |  |
| Switch OAuth2 - basic | Change auth method within an ongoing session | Correct handling | F m12 | Separate issue |  |
| Switch basic - OAuth2 | Change auth method within an ongoing session | Correct handling | P m12 t12 | Needed manual reauthentication to switch |  |

