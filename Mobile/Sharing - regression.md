###  Sharing 


Device Android: Nexus 5X v8<br>
Device iOS: iPhone XR v12<br>

Android app version: 2.12<br>
iOS app version: 1.0.4<br>

Server: 10.3.0 alpha (testing) 

---

 
| Test Case | Description | Expected | Android | iOS | Comment |
| :-------- | :---------- | :------- | :-----: | :-: | :------
| **Share with users** |   |  |
| Shared with one user| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | Passed | Passed |
| Shared with one group| Select to share a file with a group whose name includes special characters| Check that everyone in the group has access to the file<br>Check that the file includes the share icon | Passed | Passed | 
| Shared with several | Select to share a file with several users and groups | Check that everyone has access to the file<br>Check that the file includes the share icon | Passed | Passed |
| Shared with an already shared user | Select to share an item already shared, with the same user | An error is shown |  Passed | Passed |
| Share an item with edit | Share an item granting edit permission | Sharee can edit |  Passed | Passed |
| Share an item with re-share | Share an item granting share permission | Sharee can reshare |   Passed | Passed |
| Share an item with both | Share an item granting edit and share permissions | Sharee can edit and share |   Passed | Passed |
| Share an item without permissions | Share an item revoking edit and share permissions | Sharee can neither edit not share |   Passed | Passed |
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees |  Passed | Passed |
| Share with users + Share with link | Select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |  Passed | Passed |
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |  Passed | Passed |
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |  Passed | Passed |
|**Edit share**||||||
| Edit an item adding edit | Edit an item by adding edit permission | Sharee can edit | Passed | Passed |
| Edit an item adding re-share | Edit an item by adding share permission | Sharee can reshare |  Passed | Passed |
| Edit an item revoking edit | Edit an item by removing edit permission | Sharee can not edit |  Passed | Passed |
| Edit an item revoking re-share | Edit an item by removing share permission | Sharee can not reshare |  Passed | Passed |
| Edit an item with both | Share an item granting edit and share permissions | Sharee can edit and share |  Passed | Passed |
|**Delete share**||||||
| Delete | 1. Previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more | Passed | Passed |
| Delete all | 1. Delete all sharees form an item| The share with user icon is not included | Passed | Passed |
| **Public share** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | Passed | Passed |
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | Passed | Passed |
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | Passed | Passed |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | Passed | Passed |
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | Passed | Passed |
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | Passed | Passed |
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed | Passed | Passed |
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" | Passed | Passed |
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content | Passed | Passed |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | Passed | Passed |
| **Server options** |   |  |
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder | Sharing option does not appear, only private link. | Passed | Passed |
| Server doesn't support public links | 1. Select to disable the public link API<br>2. From the app, try to share by link a file/folder  | Only private link and private share | Passed | Passed |
| Allow public links | 1. disable "Allow public uploads"<br>2. From the app, try to share by link a folder | Public links on folders do not have permission options | Passed | Passed |
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed | Passed | Passed |
| Enforced Password Folders read-only | Create a new public link with the password enforced in read-only | The link can not be saved until password is typed for the enforced one |  Passed | Passed | 
| Enforced Password Folders read-write | Create a new public link with the password enforced in read-write | The link can not be saved until password is typed for the enforced one | Passed | Passed |
| Enforced Password Folders upload-only | Create a new public link with the password enforced in upload-only | The link can not be saved until password is typed for the enforced one |  Passed | Passed |
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date | Passed | Passed |
| Expiration enforced | Create a new public link with the expiration enforced in server | Expiration can not be removed | Passed | Passed |
| Password + Expiration enforced | Create a new public link with the expiration and password enforced in server | The link can not be saved until password is set. Expiration can not be deleted | Passed | Passed |
| Allow resharing | Create a new public link with the allow resharing disabled | Sharee can not share the item |  Passed | Passed |
| Default permissions | Set create and change ans default permissions<br>Create private share over a folder | Only create and change are marked | NA  | Passed
| Extra field = None | Set extra field = none<br>Create private share | Results do not shoy nothing extra | Passed | Passed |
| Extra field = User ID | Set extra field = User ID<br>Create private share | User ID is shown in results | Passed | Passed |
| Extra field = Email | Set extra field = Email<br>Create private share | Email is shown in results | Passed | Passed |
| Federated revoked | Revoke federated shares (sent and received) | No way to create (not in the results) | Passed | Passed |
| **Password policy** |  |  |
| Password minimum characters | Enable the feature, set a number, and create a password that does not fit the value | Correct error, link not created | Passed | Passed |
| Password lowercase | Enable the feature, set a lowercase letters number, and create a password that does not fit the value | Correct error, link not created | Passed | Passed |
| Password uppercase | Enable the feature, set a uppercase letters number, and create a password that does not fit the value | Correct error, link not created | Passed | Passed |
| Password numbers | Enable the feature, set a numbers' number, and create a password that does not fit the value | Correct error, link not created | Passed | Passed |
| Password special | Enable the feature, set a special characters number, and create a password that does not fit the value | Correct error, link not created | Passed | Passed |
| Add new special characterds | Enable the feature, add an special character, and create a password that includes the new one | Correct error, link not created | Passed | Passed |
| All policies OK | Enable all policies, and create a password that fits all of them | Created | Passed | Passed |
| All policies NOK | Enable all policies, and create a password that fits all but one | Correct error | Passed | Passed |
| All policies disabled | Disable all policies, and create a password that do not fin any policy | Link created | Passed | Passed |
| **Expiration policy** |  |  |
| Password set | Enable the feature, set a value of days and create a link with password (no expiration days in "Sharing") | Correct number of expiration days | Passed | Passed |
| Password not set | Enable the feature, set a value of days if password not set and create a link (no expiration days in "Sharing") | Correct number of expiration days | Passed | Passed |
| Expiration enforced with higher value in policy (password set) | Enable the feature, set a value of days higher than the expiration in "Sharing" and create a link with password | Correct number of expiration days: the ones in the expiration as maximum | Passed | Passed |
| Expiration enforced with lower value in policy (password set) | Enable the feature, set a value of days lower than the expiration in "Sharing" and create a link with password | Error, the number of days exceed the policy value | Passed | Passed |
| Expiration enforced with higher value in policy (password not set) | Enable the feature, set a value of days higher than the expiration in "Sharing" and create a link with no password | Correct number of expiration days: the ones in the expiration as maximum | Passed | Passed |
| Expiration enforced with lower value in policy (password not set) | Enable the feature, set a value of days lower than the expiration in "Sharing" and create a link with no password | Error, the number of days exceed the policy value | Passed | Passed |
| Password-set policy disabled | Disable the feature, set a value of days lower than the expiration in "Sharing" and create a link with password | Created, policy is disabled | Passed | Passed |
| Password-not-set policy disabled | Disable the feature, set a value of days lower than the expiration in "Sharing" and create a link with no password | Created, policy is disabled | Passed | Passed |
| Password enforced with policy, lower number days  |Enforce the password in "Settings"<br>In the policy set a lower number of days as set in the policy | Link created  | Passed | Passed |
| Password enforced with policy, higher number days  |Enforce the password in "Settings"<br>In the policy set a higher number of days as set in the policy | Error, expiration exceeds the number of days  | Passed | Passed |