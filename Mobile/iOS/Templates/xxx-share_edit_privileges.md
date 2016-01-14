### Sharing privileges

#### Pr: https://github.com/owncloud/ios/pull/xxx

Devices:

Server version:

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|-------------:|----------:
**Menu views**|
1|New file sharing options| 1. Swipe to share with users/groups<br>2. Tap on "add user or group" and add one of them<br>3. Tap on handle privileges|2. A badget is shown to handle privileges<br>3. Two options are displayed: "can share" and "can edit", a "Stop sharing" option, and a "Done" button to confirm. On the top appears the name of user/group to share with
2|New folder sharing options| 1. Swipe to share with users/groups<br>2. Tap on "add user or group" and add one of them<br>3. Tap on handle privileges<br>4. Enable "can edit" option|2. A badget is shown to handle privileges<br>3. Two options are displayed: "can share" and "can edit", a "Stop sharing" option, and a "Done" button to confirm<br>4. Three more options are displayed: "create", "change", "delete". On the top appears the name of user/group to share with
**Orientations**|
3|Portrait| From 1 or 2, set on portrait the view of sharing privileges| The view is correcly displayed
4|Landscape| From 1 or 2, set on landscape the view of sharing privileges| The view is correcly displayed
**Privileges**|
5|Can share|1. Swipe to share a file/folder with special characters<br>2. Select a user/group and grant it to share<br>3. Login with the sharee<br>4. Share the file/folder with other users| 3. The sharee can see the file<br>4. File/folder is correctly shared
6|Can not share|1. Swipe to share a file/folder<br>2. Select a user/group but does not grant to share<br>3. Login with the sharee<br>4. Share the file/folder with other users| 3. The sharee can see the file<br>4. The file/folder can not be shared
7|Can edit file|1. Swipe to share a file<br>2. Select a user/group and grant it to edit<br>3. Login with the sharee<br>4. Try to edit the file with an external app| 3. The sharee can see the file<br>4. The file is correctly edited
8|Can not edit file|1. Swipe to share a file<br>2. Select a user/group but does not grant it to edit<br>3. Login with the sharee<br>4. Try to edit the file with an external app| 3. The sharee can see the file<br>4. The file can not be edited
9|Can create folder|1. Swipe to share a folder<br>2. Select a user/group and grant it to create<br>3. Login with the sharee<br>4. Try to create/upload a file into the folder| 3. The sharee can see the file<br>4. The file is correctly created/uploaded
10|Can not create folder|1. Swipe to share a folder<br>2. Select a user/group but does not grant it to create<br>3. Login with the sharee<br>4. Try to create a file into the folder with an external app| 3. The sharee can see the file<br>4. The file can not be created/uploaded 
11|Can change folder|1. Swipe to share a folder<br>2. Select a user/group and grant it to change<br>3. Login with the sharee<br>4. Try to edit a file into the folder with an external app| 3. The sharee can see the folder<br>4. The file into the folder is correctly changed
12|Can not change folder|1. Swipe to share a folder<br>2. Select a user/group but does not grant it to change<br>3. Login with the sharee<br>4. Try to edit a file into the folder file with an external app| 3. The sharee can see the file<br>4. The file into the folder can not be changed
13|Can delete folder|1. Swipe to share a folder<br>2. Select a user/group and grant it to delete<br>3. Login with the sharee<br>4. Try to delete a file into the folder| 3. The sharee can see the file<br>4. The file is correctly deleted
14|Can not delete folder|1. Swipe to share a folder<br>2. Select a user/group but does not grant it to delete<br>3. Login with the sharee<br>4. Try to delete a file into the folder| 3. The sharee can see the file<br>4. The file can not be deleted
15|Can not edit folder|1. Swipe to share a folder<br>2. Select a user/group but does not grant it to edit<br>3. Login with the sharee<br>4. Try to edit files (create/change/delete) with an external app| 3. The sharee can see the file<br>4. The file can not be edited
16|Stop sharing|1. Swipe to share a file/folder<br>2. Select a user/group and grant it some privileges<br>3. Login with the sharee<br>4. Login again with the sharing user and long press to handle sharing privileges<br>5. Tap on "stop sharing"| 3. The sharee can see the file<br>5. Check that the sharee can not see the file/folder
17|Privileges in server|1. Login on server<br>2. Grant a file/folder some privileges<br>3. Login on app| Check that the granted privileges on server are visible in mobile app
18|Several sharees|1. Share a file/folder with several users granting them different privileges<br>|Each sharee can only manage the file/folder according his privileges
19|Several files|1. Share several files/folders with a user/group granting him different privileges<br>|The user/group can only manage the files/folders according his privileges
**Errors**|
20|No connection|1. Swipe to share a file/folder with privileges<br>2. Switch the device connection off<br>3. Change the privileges<br>4. Tap on "done"| An error is shown
21|Server down|1. Swipe to share a file/folder with privileges<br>2. Server down<br>3. Change the privileges<br>4. Tap on "done"| An error is shown
22|Sharing API disabled|1. Swipe to share a file/folder with privileges<br>2. In server, disable the sharing API<br>3. Change the privileges<br>4. Tap on "done"| An error is shown
23|Resharing disabled|1. Swipe to share a file/folder with privilege of sharing<br>2. In server, disable the resharing<br>3. Login with the sharee<br>4. Try to share the file/folder by handling privileges<br>5. Tap on "done"| An error is shown
24|Changing password|1. Swipe to share a file/folder with privileges<br>2. In server, change the password of the user<br>3. Try to share the file/folder by handling privileges<br>4. Tap on "done"| Credentials are required
25|Delete file|1. Swipe to share a file/folder with privileges<br>2. In server, delete the file<br>3. Tap on "done"|An error is shown
26|Delete user|1. Swipe to share a file/folder with privileges, selecting an user<br>2. In server, delete the user to share with<br>3. Tap on "done"|An error is shown
**Shibboleth**|
27|Share in shibboleth|Share a file granting/banning privileges in a shibboleth server|The privileges are correctly managed
**Special servers**|
28|LDAP|Share a file granting/banning privileges in a server with LDAP enabled|The privileges are correctly managed with LDAP users
29|Self signed|Share a file granting/banning privileges in a self signed server|The privileges are correctly managed
30|No self signed|Share a file granting/banning privileges in a no self signed server|The privileges are correctly managed
31|Redirect|Share a file granting/banning privileges in a redirect server|The privileges are correctly managed
