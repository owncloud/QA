###  OpenID Connect

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**User flow**|
| Correct OIDC URL | Set a correct OIDC URL | Connection set to the URL |  |  |  |
| Enter correct iDP credentials | 1. Set a correct OIDC URL<br>2. Enter correct credentials | Authorization is requested |  |  |  |
| Authorization | Authorize permissions and session | iDP finishes web browser and redirects to the client |  |  |  |
| Cancel login process | 1. Set a correct OIDC URL<br>2. In iDP, cancel login process<br> | Back to client |  |  |  |
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account |  |  |
|**Request flow**| 
| Check `openid-configuration` request | Enter an URL of OIDC server | The .well-known /openid-configuration endpoint must be checked to assure availability of OIDC. Response received |  |  |  |
| idP flow | Enter credentials in iDP | The `logon` endpoint is requested after entering credentials<br> The `authorize` endpoint is requested after authorizing |  |  |  |
| Redirection | Authorize session in idP | Web browser redirects correctly to the client and with session opened |  |  |  |
| Renewal | Wait till session time is exceed | `token` endoint is requested with refresh token to get a new token. This must be transparent for the client |  |  |  |
|**Migration**| 
| Basic -> OIDC | 1. Login in basic auth server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode | Session expires and user must re-authenticate against new OIDC  |  |  |
| OAuth2 -> OIDC | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC<br>3. Disable maintenance mode | Token not valid anymore, and user must re-authenticate against new OIDC  |  |  |
| OAuth2 -> OIDC + OAuth2 | 1. Login in OAuth2 server<br>2. Enable maintenance mode and upgrade to OIDC, keeping Oauth2 enabled<br>3. Disable maintenance mode | Token is valid anymore. Must re-authenticate to start using OIDC  |  |  |