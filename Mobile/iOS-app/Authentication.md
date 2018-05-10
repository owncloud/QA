#### Authentication 

#### PRs: <br>
https://github.com/owncloud/ios-app/pull/27 <br>
https://github.com/owncloud/ios-app/pull/38

Device/s: iPhoneX 11.3<br>
Server: 10.0.7 / 10.0.8

Number of tests: 44 <br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----- | :------------------------- | :-------: |
|**URL**||||||
| Empty URL | Let empty URL | Correct issue indicating error | P m11 | ||
| Incorrect URL | Set Incorrect URL | Correct issue indicating error | P m11 | FIXED: Improvement in error handling ||
| No prefix SSL I | Input non-secure-SSL URL with no protocol | Show certificate | P m11 | Tell user to check certif |  |
| No prefix SSL II | Input secure-SSL URL with no protocol | Show certificate - passed validation| P m11 |||
| No prefix http | Input http URL with no protocol | SSL error | P m11 |||
| Prefix http | Input http URL with protocol | Moved forward | P m11 |||
|**Review Connection**||||||
| Open certificate | Open certificate to check details | Certificate shown | P m11 |  |  |
| Approve certificate | Open certificate to check details and approve it | Moved forward to credentials basic/oauth | P m11 |  |  |
| Cancel certificate | Open certificate to check details and cancel it | Return to Add server | P m11 | FIXED: Switching the URL shows incorrect URL |  |
|**Basic auth**||||||
| Empty credentials |  Try to connect with empty credentials | Error | P m11 | Error message to be improved |  |
| Empty Username |  Try to connect with empty username | Error | P m11 | Error message to be improved |  |
| Empty password |  Try to connect with empty password | Error | P m11 | Error message to be improved |  |
| Special characters |  Try to connect with username that contains special characters | Works | P m11 |  |  |
| Username with blanks |  Try to connect with username that contains blanks | Works | P m11 | FIXED: File list empty |  |
|**OAuth2**||||||
| Correct credentials |  Set correct credentials in OAuth2 view |  Bookmark created | P m11 |  |  |
|**LDAP**||||||
| Correct credentials |  Set correct LDAP credentials |  Bookmark created | P m11 |  |  |
|**Name**||||||
| Empty name |  Set correct credentials but let name empty | Bookmark Name = URL | P m11 |  |  |
| Non-Empty name |  Set correct credentials and name | Bookmark name correct in list of servers | P m11 |  |  |
|**Edit account**||||||
| Edit name |  Edit the name for a different one | Name correctly changed | P m11 |  |  |
| Edit name II |  Edit the name for an empty | Bookmark Name = URL | P m11 |  |  |
| Username |  Try to edit username |Username not editable | F m11 | Editable|  |
| Password |  1. Edit the password in the UI<br>2. Open edit mode<br>3. Input new password | Correctly connected | P m11 | Dialog shown only when open a bookmark |  |
| Password incorrect |  1. Edit the password in the UI<br>2. Open edit mode<br>3. Input new password | Correctly connected | P m11 | FIXED: No feedback in file list |  |
| Edit URL basic: http -> http | Edit the URL of http server changing for other http<br>| Correctly connected | P m11 | FIXED: URL not edited |  |
| Edit URL basic: http -> https | Edit the URL of http server changing for other https<br>| Correctly connected | P m11 | FIXED: URL not edited |  |
| Edit URL basic: https -> http | Edit the URL of https server changing for other http<br>| Correctly connected | P m11 | FIXED: URL not edited |  |
| Edit URL basic: https -> https | Edit the URL of https server changing for other https<br>| Correctly connected | P m11 | FIXED: URL not edited |  |
| Edit URL basic -> OAuth2 | Edit the URL of basic auth server for an OAuth2 one<br>| Correctly connected | P m11 |  |  |
| Edit URL OAuth2 -> basic | Edit the URL of oauth2 server for an basic auth one<br>| Correctly connected | P m11 |  |  |
| Edit incorrect URL | Edit the URL for an incorrect one| Issue displayed | P m11 | FIXED: URL not edited |  |
| Delete authentication data | In edit mode, tap on "Delete authentication data" | Works | P m11 | FIXED: File list empty |  |
| Change password | Change the password in web UI<br>| Issue displayed | P m11 | FIXED: URL not edited |  |
|**Delete account**||||||
| Delete an basic auth account |  In server list, remove an basic auth account | correctly deleted from list | P m11 | FIXED: Deleted before confirming |  |
| Delete an oauth account |  In server list, remove an oauth account | correctly deleted from list | P m11 | FIXED: Deleted before confirming |  |
|**Multiaccount**||||||
| Two accounts basic | 1. Add two accounts basic auth<br>2. Switch between accounts | Correct file list | P m11 |  |  |
| Two accounts OAuth2 | 1. Add two accounts Oauth2<br>2. Switch between accounts | Correct file list | P m11 | Not able to add a second one: Server side |  |
| Ten accounts both auth methods | 1. Add ten accounts<br>2. Switch between accounts | Correct file list | P m11 |  
|**Redirections**||||||
| 301 | 1. Set an URL with a 301 redirection<br>2. Approve it | 1. Issue shown<br>2. Bookmark added | P m11 |  |  |
| 301 Cancel | 1. Set an URL with a 301 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection| P m11 |  |  |
| 302 | 1. Set an URL with a 302 redirection<br>2. Approve it | 1. Issue shown<br>2. Bookmark added | P m11 |  |  |
| 302 Cancel | 1. Set an URL with a 302 redirection<br>2. Cancel it | 1. Issue shown<br>2. No Connection | P m11 |  |  |
|**Default Settings**||||||
| Default URL | Set a default URL | URL in correct field | P m11 |  |  |
| URL Editable | Set the URL as editable | URL is able to be edited | P m11 |  
| URL Non Editable | Set the URL as no editable | URL can not be edited| P m11 |