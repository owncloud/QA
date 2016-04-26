## Test plan Simplified smoke test.

| Test Case                                | Expected Result                          | Result      | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ----------- | --------------- |
| **Web UI**                               |                                          |             |                 |
| Login with admin user.                   | Admin logs in.                           | :construct: |                 |
| Create a text file.                      | Text editor can open, file is saved.     | :construct: |                 |
| Modify a text file.                      | File can be modified, no problems found. | :construct: |                 |
| Rename a file.                           | File is renamed.                         | :construct: |                 |
| Upload a file.                           | File is uploaded, no problems found.     | :construct: |                 |
| Overwrite a file by uploading a new version. | File is uploaded and overwritten, no problems found. | :construct: |                 |
| Remove a file.                           | File is removed correctly, it appears in the trashbin. | :construct: |                 |
| Move a file inside a folder.             | There are not problems on the process.   | :construct: |                 |
| Create a folder.                         | Folder is created, no MKCOL problems appear. | :construct: |                 |
| Delete a folder.                         | Folder is removed.                       | :construct: |                 |
| Move a folder inside another.            | No problems while moving the folder.     | :construct: |                 |
| Share a file by link.                    | Link is created and can be accessed.     | :construct: |                 |
| Share a file with another user.          | It is shared correctly.                  | :construct: |                 |
| Share a file with a group.               | It is shared correctly.                  | :construct: |                 |
| Share a file with another user in another server. | Federated shared happens correctly.      | :construct: |                 |
| Share a folder with userB giving edit permissions, As userB open the recieved folder, download files inside, open them. Upload new files. Modify files and delete them. | userB doesn't find any problem while interacting with files. | :construct: |                 |
| Federate share a folder giving edit permissions with userB in serverB, As userB open the recieved folder, download files inside, open them. Upload new files. Modify files and delete them. | userB doesn't find any problem while interacting with files. | :construct: |                 |
| **Desktop Client**                       |                                          |             |                 |
| Set up two clients with the same user. Change files, add some, delete some, move some, create folders. | Changes sync properly in both clients without errors. | :construct: |                 |
| Share a file using contextual menu with userB. | Option to share appears in the contextual menu and file is correctly shared. | :construct: |                 |
| **Mobile Clients** (iOS \|\| Android)    |                                          |             |                 |
| Connect to server, see files, download one. | No problems while downloading.           | :construct: |                 |
| Upload a file using mobile client.       | No problems while uploading.             | :construct: |                 |
| Share a file with userB using mobile client. | File is correctly shared.                | :construct: |                 |


