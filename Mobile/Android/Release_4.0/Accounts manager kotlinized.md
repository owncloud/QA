### Accounts manager kotlinized


#### PR: 

**Devices**: Samsung A51, Android 12 <br>
**Server**: 10.11, oCIS 2.0


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**View**||||
| One account | Open accounts manager with only one account | Correct view in portrait and landscape with all the components: avatar, username, account, sync, relogin, trashbin and add account option  | P m12 |  |
| Several accounts | Open accounts manager with three accounts | Correct view in portrait and landscape with all the components: avatar, username, account, sync, relogin, trashbin and add account option  | P m12 |  |
|**Components**||||
| Avatar | 1. Account with no avatar<br>2. Account with avatar<br>3. Add avatar to account with no avatar | 1. Letter shown instead<br>2. Avatar correct<br>3. New avatar shown | P m12 |  |
| Username / account | 1. Set Displayname<br>2. Change display name | 1. Display name shown <br>2. New displaye name shown | P m12 |
| Sync | 1. Add account, without browsing (just root folder)<br>2. Sync the account<br>3. Remove device connection<br>4. Browse through the account | All folders discovered | P m12 |  |
| Re-login | 1. Add account<br>2. In web, change the password<br>3. In app click on key icon to relogin | Login view opened and relogin correct | P m12 |  |
| Trashbin | 1. Add three accounts<br>2. Remove then one by one till no accounts in device | Accounts removed after confirmation dialog. After the last removal, redirected to login view| P m12 |  |
| Add account | 1. Open manage accounts view<br>2. Add account | Redirected to login view to add new account | P m12 |  |