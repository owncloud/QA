### PKCE


#### PR: https://github.com/owncloud/android/pull/3310

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.7

Test server: https://ocis.keycloak-test.owncloud.works/ 

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| Server PKCE | Try to login in a server with PKCE | Correct access to the app| P m11 m7 |
| Bad Authorization | Try to login in a server with PKCE, using a random codeChallenge (not created from codeVerifier) (file OAuthViewModel.kt) | Unauthorization| P m11 m7 |
| **REGRESSION** |   |  |
| **OAuth2** |   |  |
| Log in correct | Log in OAuth2 server with correct credentials | Login correct. Files view displayed | P m11 m7
| Log in incorrect | Log in OAuth2 server with incorrect credentials | Correct error message, Login not succeded | P m11 m7
| Refresh token | Wait until token expires and perform some actions | Token is refreshed (check in BD) and user keep on using the app | P m11 m7
| Remove token | 1. After being logged, remove token in server side<br>2. perform some action in app | Redirected to login  | P m11 m7
| **OIDC** |   |  |
| Log in correct | Log in OIDC server with correct credentials | Login correct. Files view displayed | P m11 m7