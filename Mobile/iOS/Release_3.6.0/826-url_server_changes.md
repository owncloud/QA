###  URL server changes in clients 

#### Pr: https://github.com/owncloud/ios/pull/826

Devices: iPhone6Plus v10.1.1

Server: 9, 10.0

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Flag enabled One Account**||||||
| 1 | Upgrade Basic > Basic. New URL | 1. Upgrade app updating URL (without /)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 2 | Upgrade Basic > Basic. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated | P m10 |  |
| 3 | Upgrade Basic > SAML. New URL | 1. Upgrade app updating URL and auth method (SAML)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 4 | Upgrade Basic > SAML. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated | P m10 | Makes no sense if define k_is_sso_active is not changed  |
| 5 | Upgrade SAML > Basic. New URL | 1. Upgrade app updating URL and auth method (Basic)<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 6 | Upgrade SAML > Basic. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated | P m10 | Makes no sense if define k_is_sso_active is not changed |
| 7 | Upgrade SAML > SAML. New URL | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 8 | Upgrade SAML > SAML. Same URL | 1. Upgrade app version without updating URL | Version upgraded. URL is not updated | P m10 |  |
|**Flag enabled Multiaccount**||||||
| 9 | Upgrade Basic > Basic |  1. Upgrade app updating URL with several accounts<br>2. Enter in each account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 1. Check that all accounts are pending to migrate in settings<br>2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 | FIXED: Upgrade all URL |
| 10 | Upgrade Basic > SAML |  1. Upgrade app updating URL with several accounts<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 1. Check that all accounts are pending to migrate in settings<br>2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 11 | Upgrade SAML > Basic |  1. Upgrade app updating URL with several accounts<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 1. Check that all accounts are pending to migrate in settings<br>2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 12 | Upgrade SAML > SAML | 1. Upgrade app updating URL with several accounts<br>2. Enter in the account <br>3. Perform same actions (browse, create file or folder...)<br>4. Wait until expiration  | 1. Check that all accounts are pending to migrate in settings<br>2. Credentials required and message displayed (check both orientations)<br> 3. Actions are correctly performed<br>4. Credentials are required | P m10 | FIXED: Not working |
|**Flag disabled**||||||
| 13 | Upgrade Basic > Basic. New URL. | Upgrade app updating URL | URL not updated | P m10 |  |
| 14 | Upgrade Basic > SAML. New URL. | Upgrade app updating URL | URL not updated | NA | Auth method always with upgrade |
| 15 | Upgrade SAML > Basic. New URL. | Upgrade app updating URL | URL not updated | P m10 |  |
| 16 | Upgrade SAML > SAML. New URL. | Upgrade app updating URL | URL not updated | P m10 |  |
| 17 | Upgrade. Same URL. | Upgrade app updating URL | URL not updated | P m10 |  |
|**Certificate acceptance**||||||
| 18 | Upgrade http > https | 1. Upgrade app updating URL to an non-trusted https server<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials and certificate required<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
|**Redirected servers**||||||
| 19 | Upgrade No redirected > Redirected 301 (with subfolder) | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 20 | Upgrade No redirected > Redirected 302 | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 21 | Upgrade Redirected > Redirected | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
| 22 | Upgrade Redirected > No Redirected | 1. Upgrade app updating URL<br>2. Enter in the account<br>3. Perform same actions (browse, create file or folder...)<br>4. Upload some files  | 2. Credentials required and message displayed (check both orientations)<br>3. Actions are correctly performed<br>4. Check that the uploads view is correctly updated | P m10 |  |
|**Uploads**||||||
| 23 | Upgrade Basic > Basic with pending uploads|  1. Upgrade app updating URL with pending uploads<br>2. Enter in the account | 2. Credentials required and message displayed (check both orientations)<br>3. Check that the pending uploads are uploaded to the new URL. The finished ones appears with the new URL | P t10 | FIXED: Uploads interrupted  |
| 24 | Upgrade Basic > Redirected with pending uploads|  1. Upgrade app updating URL with pending uploads<br>2. Enter in the account | 2. Credentials required and message displayed (check both orientations)<br>3. Check that the pending uploads are uploaded to the new URL. The finished ones appears with the new URL  | P m9 |  |
| 25 | Upgrade Redirected > SAML with pending uploads|  1. Upgrade app updating URL with pending uploads<br>2. Enter in the account | 2. Credentials required and message displayed (check both orientations)<br>3. Check that the pending uploads are uploaded to the new URL. The finished ones appears with the new URL  | P m9 |  |
| 26 | Instant without background| 1. Enable instant uploads without backgound<br>2. After 3 minutes, take some pics<br>3. Upgrade the app with new URL. | Uploads are performed to the new account | F m10 | Uploaded to old URL |
| 26b | Instant with background| 1. Enable instant uploads with backgound<br>2. After 3 minutes, take some pics<br>3. Upgrade the app with new URL. | Uploads are performed to the new account | F m10 | Uploaded to old URL |
| 27 |  Share| 1. Share with oC from an external app<br>2. Upgrade the app with new URL. | Uploads are performed to the new account | P m10 |  |
|**Errors in login view**||||||
| 28 | SAML |  Open a SAML session and wait until it expires| Login view is displayed with an appropiate message about the expiration  | P m10 |  | 
| 29 | Incorrect pasword |  Enter wrong credentials | Login view is displayed with an appropiate message about the situation  | P m10 |  |