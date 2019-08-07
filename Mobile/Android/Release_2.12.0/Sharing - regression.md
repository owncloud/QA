###  Sharing (new architecture)

#### Pr: https://github.com/owncloud/android/pull/

Devices: Xiaomi MI A2 v9, Nexus 5X v8 <br>

Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :----: | :-----
| **View** |   |  |
| Correct share view| Open share view for different files | CEverything is correctly placed | P m9 m8 | FIXED: Thumbnails only for images
| **Share with users** |   |  |
| Shared with one user| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the share icon | P m9 m8
| Shared with one group| Select to share a file with a group whose name includes special characters| Check that everyone in the group has access to the file<br>Check that the file includes the share icon | P m9 m8
| Shared with several | Select to share a file with several users and groups | Check that everyone has access to the file<br>Check that the file includes the share icon | P m9 m8
| Shared with an already shared user | Select to share an item already shared, with the same user | An error is shown | P m9 m8
| Share an item with edit | Share an item granting edit permission | Sharee can edit | P m9 m8
| Share an item with re-share | Share an item granting share permission | Sharee can reshare | P m9 m8
| Share an item with both | Share an item granting edit and share permissions | Sharee can edit and share | P m9 m8
| Share an item without permissions | Share an item revoking edit and share permissions | Sharee can neither edit not share | P m9
| Forbidden reshare | 1. In server disable the capability "allow resharing"<br>2. Try to reshare a shared file or folder | Not allowed | P m9
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees | P m9
| Share with users + Share with link | Select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file | P m9 m8
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file | P m9 m8 | FIXED: Incorrect error when permissions can not be increased.
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file | P m9 m8
| Federated Share disabled | 1. In server, disable the option federated share<br>2. Share a folder with user1 in other server<br>3. Login with user1<br> | The file can not be federated shared | P m9 m8
|**Edit share**||||||
| Edit an item adding edit | Edit an item by adding edit permission | Sharee can edit | P m9 m8
| Edit an item adding re-share | Edit an item by adding share permission | Sharee can reshare |  P m9 m8
| Edit an item revoking edit | Edit an item by removing edit permission | Sharee can not edit |  P m9 m8
| Edit an item revoking re-share | Edit an item by removing share permission | Sharee can not reshare |  P m9 m8
| Edit an item with both | Share an item granting edit and share permissions | Sharee can edit and share |  P m9 m8
|**Delete share**||||||
| Delete | 1. Previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more | P m9 m8
| Delete all | 1. Delete all sharees form an item| The share with user icon is not included | P m9 m8
| **Public share** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m9 m8
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m9 m8
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | P m9 m8
| Server doesn't support share api preview | 1. Select to disable the share API<br>2. From the app, try to share by link a file/folder from the long press menu | Sharing option does not appear, only private link. | P m9 m8
| Server doesn't support public links | 1. Select to disable the public link API<br>2. From the app, try to share by link a file/folder from the long press menu | Only private link and private share | P m9 m8
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m9 m8
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | P m9 m8
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | P m9 m8
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed | P m9 m8
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" | P m9 m8
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content | P m9 m8
| Edit | 1. Share link of a folder<br>2. Edit name, permission, password and expiration | Folder is shared with new parameters | P m9 m8
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m9 m8
| Enforced Password | Create a new public link with the password enforced in server | The link can not be saved until password is typed | P m9
| Enforced Password Folders | Create a new public link with the password enforced in the different upload modalities | The link can not be saved until password is typed for the enforced ones | F m9 m8 | FIXED: Changed to a enforced permission in password does not allow to edit. Error is there after switching permission level to a granted one.
| Expiration default | Create a new public link with default expiration in server | The link by default has the default expiration date | P m9 m8
| Expiration enforced | Create a new public link with the expiration enforced in server | The link can not be saved until expiration is input | P m9 m8
| **Upgrade** |   |  |
| 2.11.1 | Install 2.11.1 and create public and private shares<br>Upgrade to the current | All the shares are correct in the new version | P m9