## Sharing 

PR: https://github.com/owncloud/android/pull/3011<br>
Devices: Pixel 2 Android 11<bR>

Server: oC10.5. oCIS1.0beta

---

### Upgrade from prevous version (migration)
 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **Share with users** |   |  |
| Shared with one user| Select to share a file whose name contains special characters with a user | 1. Check that user2 has access to the file<br>2. Check that the file includes the share icon | P m11 | |
| Shared with one group| 1. Select to share a file with a group whose name includes special characters| Check that everyone in the group has access to the file<br>2. Check that the file includes the share icon | P m11 |  | 
| Shared with several | Select to share a file with several users and groups | 1. Check that everyone has access to the file<br>2. Check that the file includes the share icon | P m11 |  |
| Shared with an already shared user | Select to share an item already shared, with the same user | An error is shown |  P m11 |  |
| Share an item with edit | Share an item granting edit permission | Sharee can edit |   P m11  |  |
| Share an item with re-share | Share an item granting share permission | Sharee can reshare |    P m11  | |
| Share an item with both | Share an item granting edit and share permissions | Sharee can edit and share |   P m11   |  |
| Share an item without permissions | Share an item revoking edit and share permissions | Sharee can neither edit not share |    P m11  |  |
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees |   P m11  |  |
| Share with users + Share with link | 1. Select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |  P m11    |  |
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |  P m11   |  |
| Federated Share | 1. Share a folder with user1 in other server<br>2. Login with user1| user1 can view the file | P m11  |  |
|**Edit share**||||||
| Edit an item adding edit | Edit an item by adding edit permission | Sharee can edit |  P m11  |  |
| Edit an item adding re-share | Edit an item by adding share permission | Sharee can reshare |  P m11   |  |
| Edit an item revoking edit | Edit an item by removing edit permission | Sharee can not edit |   P m11  |  |
| Edit an item revoking re-share | Edit an item by removing share permission | Sharee can not reshare |   P m11  |  |
| Edit an item with both | Share an item granting edit and share permissions | Sharee can edit and share |   P m11  |  |
|**Delete share**||||||
| Delete | 1. Previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more |  P m11  |  |
| Delete all | 1. Delete all sharees form an item| The share with user icon is not included |   P m11 |  |
| **Public share** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m11 |  |
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m11 |  |
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | P m11 |  |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m11 |  |
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | P m11 |  |
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | P m11 |  |
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed | P m11 |  |
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" | P m11 |  |
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content | P m11 |  |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m11 |  |Upgrade from prevous version (migration)
 
 
### OCIS 
 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **Share with users** |   |  |
| Shared with one user| Select to share a file whose name contains special characters with a user | 1. Check that user2 has access to the file<br>2. Check that the file includes the share icon | P m11 | |
| Shared with one group| 1. Select to share a file with a group whose name includes special characters| Check that everyone in the group has access to the file<br>2. Check that the file includes the share icon | P m11 |  | 
| Shared with several | Select to share a file with several users and groups | 1. Check that everyone has access to the file<br>2. Check that the file includes the share icon | P m11 |  |
| Shared with an already shared user | Select to share an item already shared, with the same user | An error is shown |  P m11 |  |
| Share an item with edit | Share an item granting edit permission | Sharee can edit |   P m11  |  |
| Share an item with re-share | Share an item granting share permission | Sharee can reshare |    P m11  | |
| Share an item with both | Share an item granting edit and share permissions | Sharee can edit and share |   P m11   |  |
| Share an item without permissions | Share an item revoking edit and share permissions | Sharee can neither edit not share |    P m11  |  |
| Reshare reflected | 1. Share content with user1<br>2. User1 shares with user2 | source user sees user1 and user2 as sharees |   P m11  |  |
| Share with users + Share with link | 1. Select shared with user<br>2. Select to share by link | Check that the link works<br>Check, at least one user have still access to the file |  P m11    |  |
| Privileges inheritance | 1. Share a folder with user1 with share and create privileges, and without change and delete<br>2. Login with user1 and try to re-share the folder with create privilege<br>3. Re-share with change and/or delete privileges (check in server side)| 2. user1 can reshare the file<br>3. user1 can not reshare the file |  P m11   |  |
|**Edit share**||||||
| Edit an item adding edit | Edit an item by adding edit permission | Sharee can edit |  P m11  |  |
| Edit an item adding re-share | Edit an item by adding share permission | Sharee can reshare |  P m11   |  |
| Edit an item revoking edit | Edit an item by removing edit permission | Sharee can not edit |   P m11  |  |
| Edit an item revoking re-share | Edit an item by removing share permission | Sharee can not reshare |   P m11  |  |
| Edit an item with both | Share an item granting edit and share permissions | Sharee can edit and share |   P m11  |  |
|**Delete share**||||||
| Delete | 1. Previosly shared user, select shared with user<br>2. Unshare with 1 of the users<br>| The share with user icon is not included<br>User does not have access to the folder any more |  P m11  |  |
| Delete all | 1. Delete all sharees form an item| The share with user icon is not included |   P m11 |  |
| **Public share** |   |  |
| Share by link | 1. Share a folder with a long name by link, by long press<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m11 |  |
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m11 |  |
| Share by link from the web | 1. From the web select to share by link a file and a folder at different levels<br>2. Access to the device | Files are shown as shared by link | P m11 |  |
| Share by link with password | 1. in the server, enforce the password<br>2. select to share by link a file/folders<br>3. fill in a password | File is shared | P m11 |  |
| Share by link with expiration | 1. in the server, enforce the date<br>2. select to share by link a file/folders<br>3. fill in the date | File is shared | P m11 |  |
| Multiple links | Create several public links on the same file or folder | Check that all of them are correctly generated in server | P m11 |  |
| Download / View | 1. Share link of a folder<br>2. Select "Download / View"  | Folder is shared and content is visible, but no action is allowed | P m11 |  |
| Download / View / Upload | 1. Share link of a folder<br>2. Select "Download / View / Upload"  | Folder is shared and content is "updatable" | P m11 |  |
| Upload only | 1. Share link of a folder<br>2. Select "Upload Only"  | Folder is shared and content is not visible, but it is posible to upload content | P m11 |  |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed do not appear | P m11 |  |
