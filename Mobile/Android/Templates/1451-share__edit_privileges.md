### Sharing privileges

#### Pr: https://github.com/owncloud/android/pull/1451

Devices: 

Server version: 

<br>
 
Test Case ID | Test case     | Steps   | Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------------|:-------------|:-------------:|----------
**Menu views**|
1|New file sharing options| 1. Long press in a file to share with users/groups<br>2. Tap on "add user or group" and add one of them<br>3. Tap on handle privileges|2. A badget is shown to handle privileges<br>3. Two options are displayed: "can share" and "can edit". On the top appears the name of user/group to share with | 
2|New folder sharing options| 1. Long press in a folder to share with users/groups<br>2. Tap on "add user or group" and add one of them<br>3. Tap on handle privileges<br>4. Enable "can edit" option|2. A badget is shown to handle privileges<br>3. Two options are displayed: "can share" and "can edit"<br>4. Three more options are displayed: "create", "change", "delete". On the top appears the name of user/group to share with 
|**Orientations**|
3|Portrait| From 1 or 2, set on portrait the view of sharing privileges| The view is correcly displayed | 
4|Landscape| From 1 or 2, set on landscape the view of sharing privileges| The view is correcly displayed 
| **Privileges**|
5|Can share|1. Long press to share a file/folder with special characters<br>2. Select a user/group and grant it to share<br>3. Login with the sharee<br>4. Share the file/folder with other users| 3. The sharee can see the file<br>4. File/folder is correctly shared |
6|Can not share|1. Long press to share a file/folder<br>2. Select a user/group but does not grant to share<br>3. Login with the sharee<br>4. Share the file/folder with other users| 3. The sharee can see the file<br>4. The file/folder can not be shared | 
7|Can edit file|1. Long press to share a file<br>2. Select a user/group and grant it to edit<br>3. Login with the sharee<br>4. Try to edit the file with an external app| 3. The sharee can see the file<br>4. The file is correctly edited | 
8|Can not edit file|1. Long press to share a file<br>2. Select a user/group but does not grant it to edit<br>3. Login with the sharee<br>4. Try to edit the file with an external app| 3. The sharee can see the file<br>4. The file can not be edited | 
9|Can create folder|1. Long press to share a folder<br>2. Select a user/group and grant it to create<br>3. Login with the sharee<br>4. Try to create/upload a file into the folder| 3. The sharee can see the file<br>4. The file is correctly created/uploaded |
10|Can not create folder|1. Long press to share a folder<br>2. Select a user/group but does not grant it to create<br>3. Login with the sharee<br>4. Try to create a file into the folder with an external app| 3. The sharee can see the file<br>4. The file can not be created/uploaded | 
11|Can change folder|1. Long press to share a folder<br>2. Select a user/group and grant it to change<br>3. Login with the sharee<br>4. Try to edit a file into the folder with an external app| 3. The sharee can see the folder<br>4. The file into the folder is correctly changed | 
12|Can not change folder|1. Long press to share a folder<br>2. Select a user/group but does not grant it to change<br>3. Login with the sharee<br>4. Try to edit a file into the folder file with an external app| 3. The sharee can see the file<br>4. The file into the folder can not be changed | 
13|Can delete folder|1. Long press to share a folder<br>2. Select a user/group and grant it to delete<br>3. Login with the sharee<br>4. Try to delete a file into the folder| 3. The sharee can see the file<br>4. The file is correctly deleted |
14|Can not delete folder|1. Long press to share a folder<br>2. Select a user/group but does not grant it to delete<br>3. Login with the sharee<br>4. Try to delete a file into the folder| 3. The sharee can see the file<br>4. The file can not be deleted | 
15|Can not edit folder|1. Long press to share a folder<br>2. Select a user/group but does not grant it to edit<br>3. Login with the sharee<br>4. Try to edit files (create/change/delete) with an external app| 3. The sharee can see the file<br>4. The file can not be edited | 
16|Stop sharing|1. Long press to share a file/folder<br>2. Select a user/group and grant it some privileges<br>3. Login with the sharee<br>4. Login again with the sharing user and long press to handle sharing privileges<br>5. Tap on "stop sharing"| 3. The sharee can see the file<br>5. Check that the sharee can not see the file/folder| 
17|Privileges in server|1. Login on server<br>2. Grant a file/folder some privileges<br>3. Login on app| Check that the granted privileges on server are visible in mobile app | 
18|Privileges in app|1. Login on app<br>2. Grant a file/folder some privileges<br>3. Login on server| Check that the granted privileges on app are visible in server | 
19|Several sharees|1. Share a file/folder with several users granting them different privileges<br>|Each sharee can only manage the file/folder according his privileges | 
20|Several files|1. Share several files/folders with a user/group granting him different privileges<br>|The user/group can only manage the files/folders according his privileges| 
**Re-sharing privileges**|
21|Re-share with all privileges| 1. Swipe to share a folder with user1<br>2. Grant user1 to edit (all privileges) and share <br> 3. Login with user1<br>4. Swipe to re-share the folder with some different privileges| The folder can be reshared |
22|Re-share with share and without edit| 1. Swipe to share a folder with user1<br>2. Grant user1 to share but not to edit <br> 3. Login with user1<br>4. Swipe to re-share the folder with user2 granting edit<br>5. Re-share the folder with user2 granting share but not edit|  4. The folder can not be reshared<br> 5. The folder can be reshared | 
23|Re-share with edit and without share| 1. Swipe to share a folder with user1<br>2. Grant user1 to edit (all edit privileges) but not to share <br> 3. Login with user1<br>4. Swipe to re-share the folder with user2 granting share<br>| The folder can not be reshared| 
24|Re-share with edit (not all) and without share| 1. Swipe to share a folder with user1<br>2. Grant user1 to edit (some edit privileges) but not to share <br> 3. Login with user1<br>4. Swipe to re-share the folder with user2 | The folder can not be reshared |
25|Re-share without edit + share| 1. Swipe to share a folder with user1<br>2. Grant user1 to share but not to edit <br> 3. Login with user1<br>4. Swipe to re-share the folder with user2 granting more permissions than read<br>5. Re-share the folder with user2 granting minimim permissions| 4. The folder can not be reshared<br> 5. The folder can be reshared | 
26|Re-share with edit + share| 1. Swipe to share a folder with user1<br>2. Grant user1 to share but some privileges of editing <br> 3. Login with user1<br>4. Swipe to re-share the folder with user2 granting more permissions than the granted <br>5. Re-share the folder with user2 granting the same permissions| 4. The folder can not be reshared<br> 5. The folder can be reshared | 
**Errors**|
27|No connection|1. Long press to share a file/folder with privileges<br>2. Switch the device connection off<br>3. Change the privileges<br>4. Tap on "done"| An error is shown | 
28|Server down|1. Long press to share a file/folder with privileges<br>2. Server down<br>3. Change the privileges<br>4. Tap on "done"| An error is shown |
29|Sharing API disabled|1. Long press to share a file/folder with privileges<br>2. In server, disable the sharing API<br>3. Change the privileges<br>4. Tap on "done"| An error is shown | 
30|Resharing disabled|1. Long press to share a file/folder with privilege of sharing<br>2. In server, disable the resharing<br>3. Login with the sharee<br>4. Try to share the file/folder by handling privileges<br>5. Tap on "done"| An error is shown | 
31|Changing password|1. Long press to share a file/folder with privileges<br>2. In server, change the password of the user<br>3. Try to share the file/folder by handling privileges<br>4. Tap on "done"| Credentials are required | 
32|Delete file|1. Long press to share a file/folder with privileges<br>2. In server, delete the file<br>3. Tap on "done"|An error is shown | 
33|Delete user|1. Long press to share a file/folder with privileges, selecting an user<br>2. In server, delete the user to share with<br>3. Tap on "done"|An error is shown|
**Shibboleth**| 1 device
34|Share in shibboleth|Share a file granting/banning privileges in a shibboleth server|The privileges are correctly managed | 
**Special servers**|
35|LDAP|Share a file granting/banning privileges in a server with LDAP enabled|The privileges are correctly managed with LDAP users | 
36|Self signed|Share a file granting/banning privileges in a self signed server|The privileges are correctly managed|
38|No self signed|Share a file granting/banning privileges in a no self signed server|The privileges are correctly managed | 
39|Redirect|Share a file granting/banning privileges in a redirect server|The privileges are correctly managed | 