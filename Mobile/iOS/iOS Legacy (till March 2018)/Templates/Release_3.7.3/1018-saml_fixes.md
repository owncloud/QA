#### SAML fixes

#### Pr: https://github.com/owncloud/ios/pull/1018


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Expiration**||||||
| 1 | Correct expiration | 1. Set 5 minutes of expiration<br>2. Open a session<br>3. 3 minutes later, open a new session | Minute 5: first session expires, second one is alive<br>Minute 8: first session alive, second one expires<br> Minute 12: both expires<br>Minute 14: Both alive |  |  |
|**Switching account**||||||
| 2 | Switch accounts same server | 1. Attach two accounts of different servers several times| Both accounts show correct content |  |  |
| 3 | Switch accounts different server | 1. Attach two accounts of different servers several times| Both accounts show correct content |  |  |