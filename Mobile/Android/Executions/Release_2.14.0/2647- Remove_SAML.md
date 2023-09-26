###  Remove SAML

#### Pr: https://github.com/owncloud/android/pull/2647

Devices: Nexus 5X v8, Pixel2 v10<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**Setup**||||||
| Remove from setup.xml | Open setup.xml file | Option to enable SAML is not there anymore | Passed |  |  |
|**Regression**||||||
| Basic auth | Type a basic auth URL<br>Perform basic actions | Correct Login<br>Actions correctly performed| P m8 m10 |  |  |
| OAuth2 login | Login in a OAuth2 account | Correct login | P m8 |  |  |
| OAuth2 renewal | Enforce a token expiration| Token is correctly renewed | P m8 |  |  |
| OAuth2 token revoked | In a OAuth2 session, revoke the token in webUI | Session finished | F m8 m10 | Check regression -> new issue android#2655
| Redirected server 301 | Login in a 301 redirected server<br>Perform some actions | Session started<br>Actions correctly performed | P m8 m10 |  |  |
| Redirected server 302 | Login in a 302 redirected server<br>Perform some actions | Session started<br>Actions correctly performed | P m8 m10 |  |  |
| App password | Start a session with a App password | Session started | P m8 m10 |  |  |
| Guest | Start a session with a Guest user | Session started | P m8 m10 |  |  |