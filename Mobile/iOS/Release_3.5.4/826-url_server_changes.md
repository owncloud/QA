###  URL server changes in clients 

#### Pr: https://github.com/owncloud/ios/pull/826

Devices: iPhone 6S v9.3

Server: 8.1, 9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Flag enabled One Account**||||||
| 1 | Upgrade Basic http -> Basic http. Version&build changed | 1. Upgrade app updating URL (pending uploads), version and build<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | F m9 | From older version fails |
| 2 | Upgrade Basic http -> Basic http. Version changed, build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 3 | Upgrade Basic http -> Basic http. Version not changed, build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 4 | Upgrade Basic http -> Basic http. Version& build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | URL not updated | P m9 |  |
| 5 | Upgrade Basic http -> Basic https. Version& build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 6 | Upgrade Basic http -> Basic https. Version changed, build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |P m9  |  |
| 7 | Upgrade Basic http -> Basic https. Version not changed, build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 8 | Upgrade Basic http -> Basic https. Version& build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | URL not updated | P m9 |  |
| 9 | Upgrade Basic https -> Basic http. Version& build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 10 | Upgrade Basic https -> Basic http. Version changed, build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 11 | Upgrade Basic https -> Basic http. Version not changed, build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 12 | Upgrade Basic https -> Basic http. Version& build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | URL not updated | P m9 |  |
| 13 | Upgrade Basic https -> Basic https. Version& build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 14 | Upgrade Basic https -> Basic https. Version changed, build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 15 | Upgrade Basic https -> Basic https. Version not changed, build changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m9 |  |
| 16 | Upgrade Basic https -> Basic https. Version& build not changed | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | URL not updated | P m9 |  |
| 17| Upgrade SAML -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required |  |
|**Flag enabled Multiaccount**||||||
| 18 | Upgrade Basic -> Basic |  1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 19 | Upgrade SAML -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required |  |
|**Flag disabled**||||||
| 20 | Upgrade Basic -> Basic, Version or build changed| Upgrade app with no URL change | Upgrade correct | F m9 | Second upgrade does not work well |
| 20 | Upgrade Basic -> Basic, Version and build not changed | Upgrade app with no URL change | Upgrade correct | P m9 |  |
| 21 | Upgrade SAML -> SAML | Upgrade app with no URL change | Upgrade correct |  |  |
