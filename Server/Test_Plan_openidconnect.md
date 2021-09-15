## Setup 

<details>
<summary>Setup details (click to view)</summary>

Automated setup script: https://github.com/owncloud/QA/tools/hetzner-deploy/make_openidconnect_test.sh

Template: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_openidconnect.md

 
References:
* https://github.com/owncloud/docs/issues/2855#issuecomment-719944884
* https://doc.owncloud.com/server/admin_manual/configuration/user/oidc/
* https://github.com/owncloud/openidconnect/issues/66#issuecomment-679093440
* https://github.com/owncloud/openidconnect/issues/66#issuecomment-708217650
* https://github.com/owncloud/openidconnect/issues/66#issuecomment-709999406
* https://github.com/owncloud/QA/blob/master/Mobile/GenericTPs/OIDC.md
* https://github.com/owncloud/QA/blob/master/Server/Test_Plan_OAuth2.md
* https://github.com/owncloud/QA/blob/master/Server/Test_Plan_Pluggable_Auth.md

</details>



## Testplan 

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Installation**|
| Fresh install | `occ app:enable openidconnect`  | app gets enabled | :construction:   | 
| Fresh install | disable/enable via admin web gui  | app gets disabled/enabled | :construction:  | 
| Update from 1.0.0 | disable, unpack new tar, enable via admin web gui | app gets enabled | :construction:  | `occ upgrade` is needed. #135
|**User flow**|
| Correct OIDC URL | Set a correct OIDC URL | Connection set to the URL | :construction:   | as per INIT.bashrc |
| Enter correct iDP credentials | 1. Set a correct OIDC URL<br>2. Enter correct credentials | Authorization is requested | :construction:   |
| Authorization | Authorize permissions and session | iDP finishes web browser and redirects to the client | :construction:   |
| Cancel login process | 1. Set a correct OIDC URL<br>2. In iDP, cancel login process<br> | Back to client | :construction:  | Error in OpenIdConnect:Error: access_denied Description: consent denied 
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | :construction:   | Stranded at kopano-url, oc-url would be better |
|**Request flow**| 
| Check `openid-configuration` request | Enter an URL of OIDC server | The .well-known /openid-configuration endpoint must be checked to assure availability of OIDC. Response received | :construction:   |  
| `register` endpoint available | In case the server supports Dynamic Client Registration, `register` endpoint is requested  | Client id and secret id (not mandatory) is retrieved | :construction:  |
| idP flow | Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing | :construction:   | /signin/v1/chooseaccount<br>/signin/v1/identifier<br>/signin/v1/consent<br>http://localhost:44155/
| idP flow  with dynamic client registration| Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing using client id and secret id granted by register endpoint |  |
| Redirection | Authorize session in idP | Web browser redirects correctly to the client and with session opened | :construction:  | 
| Token Renewal | Wait till session time is exceed | `token` endoint is requested with refresh token to get a new token. This must be transparent for the client | :construction:   |  01-22 09:10:46:385 [ info sync.httplogger ]:  ...  \"expires_in\": 600\n}\n]"<br>01-22 09:21:03:624 [ info sync.credentials.http ]:      Refreshing token<br>01-22 09:21:03:759 [ info sync.httplogger ]:    ... Request: POST ... /konnect/v1/token 
| ClientId/SecretiD renewal | Wait till clientId/SecretId granted by register endpoint, expire | New ClientId/SecretId must be granted to request new tokens | :construction:   | renewal seen after 10 minutes. See log example below https://github.com/owncloud/openidconnect/issues/132#issuecomment-768982643
|**Migration**| 
| Basic -> OIDC | 1. Login in basic auth server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. add `'token_auth_enforced' => true` to config.php<br>4. Disable maintenance mode | Client shows and error and user must re-authenticate against new OIDC  | :construction:  | `Server replied "599"` after 30 sec.; see also #136
| OAuth2 -> OIDC | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode | Token not valid anymore, and user must re-authenticate against new OIDC  | :construction:  | Unclear expectations: https://github.com/owncloud/openidconnect/issues/66#issuecomment-718560009
| OAuth2 -> OIDC + OAuth2 | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC, keeping Oauth2 enabled<br>3. Disable maintenance mode | Token is valid anymore. Must re-authenticate to start using OIDC  | :construction:   |

---

###  Android

After releasing 2.16, authentication library will be replaced for a [custom implementation](https://github.com/owncloud/android/pull/3043). Tests here will be done with such implementation as well

Actually, Android does not support Dynamic Client Registration yet.

Openidconnect: 2.x.x
Device: Google Pixel 2
Android version: 11

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**User flow**|
| Correct OIDC URL | Set a correct OIDC URL | Connection set to the URL |2.16: :construction:  <br> New: :construction:   |  |  |
| Enter correct iDP credentials | 1. Set a correct OIDC URL<br>2. Enter correct credentials | Authorization is requested | 2.16: :construction:  <br> New: :construction:    |  |  |
| Authorization | Authorize permissions and session | iDP finishes web browser and redirects to the client | 2.16: :construction:  <br> New: :construction:   |  |  |
| Cancel login process | 1. Set a correct OIDC URL<br>2. In iDP, cancel login process<br> | Back to client | 2.16: :construction:  <br> New: :construction:    |  |  |
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA |  |
|**Request flow**| 
| Check `openid-configuration` request | Enter an URL of OIDC server | The .well-known /openid-configuration endpoint must be checked to assure availability of OIDC. Response received | 2.16: :construction:  <br> New: :construction:  |  |  |
| `register` endpoint available | In case the server supports Dynamic Client Registration, `register` endpoint is requested  | Client id and secret id (not mandatory) is retrieved | NA | Android does not support yet |  |
| idP flow | Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing |  2.16: :construction:  <br> New: :construction:  |  |  |
| idP flow  with dynamic client registration| Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing using client id and secret id granted by register endpoint | NA  |  Android does not support yet  |  |
| Redirection | Authorize session in idP | Web browser redirects correctly to the client and with session opened | 2.16: :construction:  <br> New: :construction:   |  |  |
| Renewal | Wait till session time is exceed | `token` endoint is requested with refresh token to get a new token. This must be transparent for the client |  2.16: :construction:  <br> New: :construction: |  |  |
| ClientId/SecretId renewal | Wait till clientId/SecretId granted by register endpoint, expire | New ClientId/SecretId must be granted to request new tokens | NA | Android does not support yet |  |
|**Migration**| 
| Basic -> OIDC | 1. Login in basic auth server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode<br>4. Force re-login | User must re-authenticate against new OIDC  | 2.16 :construction: <br>New: :construction:  |  |
| OAuth2 -> OIDC | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode | Token not valid anymore, and user must re-authenticate against new OIDC  | 2.16  :construction: <br>New :construction: | 
| OAuth2 -> OIDC + OAuth2 | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC, keeping Oauth2 enabled<br>3. Disable maintenance mode | Token is not valid anymore. Must re-authenticate to start using OIDC  | 2.16 :construction: <br>New: :construction:  |  

Smoke test:  2.16 :construction:   New :construction: 
---

###  iOS

Openidconnect: 2.x.x
Device: iPhoneXR
iOS version: 14.2

Tested with the current stable `11.4.5` and the new one 11.5, including Dynamic Client Registration

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**User flow**|
| Correct OIDC URL | Set a correct OIDC URL | Connection set to the URL | 11.4: :construction:  <br>11.5 :construction:   |  |  |
| Enter correct iDP credentials | 1. Set a correct OIDC URL<br>2. Enter correct credentials | Authorization is requested | 11.4: :construction:  <br>11.5 :construction:    |  |  |
| Authorization | Authorize permissions and session | iDP finishes web browser and redirects to the client | 11.4: :construction: <br>11.5 :construction:    |  |  |
| Cancel login process | 1. Set a correct OIDC URL<br>2. In iDP, cancel login process<br> | Back to client | 11.4: :construction: <br>11.5 :construction:     |  |  |
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA |  |
|**Request flow**| 
| Check `openid-configuration` request | Enter an URL of OIDC server | The .well-known /openid-configuration endpoint must be checked to assure availability of OIDC. Response received | 11.4: :construction: <br>11.5 :construction:    |  |  |
| `register` endpoint available | In case the server supports Dynamic Client Registration, `register` endpoint is requested  | Client id and secret id (not mandatory) is retrieved | 11.4: NA <br>11.5 :construction:   | |  |
| idP flow | Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing |  11.4: :construction: <br>11.5 :construction:    |  |  |
| idP flow  with dynamic client registration| Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing using client id and secret id granted by register endpoint | 11.4: NA <br>11.5 :construction:   |    |  |
| Redirection | Authorize session in idP | Web browser redirects correctly to the client and with session opened | 11.4: :construction: <br>11.5 :construction:    |  |  |
| Renewal | Wait till session time is exceed | `token` endpoint is requested with refresh token to get a new token. This must be transparent for the client | 11.4: <br>11.5 :construction:     |  |  |
| ClientId/SecretId renewal | Wait till clientId/SecretId granted by register endpoint, expire | New ClientId/SecretId must be granted to request new tokens |  11.4: NA <br>11.5 :construction:   |  
|**Migration**| 
| Basic -> OIDC | 1. Login in basic auth server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode<br>4. Force re-login | User must re-authenticate against new OIDC  | NA | Not supported. [Link](https://github.com/owncloud/ios-app/issues/43)  |
| OAuth2 -> OIDC | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode | Token not valid anymore, and user must re-authenticate against new OIDC  | 11.4 :construction:  <br>11.5 :construction: |  |
| OAuth2 -> OIDC + OAuth2 | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC, keeping Oauth2 enabled<br>3. Disable maintenance mode | Token is valid anymore. Must re-authenticate to start using OIDC  | 11.4: :construction:  <br>11.5 :construction:   | 

