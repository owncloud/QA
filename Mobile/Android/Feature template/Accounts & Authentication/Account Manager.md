### Account Manager

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

 
| Test Case | Steps | Expected | Result | Related Comment / Defect  | 
| :-------- | :---- | :------- | :----: | :------------------------ | 
|**Access**||||||
| List of files | 1. Log in in a account<br>2. On the top right corner, click on the account avatar | Account Manager opened |  |  |
| Drawer | 1. Log in a account<br>2. Open drawer by clicking the hamburger button<br>3. Click on the arrow inside the drawer to show the submenu<br>4. Click on `Manage accounts`| Account Manager opened |  |  |
|**View**||||||
| View | Open the Account Manager view (check howto with "Access" tests) | Displayed: <br>- Correct header (`Manage accounts`)<br>- Left arrow to browse back<br>- At least, one account including avatar, display name, username@URL, sync button ,key button and trashbin button<br>- `Add account` option<br> Same in landscape orientation |  |  |
|**Add account**||||||
| Add new account | 1. Click on `Add account` option | Login View displayed with editable Server address field |  |  |
|**Enter account**||||||
| Enter | 1. Add account to the device<br>2. Open Account Manager<br>3. Click on the account | List of files of the account displayed |  |  |
|**Edit account**||||||
| URL & username (basic auth) | 1. Click on key button of an attached basic auth account<br>2. Try to edit username and URL | 1. Login View displayed with URL and username visible<br>2. Not posible, URL and username are not editable in edit mode for basic auth accounts |  |  |
| Password (basic auth) | 1. Click on key button of an attached basic auth account<br>2. In server, modify the password of the account<br>3. Enter the old password in Login View<br>4. Enter the new password in Login View | 3. Error: Wrong username or password"<br>4. Connected and Login View displayed |  |  |
| OAuth2/OIDC | 1. Click on key button of an attached OAuth2/OIDC account<br>2. In server, modify the password of the account<br>3. Enter the old password in Login View<br>4. Enter the new password in Login View  | 1. Moved forward to the browser<br>3. Error in browser<br>4. Connected and Login View displayed |  |  |
|**Sync account**||||||
| Sync account content | 1. Add new account to the app<br>2. Without browsing, open Account Manager<br>3. Click on sync (rounded arrow button)<br>4. After some seconds, remove device connection<br>5. Click on account in the list to open it<br>6. Browse through all available folders | All folders are discovered and all content is listed  |  |  |
| Sync correct account | 1. Add two new accounts to the app<br>2. Without browsing, open Account Manager<br>3. Click on sync (rounded arrow button) of the account 1<br>4. After some seconds, remove device connection<br>5. Click on account 1 in the list to open it<br>6. Open Account Manager and click on account 2 in the list to open it | 5. Able to browse through all folders and content listed<br>6. Not able to browse and content not listed because account 2 was not synced |  |  |
|**Delete account**||||||
| Delete one account from app | 1. Add several accounts to the app<br>2.Open Account Manager<br>3. Click on trashbin icon to delete one of them<br>4. Confirm deletion | Deleted account is not listed in Account Manager<br>Account not listed in device's Settings > Accounts   |  |  |
| Delete one account from device | 1. Add several accounts to the app<br>2.Open device's Settings > Accounts<br>3. Remove account from there<br>4. Open Account manager in the app | Deleted account is not listed in Account Manager<br>Account not listed in device's Settings > Accounts   |  |  |
| Delete last account from app | 1. Add one account to the app<br>2.Open Account Manager<br>3. Click on trashbin icon to delete account<br>4. Confirm deletion | Moved to the login view, no more accounts to browse   |  |  |
| Delete last account from device | 1. Add one account to the app<br>2.Open device's Settings > Accounts<br>3. Remove account from there<br>4. Open Account manager in the app | Moved to the login view, no more accounts to browse  |  |  |
|**Multiaccount**||||||
| Bubble | 1. Add two accounts<br>2. Open the first account<br>3. Open Account manager<br>4. Open second account<br>5. Open Account manager | 3. First account selected with the tick bubble over the avatar<br>5. Second account selected with the tick bubble over the avatar |   |   | 
| List of files | 1. Add three accounts of different authentication methods (basic, OAuth2, OIDC)<br>2. Open the first account<br>3. Open Account manager<br>4. Open second account<br>5. Open Account manager<br>6. Open third account | 2. List of files of first account displayed<br>4. List of files of second account displayed<br>6. List of files of third account displayed |   |   | 