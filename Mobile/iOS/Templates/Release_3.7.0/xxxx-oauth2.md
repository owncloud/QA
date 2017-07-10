###  OAuth2 

#### Pr: https://github.com/owncloud/ios/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Login View**|||||||
| 1 | Initial look | Open the app. Check both orientations | Correct view. Only URL and connect button are shown  |  |  |
| 2 | OAuth2 URL | 1. Set an URL of a server with OAuth2<br>2. Tap on connect.<br> Check both orientations | Redirected to webview. No more options shown |  |  |
| 3 | Basic Auth URL | 1. Set an URL of a server without OAuth2<br>2. Tap on connect.<br>Check both orientations | Fields username and password are shown |  |  |
| 4 | Redirected URL | 1. Set a redirection URL <br>2. Tap on connect. <br>Check both orientations | Fields username and password are shown  |  |
| 5 | SAML URL | Set an SAML URL (not supported by the app)<br>Check both orientations | Correct error messaege |  |  |
| 6 | Wrong URL | Set an incorrect URL. <br>Check both orientations | Correct error messaege |  |  |
| 7 | Wrong Authorizathion endpoint | 1. In customization file, change auth endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect. <br>Check both orientations | Correct error handling |  |  |
|**Branding**|||||||
| 8 | OAuth2 URL hardcoded | Open the app.<br> Check both orientations | Correct view |  |  |
| 9 | OAuth2 URL hardcoded and hidden | Open the app.<br> Check both orientations | Correct view |  |  |
| 10 | Help link hidden | Open the app.<br> Check both orientations | Correct view |  |
|**OAuth2 UI flow**|||||||
| 11 | Webview | Enter OAuth2 URL and connect.<br> Check both orientations | Correct webview  |  |  |
| 12 | Correct credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter correct credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Credentials are checked and webview is closed  |  |  |
| 13 | Token expired | Wait until token expires| User is redirected to the webview to enter again the credentials |  |  |
| 14 | Wrong credentials | 1. Enter OAuth2 URL and connect.<br>2. Enter wrong credentials. <br>Check both orientations | 1. Webview is opened<br> 2. Webview can be closed  |  |  |
| 15 | Wrong client id | 1. In customization file, change client id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  |  |  |
| 16 | Wrong secret id | 1. In customization file, change secret id for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>Check both orientations | Correct error handling  |  |  |
| 17 | Wrong redirection url | 1. In customization file, change redirection url for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  |  |  |
| 18 | Wrong token endpoint | 1. In customization file, change token endpoint for a incorrect one<br>2. Enter OAuth2 URL and connect.<br>3. Input correct credentials<br>Check both orientations | Correct error handling  |  |  |
|**OAuth2 internal flow**|||||||
| 19 | Auth request | With mitmproxy, check the OAuth2 GET authorization code request | The URL contains the parameters: response_type=code, redirect_uri=\<customized\>, client_id=\<customized\> |  |  |
| 20 | Token request | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic |  |  |
| 21 | Token refresh | With mitmproxy, check the OAuth2 POST token request | The POST request contains in the body the parameters: grant_type=authorization_code, code=\<code from prev test\>,  redirect_uri=\<customized\>, client_id=\<customized\>.<br> Header Content Type = application/x-www-form-urlencoded.<br> Header www-authorization = Basic |  |  |
|**OAuth2 session**|||||||
| 22 | Create folder | With OAuth session active, create folder | Success |  |  |
| 23 | Upload files | With OAuth session active, upload files | Success |  |  |
| 24 | Download files | With OAuth session active, upload files | Success |  |  |
| 25 | Remove files | With OAuth session active, remove files | Success |  |  |
| 26 | Rename files | With OAuth session active, rename files | Success |  |  |
| 27 | Av. offline files | With OAuth session active,set files as av.offline | Success |  |  |
| 28 | Instant uploads | With OAuth session active, upload files | Success |  |  |
| 29 | Share with users | With OAuth session active, share with users | Success |  |  |
| 30 | Share public| With OAuth session active, share public | Success |  |  |
|**Multiaccount**|||||||
| 31 | Several OAuth2 same server | Attach several OAuth2 accounts of the same server on the same device. Check correct expirations. | All correct |  |  |
| 32 | Several OAuth2 different server | Attach several OAuth2 accounts of different servers on the same device | All correct |  |  |
| 33 | OAuth2 + basic | Attach an OAuth2 and a basic auth accounts to the same device | All correct |  |  | 
| 34 | OAuth2 + SAML | Attach an OAuth2 and a SAML auth accounts to the same device | Not posible |  |  |
|**Regression**|||||||
| 35 | Basic Auth server | Open a session in a basic auth server and perform some actions (create folder, update, download, share...) | Success |  |  |
| 36 | SAML server | Open a session in a SAML server and perform some actions (create folder, update, download, share...) | Success |  |  |
| 37 | SAML expiration | Open a session in a SAML server and wait until it expires | Redirected to iDP credentials view |  |  |
| 38 | Redirected | Open a session in a redirected server and perform some actions (create folder, update, download, share...) | Success |  |  |
| 39 | Redirected with subfolder| Open a session in a redirected server with subfolder and perform some actions (create folder, update, download, share...) | Success |  |  |
|**Upgrade**|||||||
| 40 | Upgrade app from older version with basic | 1. Install an older version (basic auth)<br>2. Upgrade to this one | Correct upgrade |  |  |
| 41 | Upgrade auth method server (to OAuth2)| 1. Login in a server without OAuth2<br>2. Enable OAuth2 in server<br>3. Login again with OAuth2 | 1. Correct login<br>2. Correct login |  |  |
| 42 | Upgrade auth method server (to basic)| 1. Login in a server with OAuth2<br>2. Disable OAuth2 in server<br>3. Login again with basic | 1. Correct login<br>2. Correct login |  |  |
| 43 | Migrate basic to OAuth2| 1. Login in a basic older server<br>2. Upgrade by migrating to a OAuth2 server | Migration OK |  |  |
| 44 | Migrate SAML to OAuth2| 1. Login in a older SAML server<br>2. Upgrade by migrating to a OAuth2 server | Migration OK |  |  |