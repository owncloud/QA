###  Fix: App freezes when SAML session expires and av. offline file 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices: iPhone 6Plus v10, iPadAir v10

Server: 9.1.4


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| 1 | File in root | 1. Set files as av. offline in root folder<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10|  |
| 2 | File in not root | 1. Set files as av. offline in no-root folder<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10|  |
| 3 | File in root and no-root| 1. Set files as av. offline in root and no-root folders<br>2. Session expires<br>3. Input credentials |  New session starts correctly  |P m10 t10 |  |
| 4 | Folder in root | 1. Set folders as av. offline in root folder<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10|  |
| 5 | Folder in not root | 1. Set folders as av. offline in no-root folder<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10|  |
| 6 | Folder in root and no-root| 1. Set folders as av. offline in root and no-root folders<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10 |  |
| 7 | Files and folders | 1. Set files and folders as av. offline in root and no-root folders<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10|  |
| 8 | No av. offline | 1. No av. offline content<br>2. Session expires<br>3. Input credentials |  New session starts correctly  | P m10 t10 |  |

