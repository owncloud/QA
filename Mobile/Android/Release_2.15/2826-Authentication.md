#### Authentication

Devices: Pixel 2 v10, Huawei P20 v9<br>
Server: 10.4.0

---

 
| Test Case | Steps | Expected | Result | Related Comment  | 
| :-------- | :---- | :------- | :----: | :--------------- | 
|**View**||||||
| Portrait | Open login view in portrait orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles | P m10 m9 | FIXED: Link to new to owncloud misplaced |
| Landscape | Open login view in landscape orientation | Everything correct placed<br>Check the disclosure button and the password eye are visibles | P m10 m9|  |
| New to ownCloud | Tap on the link "New to ownCloud" | Link works| P m10 m9 |  |
|**URL validation**||||||
| Empty URL | Let empty URL | 1. Correct issue indicating error<br>2. Login button/credentials not displayed | P m10 m9 |  |
| Prefix http | Input correct http URL with protocol | Accepted | P m10 m9|  |
| Prefix https | Input correct https URL with protocol | Accepted | P m10 m9|  |
| No prefix http | Input correct http URL without protocol | Accepted | P m10 m9|  |
| No prefix https | Input correct https URL without protocol | Accepted | P m10 m9 |  |
| Icon check | 1. Input correct URL<br>2. Tap on ownCloud icon| URL checked | P m10 m9|  |
| Incorrect URL | Set Incorrect URL | 1. Correct issue indicating error: \"Error while connecting with the server\"<br>2. Login button/credentials not displayed | P m10 m9 | |
| Server not reachable | Set a correct URL but with no reachable server (f. ex. invalid port) | 1. Correct issue indicating error: \"Error while connecting with the server\<br>2. Login button not displyed | P m10 m9 |  |
| Incorrect prefix http | Input http URL with "https://" prefix | 1. SSL initialization error<br>2. Login button/credentials not displayed | P m10 m9 |  |
| Incorrect prefix https | Input https URL with "http://" prefix | Connection established | P m10 m9 |  |
| Bad prefix | Input https URL with "http:::::////" prefix | Wrong format error | P m10 m9 |  |
| No internet connection | 1. Disable internet connection in device<br>2. Input URL | Correct error: Device is not connected to a network | P m10 m9 |  |
| No server connection | 1. Switch server off in device<br>2. Input URL | Correct error | P m10 m9 |  |
| Server not supported | Input URL of non supported server (older than 10) | Correct error | P m10 m9 | FIXED: Incorrect error |
| Maintenance mode | 1. Enable maintenance mode<br>2. Input error | Correct error | P m10 m9 |  |
|**Review Connection**||||||
| Self signed | Enter an URL of a server which certificate is self-signed | Certificate Dialog shown | P m10 m9|  |  |
| Open certificate | Open certificate to check details | Certificate shown correctly | P m10 m9|  |  |
| Approve certificate | Open certificate to check details and approve it | 1. Moved forward to credentials basic/OAuth<br>2. Login button not displyed  | P m10 m9|  |  |
| Cancel certificate | 1. Open certificate to check details<br>2. Cancel it | Back to URL | P m10 m9 |  FIXED: Wrong message |  |
|**Basic auth**||||||
| Correct connection | Connect with correct credentials | File list shown | P m10 m9 |  |
| Empty credentials | Connect with empty credentials | Connect button not displayed | P m10 m9|  | 
| Empty username | Connect with empty username | Connect button not displayed | P m10 m9 |  |
| Empty password | Connect with empty password | Connect button not displayed | P m10 m9 |  |
| Special characters | Connect with username that contains special characters | Correct connected | P m10 |  | 
| Username with blanks | Connect with username that contains blanks | Correctly connected  | P m10 m9|  |
| Password eye | 1. Input a password<br>2. Click on eye button | Password is correctly displayed/hidden | P m10 m9|  |
| No internet connection | 1. Disable internet connection in device after entering the URL<br>2. Input credentials | Correct error | P m10 m9 | FIXED: message not accurate |
| No server connection | 1. Switch server off in device after entering the URL<br>2. Input credentials | Correct error | P m10 m9 |  |
| Existing account | 1. Conect with credentials of an already attached user | Correct error | P m10 m9 |  |
| Maintenance mode | 1. Enable maintenance mode after entering the URL<br>2. Input credentials | Correct error | P m10 m9 | FIXED: unknown error |
|**OAuth2**||||||
| Correct credentials | Set correct credentials in OAuth2 view | Correctly connected | P m10 m9 |  | 
| Cancel OAuth2 Login | 1. Open OAuth2<br>2. Cancel it in credentials view | Moved to Login view | P m10 m9|  |
| Cancel OAuth2 Authorizaton | 1. Open OAuth2<br>2. Cancel it in authorization view | Moved to Login view | P m10 m9|  |
| Revoke OAuth2 token | 1. Open OAuth2 account<br>2. In web UI, revoke token | Moved to Login view | P m10 m9|  |
|**LDAP**||||||
| Correct credentials | Set correct LDAP credentials | Correctly connected | P m10 m9 |  |  |
|**Redirections**||||||
| 301 | 1. Set an URL with a 301 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected | P m10 m9 | FIXED: Not working |  |
| 302 | 1. Set an URL with a 302 redirection<br>2. Connect | 1. Issue shown<br>2. Correctly connected | P m10 m9 | FIXED: Not working |
|**Edit account**||||||
| URL | 1. Go to account list and edit account<br>2. Edit URL | URL not editable |P m10 m9 |  |
| Username | 1. Go to account list and edit account (basic auth)<br>2. Edit username | Username not editable | P m10 m9 | FIXED: Editable in landscape |
| Password | 1. Edit the password in the UI<br>2. Open account list and edit account (basic auth)<br>3. Input new password | Correctly connected | P m10 m9 |  |
| Edit OAuth2 | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter correct credentials | Correctly connected | P m10 m9 |  |
| Edit OAuth2 - other account | 1. Open OAuth2<br>2. Open account list and edit account<br>3. Enter credentials of a different user | Correct error displayed | P m10 m9 | FIXED: Connected with different account |
|**Multiaccount**||||||
| Two accounts basic | 1. Add two accounts with basic auth<br>2. Switch between the accounts | Correct file lists | P m10 m9 |   | 
| Two accounts OAuth2 same server | 1. Add two accounts OAuth2 from same server<br>2. Switch between the accounts | Correct file lists | P m10 m9|   | 
| Six accounts both auth methods | 1. Add six accounts (three OAuth2, three basic, from different severs as posible)<br>2. Switch between accounts | Correct file lists | P m10 m9 |  
|**Brandable options**||||||
| Default URL | Set a default URL in server\_url field of setup.xml | URL set in correct field | P m10 m9 |  |  |
| Hide URL | Set show\_server\_url\_input to false in setup.xml | URL hidden | P m10 m9 |  |  |
| Show welcome link | Set show\_welcome\_link to false in setup.xml | Welcome link hidden | P m10 m9  |  |  |
| Welcome link | Set a URL in welcome\_link\_url field in setup.xml | Correct link | P m10 m9 |  |  |
| Check arrow color| Set a color in login\_text\_color field in setup.xml | Correct color of the arrow, the same as the login text | P m10 m9 | FIXED: Different color |  |
| Eye color | Set a color in login\_text\_color field in setup.xml | Password eye of the same color of credentials | P m10 m9 |  |  |
| Server status icon | Set a color in login\_connection\_text\_color field in setup.xml | Correct color | P m9 m10 | FIXED: Different color |  |
| Auth status icon | Set a color in login\_credentials\_text\_color field in setup.xml | Correct color | P m9 m10 | FIXED: Different color |  |
|**Extra**||||||
| 2655 | Check issue [2655](https://github.com/owncloud/android/issues/2655) | Problem fixed | P m10 m9 |  |  |
|**Upgrade**||||||
| Basic | 1. Add two accounts with basic auth in previous app version<br>2. Upgrade to the current one | Authentication persists | P m10 m9 |   | 
| OAuth2 | 1. Add two accounts with OAuth2 in previous app version<br>2. Upgrade to the current one | Authentication persists | P m10 m9 |   | 