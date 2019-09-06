###  Remove SAML

#### Pr: https://github.com/owncloud/android/pull/2647


---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**Setup**||||||
| Remove from setup.xml | Open setup.xml file | Option to enable SAML is not there anymore |  |  |  |
|**Regression**||||||
| Basic auth | Type a basic auth URL<br>Perform basic actions | Correct Login<br>Actions correctly performed|  |  |  |
| OAuth2 login | Login in a OAuth2 account | Correct login |  |  |  |
| OAuth2 renewal | Enforce a token expiration| Token is correctly renewed |  |  |  |
| OAuth2 token revoked | In a OAuth2 session, revoke the token in webUI | Session finished |  |  |  |
| Redirected server 301 | Login in a 301 redirected server<br>Perform some actions | Session started<br>Actions correctly performed |  |  |  |
| Redirected server 302 | Login in a 302 redirected server<br>Perform some actions | Session started<br>Actions correctly performed |  |  |  |
| App password | Start a session with a App password | Session started |  |  |  |
| Guest | Start a session with a Guest user | Session started |  |  |  |