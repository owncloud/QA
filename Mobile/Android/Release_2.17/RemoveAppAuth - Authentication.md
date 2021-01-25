#### Authentication

PR: https://github.com/owncloud/android/pull/3043

**Devices**: Pixel 2 Android 11<br>
**Server**: 10.6


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----: | :--------------- | 
|**View**||||||
| Portrait | Open login view in portrait orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles | P m11 |  |
| Landscape | Open login view in landscape orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles | P m11 |  |
| New to ownCloud | Tap on the link "New to ownCloud" | Link works | P m11 |  |
|**URL validation**||||||
| Empty URL | Let empty URL | 1. Correct issue indicating error<br>2. Login button not displyed | P m11 |  |
| Prefix http | Input correct http URL with protocol | Accepted | P m11 |  |
| Prefix https | Input correct https URL with protocol | Accepted | P m11 |  |
| No prefix http | Input correct http URL without protocol | Accepted | P m11 |  |
| No prefix https | Input correct https URL without protocol | Accepted | P m11 |  |
| Icon check | 1. Input correct URL<br>2. Tap on ownClouud icon| URL checked | P m11 |  |
| Incorrect URL | Set Incorrect URL | 1. Correct issue indicating error<br>2. Login button not displyed | P m11 |  |
| Server not reachable | Set a correct URL but with no reachable server (f. ex. invalid port) | 1. Correct issue indicating error<br>2. Login button not displyed | P m11 |  |
| Incorrect prefix http | Input http URL with "https://" prefix | 1. SSL initialization error<br>2. Login button not displyed | P m11 |  |
| Incorrect prefix https | Input https URL with "http://" prefix | Connection established | P m11 |  |
| Bad prefix | Input https URL with "http:::::////" prefix | Wrong format error | P m11 |  |
| No internet connection | 1. Disable internet connection in device<br>2. Input URL | Correct error | P m11 |  |
| No server connection | 1. Switch server off in device<br>2. Input URL | Correct error |P m11  |  |
| Server not supported | Input URL of non supported server (older than 10) | Correct error | P m11 |  |
| Maintenance mode | 1. Enable maintenance mode<br>2. Input error | Correct error | P m11 |  |
|**Review Connection**||||||
| Open certificate | Open certificate to check details | Certificate shown correctly | P m11 |  |  |
| Approve certificate | Open certificate to check details and approve it | 1. Moved forward to credentials basic/OAuth<br>2. Login button not displyed  | P m11|  |  |
| Cancel certificate | 1. Open certificate to check details<br>2. Cancel it | Back to URL |P m11 |  |  |
|**Basic auth**||||||
| Empty credentials | Connect with empty credentials | Connect button not displayed  | P m11 |  | 
| Empty username | Connect with empty username | Connect button not displayed | P m11 |  |
| Empty password | Connect with empty password | Connect button not displayed | P m11 |  |
| Correct credentials | Connect with correct username and passowrd | Correct connected | P m11 |  | 
| Special characters | Connect with username that contains special characters | Correct connected | P m11 |  | 
| Username with blanks | Connect with username that contains blanks | Correctly connected  | P m11 |  |
| Password eye | 1. Input a password<br>2. Click on eye button | Password is correctly displayed/hidden | P m11 |  |
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
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account | NA  |  |
|**LDAP**||||||
| Correct credentials | Set correct LDAP credentials | Correctly connected | P m11 |  |  |
|**Redirections**||||||
| 301 | 1. Set an URL with a 301 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected | F m11 | [Infinite loop](https://github.com/owncloud/android/pull/3043#issuecomment-766879561) |  |
| 301 Cancel | 1. Set an URL with a 301 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection| F m11 | [Infinite loop](https://github.com/owncloud/android/pull/3043#issuecomment-766879561)  |
| 302 | 1. Set an URL with a 302 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected |  F m11| [Infinite loop](https://github.com/owncloud/android/pull/3043#issuecomment-766879561)  |
| 302 Cancel | 1. Set an URL with a 302 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection | F m11 | [Infinite loop](https://github.com/owncloud/android/pull/3043#issuecomment-766879561)  |
|**Edit account**||||||
| URL | 1. Go to account list and edit account<br>2. Edit URL | URL not editable | P m11 |  |
| Username | 1. Go to account list and edit account (basic auth)<br>2. Edit username | Username not editable | P m11 |  |
| Password | 1. Edit the password in the UI<br>2. Open account list and edit account (basic auth)<br>3. Input new password | Correctly connected | P m11 |  |
| Edit OAuth2 | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter correct credentials | Correctly connected | P m11 |  |
| Edit OAuth2 - other account | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter credentials of a different user | Correct error displayed | P m11 |  |
|**Multiaccount**||||||
| Two accounts basic | 1. Add two accounts with basic auth<br>2. Switch between the accounts | Correct file lists |  P m11 |   | 
| Two accounts OAuth2 same server | 1. Add two accounts OAuth2 from saver server<br>2. Switch between the accounts | Correct file lists | P m11   |   | 
| Six accounts both auth methods | 1. Add six accounts (three OAuth2, three basic, from different severs as posible)<br>2. Switch between accounts | Correct file lists in every account after switching | P m11 |  [Small glitch](https://github.com/owncloud/android/issues/3060)
|**Generic errors**||||||
| No internet connection | 1. Disable internet connection in device after entering the URL<br>2. Input credentials | Correct error | P m11 |  |
| No server connection | 1. Switch server off in device after entering the URL<br>2. Input credentials | Correct error | P m11 |  |
| Existing account | 1. Conect with credentials of an already attached user | Correct error | P m11 |  |
| Maintenance mode | 1. Enable maintenance mode after entering the URL<br>2. Input credentials | Correct error | P m11 |  |
|**Upgrade**||||||
| Upgrade from latest| 1. Install latest version<br>2. Add an basic, an OAuth2, and an OIDC account<br>3. Upgrade to current version | Correct upgrade. Sessions are not lost. Check exploratorily the app  |  |  