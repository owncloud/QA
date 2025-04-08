###  Sharing 

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :----: | :------ |
| **Share with users (local)**|   |  |
| Shared with one user| 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant any permission level| Check that sharee has access to the file. Check that the item includes the share icon. Check in web |  |  |
| Shared with one group| 1. Select `Sharing` over any item in the list<br>2. Invite an existing group<br>3. Grant any permission level| Check that every member of the group has access to the item. Check that the file includes the share icon. Check in web |  |  |
| Shared with several | 1. Select `Sharing` over any item in the list<br>2. Invite some users and groups granting them any permission level | Check that every user has access to the item <br>2. Check that the file includes the share icon. Check in web |  |  |
| Shared with an already shared user | 1. Select `Sharing` over any item in the list<br>2. Invite a user<br>3. Grant any permission level<br>4. Invite again the same user| `Already shared with the user` |  | |
| Share with yourself | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the item | |  |
| Share with no permission | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Don't choose any permission level| `Invite` button disabled |   |  |
| Share with `Can View` | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant `Can View` | Check that sharee has access to the item. Check in web the permission level is `Can View` |   |  |
| Share folder with `Can Upload` | 1. Select `Sharing` over a folder in the list<br>2. Invite another user<br>3. Grant `Can Upload` | Check that sharee has access to the folder. Check in web the permission level is `Can Upload` |   |  |
| Share file with `Can Upload` | 1. Select `Sharing` over a file in the list<br>2. Invite another user<br>|  `Can Upload` not available as permission|   |  |
| Share with `Can Edit`<br>`without versions` | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant `Can Edit without versions` | Check that sharee has access to the file. Check in web the permission level is `Can Edit without versions` |   |  |
| Share with expiration default | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant any permission<br>4. `Add` expiration date by default | Check that sharee has access to the file. Check in web the expiration date is one week later than today (default in iOS)  |   |  |
| Share with expiration custom | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant any permission<br>4. `Add` expiration date<br>5. Click on the default date and choose a different one | Check that sharee has access to the file. Check in web the expiration date is the chosen one in step 5.  |   |  |s<br>Check, at least one user have still access to the file |   |  |
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |   | only oC10  |
| **Share with users (remote)**|   |  |
| Share with `Can View` | In web, share any item with `Can View` permission | Check in the app that the permission level is `Can View` |    |  |
| Share folder with `Can Upload` | In web, share a folder with `Can Upload` permission | Check in the app that the permission level is `Can Upload` |    |  |
| Share with `Can Edit`<br>`without permissions` | In web, share any item with `Can Edit`<br>`without permissions` permission | Check in the app that the permission level is `Can Edit`<br>`without permissions` |    |  |
| Share with expiration default | In web, share any item with any permission level and a expiration date | Check in the app that the expiration date is the chosen one |  |  |
|**Edit share (local)**||||||
| Change permissons | 1. Open an existing share with `Can View` permission<br>2. Change permission to `Can edit`<br>`without versions` | Check in web the permission level is `Can Edit`<br>`without versions`<br>  |  |  |
| Change permissons folder | 1. Open an existing shared folder with `Can View` permission<br>2. Change permission to `Can upload` | Check in web the permission level is `Can upload`<br>  |  |  |
| Add expiration date | 1. Open an existing share without expiration date<br>2. Add an expiration date to the share |  Check in web the expiration date is the new chosen one  |  |  |
| Change expiration date | 1. Open an existing share with expiration date<br>2. Change expiration date to a different one |  Check in web the expiration date is the new chosen one  |  |  |
| Remove expiration date | 1. Open an existing share with expiration date<br>2. Remove expiration date |  Check in web the item does not have expiration date |  |  |
|**Edit share (remote)**||||||
| Change permissons | 1. In web, open an existing share with `Can View` permission<br>2. Change permission to `Can edit`<br>`without versions` | Check in app the permission level is `Can Edit`<br>`without versions`<br>  |  |  |
| Change permissons folder | 1. In web, open an existing shared folder with `Can View` permission<br>2. Change permission to `Can upload` | Check in app the permission level is `Can upload`<br>  |  |  |
| Add expiration date | 1. In web, open an existing share without expiration date<br>2. Add an expiration date to the share |  Check in app the expiration date is the new chosen one  |  |  |
| Change expiration date | 1. In web, open an existing share with expiration date<br>2. Change expiration date to a different one |  Check in app the expiration date is the new chosen one  |  |  |
| Remove expiration date | 1. In web, open an existing share with expiration date<br>2. Remove expiration date |  Check in app the item does not have expiration date |  |  |
|**Delete share(local)**||||||
| Delete with unshare | 1. Open an existing share<br>2. Remove the share with the `Unshare` option | Sharee is not in the list anymore. Check in web  |  |  |
| Delete with swipe | 1. Open the list of sharees of any share<br>2. Remove any sharee by swiping over its name| Sharee is not in the list anymore. Check in web  |  |  |
|**Delete share(remote)**||||||
| Delete | 1. In web, open an existing share<br>2. Remove the share| In app, sharee is not in the list anymore.|  |  |
| **Public link(local)** |   |  |
| Share by link with name | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add a name to the link<br>3. Select any permission level<br>4. `Create`  | Link is created with the given name. Check on web | |  |
| Share by link `Can View` | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add `Can View` as permission level<br>3. `Create` | Link is created with `Can View`permission. Check on web | |  |
| Share by link `Can Edit` | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add `Can Edit` as permission level<br>3. `Create` | Link is created with `Can Edit` permission. Check on web | |  |
| Share folder by link `Secret File Drop` | 1. Select `Sharing` over a folder in the list and `Create Link`<br>2. Add `Secret File Dropt` as permission level<br>3. `Create` | Link is created with `Secret File Drop` permission. Check on web |  |  |
| Share by link without permission | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Select no permission level | `Create` option is disabled | |  |
| Share by link with password auto | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add an automatic password by clicking `Generate`<br>3. `Create` | Link is created with the given password. Check on web |  |  |
| Share by link with password custom | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add a password by clicking `Set`<br>3. Add a password that fulfill requirements<br>4. `Create` | Link is created with the given password. Check on web |  |  |
| Share by link with expiration date default | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add default expiration date by clicking `Add`<br>3. `Create` | Link is created with the given expiration date. Check on web |  |  |
| Share by link with expiration date custom | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add default expiration date by clicking `Add`<br>3. Click on the default expiration date and choose another one<br>4. `Create` | Link is created with the given expiration date. Check on web |  |  |
| **Public link(remote)** |   |  |
| Share by link with name | In web, create a link with name  | In app, link is listed with the given name |  |  |
| Share by link `Can View` | In web, create a link with `Can View` as permission level | In app, link is created with `Can View` permission |  |  |
| Share by link `Can Edit` | In web, create a link with `Can Edit` as permission level | In app, link is created with `Can Edit` permission |  |  |
| Share by link `Secret File Drop` | In web, create a link over a folder with `Secret File Drop` as permission level | In app, link is created with `Secret File Drop` permission |  |  |
| Share by link with password | In web, create a link with password | In app, link is created with the given password |  |  |
| Share by link with expiration date | In web, create a link with expiration date | Link is created with the given expiration date |  |  |
| **Edit Public link(local)** |   |  |
| Edit name | 1. Open an existing link<br>2. Change name | Check in web the new name  |  |  |
| Remove name | 1. Open an existing link<br>2. Remove name | Check in web the name was removed |  |  |
| Change permission | 1. Open an existing link with `Can view`<br>2. Change pemission `Can edit` | Check in web the permission is `Can edit` |  |  |
| Change permission folder | 1. Open an existing link over a folder with `Can view`<br>2. Change pemission `Secret file drop` | Check in web the permission is `Secret file drop` |  |  |
| Change password | 1. Open an existing link with password<br>2. Change password | Check in web the password is set|  |  |
| Remove password | 1. Open an existing link with password<br>2. Remove password | Check in web the password is not set anymore |  |  |
| Add expiration date | 1. Open an existing link without expiration date<br>2. Change the expiration date | Check in web the expiration is the new one |  |  |
| Change expiration date | 1. Open an existing link with expiration date<br>2. Change the expiration date | Check in web the expiration is the new one |  |  |
| Remove expiration date | 1. Open an existing link with expiration date<br>2. Remove the expiration date | Check in web there is no expiration date|  |  |
| **Edit Public link(remote)** |   |  |
| Change permission | 1. In web, open an existing link with `Can view`<br>2. Change pemission `Can edit` | Check in app the permission is `Can edit` |  |  |
| Change permission folder | 1. In web, open an existing link over a folder with `Can view`<br>2. Change pemission `Secret file drop` | Check in app the permission is `Secret file drop` |  |  |
| Change password | 1. In web, open an existing link with password<br>2. Change password | Check in app the password is set|  |  |
| Remove password (files) | 1. In web, open an existing link with password<br>2. Remove password | Check in app the password is not set anymore |  |  Only for files not for folders|
| Add expiration date | 1. In web, open an existing link without expiration date<br>2. Change the expiration date | Check in app the expiration is the new one |  |  |
| Change expiration date | 1. In web, open an existing link with expiration date<br>2. Change the expiration date | Check in app the expiration is the new one |  |  |
| Remove expiration date | 1. In web, open an existing link with expiration date<br>2. Remove the expiration date | Check in app there is no expiration date|  |  |
| **Remove link(local)** |   |  |
| Remove link by unshare | 1. Open an existing link<br>2. `Unshare` | Link is removed from the list. Check on web |  |  |
| Remove link by swipe | 1. Open the list of links over an item<br>2. Swipe over a link and `Remove`| Link is removed from the list. Check on web|  |  |
| **Remove link(remote)** |   |  |
| Remove link | 1. In web, open an existing link<br>2. Remove link | in app, link is removed from the list |  |  |
| **Server options** | only oC10  |  |
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder | Sharing option does not appear, only private link. |  |  |
| Server doesn't support public links | 1. Select to disable the public link API<br>2. From the app, try to share by link a file/folder  | Only private link and private share |  |  |
| Allow public links | 1. disable "Allow public uploads"<br>2. From the app, try to share by link a folder | Public links on folders do not have permission options |  |  |
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed |  |  |
| Enforced Password Folders read-only | Create a new public link with the password enforced in read-only | The link can not be saved until password is typed for the enforced one |   |  | 
| Enforced Password Folders read-write | Create a new public link with the password enforced in read-write | The link can not be saved until password is typed for the enforced one |  |  |
| Enforced Password Folders upload-only | Create a new public link with the password enforced in upload-only | The link can not be saved until password is typed for the enforced one |   |  |
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date |  |  |
| Expiration enforced | Create a new public link with the expiration enforced in server | Expiration can not be removed |  |  |
| Password + Expiration enforced | Create a new public link with the expiration and password enforced in server | The link can not be saved until password is set. Expiration can not be deleted |  |  |
| Allow resharing | Create a new public link with the allow resharing disabled | Sharee can not share the item |   |  |
| Default permissions | Set create and change ans default permissions<br>Create private share over a folder | Only create and change are marked |   | 
| Extra field = None | Set extra field = none<br>Create private share | Results do not shoy nothing extra |  |  |
| Extra field = User ID | Set extra field = User ID<br>Create private share | User ID is shown in results |  |  |
| Extra field = Email | Set extra field = Email<br>Create private share | Email is shown in results |  |  |
| Federated revoked | Revoke federated shares (sent and received) | No way to create (not in the results) |  |  |
| **Password policy** |  only oC10|  |
| Password minimum characters | Enable the feature, set a number, and create a password that does not fit the value | Correct error, link not created |  |  |
| Password lowercase | Enable the feature, set a lowercase letters number, and create a password that does not fit the value | Correct error, link not created |  |  |
| Password uppercase | Enable the feature, set a uppercase letters number, and create a password that does not fit the value | Correct error, link not created |  |  |
| Password numbers | Enable the feature, set a numbers' number, and create a password that does not fit the value | Correct error, link not created |  |  |
| Password special | Enable the feature, set a special characters number, and create a password that does not fit the value | Correct error, link not created |  |  |
| Add new special characterds | Enable the feature, add an special character, and create a password that includes the new one | Correct error, link not created |  |  |
| All policies OK | Enable all policies, and create a password that fits all of them | Created |  |  |
| All policies NOK | Enable all policies, and create a password that fits all but one | Correct error |  |  |
| All policies disabled | Disable all policies, and create a password that do not fin any policy | Link created |  |  |
| **Expiration policy** | only oC10 |  |
| Password set | Enable the feature, set a value of days and create a link with password (no expiration days in "Sharing") | Correct number of expiration days |  |  |
| Password not set | Enable the feature, set a value of days if password not set and create a link (no expiration days in "Sharing") | Correct number of expiration days |  |  |
| Expiration enforced with higher value in policy (password set) | Enable the feature, set a value of days higher than the expiration in "Sharing" and create a link with password | Correct number of expiration days: the ones in the expiration as maximum |  |  |
| Expiration enforced with lower value in policy (password set) | Enable the feature, set a value of days lower than the expiration in "Sharing" and create a link with password | Error, the number of days exceed the policy value |  |  |
| Expiration enforced with higher value in policy (password not set) | Enable the feature, set a value of days higher than the expiration in "Sharing" and create a link with no password | Correct number of expiration days: the ones in the expiration as maximum |  |  |
| Expiration enforced with lower value in policy (password not set) | Enable the feature, set a value of days lower than the expiration in "Sharing" and create a link with no password | Error, the number of days exceed the policy value |  |  |
| Password-set policy disabled | Disable the feature, set a value of days lower than the expiration in "Sharing" and create a link with password | Created, policy is disabled |  |  |
| Password-not-set policy disabled | Disable the feature, set a value of days lower than the expiration in "Sharing" and create a link with no password | Created, policy is disabled |  |  |
| Password enforced with policy, lower number days  |Enforce the password in "Settings"<br>In the policy set a lower number of days as set in the policy | Link created  |  |  |
| Password enforced with policy, higher number days  |Enforce the password in "Settings"<br>In the policy set a higher number of days as set in the policy | Error, expiration exceeds the number of days  |  |  |