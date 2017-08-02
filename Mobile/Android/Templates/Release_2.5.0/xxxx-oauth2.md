###  OAuth2 

#### Pr: https://github.com/owncloud/android/pull/XXX 


---

| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Login View**|||||||
| 1 | Initial look | Open the app. Check both orientations | Correct view. Only URL and connect button are shown  |  |  |
| 2 | OAuth2 URL http | 1. Set an URL of a http server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown |  |  |
| 3 | OAuth2 URL https trusted | 1. Set an URL of a https trusted server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown |  |  |
| 4 | OAuth2 URL https non-trusted | 1. Set an URL of a https non-trusted server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown |  |  |
| 5 | Basic Auth http URL | 1. Set an URL of a http server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown |  |  |
| 6 | Basic Auth https trusted URL | 1. Set an URL of a https trusted server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown |  |  |
| 7 | Basic Auth https non-trusted URL | 1. Set an URL of a https non-trusted server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown |  |  |
| 8 | Redirected URL | 1. Set a redirection URL <br>2. Tap on connect. <br>Check both orientations | Fields username and password are shown  |  |
| 9 | SAML URL | Set an SAML URL (not supported by the app)<br>Check both orientations | Correct error messaege |  |  |
| 10 | Wrong URL | Set an incorrect URL. <br>Check both orientations | Correct error messaege |  |  |
| 11 | Wrong Authorizathion endpoint | 1. In customization file, change auth endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect. <br>Check both orientations | Correct error handling |  |  |
|**Branding**|||||||
| 12 | OAuth2 URL hardcoded | Open the app.<br>Check both orientations | Correct view |  |  |
| 13 | OAuth2 URL hardcoded and hidden | Open the app.<br> Check both orientations | Correct view |  |  |
| 14 | Help link hidden | Open the app.<br>Check both orientations | Correct view |  |
|**OAuth2 UI flow**|||||||
| 15 | Webview | Enter OAuth2 URL and connect.<br> Check both orientations | Correct webview  |  |  |
| 16 | Correct credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter correct credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Credentials are checked and webview is closed  |  |  |
| 17 | Wrong credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter wrong credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Webview can be closed  |  |  |
| 18 | Wrong client id | 1. In customization file, change client id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  |  |  |
| 19 | Wrong secret id | 1. In customization file, change secret id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  |  |  |
| 20 | Wrong redirection url | 1. In customization file, change redirection url for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  |  |  |
| 21 | Wrong token endpoint | 1. In customization file, change token endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  |  |  |
|**OAuth2 internal flow**|||||||
| 22 | Auth request | With mitmproxy, check the OAuth2 GET authorization code request | The URL contains the parameters: response_type=code, redirect_uri=\<customized\>, client_id=\<customized\> |  |  |
| 23 | Token request | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic + client id + : + secretid |  |  |
| 24 | Token refresh | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic |  |  |
|**OAuth2 session**|||||||
| 25 | Create folder | With OAuth2 session active, create folder | Success |  |  |
| 26 | Upload files | With OAuth2 session active, upload files | Success |  |  |
| 27 | Download files | With OAuth2 session active, upload files | Success |  |  |
| 28 | Remove files | With OAuth2 session active, remove files | Success |  |  |
| 29 | Rename files | With OAuth2 session active, rename files | Success |  |  |
| 30 | Av. offline files | With OAuth2 session active,set files as av.offline | Success |  |  |
| 31 | Instant uploads | With OAuth2 session active, upload files | Success |  |  |
| 32 | Share with users | With OAuth2 session active, share with users | Success |  |  |
| 33 | Share public| With OAuth2 session active, share public | Success |  |  |
| 34 | Open from | With OAuth2 session active, open from an external app | Success |  |  |
| 35 | Share with oC | With OAuth2 session active, share content from an external app | Success |  |  |
| 36 | Send text | With OAuth2 session active, send text from an external app to oC | Success |  |  |
|**Session ends/refresh**||||||
| 37 | Session Expired | 1. Wait until token is refreshed<br> 2. Perform actions (download, upload, delete, move, remove) | New token is used in the requests and the action is performed|  |  |
| 38 | Session Expired - external | 1. Wait until token is refreshed out of the app<br> 2. From an external app, send content once the token is expired | New token is used in the requests and the action is performed|  |  |
|**Multiaccount**|||||||
| 39 | Several OAuth2 same server | Attach several OAuth2 accounts of the same server on the same device. Check correct expirations. | All correct |  |  |
| 40 | Several OAuth2 different server | Attach several OAuth2 accounts of different servers on the same device | All correct |  |  |
| 41 | Several OAuth2 expiration | 1. Attach several OAuth2 accounts of different servers on the same device<br>2. Wait until one session expires. | Expired session is refresed. The other sessions keep alive |  |  |
| 42 | OAuth2 + basic | Attach an OAuth2 and a basic auth accounts to the same device | All correct |  |  | 
| 43 | OAuth2 + SAML | Attach an OAuth2 and a SAML auth accounts to the same device | Not posible |  |  |
|**External actions**|||||||
| 44 | Refresh Token revoked | 1. After login, remove refresh token in DB<br> 2. Wait until session expires| Session is not refreshed. User redirected to login view |  |  |
| 45 | Token revoked | After login, remove token | Session ends. User redirected to login view |  |  |
| 46 | Change credentials | 1. In webUI, change password<br> 2. In app, after login, in settings view, go to edit credentials and enter new credentials | New token is received |  |  |
| 47 | Edit credentials with other account | 1. In app, after login, in settings view, go to edit credentials and enter other user credentials | Account updated / Error shown |  |  |
| 48 | User deleted | 1. In webUI, remove user | Session ends. User redirected to login view and can not login anymore |  |  |
| 49 | Manage Space | In device Settings, clear cache and manage space of the app | Session does not end |  |  |
| 50 | Remove client | In webUI, remove client | Not posible to authenticate anymore |  |  |
| 51 | Remove OAuth2 app | In webUI, disable app | basic auth? |  |  |
|**Errors**|||||||
| 52 | No internet connection | 1. Disable internet connection in device<br>2. Try to login in OAuth2 | Correct error |  |  |
| 53 | No server connection | 1. Switch server off in device<br>2. Try to login in OAuth2 | Correct error |  |  |
| 54 | Maintenance mode login | 1. Enable maintenance mode<br>2. Try to login in OAuth2 | Correct error |  |  |
| 55 | Firewall mode login | Enable a firewall rule to ban the login<br>2. Try to login in OAuth2 | Correct error |  |  |
|**Regression**|||||||
| 56 | Basic Auth server | Open a session in a basic auth server and perform some actions (create folder, update, download, share...) | Success |  |  |
| 57 | SAML server | Open a session in a SAML server and perform some actions (create folder, update, download, share...) | Success |  |  |
| 58 | SAML expiration | Open a session in a SAML server and wait until it expires | Redirected to iDP credentials view |  |  |
| 59 | Redirected | Open a session in a redirected server and perform some actions (create folder, update, download, share...) | Success |  |  |
| 60 | Redirected with subfolder| Open a session in a redirected server with subfolder and perform some actions (create folder, update, download, share...) | Success |  |  |
| 61 | VideoStreaming | Stream a video in a OAuth2 server | Video is streamed |  |  |
|**Upgrade**|||||||
| 62 | Upgrade app from older version with basic | 1. Install an older version (basic auth)<br>2. Upgrade to this one without changes in server| Correct upgrade |  |  |
| 63 | Upgrade auth method server (to OAuth2)| 1. Login in a server without OAuth2<br>2. Enable OAuth2 in server<br>3. Login with OAuth2 | 1. Correct login<br>2. Correct login |  |  |
| 64 | Upgrade auth method server (to basic)| 1. Login in a server with OAuth2<br>2. Disable OAuth2 in server<br>3. Login with basic | 1. Correct login<br>2. Correct login |  |  |
| 65 | Migrate basic to OAuth2| 1. Login in a basic older server<br>2. Upgrade by enabling OAuth2 in server | Migration OK. Users access to the account without re-login |  |  |
| 66 | Migrate OAuth2 to basic| 1. Login in a OAuth2 server<br>2. Upgrade by disabling OAuth2 in server | Migration OK. Users access to the account without re-login |  |  |