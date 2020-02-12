###  AppAuth integration (OAuth2 regression) 

#### Pr: https://github.com/owncloud/android/pull/2800 

Devices: Samsung S9 v9

Server: 10.3.2

---

| Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Login View**|||||||
| OAuth2 URL http | 1. Set an URL of a http server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown | P m9 |  |
| OAuth2 URL https trusted | 1. Set an URL of a https trusted server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown | P m9 |  |
| OAuth2 URL https non-trusted | 1. Set an URL of a https non-trusted server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown | P m9 | FIXED: Unauthorized |
|**OAuth2 UI flow**|||||||
| Webview | Enter OAuth2 URL and connect.<br> Check both orientations | Correct webview  | P m9 |  |
| Correct credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter correct credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Credentials are checked and webview is closed  | P m9 |  |
| Wrong credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter wrong credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Webview can be closed  | P m9 |  |
| Wrong credentials recovery | 1. Enter OAuth2 URL and connect.<br>2. Enter wrong credentials.<br>3. Enter the correct credentials<br>Check both orientations | 1. Webview is opened<br> 2. Webview can be closed<br>3. Webview is closed and account created | P m9 | |
| Wrong client id | 1. In customization file, change client id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  | P m9 | |
| Wrong secret id | 1. In customization file, change secret id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  | P m9 | |
| Wrong redirection url | 1. In customization file, change redirection url for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  | P m9 | |
| Wrong token endpoint | 1. In customization file, change token endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  | P m9 |  |
| Wrong Authorizathion endpoint | 1. In customization file, change auth endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect. <br>Check both orientations | Correct error handling | P m9 | |q
|**OAuth2 internal flow**|||||||
| Auth request | With mitmproxy, check the OAuth2 GET authorization code request | The URL contains the parameters: response_type=code, redirect_uri=\<customized\>, client_id=\<customized\> | P m9 |  |
| Token request | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic + client id + : + secretid | F m9 | client_id is not present in body of request |
| Token refresh | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=refresh_token, clientid=\<customized\>,  refresh_token=\<obtained in the previous test\>.<br> The POST request contains in the headers: Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic + client id + : + secretid | F m9 | client_id is not present in body of request |
|**OAuth2 session**|||||||
| Create folder | With OAuth2 session active, create folder | Success | P m9 |  |
| Upload files | With OAuth2 session active, upload files | Success | P m9 |  |
| Download files | With OAuth2 session active, upload files | Success | P m9 |  |
| Remove files | With OAuth2 session active, remove files | Success | P m9 |  |
| Rename files | With OAuth2 session active, rename files | Success | P m9 |  |
| Av. offline files | With OAuth2 session active,set files as av.offline | Success | P m9 |  |
| Instant uploads | With OAuth2 session active, upload files | Success | P m9 |  |
| Share with users | With OAuth2 session active, share with users | Success | P m9 |  |
| Share public| With OAuth2 session active, share public | Success | P m9 |  |3
| Sync account | With OAuth2 session active, sync the whole account | Success | P m9 |  |
| Share with oC | With OAuth2 session active, share content from an external app | Success | P m9 |  |
| Send text | With OAuth2 session active, send text from an external app to oC | Success | P m9 |  |
| Sync account from settings | With OAuth2 session active, sync the whole account from device settings | Success | P m9 |  |
|**Session ends/refresh**||||||
| Session Expired | 1. Wait until token is refreshed<br> 2. Perform actions (download, upload, delete, move, remove) | New token is used in the requests and the action is performed| P m9 |  |
| Session Expired - external | 1. Wait until token is refreshed out of the app<br> 2. From an external app, send content once the token is expired | New token is used in the requests and the action is performed| P m9 |  |
| Session Expired while executing an action (upload, download, refresh folder) | 1. Perform a long operation <br> 2. Wait until token expires and is automatically refreshed<br> | New token is used in the current operation and it is completely performed| P m9 |  |
|**Multiaccount**|||||||
| Several OAuth2 same server | Attach several OAuth2 accounts of the same server on the same device. Check correct expirations. | All correct | P m9 |  |
| Several OAuth2 different server | Attach several OAuth2 accounts of different servers on the same device | All correct | P m9 |  |
| Several OAuth2 expiration | 1. Attach several OAuth2 accounts of different servers on the same device<br>2. Wait until one session expires. | Expired session is refreshed. The other sessions keep alive | P m9 |  |
| OAuth2 + basic | Attach an OAuth2 and a basic auth accounts to the same device | All correct | P m9  |  | 
|**External actions**|||||||
| Refresh Token revoked | 1. After login, remove refresh token in DB<br> 2. Wait until session expires| Session is not refreshed. User redirected to login view | F m9 | Crash |
| Token revoked | After login, remove access and refresh token | Session ends. User redirected to login view | F m9 | Crash  |
| Edit credentials with other account | 1. In app, after login, in settings view, go to edit credentials and enter other user credentials | Credentials from other account are not allowed | P m9 |
| Unauthorize android app | 1. In app, create an OAuth2 session<br>2. In web UI, remove authorized Android client  | User asked to reauthenticate | F m9 | Crash |
| User deleted | 1. In webUI, remove user | Session ends. User redirected to login view and can not login anymore | F m9 | Crash |
| Manage Space | In device Settings, clear cache and manage space of the app | Session does not end | P m9 |  |
| Remove client | In webUI, remove client  | Not posible to authenticate anymore | F m9 | Crash |
| Remove OAuth2 app | In webUI, disable app | basic auth? | F m9 | Crash  |
|**Errors**|||||||
| No internet connection | 1. Disable internet connection in device<br>2. Try to login in OAuth2 | Correct error | P m9 |  |
| No server connection | 1. Switch server off in device<br>2. Try to login in OAuth2 | Correct error | P m9 |  |
| Maintenance mode login | 1. Enable maintenance mode<br>2. Try to login in OAuth2 | Correct error | P m9 |  |
|**Regression**|||||||
| Basic Auth http URL | 1. Set an URL of a http server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown | P m9 |  |
| Basic Auth https trusted URL | 1. Set an URL of a https trusted server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown | P m9 |  |
| Basic Auth https non-trusted URL | 1. Set an URL of a https non-trusted server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown | P m9 |  |
| Switch a Basic Auth URL for an OAuth2 URL after the connection check | 1. Set an URL of a server with OAuth2<br>2. Tap on connect.<br>3. Edit the URL to point to a server without OAuth2 support <br>Check both orientations |Redirected to webview. No more options shown | P m9 |  |
| Switch an OAuth2 Auth URL for a Basic Auth URL after the connection check | 1. Set an URL of a server without OAuth2<br>2. Tap on connect.<br>3. Edit the URL to point to a server with OAuth2 support <br>Check both orientations | Fields username and password are shown | P m9  |  |
| Redirected | Open a session in a redirected server and perform some actions (create folder, update, download, share...) | Success | P m9 |  |
| Redirected with subfolder| Open a session in a redirected server with subfolder and perform some actions (create folder, update, download, share...) | Success | P m9 |  |
| VideoStreaming | Stream a video in a OAuth2 server | Video is streamed | P m9 |  |
|**Upgrade**|||||||
| Upgrade app from older version with basic | 1. Install an older version (basic auth)<br>2. Upgrade to this one without changes in server| Correct upgrade | P m9 |  |
| Upgrade app from older version with OAuth2 | 1. Install an older version (oauth2 auth)<br>2. Upgrade to this one without changes in server| Correct upgrade | P m9 |  |
| Migrate basic to OAuth2 | 1. Login in a basic older server<br>2. Upgrade by enabling OAuth2 in server | Users access to the account without re-login | P m9 |  |
| Migrate OAuth2 to basic | 1. Login in a OAuth2 server<br>2. Upgrade by disabling OAuth2 in server | Migration OK. Users access to the account after re-login | P m9 |  |