###  URL server changes in clients 

#### Pr: https://github.com/owncloud/ios/pull/826


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Flag enabled One Account**||||||
| 1 | Upgrade Basic http -> Basic http. New URL. | 1. Upgrade app updating URL (pending uploads), version and build<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 1 | Upgrade Basic http -> Basic http. Same URL. | 1. Upgrade app updating URL (pending uploads), version and build<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 5 | Upgrade Basic http -> Basic https | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 9 | Upgrade Basic https -> Basic http | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 13 | Upgrade Basic https -> Basic https | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
|**Flag enabled Multiaccount**||||||
| 17 | Upgrade Basic -> Basic |  1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 18 | Upgrade SAML -> SAML | 1. Upgrade app updating URL<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 2. Credentials required<br> 3. Actions are correctly performed<br>4. Credentials are required |  |
|**Flag disabled**||||||
| 19 | Upgrade Basic -> Basic. New URL. | Upgrade app with URL change | No upgrade |  |  |
| 20 | Upgrade SAML -> SAML. New URL. | Upgrade app with URL change | No upgrade |  |  |
|**Redirected servers**||||||
| 21 | Upgrade No redirected -> Redirected 301 (with subfolder) | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 22 | Upgrade No redirected -> Redirected 302 | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 23 | Upgrade Redirected -> Redirected | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 24 | Upgrade Redirected -> No Redirected | 1. Upgrade app updating URL (pending uploads)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |