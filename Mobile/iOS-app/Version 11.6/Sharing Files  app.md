###  Sharing in Files App 

#### PR: https://github.com/owncloud/ios-app/pull/

Devices: iPhoneXR v14.24, iPadAir v13<br>
Server: 10.6

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **View** |   |  |
| Shared with user/group| Open Files App -> ownCloud account and long press on any item  | Option to share with user/groups is there in both orientations | P m14 t13 | FIXED: Missing theme from app |
| Shared link| Open Files App -> ownCloud account and long press on any item  | Option to share link in there in both orientations | P m14 t13 | FIXED: Missing theme from app |
| **Share with users** |   |  |
| Shared with one user| Select to share a file whose name contains special characters with a user whose name includes special characters| 1. Check that user2 has access to the file<br>2. Check that the file includes the share icon | P m14  t13|  |
| Shared with one group| 1. Select to share a file with a group whose name includes special characters| Check that everyone in the group has access to the file<br>2. Check that the file includes the share icon |  P m14  t13|  | 
| Shared with several | Select to share a file with several users and groups | 1. Check that everyone has access to the file<br>2. Check that the file includes the share icon | P m14 t13 |  |
| Shared with an already shared user | Select to share an item already shared, with the same user | An error is shown | P m14  t13 |  |
| Share an item with edit | Share an item granting edit permission | Sharee can edit | P m14   |  |
| Share an item with re-share | Share an item granting share permission | Sharee can reshare |  P m14  t13  |  |
| Share an item with both | Share an item granting edit and share permissions | Sharee can edit and share |  P m14   t13 |  |
| Share an item without permissions | Share an item revoking edit and share permissions | Sharee can neither edit not share |  P m14  t13  |  |
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees | P m14  t13 |  |
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file |  P m14  t13|  |
|**Edit share**||||||
| Edit an item adding edit | Edit an item by adding edit permission | Sharee can edit | P m14  t13|  |
| Edit an item adding re-share | Edit an item by adding share permission | Sharee can reshare | P m14  t13 |  |
| Edit an item revoking edit | Edit an item by removing edit permission | Sharee can not edit | P m14  t13 |  |
| Edit an item revoking re-share | Edit an item by removing share permission | Sharee can not reshare |  P m14  t13|  |
| Edit an item with both | Share an item granting edit and share permissions | Sharee can edit and share | P m14  t13 |  |
|**Delete share**||||||
| Delete | 1. Previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more | P m14  t13|  |
| Delete all | 1. Delete all sharees form an item| The share with user icon is not included | P m14  t13|  |
| Unshare | 1. A shares with B<br>2. B unshares the share| The share isnot available for B anymore | P m14 t13 | FIXED: Stucked |
| **Public share** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works |  P m14  t13|  |
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link |  P m14  t13|  |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared |  P m14  t13|  |
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared |  P m14 t13 |  |
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server |  P m14  t13|  |
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed |  P m14  t13|  |
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" |   P m14  t13|  |
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content |  P m14  t13|  |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear |  P m14  t13|  |
| Copy link | After creating link, copy it<br>Paste it in a text editing app| Text is correctly pasted, s it was copied|  P m14  t13|  |
| **Server options** |   |  |
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder | Sharing option does not appear, only private link. | P m14  t13| FIXED: Options appears |
| Server doesn't support public links | 1. Select to disable the public link API<br>2. From the app, try to share by link a file/folder  | Only private link and private share | P m14  t13|  |
| Allow public uploads | 1. disable "Allow public uploads"<br>2. From the app, try to share by link a folder | Public links on folders do not have permission options | P m14  t13|  |
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed | P m14  t13|  |
| Enforced Password Folders read-only | Create a new public link with the password enforced in read-only | The link can not be saved until password is typed for the enforced one | P m14  t13 |  | 
| Enforced Password Folders read-write | Create a new public link with the password enforced in read-write | The link can not be saved until password is typed for the enforced one | P m14  t13 |  |
| Enforced Password Folders upload-only | Create a new public link with the password enforced in upload-only | The link can not be saved until password is typed for the enforced one |  P m14 t13 |  |
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date |P m14  t13 |  |
| Expiration enforced | Create a new public link with the expiration enforced in server | Expiration can not be removed | P m14  t13|  |
| Password + Expiration enforced | Create a new public link with the expiration and password enforced in server | The link can not be saved until password is set. Expiration can not be deleted | P m14  t13|  |
| Allow resharing | Create a new public link with the allow resharing disabled | Sharee can not share the item | P m14  t13 |  |
| Default permissions | Set create and change ans default permissions<br>Create private share over a folder | Only create and change are marked | P m14  t13 | 
| Federated revoked | Revoke federated shares (sent and received) | No way to create (not in the results) | P m14  t13|  |
| **Other** |   |  |
| No connection | Create a share and a link after remove the device connection | Not posible | P m14 t13 |  |
| No server connection | Create a share and a link after switching the server off  | Not posible | P m14 t13 |  |
| Maintenance mode | Create a share and a link after setting maintenance mode in the server | Not posible | P m14 t13 |  |