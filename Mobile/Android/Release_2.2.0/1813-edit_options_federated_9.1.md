###  Share option federated shares v9.1 

#### Pr: https://github.com/owncloud/android/pull/1813

Devices: Nexus5 v6, Galaxy Note4 v6, Nexus 7 v4.3

Server: 9.1, 9.0, 8.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Server v9.1**||||||
| 1 | Folders | 1. Login in server 9.1<br>2. Share a folder with a user in another server<br>3. Tap on (>) | "Can edit" enabled shows the options "create", "change", "delete" (check in both orientations) | P m6 t4 |  |
| 2 | Files | 1. Login in server 9.1<br>2. Share a file with a user in another server<br>3. Tap on (>) | "Can edit" enabled does not show any aditional option (check in both orientations) | P m6 t4|  |
|**Server v9.0**||||||
| 3 | Folders | 1. Login in server 9.0<br>2. Share a folder with a user in another server<br>3. Tap on (>) | "Can edit" enabled does not show any aditional option (check in both orientations) | P m6 t4|  |
| 4 | Files | 1. Login in server 9.0<br>2. Share a file with a user in another server<br>3. Tap on (>) | "Can edit" enabled does not show any aditional option (check in both orientations) | P m6 t4|  |
|**Server v8.2**||||||
| 5 | Folders | 1. Login in server 8.2<br>2. Share a folder with a user in another server<br>3. Tap on (>) | "Can edit" enabled does not show any aditional option (check in both orientations) | P m6 t4|  |
| 6 | Files | 1. Login in server 8.2<br>2. Share a file with a user in another server<br>3. Tap on (>) | "Can edit" enabled does not show any aditional option (check in both orientations) | P m6 t4|  |
|**Actions (v9.1)**||||||
| 7 | Whole Edit permission | 1. Share a folder with a user in another server<br>2. Tap on (>) and grant edit permission with all subpermissions<br>3. Login with the sharee and accept the federated share<br>4. Upload some content to the folder<br>5. Delete content from the folder<br>6. Change some content of the folder| 3. Folder appears in sharee's file list<br>4. Upload is allowed<br>5. Delete is allowed<br>6. Update is allowed | P m6 t4| |
| 8 | No Edit permission | 1. Share a folder with a user in another server<br>2. Tap on (>) and revoke edit permission<br>3. Login with the sharee and accept the federated share<br>4. Upload some content to the folder<br>5. Delete content from the folder<br>6. Change some content of the folder| 3. Folder appears in sharee's file list<br>4. Upload is not allowed<br>5. Delete is not allowed<br>6. Update is not allowed | P m6 t4|   |
| 9 | Create | 1. Share a folder with a user in another server<br>2. Tap on (>) and grant only "create" permission<br>3. Login with the sharee and accept the federated share<br>4. Upload some content to the folder<br>5. Delete content from the folder<br>6. Change some content of the folder| 3. Folder appears in sharee's file list<br>4. Upload is allowed<br>5. Delete is not allowed<br>6. Update is not allowed | P m6 t4|  Server issue #26173 solved |
| 10 | Change | 1. Share a folder with a user in another server<br>2. Tap on (>) and grant only "change" permission<br>3. Login with the sharee and accept the federated share<br>4. Upload some content to the folder<br>5. Delete content from the folder<br>6. Change some content of the folder| 3. Folder appears in sharee's file list<br>4. Upload is not allowed<br>5. Delete is not allowed<br>6. Update is allowed | P m6 t4| Server issue #26173 solved |
| 11 | Delete | 1. Share a folder with a user in another server<br>2. Tap on (>) and grant only "delete" permission<br>3. Login with the sharee and accept the federated share<br>4. Upload some content to the folder<br>5. Delete content from the folder<br>6. Change some content of the folder| 3. Folder appears in sharee's file list<br>4. Upload is not allowed<br>5. Delete is allowed<br>6. Update is not allowed | P m6 t4|  |
