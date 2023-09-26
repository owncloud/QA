#### Authentication


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----- | :--------------- | 
|**URL validation**||||||
| Empty URL | Let empty URL | 1. Correct issue indicating error<br>2. Login button not displyed | P m11 |  |
| Prefix http | Input correct http URL with protocol | Accepted | P m11 |  |
| Prefix https | Input correct https URL with protocol | Accepted | P m11 |  |
| No prefix http | Input correct http URL without protocol | Accepted | P m11 | New behaviour: It expects https. |
| No prefix https | Input correct https URL without protocol | Accepted | P m11 |  |
| Icon check | 1. Input correct URL<br>2. Tap on ownClouud icon| URL checked | P m11 |  |
| Incorrect URL | Set Incorrect URL | 1. Correct issue indicating error<br>2. Login button not displyed | P m11 |  |
| Server not reachable | Set a correct URL but with no reachable server (f. ex. invalid port) | 1. Correct issue indicating error<br>2. Login button not displyed | P m11 |  |
| Incorrect prefix http | Input http URL with "https://" prefix | 1. SSL initialization error<br>2. Login button not displyed | P m11 |  |
| Incorrect prefix https | Input https URL with "http://" prefix | Connection established | P m11 |  |
| Bad prefix | Input https URL with "http:::::////" prefix | Wrong format error | P m11 |  |
| No internet connection | 1. Disable internet connection in device<br>2. Input URL | Correct error | P m11 |  |
| No server connection | 1. Switch server off in device<br>2. Input URL | Correct error | P m11 |  |
| Server not supported | Input URL of non supported server (older than 10) | Correct error | P m11 |  |
| Maintenance mode | 1. Enable maintenance mode<br>2. Input error | Correct error | P m11 |  |
|**Review Connection**||||||
| Open certificate | Open certificate to check details | Certificate shown correctly | P m11 |  |  |
| Approve certificate | Open certificate to check details and approve it | 1. Moved forward to credentials basic/OAuth<br>2. Login button not displyed  | P m11 |  |  |
| Cancel certificate | 1. Open certificate to check details<br>2. Cancel it | Back to URL | P m11 |  |  |
|**Basic auth**||||||
| Empty credentials | Connect with empty credentials | Not posible. Login button hidden | P m11 |  | 
| Empty username | Connect with empty username | Connect button not displayed | P m11 |  |
| Empty password | Connect with empty password | Connect button not displayed | P m11 |  |
| Correct credentials | Connect with correct username and passowrd | Correct connected | P m11 |  | 
| Special characters | Connect with username that contains special characters | Correct connected | P m11 |  | 
| Username with blanks | Connect with username that contains blanks | Correctly connected  | P m11 |  |
|**OAuth2**||||||
| Correct credentials | Set correct credentials in OAuth2 view | Correctly connected | P m11 |  | 
| Cancel OAuth2 Login | 1. Open OAuth2<br>2. Cancel it in credentials view | Moved to Login view | P m11 |  |
| Cancel OAuth2 Authorizaton | 1. Open OAuth2<br>2. Cancel it in authorization view | Moved to Login view | P m11 |  |
| Renewal OAuth2 token | 1. Open OAuth2 account<br>2. Wait till token expiration time passes | Token is renewed (check with mitmproxy) and it is transparent to user | P m11 |  |
| Revoke OAuth2 token | 1. Open OAuth2 account<br>2. In web UI, revoke token | Moved to Login view | P m11 |  |
|**OIDC**||||||
| Correct credentials | 1. Set a correct OIDC URL<br>2. Enter correct credentials | Correctly validated | P m11 |  |  |
| Authorization | 1. After entering correct credentials, authorize to connect | Correctly connected | P m11 |  |  |
| Cancel login process | 1. Set a correct OIDC URL<br>2. In iDP, cancel login process<br> | Back to client | P m11 |  |  |
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA |  |
|**LDAP**||||||
| Correct credentials | Set correct LDAP credentials | Correctly connected | P m11 |  |  |
|**Redirections**||||||
| 301 | 1. Set an URL with a 301 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected | P m11 | Issue not shown |  |
| 301 Cancel | 1. Set an URL with a 301 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection| P m11 |  |
|**Edit account**||||||
| URL | 1. Go to account list and edit account<br>2. Edit URL | URL not editable | P m11 |  |
| Username | 1. Go to account list and edit account (basic auth)<br>2. Edit username | Username not editable | P m11 |  |
| Password | 1. Edit the password in the UI<br>2. Open account list and edit account (basic auth)<br>3. Input new password | Correctly connected | P m11 |  |
| Edit OAuth2 | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter correct credentials | Correctly connected | P m11 |  |
| Edit OAuth2 - other account | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter credentials of a different user | Correct error displayed |  P m11|  |
|**General errors**||||||
| No internet connection | 1. Disable internet connection in device after entering the URL<br>2. Input credentials | Correct error | P m11 |  |
| No server connection | 1. Switch server off in device after entering the URL<br>2. Input credentials | Correct error | P m11 |  |
| Existing account | 1. Conect with credentials of an already attached user | Correct error | P m11 |  |
| Maintenance mode | 1. Enable maintenance mode after entering the URL<br>2. Input credentials | Correct error | P m11 |  |