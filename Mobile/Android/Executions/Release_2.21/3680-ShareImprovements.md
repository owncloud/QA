###  Share improvements

#### PR: https://github.com/owncloud/android/pull/3680

Devices: Pixel5 v12, Nexus 6P v7

Server: 10.10.0


---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :------
| **Private Share** |   |  |
| Shared with one user| Select to share a file whose name contains special characters with a user whose name includes special characters| Check that user2 has access to the file<br>Check that the file includes the individual share icon | P m12 m7 |  |
| Shared with one group| Select to share a file with a group whose name includes special characters| Check that everyone in the group has access to the file<br>Check that the file includes the group share icon | P m12 m7 |  | 
| Shared with several | Select to share a file with several users and groups | Check that every sharee has access to the file<br>Check that the shares includes the correct individual/group icon |  P m12 m7|  |
| Share with users + Share with link | 1. Select an item to share with several users<br>2. Select same item to share by link, creating several links | Check that the link works<br>Check, at least one user have still access to the file | P m12 m7 |  |
| Federated Share | Share a folder with a user in other server (reachable) | Check that the user can see the file in the list | P m12  |  |
| Edit | 1. Previously shared item with a user<br>2. Click on the pencil icon to edit<br>3. Remove permissions| Check in server that the share does not have any permissions | P m12 m7 |  |
| Delete | 1. Previously shared item with several users<br>2. Unshare one of the sharees<br>| The share with individual icon is no longer displayed<br>User does not have access to the folder any more<br>Other shares do not change| P m12 m7 |  |
| Delete all | Delete all sharees form an item| Empty list of shares | P m12 m7 |  |
| **Public Share** |   |  |
| Share by link | 1. Share a item by link<br>2. Access using a web browser to the link | 1. Link is generated and options to share are shown<br>2. Link works | P m12 m7 |  |
| Unshare by link | Select to unshare the previous file | Link icon is not shown. Link doesn't work | P m12 m7|  |
| Multiple links | Create several public links on the same item | Check that all of them are correctly generated in server | P m12 m7 |  |
| Edit | 1. Links created before<br>2. Click on the pencil icon to edit<br>3. Add password and expiration date| Check in server that the link has the correct expiration date and password | P m12 m7 |  |
| Remove links | After creating a huge amount of links in the same file, remove some of them | Check in server that removed links do not appear anymore | P m12 m7 |  |
| Remove all links | After creating a huge amount of links in the same file, remove all of them | Empty list of links | P m12 m7 |  |
| **Capabilities** |   |  |
| Server doesn't support share api | 1. In server, select to disable the share API<br>2. From the app, try to share a file/folder | Sharing option does not appear, only private link. | P m12 m7 |
| Server doesn't support public links | 1. In sever, select to disable the public link API<br>2. From the app, try to share by link a file/folder  | Only private link and private share | P m12 m7 |  |
| Extra field = None | Set extra field = none<br>Create private share | Results do not show nothing extra | P m12 m7 |  |
| Extra field = User ID | Set extra field = User ID<br>Create private share | User ID is shown in results | P m12 m7|  |
| Extra field = Email | Set extra field = Email<br>Create private share | Email is shown in results | P m12 m7 |  |