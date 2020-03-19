#### Authentication

Devices: Pixel 2 v10<br>
Server: 10.4.0

---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----- | :--------------- | 
|**View**||||||
| Portrait | Open login view in portrait orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles | F m10 | Link to new to owncloud misplaced |
| Landscape | Open login view in landscape orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles | P m10 |  |
| New to ownCloud | Tap on the link "New to ownCloud" | Link works| P m10 |  |
|**URL validation**||||||
| Empty URL | Let empty URL | 1. Correct issue indicating error<br>2. Login button/credentials not displayed | P m10  |  |
| Prefix http | Input correct http URL with protocol | Accepted | P m10 |  |
| Prefix https | Input correct https URL with protocol | Accepted | P m10 |  |
| No prefix http | Input correct http URL without protocol | Accepted | P m10 |  |
| No prefix https | Input correct https URL without protocol | Accepted | P m10 |  |
| Icon check | 1. Input correct URL<br>2. Tap on ownCloud icon| URL checked | P m10 |  |
| Incorrect URL | Set Incorrect URL | 1. Correct issue indicating error<br>2. Login button/credentials not displayed | P m10 |  |
| Server not reachable | Set a correct URL but with no reachable server (f. ex. invalid port) | 1. Correct issue indicating error<br>2. Login button not displyed | F m10 | correct error? |
| Incorrect prefix http | Input http URL with "https://" prefix | 1. SSL initialization error<br>2. Login button/credentials not displayed | P m10 |  |
| Incorrect prefix https | Input https URL with "http://" prefix | Connection established | P m10 |  |
| Bad prefix | Input https URL with "http:::::////" prefix | Wrong format error | P m10 |  |
| No internet connection | 1. Disable internet connection in device<br>2. Input URL | Correct error | F m10 | appropiate error message? |
| No server connection | 1. Switch server off in device<br>2. Input URL | Correct error | P m10 |  |
| Server not supported | Input URL of non supported server (older than 10) | Correct error | F m10 | Incorrect error |
| Maintenance mode | 1. Enable maintenance mode<br>2. Input error | Correct error | P m10 |  |
|**Review Connection**||||||
| Self signed | Enter an URL of a server which certificate is self-signed | Certificate Dialog shown | P m10 |  |  |
| Open certificate | Open certificate to check details | Certificate shown correctly | P m10 |  |  |
| Approve certificate | Open certificate to check details and approve it | 1. Moved forward to credentials basic/OAuth<br>2. Login button not displyed  | P m10 |  |  |
| Cancel certificate | 1. Open certificate to check details<br>2. Cancel it | Back to URL | F m10 |  Wrong message |  |
|**Basic auth**||||||
| Empty credentials | Connect with empty credentials | Connect button not displayed | P m10 |  | 
| Empty username | Connect with empty username | Connect button not displayed | P m10 |  |
| Empty password | Connect with empty password | Connect button not displayed | P m10 |  |
| Special characters | Connect with username that contains special characters | Correct connected | P m10 |  | 
| Username with blanks | Connect with username that contains blanks | Correctly connected  | P m10 |  |
| Password eye | 1. Input a password<br>2. Click on eye button | Password is correctly displayed/hidden | P m10 |  |
| No internet connection | 1. Disable internet connection in device after entering the URL<br>2. Input credentials | Correct error | F m10 | message not accurate |
| No server connection | 1. Switch server off in device after entering the URL<br>2. Input credentials | Correct error | F m10 | message improvable |
| Existing account | 1. Conect with credentials of an already attached user | Correct error | P m10 |  |
| Maintenance mode | 1. Enable maintenance mode after entering the URL<br>2. Input credentials | Correct error | F m10 | unknown error |
|**OAuth2**||||||
| Correct credentials | Set correct credentials in OAuth2 view | Correctly connected | P m10 |  | 
| Cancel OAuth2 Login | 1. Open OAuth2<br>2. Cancel it in credentials view | Moved to Login view | P m10 |  |
| Cancel OAuth2 Authorizaton | 1. Open OAuth2<br>2. Cancel it in authorization view | Moved to Login view | P m10 |  |
| Revoke OAuth2 token | 1. Open OAuth2 account<br>2. In web UI, revoke token | Moved to Login view | P m10 |  |
|**LDAP**||||||
| Correct credentials | Set correct LDAP credentials | Correctly connected | P m10 |  |  |
|**Redirections**||||||
| 301 | 1. Set an URL with a 301 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected | F m10 | Not working |  |
| 302 | 1. Set an URL with a 302 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected | F m10 | Not working |
|**Edit account**||||||
| URL | 1. Go to account list and edit account<br>2. Edit URL | URL not editable |P m10  |  |
| Username | 1. Go to account list and edit account (basic auth)<br>2. Edit username | Username not editable | F m10 | Editable in landscape |
| Password | 1. Edit the password in the UI<br>2. Open account list and edit account (basic auth)<br>3. Input new password | Correctly connected | P m10 |  |
| Edit OAuth2 | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter correct credentials | Correctly connected | P m10 |  |
| Edit OAuth2 - other account | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter credentials of a different user | Correct error displayed | F m10 | Connected with different account |
|**Multiaccount**||||||
| Two accounts basic | 1. Add two accounts with basic auth<br>2. Switch between the accounts | Correct file lists | P m10 |   | 
| Two accounts OAuth2 same server | 1. Add two accounts OAuth2 from saver server<br>2. Switch between the accounts | Correct file lists | P m10 |   | 
| Six accounts both auth methods | 1. Add six accounts (three OAuth2, three basic, from different severs as posible)<br>2. Switch between accounts | Correct file lists | P m10 |  
|**Brandable options**||||||
| Default URL | Set a default URL in server\_url field of setup.xml | URL set in correct field | P m10 |  |  |
| Hide URL | Set show\_server\_url\_input to false in setup.xml | URL hidden | P m10 |  |  |
| Show welcome link | Set show\_welcome\_link to false in setup.xml | Welcome link hidden | P m10 |  |  |
| Welcome link | Set a URL in welcome\_link\_url field in setup.xml | Correct link | P m10 |  |  |
| Check arrow color| Set a color in login\_text\_color field in setup.xml | Correct color of the arrow, the same as the login text | F m10 | Different color |  |
| Eye color | Set a color in login\_text\_color field in setup.xml | Password eye of the same color of credentials | P m10 |  |  |
| Server status icon | Set a color in login\_connection\_text\_color field in setup.xml | Correct color | F m10 | Different color |  |
| Auth status icon | Set a color in login\_credentials\_text\_color field in setup.xml | Correct color | F m10 | Different color |  |
|**Extra**||||||
| 2655 | Check issue [2655](https://github.com/owncloud/android/issues/2655) | Problem fixed | P m10 |  |  |
