###  URL server changes in clients 

#### Pr: https://github.com/owncloud/android/pull/xxxx


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Flag enabled One Account**||||||
| 1 | Upgrade Basic > Basic. New URL | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 2 | Upgrade Basic > Basic. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated |  |  |
| 3 | Upgrade Basic > SAML. New URL | 1. Upgrade app updating URL and auth method (SAML)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 4 | Upgrade Basic > SAML. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated |  |  |
| 5 | Upgrade SAML > Basic. New URL | 1. Upgrade app updating URL and auth method (Basic)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 6 | Upgrade SAML > Basic. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated |  |  |
| 7 | Upgrade SAML > SAML. New URL | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 8 | Upgrade SAML > SAML. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated |  |  |
|**Flag enabled Multiaccount**||||||
| 9 | Upgrade Basic > Basic |  1. Upgrade app updating URL with several accounts<br>2. Enter in each account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 1. Check that all accounts are updated<br>2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 10 | Upgrade Basic > SAML |  1. Upgrade app updating URL with several accounts<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 1. Check that all accounts are updated<br>2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 11 | Upgrade SAML > Basic |  1. Upgrade app updating URL with several accounts<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 1. Check that all accounts are updated<br>2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 12 | Upgrade SAML > SAML | 1. Upgrade app updating URL with several accounts<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 1. Check that all accounts are updated<br>2. Credentials required and message displayed (check both orientations)<br> 3. Actions are correctly performed<br>4. Credentials are required |  |
|**Flag disabled**||||||
| 13 | Upgrade Basic > Basic. New URL. | Upgrade app updating URL | URL not updated |  |  |
| 14 | Upgrade Basic > SAML. New URL. | Upgrade app updating URL | URL not updated |  |  |
| 15 | Upgrade SAML > Basic. New URL. | Upgrade app updating URL | URL not updated |  |  |
| 16 | Upgrade SAML > SAML. New URL. | Upgrade app updating URL | URL not updated |  |  |
| 17 | Upgrade. Same URL. | Upgrade app updating URL | URL not updated |  |  |
|**Certificate acceptance**||||||
| 18 | Upgrade http > https | 1. Upgrade app updating URL to an non-trusted https server<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials and certificate required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
|**Redirected servers**||||||
| 19 | Upgrade No redirected > Redirected 301 (with subfolder) | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 20 | Upgrade No redirected > Redirected 302 | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 21 | Upgrade Redirected > Redirected | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
| 22 | Upgrade Redirected > No Redirected | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated |  |  |
|**Uploads**||||||
| 23 | Upgrade Basic > Basic with pending uploads|  1. Upgrade app updating URL with pending uploads<br>2. Enter in the account | 2. Credentials required and message displayed (check both orientations)<br>3. Check that the pending uploads are uploaded to the new URL. The finished ones appears with the new URL |  |  |
| 24 | Upgrade Basic > Redirected with pending uploads|  1. Upgrade app updating URL with pending uploads<br>2. Enter in the account | 2. Credentials required and message displayed (check both orientations)<br>3. Check that the pending uploads are uploaded to the new URL. The finished ones appears with the new URL  |  |  |
| 25 | Upgrade Redirected > SAML with pending uploads|  1. Upgrade app updating URL with pending uploads<br>2. Enter in the account | 2. Credentials required and message displayed (check both orientations)<br>3. Check that the pending uploads are uploaded to the new URL. The finished ones appears with the new URL  |  |  |
| 26 | Instant without background| 1. Enable instant uploads without backgound<br>2. After 3 minutes, take some pics<br>3. Upgrade the app with new URL. | Uploads are performed to the new account |  |  |
| 27 | Share | 1. Share with oC from an external app<br>2. Upgrade the app with new URL. | Uploads are performed to the new account |  |  |