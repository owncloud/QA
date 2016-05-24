## Federated sharing

Previous requirements

**Server A**

- **ownCloud Version**:


- **Encryption enabled?**:

**Server B**

- **ownCloud Version**:


- **Encryption enabled?**:

**Server C**

- **ownCloud Version**:


- **Encryption enabled?**:



| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| **Federated share**                      |                                          |                |                 |
| share a file (server A) to (server B)    | shared file can be seen from the server B | :construction: |                 |
| share a folder (server A) to (server B)  | shared folder can be seen from the server B and access to its contents | :construction: |                 |
| unshare a file / folder in your owncloud (server B) | shared file is no longer visible from the server B | :construction: |                 |
| share a file (server A) in (server B), delete file in server A | shared file is no longer visible from the server B | :construction: |                 |
| share a file password-protected (server A) with the correct password (server B) | shared file can be seen from the server B | :construction: |                 |
| share a file (server A) with a wrong password (server B) | Error is notified and file isn't visible | :construction: |                 |
| share a file password-protected (server A), with the correct password (server B), change the password (server A) | file isn't accessible anymore            | :construction: |                 |
| share a folder (server A) allowing editing (server B), upload a file inside the folder (server B) | file is shown in server A                | :construction: |                 |
| share a file (server A) in (server B), update the file in server A | file is updated in server B              | :construction: |                 |
| share a file  (server A), in (server B) using an openLDAP user | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A), in (server B) using an Active Directory user | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A) in (server B) using different oC versions | shared file can be seen from the server B | :construction: |                 |
| share a file (server A), in (server B) using different oC versions | shared file can be seen from the server B | :construction: |                 |
| share a file (server A), in (server B) using different oC versions both servers with encryption | shared file can be seen from the server B | :construction: |                 |
| share a file (server A) to (server B) and edit it | shared file can be seen modified from the server B | :construction: |                 |
| share a file (server A) to (server B) and edit it from B. (Allowed editing marked when sharing) | shared file can be seen modified from both servers. | :construction: |                 |
| share a folder (server A) to (server B) and edit it | shared folder can be seen modified from the server B | :construction: |                 |
| share a file (server A) to (server B) and rename it in A | shared file in A is seen with the new name and old named in B | :construction: |                 |
| share a file (server A) to (server B) and rename it from B | shared file can be seen renamed from the server B and old named in A | :construction: |                 |
| share a folder (server A) to (server B) and rename it in A | shared folder can be seen renamed from the server B | :construction: |                 |
| share a folder (server A) to (server B) and rename it in B | shared folder can be seen renamed from the server B and old named in A | :construction: |                 |
| share a folder (server A) to (server B) and rename a file in dir | shared file can be seen renamed from the server B | :construction: |                 |
| share a folder (server A) to (server B) and rename a file in dir B | shared file can be seen renamed from both servers | :construction: |                 |
| share a folder (server A) to (server B) and delete a file in dir B | shared file can be seen only in server A | :construction: |                 |
| share a folder (server A) to (server B) and add files in dir in B | added files can be seen in both servers  | :construction: |                 |
| share a file (server A) to (server B) with a group in B | shared file can be seen from the group of server B | :construction: |                 |
| **Federated shared links**               |                                          |                |                 |
| share a file with link (server A), add link to your owncloud (server B) | shared file can be seen from the server B | :construction: |                 |
| share a folder with link (server A), add link to your owncloud (server B) | shared folder can be seen from the server B and access to its contents | :construction: |                 |
| unshare a file / folder in your owncloud (server B) | shared file is no longer visible from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B), delete file in server A | shared file is no longer visible from the server B | :construction: |                 |
| share a file with link password-protected (server A), add link to your owncloud with the correct password (server B) | shared file can be seen from the server B | :construction: |                 |
| share a file with link password-protected (server A), add link to your owncloud with a wrong password (server B) | Error is notified and file isn't visible | :construction: |                 |
| share a file with link password-protected (server A), add link to your owncloud with the correct password (server B), change the password (server A) | file isn't accessible anymore            | :construction: |                 |
| share a folder with link (server A) allowing editing, add link to your owncloud (server B), upload a file inside the folder (server B) | file is shown in server A                | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B), update the file in server A | file is updated in server B              | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) using an openLDAP user | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) using an Active Directory user | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) using different O.C versions | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) using different O.C versions | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) using different O.C versions both servers with encryption | shared file can be seen from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) and modify the file from server A | shared file can be seen modified from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) and modify the file from server B (allow editing marked when sharing) | shared file can be seen modified from both servers. | :construction: |                 |
| share a folder with link (server A), add link to your owncloud (server B) and modify the folder | shared folder can be seen from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) and rename the file | shared file can be seen renamed from the server B | :construction: |                 |
| share a file with link (server A), add link to your owncloud (server B) and rename the file | shared file can be seen renamed from the server B and old named in A | :construction: |                 |
| share a folder with link (server A), add link to your owncloud (server B) and rename the folder | shared folder can be seen renamed from the server B | :construction: |                 |
| share a folder with link (server A) to (server B) and add files in dir in B | added files can be seen in both servers  | :construction: |                 |
| share a folder with link (server A) to (server B) and delete a file in dir B | shared file can be seen only in server A | :construction: |                 |
| share a folder with link (server A) to (server B) and rename a file in dir B | shared file can be seen renamed from both servers | :construction: |                 |
| share a file with link (server A) to (server B) with a group in B | shared file can be seen from the group of server B | :construction: |                 |
| **Resharing**                            |                                          |                |                 |
| share a file  (server A -> server B -> server C) | file is visible in the 3 servers         | :construction: |                 |
| share a file  (server A -> server B -> server C) with at least two different oC. Versions | file is visible in the 3 servers         | :construction: |                 |
| share a file (server A -> server B -> server C) Server A,B,C with encryption enabled | file is visible in the 3 servers         | :construction: |                 |
| share a file  (server A -> server B -> server C) Server A with encryption enabled | file is visible in the 3 servers         | :construction: |                 |
| share a file (server A -> server B -> server C) Server C with encryption enabled. | file is visible in the 3 servers         | :construction: |                 |
| share a folder (server A -> server B -> server C) | folder contents are visible in the 3 servers | :construction: |                 |
| share a folder (server A -> server B -> server C) Server A,B,C with encryption enabled | folder contents are visible in the 3 servers | :construction: |                 |
| share a file (server A -> server B -> server C), unshare the file in server B | User in server C can still see the shared file. | :construction: |                 |
| share a file  (server A -> server B -> server C), delete file in server A | file is no longer visible in any server  | :construction: |                 |
| share a file password-protected (server A), with the correct password (server B), and to the server C | shared file can be seen from the server C | :construction: |                 |
| share a file password-protected (server A), with the correct password (server B), and to server C, change the password (server A) | file isn't accessible anymore in server B neither C | :construction: |                 |
| share a folder (server A) allowing editing, (server B), and to server C, upload a file inside the folder (server C) | file is shown in server A                | :construction: |                 |
| share a file (server A) in (server B), and to server C, update the file in server A | file is updated in server B              | :construction: |                 |
| share a file  (server A -> server B -> server C) and modify the file | file is visible in the 3 servers modified | :construction: |                 |
| share a folder  (server A -> server B -> server C) and modify the folder | folder is visible in the 3 servers modified | :construction: |                 |
| share a file  (server A -> server B -> server C) and rename the file | file is visible in the 3 servers renamed | :construction: |                 |
| share a folder  (server A -> server B -> server C) and rename the folder | folder is visible in the 3 servers renamed | :construction: |                 |
| share a folder  (server A -> server B -> server C) change permissions of the folder. | permissions are propagated across servers. | :construction: |                 |

