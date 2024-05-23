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
| View | Open the Account Manager view (check howto with "Access" tests) | Displayed: <br>- Correct header (`Manage accounts`)<br>- Left arrow to browse back<br>- At least, one account including avatar, display name, username@URL, broom button and trashbin button<br>- `Add account` option<br> Same in landscape orientation |  |  |
|**Add account**||||||
| Add new account | 1. Click on `Add account` option | Login View displayed with editable Server address field |  |  |
|**Enter account**||||||
| Enter | 1. Add account to the device<br>2. Open Account Manager<br>3. Click on the account | List of files of the account displayed |  |  |
|**Sync account**||||||
| Sync account oC10 content | 1. Add new oC10 account to the app<br>2. Don't browse through, stay in root folder<br>3. After some minutes, remove device connection<br>4. Browse through all available folders | All folders are discovered and all content is listed  |  |  |
| Sync account oCIS content | 1. Add new oCIS account to the app, that include spaces with content<br>2. Don't browse through, stay in root folder<br>3. After some minutes, remove device connection<br>4. Browse through all available folders and spaces | All folders are discovered and all content is listed in all spaces  |  |  |
|**Clean up account**||||||
| Clean up oC10 | 1. Add new oC10 account to the app<br>2. Download some files in different folders<br>3. Set as av. offline some files and folders<br>4. In `Manage Accounts` view, click on broom icon of the account | All downloaded files are removed from local storage (check in Android Studio with Device explorer)<br>Available offline files keep in the local storage (check in Android Studio with Device explorer) |  |  |
| Clean up oCIS | 1. Add new oCIS account to the app<br>2. Download some files in different folders and spaces<br>3. Set as av. offline some files and folders in different spaces<br>4. In `Manage Accounts` view, click on broom icon of the account | All downloaded files are removed from local storage (check in Android Studio with Device explorer)<br>Available offline files keep in the local storage (check in Android Studio with Device explorer) |  |  |
| tmp not cleaned up | 1. Add new account to the app<br>2. Put server down<br>3. Upload manually some files<br> 4. In `Manage Accounts` view, click on broom icon of the account<br>5. In uploads view, click on `Retry` | 3. Uploads fail, check in uploads view<br>5. All uploads success |  |  |
|**Delete account**||||||
| Delete one account from app | 1. Add several accounts to the app<br>2.Open Account Manager<br>3. Click on trashbin icon to delete one of them<br>4. Confirm deletion | Deleted account is not listed in Account Manager<br>Account not listed in device's Settings > Accounts   |  |  |
| Delete one account from device | 1. Add several accounts to the app<br>2.Open device's Settings > Accounts<br>3. Remove account from there<br>4. Open Account manager in the app | Deleted account is not listed in Account Manager<br>Account not listed in device's Settings > Accounts   |  |  |
| Delete last account from app | 1. Add one account to the app<br>2.Open Account Manager<br>3. Click on trashbin icon to delete account<br>4. Confirm deletion | Moved to the login view, no more accounts to browse   |  |  |
| Delete last account from device | 1. Add one account to the app<br>2.Open device's Settings > Accounts<br>3. Remove account from there<br>4. Open Account manager in the app | Moved to the login view, no more accounts to browse  |  |  |
|**Multiaccount**||||||
| Bubble | 1. Add two accounts<br>2. Open the first account<br>3. Open Account manager<br>4. Open second account<br>5. Open Account manager | 3. First account selected with the tick bubble over the avatar<br>5. Second account selected with the tick bubble over the avatar |   |   | 
| List of files | 1. Add three accounts of different authentication methods (basic, OAuth2, OIDC)<br>2. Open the first account<br>3. Open Account manager<br>4. Open second account<br>5. Open Account manager<br>6. Open third account | 2. List of files of first account displayed<br>4. List of files of second account displayed<br>6. List of files of third account displayed |   |   | 