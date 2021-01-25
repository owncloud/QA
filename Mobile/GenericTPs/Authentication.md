#### Authentication


---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----- | :--------------- | 
|**Login view**||||||
| Portrait | Open login view in portrait orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles |  |  |
| Landscape | Open login view in landscape orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles |  |  |
| New to ownCloud | Tap on the link "New to ownCloud" | Link works|  |  |
|**URL validation**||||||
| Empty URL | Let empty URL | 1. Correct issue indicating error<br>2. Login button not displyed |  |  |
| Prefix http | Input correct http URL with protocol | Accepted |  |  |
| Prefix https | Input correct https URL with protocol | Accepted |  |  |
| No prefix http | Input correct http URL without protocol | Accepted |  |  |
| No prefix https | Input correct https URL without protocol | Accepted |  |  |
| Icon check | 1. Input correct URL<br>2. Tap on ownClouud icon| URL checked |  |  |
| Incorrect URL | Set Incorrect URL | 1. Correct issue indicating error<br>2. Login button not displyed |  |  |
| Server not reachable | Set a correct URL but with no reachable server (f. ex. invalid port) | 1. Correct issue indicating error<br>2. Login button not displyed |  |  |
| Incorrect prefix http | Input http URL with "https://" prefix | 1. SSL initialization error<br>2. Login button not displyed |  |  |
| Incorrect prefix https | Input https URL with "http://" prefix | Connection established |  |  |
| Bad prefix | Input https URL with "http:::::////" prefix | Wrong format error |  |  |
| No internet connection | 1. Disable internet connection in device<br>2. Input URL | Correct error |  |  |
| No server connection | 1. Switch server off in device<br>2. Input URL | Correct error |  |  |
| Server not supported | Input URL of non supported server (older than 10) | Correct error |  |  |
| Maintenance mode | 1. Enable maintenance mode<br>2. Input error | Correct error |  |  |
|**Review Connection**||||||
| Open certificate | Open certificate to check details | Certificate shown correctly |  |  |  |
| Approve certificate | Open certificate to check details and approve it | 1. Moved forward to credentials basic/OAuth<br>2. Login button not displyed  | |  |  |
| Cancel certificate | 1. Open certificate to check details<br>2. Cancel it | Back to URL | |  |  |
|**Basic auth**||||||
| Empty credentials | Connect with empty credentials | Wrong credentials error |  |  | 
| Empty username | Connect with empty username | Connect button not displayed |  |  |
| Empty password | Connect with empty password | Connect button not displayed |  |  |
| Correct credentials | Connect with correct username and passowrd | Correct connected |  |  | 
| Special characters | Connect with username that contains special characters | Correct connected |  |  | 
| Username with blanks | Connect with username that contains blanks | Correctly connected  |  |  |
| Password eye | 1. Input a password<br>2. Click on eye button | Password is correctly displayed/hidden |  |  |
|**OAuth2**||||||
| Correct credentials | Set correct credentials in OAuth2 view | Correctly connected |  |  | 
| Cancel OAuth2 Login | 1. Open OAuth2<br>2. Cancel it in credentials view | Moved to Login view |  |  |
| Cancel OAuth2 Authorizaton | 1. Open OAuth2<br>2. Cancel it in authorization view | Moved to Login view |  |  |
| Renewal OAuth2 token | 1. Open OAuth2 account<br>2. Wait till token expiration time passes | Token is renewed (check with mitmproxy) and it is transparent to user |  |  |
| Revoke OAuth2 token | 1. Open OAuth2 account<br>2. In web UI, revoke token | Moved to Login view |  |  |
|**OIDC**||||||
| Correct credentials | 1. Set a correct OIDC URL<br>2. Enter correct credentials | Correctly validated |  |  |  |
| Authorization | 1. After entering correct credentials, authorize to connect | Correctly connected |  |  |  |
| Cancel login process | 1. Set a correct OIDC URL<br>2. In iDP, cancel login process<br> | Back to client |  |  |  |
| Logout  | 1. Complete login process in a OIDC server<br>2. Logout in the idP | Session logged out. Needed credentials again to enter the account |  |  |
|**LDAP**||||||
| Correct credentials | Set correct LDAP credentials | Correctly connected |  |  |  |
|**Redirections**||||||
| 301 | 1. Set an URL with a 301 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected |  |  |  |
| 301 Cancel | 1. Set an URL with a 301 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection|  |  |
| 302 | 1. Set an URL with a 302 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected |  |  |
| 302 Cancel | 1. Set an URL with a 302 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection |  |  |
|**Edit account**||||||
| URL | 1. Go to account list and edit account<br>2. Edit URL | URL not editable |  |  |
| Username | 1. Go to account list and edit account (basic auth)<br>2. Edit username | Username not editable |  |  |
| Password | 1. Edit the password in the UI<br>2. Open account list and edit account (basic auth)<br>3. Input new password | Correctly connected |  |  |
| Edit OAuth2 | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter correct credentials | Correctly connected |  |  |
| Edit OAuth2 - other account | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter credentials of a different user | Correct error displayed |  |  |
|**Multiaccount**||||||
| Two accounts basic | 1. Add two accounts with basic auth<br>2. Switch between the accounts | Correct file lists |   |   | 
| Two accounts OAuth2 same server | 1. Add two accounts OAuth2 from saver server<br>2. Switch between the accounts | Correct file lists |   |   | 
| Six accounts both auth methods | 1. Add six accounts (thre OAuth2, three basic, from different severs as posible)<br>2. Switch between accounts | Correct file lists |  |  
|**General errors**||||||
| No internet connection | 1. Disable internet connection in device after entering the URL<br>2. Input credentials | Correct error |  |  |
| No server connection | 1. Switch server off in device after entering the URL<br>2. Input credentials | Correct error |  |  |
| Existing account | 1. Conect with credentials of an already attached user | Correct error |  |  |
| Maintenance mode | 1. Enable maintenance mode after entering the URL<br>2. Input credentials | Correct error |  |  |
|**Brandable options**||||||
| Default URL | Set a default URL in server\_url field of setup.xml | URL set in correct field |  |  |  |
| Hide URL | Set show\_server\_url\_input to false in setup.xml | URL hidden |  |  |  |
| Show welcome link | Set show\_welcome\_link to false in setup.xml | Welcome link hidden |  |  |  |
| Welcome link | Set a URL in welcome\_link\_url field in setup.xml | Correct link |  |  |  |