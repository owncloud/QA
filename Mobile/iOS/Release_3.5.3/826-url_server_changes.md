###  URL server changes in clients 

#### Pr: https://github.com/owncloud/ios/pull/826

Devices: iPhone 6S v9.3

Server: 8.1, 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Flag enabled One Account**||||||
| 1 | Upgrade Basic -> Basic |  1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | F m9 | SOLVED: not upgrade. File list not upgraded |
| 2 | Upgrade Basic -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required| F m9 | Not login |
| 3 | Upgrade SAML -> Basic | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)  | 2. Credentials required<br> 3. Actions are correctly performed | F m9 | Username from idP
| 4 | Upgrade SAML -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required | P m9 | User must be the same in both servers |
|**Flag enabled Multiaccount**||||||
| 5 | Upgrade Basic -> Basic |  1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 6 | Upgrade Basic -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required|  |
| 7 | Upgrade SAML -> Basic | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)  | 2. Credentials required<br> 3. Actions are correctly performed |  |
| 8 | Upgrade SAML -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required |  |
|**Flag disabled**||||||
| 9 | Upgrade Basic -> Basic | Upgrade app with no URL change | Upgrade correct | P m9 |  |
| 10 | Upgrade Basic -> SAML | Upgrade app with no URL change | Upgrade correct | P m9 |  |
| 11 | Upgrade SAML -> Basic | Upgrade app with no URL change | Upgrade correct | P m9 |  |
| 12 | Upgrade SAML -> SAML | Upgrade app with no URL change | Upgrade correct | P m9 |  |
