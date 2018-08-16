#### Replace network library

#### Pr: https://github.com/owncloud/android/pull/2236


---

 
| Test  | Test Case | Expected Result | Result | Related Comment |
| :----: | :------- | :-------------- | :----- | :---------------: 
|**URL**||||||
| 1 | http url |  Correct behaviour |  |  |
| 1 | https trusted url | Correct behaviour |  |  |
| 1 | https non-trusted url | Show certificate to be approved |  |  |
| 1 | https url with http prefix | Correct error |  |  |
| 1 | 301 Redirection | Correct behaviour |  |  |
| 1 | 302 Redirection | Correct behaviour |  |  |
| 1 | SAML url | Correct behaviour |  |  |
| 1 | No internet connection | Correct error |  |  |
| 1 | No server connection | Correct error |  |  |
| 1 | Maintenance mode | Correct error |  |  |
