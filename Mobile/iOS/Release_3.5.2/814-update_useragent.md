###  Update user agent 

#### Pr: https://github.com/owncloud/ios/pull/814 

Devices: iPhone6 v9.3.5, iPad v10.1.1

Server: from 8.1 to 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Server v9.1**||||||
| 1 | User agent by default |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1" | Login correct | P m9 t10|  |
| 2 | User agent with oB suffix |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10 |  |
| 3 | User agent with oB suffix in SAML |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10|  |
|**Server v9.0**||||||
| 4 | User agent by default |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 | Login correct" | P m9 t10 |  |
| 5 | User agent with oB suffix |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10 |  |
| 6 | User agent with oB suffix in SAML |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10|  |
|**Server v8.2**||||||
| 7 | User agent by default |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1" | Login correct | P m9 t10 |  |
| 8 | User agent with oB suffix |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10 |  |
| 9 | User agent with oB suffix in SAML |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10|  |
|**Server v8.1**||||||
| 10 | User agent by default |  "Login with user agent: Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1" | Login correct | P m9 t10 |  |
| 11 | User agent with oB suffix |  "Login with user agent: Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10 |  |
| 12 | User agent with oB suffix in SAML |  Login with user agent: "Mozilla/5.0 (iOS) ownCloud-iOS/3.5.1 userAgentA" | Login correct | P m9 t10|  |
|**Upgrade**||||||
| 13 | Upgrade from older to new | 1. Install an app with latest user agent<br>2. Upgrade to a version with new user agent | Login correct | P m9 t10 |  |