### Authentication

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: 

---

 
| Test Case | Steps | Expected | Result | Related Comment / Defect  | 
| :-------- | :---- | :------- | :----: | :------------------------ | 
|**Login view UI**||||||
| View | Open welcome view  | Visible: <br>- ownCloud icon<br>- `Welcome to ownCloud`<br>- `Start Setup`<br>- `Settings`<br>- Settings link<br>Only available in portrait orientation |  |  |
| Settings | Tap on the link `Settings` | `Settings` view open |  |  |
|**Start Setup / URL validation**||||||
| Empty URL | Let empty URL | `Proceed` button locked |  |  |
| Prefix http | 1. Enter correct http URL with protocol prefix "http://"<br>2. Click on `Proceed`<br>3. `Approve` | 2. "Review Connection" dialog displayed<br>3. Login view displayed |  |  |
| Prefix https (secure) | 1. Enter correct https secure URL with protocol prefix "https://"<br>2. Click `Proceed` | Login view displayed |  |  |
| Prefix https (secure) | 1. Enter correct https non-secure URL with protocol prefix "https://"<br>2. Click `Proceed`<br>3. `Approve` | 2. "Review Connection" dialog displayed<br>3. Login view displayed  |  |  |
| No prefix http | 1. Enter correct http URL without protocol prefix "http://"<br>2. Click on right arrow| Error: `An SSL error has occurred` |  |  |
| Server not reachable | 1. Enter an URL that points nowhere<br>2. Click on `Proceed`| Error: `not an ownCloud instance` |  |  |
| Wrong format | 1. Enter as URL an invalid string like "hello, i'm here"<br>2. Click on `Proceed`| Error: `hostname could not be found` |  |  | 
| No server connection | 1. Switch server off<br>2. Enter URL<br>3. Click on `Proceed` | Error: `could not connect to the server` |  |  |
| Server not supported | 1. Enter URL of non supported server (older than 10.x)<br>2. Click on `Proceed` | Error: `this server runs an unsupported version` |  |  |
| Maintenance mode (oC10) | 1. Enable maintenance mode in server<br>2. Enter URL<br>3. Click on `Proceed` | Error: `Server down for maintenance` |  |  |
|**Review Connection**||||||
| Open certificate | 1. Enter non-secure https server URL (https self signed certificate, or adding mitm f.ex.)<br>2. Click on `Certificate` | 1. Alert about non secure certificate is displayed: `Review Connecion`<br>2. Certificate properties listed |  |  |  |
| Approve certificate | 1. Enter non-secure server URL (https self signed certificate, or adding mitm f.ex.)<br>2. Click on `Approve` | 1. Alert about non secure certificate is displayed: `Review Connecion`<br>2. Moved forward to login view | |  |  |
| Cancel certificate | 1. Enter non-secure server URL (https self signed certificate, or adding mitm f.ex.)<br>2. Click on `Cancel`  | Stay in `Sever URL` till it's accepted | |  |  |
|**Basic auth**| PREC: Correct basic auth URL |||||
| Empty credentials | Let empty credentials| `Login` button locked  |  |  | 
| Empty username | Let empty username| `Login` button locked  |  |  |  
| Empty password | 1. Enter username<br>2. Let empty password<br>3. Click on `Login` | Error: `Authorization failed` |  |  |
| Correct credentials | 1. Enter correct credentials<br>2. Click on `Login`<br>2. Add name to the account (optional)| Account added and listed |  |  | 
| Special characters | 1. Enter correct username that contains special characters like "+_.@-'" (created in advace in server) and correct password<br>2. Click on `Login`<br>3. Add name to the account (optional) | Account added and listed |  |  |  
| Username with blanks | 1. Enter correct username that contains blank characters (created in advace in server) and correct password<br>2. Click on `Login` | Account added and listed |  |  |
| Wrong credentials | 1. Enter correct username and incorrect password<br>2. Click on `Login` | Error: `Authorization failed` |  |  | 
|**OAuth2**| PREC: Correct OAuth URL |||||
| Correct credentials | 1. Enter correct credentials in OAuth2 view (browser)<br>2. Add name to the account (optional)| Account added and listed |  |  | 
| Cancel OAuth2 Login | 1. Enter correct credentials in OAuth2 view (browser)<br>2. Cancel authentication process in browser| Moved to login view |  |  |
| Cancel OAuth2 Authorizaton | 1. Enter correct credentials in browser<br>3. Cancel process in authorization view | Moved to login view |  |  |
| Renewal OAuth2 token | 1. Enter correct credentials in browser and authorize<br>2. Wait till token expires (default 1h)<br>3. Perform any operations in the list of files | Operation is completed with no authentication/authorization errors. Check with mitmproxy or any other tool that the token endpoint was called |
| Revoke OAuth2 token (oC10) |1. Enter correct credentials in browser and authorize<br>2. Revoke the iOS token<br>3. Perform any operation in list of files<br>4. Click on `Sign In` and enter correct credentals | 3. Error in list of files: `Access denied`<br>4. List of files displayed again. |  |  |
| Logout  | 1. Complete authentication/authorization process in a OAuth2 server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA | Not done yet |
|**OIDC**| PREC: Correct OIDC URL |||||
| Correct credentials | 1. Enter correct credentials in OIDC view (browser)<br>2. Add name to the account (optional)| Account added and listed |  |  | 
| Cancel OIDC Login | 1. Enter correct credentials in OIDC view (browser)<br>2. Cancel authentication process in browser| Moved to login view |  |  |
| Cancel OIDC Authorizaton | 1. Enter correct credentials in browser<br>3. Cancel process in authorization view | Moved to login view |  |  |
| Renewal OIDC token | 1. Enter correct credentials in browser and authorize<br>2. Wait till token expires (default 1h)<br>3. Perform any operations in the list of files | Operation is completed with no authentication/authorization errors. Check with mitmproxy or any other tool that the token endpoint was called |
| Revoke OAuth2 token |1. Enter correct credentials in browser and authorize<br>2. Revoke the iOS token<br>3. Perform any operation in list of files<br>4. Click on `Sign In` and enter correct credentals | 3. Error in list of files: `Access denied`<br>4. List of files displayed again. | NA | No way|
| Logout  | 1. Complete authentication/authorization process in a OAuth2 server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA | Not done yet |
|**Redirections**||||||
| 301 | 1. Enter an URL that points to 301 redirection<br>2. `Approve`<br>3. Complete the authentication process | 1. `Review connection` dialog displayed, showing the target URL<br>2. Redirection followed to the new location. New Location displayed in login view<br>3. Account added and listed using the target URL |  |  |  

#### Account options

[Reference](https://github.com/owncloud/ios-app/blob/11074347386021d2bd222aee4efa14810cf93f70/doc/CONFIGURATION.json#L771-L784)

| Option | Value | Expected | Result | Related Comment / Defect  | 
| :----- | :---- | :------- | :----: | :------------------------ | 
| branding.can-add-account | false | `+` button hidden in downside of sidebar menu | | 
| branding.can-edit-account | false | `Edit` option hidden when long pressing over account header in side bar menu | | 

#### Branding assets

[Reference](https://github.com/owncloud/ios-app/pull/1274)

Locations:

(1) ownCloud/Resources/Theming/com.owncloud.ios-app<br>
(2) ownCloud/Resources/Theming/branding-assets

Clean build folder after every execution

| Asset | Location | Expected | Result | Related Comment / Defect  | 
| :---- | :------- | :------- | :----: | :------------------------ | 
| branding-logo.png (req)<br>branding-splashscreen-logo.png (req)<br>branding-splashscreen-background.png (req)  | 1. Just (1)<br>2. (1) & (2) | 1. Displayed (1)<br>2. Displayed (2) | | Logo: In Welcome view
| branding-background.png (opt)|1. Just (1)<br>2. (1) & (2) | 1. Displayed (1)<br>2. Displayed (2) | | Background of welcome view|
| branding-logo-setup.png (opt)<br>branding-background-setup.png (opt)|1. Just (1)<br>2. Just (2) | 1. Displayed (1)<br>2. Displayed (2)| | Not by default in (1).<br> Only works by adding in (2) | |
| branding-logo-sidebar.png (opt)<br>branding-background-sidebar.png(opt)| 1. Just (1)<br>2. Just (2) | 1. Displayed (1)<br>2. Displayed (2) | Failed | Depends on `branding.organization-name` ¿? |

#### Branding theme colors

| Asset | Value  | Result | Related Comment / Defect  | 
| :---- | :----- | :----- | :-----------------------  |
| tint-color | Color hex value |  | Topbar items, 3-dot button, button background...
| branding-background.png | Color hex value |  | Background of welcome view and background of icon in sidebar. Works when no background image is set|


