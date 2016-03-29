## 'Files transfer ownership' Test Plan


## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**files:transfer-ownership** |  |   |
|  |   |
Transfer files/folder ownership with shares and federated shares included from user1 to user2 | The files/folders are transferred to user2  and they do not appear for user1 any longer| :construction:  |
Try to transfer files/folder ownership with shares and federated shares included from user1 to user2, user1 does not exist in the server| An error message related to user1 is shown | :construction:  |
Try to transfer files/folder ownership from user1 to user2, user2 does not exist in the server| An error message related to user2 is shown | :construction:  |
Transfer files/folder ownership with shares and federated shares included from shibboleth to regular user| The files/folders are transferred to regular user and they do not appear for shibboleth user any longer | :construction:  |
Transfer files/folder ownership with shares and federated shares included from regular to shibboleth user| The files/folders are transferred to shibboleth user and they do not appear for regular user any longer | :construction:  |
Transfer files/folder ownership with shares and federated shares included from LDAP user (user id) to regular user| The files/folders are transferred to regular user and they do not appear for LDAP user any longer | :construction:  |
Transfer files/folder ownership with shares and federated shares included from regular user to LDAP user (user id) | The files/folders are transferred to regular user and they do not appear for LDAP user any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1" | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" shares folder with files with "user2" and "user3" | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |

Transfer from user1 to user2, both users are in group "group1". "User1" shares subfolder with files with "user2" and "user3" | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" shares subfolder with files with "user2" and "user3" | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". check that share permissions are kept | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" shares folder with group "group1" (in which the user is member) | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" shares folder with group "group1" (in which the user is not member) | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" shares folder with group "group1", "user2" renamed target folder | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" has link share | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" is recipient of local shares => incoming shares not kept | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" is recipient of fed shares => incoming shares not kept | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". "User1" has outgoing fed shares => they are still accessible after transfer | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". Metadata still exists (activity, system tags, comments) | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". Favorite information not kept for target user (?) | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". Non-decrypted encrypted files | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |
Transfer from user1 to user2, both users are in group "group1". Transfer after manually decrypting files | The files/folders are transferred to user2 and they do not appear for user1 any longer | :construction:  |


