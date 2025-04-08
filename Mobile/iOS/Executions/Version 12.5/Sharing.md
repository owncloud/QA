###  Sharing 

**Server(s)**: oCIS 7.1.1<br>
**Device(s)**: iPhoneXR v18.2, iPad Air iPadOS 17.6.1<br>
**Execution date**: 07/04/2025<br>
**Tester**: jrecio <br>
**Context**: Regression over sharing feature after moving to sharing NG<br>


---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **Share with users (local)**|   |  |
| Shared with one user| 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant any permission level| Check that sharee has access to the file. Check that the item includes the share icon. Check in web | P m18 t17 |  |
| Shared with one group| 1. Select `Sharing` over any item in the list<br>2. Invite an existing group<br>3. Grant any permission level| Check that every member of the group has access to the item. Check that the file includes the share icon. Check in web | P m18 t17 |  |
| Shared with several | 1. Select `Sharing` over any item in the list<br>2. Invite some users and groups granting them any permission level | Check that every user has access to the item <br>2. Check that the file includes the share icon. Check in web | P m18 t17  |  |
| Shared with an already shared user | 1. Select `Sharing` over any item in the list<br>2. Invite a user<br>3. Grant any permission level<br>4. Invite again the same user| `Already shared with the user` | P m18  t17 | FIXED: [Bad error message](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2782521393) |
| Share with yourself | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the item | P m18  t17 | FIXED: [Bad error message](https://github.com/owncloud/ios-app/pull/1435#issuecomment-2782471771) |
| Share with no permission | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Don't choose any permission level| `Invite` button disabled | P m18  t17 |  |
| Share with `Can View` | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant `Can View` | Check that sharee has access to the item. Check in web the permission level is `Can View` |  P m18  t17 |  |
| Share folder with `Can Upload` | 1. Select `Sharing` over a folder in the list<br>2. Invite another user<br>3. Grant `Can Upload` | Check that sharee has access to the folder. Check in web the permission level is `Can Upload` |  P m18  t17 |  |
| Share file with `Can Upload` | 1. Select `Sharing` over a file in the list<br>2. Invite another user<br>|  `Can Upload` not available as permission|   P m18  t17|  |
| Share with `Can Edit`<br>`without versions` | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant `Can Edit without versions` | Check that sharee has access to the file. Check in web the permission level is `Can Edit without versions` |  P m18  t17 |  |
| Share with expiration default | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant any permission<br>4. `Add` expiration date by default | Check that sharee has access to the file. Check in web the expiration date is one week later than today (default in iOS)  | P m18  t17   |  |
| Share with expiration custom | 1. Select `Sharing` over any item in the list<br>2. Invite another user<br>3. Grant any permission<br>4. `Add` expiration date<br>5. Click on the default date and choose a different one | Check that sharee has access to the file. Check in web the expiration date is the chosen one in step 5.  |  P m18 t17 |  |
| **Share with users (remote)**|   |  |
| Share with `Can View` | In web, share any item with `Can View` permission | Check in the app that the permission level is `Can View` | P m18   |  |
| Share folder with `Can Upload` | In web, share a folder with `Can Upload` permission | Check in the app that the permission level is `Can Upload` | P m18   |  |
| Share with `Can Edit`<br>`without permissions` | In web, share any item with `Can Edit`<br>`without permissions` permission | Check in the app that the permission level is `Can Edit`<br>`without permissions` |  P m18  |  |
| Share with expiration default | In web, share any item with any permission level and a expiration date | Check in the app that the expiration date is the chosen one | P m18 |  |
|**Edit share (local)**||||||
| Change permissons | 1. Open an existing share with `Can View` permission<br>2. Change permission to `Can edit`<br>`without versions` | Check in web the permission level is `Can Edit`<br>`without versions`<br>  | P m18 t17  |  |
| Change permissons folder | 1. Open an existing shared folder with `Can View` permission<br>2. Change permission to `Can upload` | Check in web the permission level is `Can upload`<br>  | P m18 t17  |  |
| Add expiration date | 1. Open an existing share without expiration date<br>2. Add an expiration date to the share |  Check in web the expiration date is the new chosen one  | P m18 t17  |  |
| Change expiration date | 1. Open an existing share with expiration date<br>2. Change expiration date to a different one |  Check in web the expiration date is the new chosen one  | P m18 t17   |  |
| Remove expiration date | 1. Open an existing share with expiration date<br>2. Remove expiration date |  Check in web the item does not have expiration date | P m18 t17  |  |
|**Edit share (remote)**||||||
| Change permissons | 1. In web, open an existing share with `Can View` permission<br>2. Change permission to `Can edit`<br>`without versions` | Check in app the permission level is `Can Edit`<br>`without versions`<br>  | P m18  |  |
| Change permissons folder | 1. In web, open an existing shared folder with `Can View` permission<br>2. Change permission to `Can upload` | Check in app the permission level is `Can upload`<br>  | P m18  |  |
| Add expiration date | 1. In web, open an existing share without expiration date<br>2. Add an expiration date to the share |  Check in app the expiration date is the new chosen one  | P m18  |  |
| Change expiration date | 1. In web, open an existing share with expiration date<br>2. Change expiration date to a different one |  Check in app the expiration date is the new chosen one  |  P m18 |  |
| Remove expiration date | 1. In web, open an existing share with expiration date<br>2. Remove expiration date |  Check in app the item does not have expiration date |P m18   |  |
|**Delete share(local)**||||||
| Delete with unshare | 1. Open an existing share<br>2. Remove the share with the `Unshare` option | Sharee is not in the list anymore. Check in web  | P m18  t17  |  |
| Delete with swipe | 1. Open the list of sharees of any share<br>2. Remove any sharee by swiping over its name| Sharee is not in the list anymore. Check in web  |  P m18 t17 |  |
|**Delete share(remote)**||||||
| Delete | 1. In web, open an existing share<br>2. Remove the share| In app, sharee is not in the list anymore.| P m18  |  |
| **Public link(local)** |   |  |
| Share by link with name | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add a name to the link<br>3. Select any permission level<br>4. `Create`  | Link is created with the given name. Check on web | P m18 t17|  |
| Share by link `Can View` | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add `Can View` as permission level<br>3. `Create` | Link is created with `Can View`permission. Check on web | P m18 t17 |  |
| Share by link `Can Edit` | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add `Can Edit` as permission level<br>3. `Create` | Link is created with `Can Edit` permission. Check on web |P m18 t17  |  |
| Share folder by link `Secret File Drop` | 1. Select `Sharing` over a folder in the list and `Create Link`<br>2. Add `Secret File Dropt` as permission level<br>3. `Create` | Link is created with `Secret File Drop` permission. Check on web | P m18 t17 |  |
| Share by link without permission | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Select no permission level | `Create` option is disabled |P m18 t17  |  |
| Share by link with password auto | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add an automatic password by clicking `Generate`<br>3. `Create` | Link is created with the given password. Check on web | P m18 t17 |  |
| Share by link with password custom | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add a password by clicking `Set`<br>3. Add a password that fulfill requirements<br>4. `Create` | Link is created with the given password. Check on web | P m18 t17 |  |
| Share by link with expiration date default | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add default expiration date by clicking `Add`<br>3. `Create` | Link is created with the given expiration date. Check on web | P m18 t17 |  |
| Share by link with expiration date custom | 1. Select `Sharing` over any item in the list and `Create Link`<br>2. Add default expiration date by clicking `Add`<br>3. Click on the default expiration date and choose another one<br>4. `Create` | Link is created with the given expiration date. Check on web | P m18 t17 |  |
| **Public link(remote)** |   |  |
| Share by link with name | In web, create a link with name  | In app, link is listed with the given name | NA | No name field in web |
| Share by link `Can View` | In web, create a link with `Can View` as permission level | In app, link is created with `Can View` permission | P m18 |  |
| Share by link `Can Edit` | In web, create a link with `Can Edit` as permission level | In app, link is created with `Can Edit` permission | P m18 |  |
| Share by link `Secret File Drop` | In web, create a link over a folder with `Secret File Drop` as permission level | In app, link is created with `Secret File Drop` permission | P m18 |  |
| Share by link with password | In web, create a link with password | In app, link is created with the given password |P m18  |  |
| Share by link with expiration date | In web, create a link with expiration date | Link is created with the given expiration date | P m18 |  |
| **Edit Public link(local)** |   |  |
| Edit name | 1. Open an existing link<br>2. Change name | Check in web the new name  | P m18 t17 |  |
| Remove name | 1. Open an existing link<br>2. Remove name | Check in web the name was removed | P m18 t17 |  |
| Change permission | 1. Open an existing link with `Can view`<br>2. Change pemission `Can edit` | Check in web the permission is `Can edit` | P m18 t17 |  |
| Change permission folder | 1. Open an existing link over a folder with `Can view`<br>2. Change pemission `Secret file drop` | Check in web the permission is `Secret file drop` | P m18 t17  |  |
| Change password | 1. Open an existing link with password<br>2. Change password | Check in web the password is set| P m18 t17  |  |
| Remove password | 1. Open an existing link with password<br>2. Remove password | Check in web the password is not set anymore | P m18 t17 |  |
| Add expiration date | 1. Open an existing link without expiration date<br>2. Change the expiration date | Check in web the expiration is the new one | P m18 t17  |  |
| Change expiration date | 1. Open an existing link with expiration date<br>2. Change the expiration date | Check in web the expiration is the new one | P m18 t17  |  |
| Remove expiration date | 1. Open an existing link with expiration date<br>2. Remove the expiration date | Check in web there is no expiration date| P m18 t17  |  |
| **Edit Public link(remote)** |   |  |
| Edit name | 1. In web, open an existing link<br>2. Change name | Check in app the new name  | P m18 |  |
| Change permission | 1. In web, open an existing link with `Can view`<br>2. Change pemission `Can edit` | Check in app the permission is `Can edit` | P m18 |  |
| Change permission folder | 1. In web, open an existing link over a folder with `Can view`<br>2. Change pemission `Secret file drop` | Check in app the permission is `Secret file drop` | P m18 |  |
| Change password | 1. In web, open an existing link with password<br>2. Change password | Check in app the password is set|  P m18|  |
| Remove password (files) | 1. In web, open an existing link with password<br>2. Remove password | Check in app the password is not set anymore | P m18 | Only for files not for folders | | |
| Add expiration date | 1. In web, open an existing link without expiration date<br>2. Change the expiration date | Check in app the expiration is the new one | P m18 |  |
| Change expiration date | 1. In web, open an existing link with expiration date<br>2. Change the expiration date | Check in app the expiration is the new one | P m18 |  |
| Remove expiration date | 1. In web, open an existing link with expiration date<br>2. Remove the expiration date | Check in app there is no expiration date| P m18 |  |
| **Remove link(local)** |   |  |
| Remove link by unshare | 1. Open an existing link<br>2. `Unshare` | Link is removed from the list. Check on web | P m18 t17|  |
| Remove link by swipe | 1. Open the list of links over an item<br>2. Swipe over a link and `Remove`| Link is removed from the list. Check on web| P m18  t17|  |
| **Remove link(remote)** |  |  |
| Remove link | 1. In web, open an existing link<br>2. Remove link | in app, link is removed from the list | P m18 |  |
