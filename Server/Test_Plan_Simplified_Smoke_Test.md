## Test plan Simplified smoke test

- Template: https://github.com/owncloud/QA/blob/master/Server/Test_Plan_Simplified_Smoke_Test.md


| Test Case                                | Expected Result                          | Result      | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ----------- | --------------- |
| **Automated Checks**                     |                                          |             |                 |
| Travis nightly cron job with UI tests on chrome, firefox, Edge, IE11 | All tests pass on the release branch | :construction: | Note: IE11 tests have intermittent issues with IE webdriver, it is acceptable to restart failed test suites to see that they will pass |
| **Web UI**                               |                                          |             |                 |
| Login with admin user.                   | Admin logs in.                           | :gear: |                 |
| Create a text file.                      | Text editor can open, file is saved.     | :gear: |                 |
| Modify a text file.                      | File can be modified, no problems found. | :gear: |                 |
| Rename a file.                           | File is renamed.                         | :gear: |                 |
| Upload a file.                           | File is uploaded, no problems found.     | :gear: |                 |
| Overwrite a file by uploading a new version. | File is uploaded and overwritten, no problems found. | :gear: |                 |
| Remove a file.                           | File is removed correctly, it appears in the trashbin. | :gear: |                 |
| Move a file inside a folder.             | There are not problems on the process.   | :gear: |                 |
| Create a folder.                         | Folder is created, no MKCOL problems appear. | :gear: |                 |
| Delete a folder.                         | Folder is removed.                       | :gear: |                 |
| Move a folder inside another.            | No problems while moving the folder.     | :gear: |                 |
| Share a file by private link.            | Link is created and can be accessed.     | :gear: |                 |
| Share a file by public link.             | Link is created and can be accessed.     | :gear: |                 |
| Share a file with another user.          | It is shared correctly.                  | :gear: |                 |
| Share a file with a group.               | It is shared correctly.                  | :gear: |                 |
| Share a file with another user in another server. | Federated sharing happens correctly.      | :gear: |                 |
| Share a folder with userB giving edit permissions. As userB open the received folder, download files inside, open them. Upload new files. Modify files and delete them. | userB doesn't find any problem while interacting with files. | :gear: |                 |
| Federate share a folder giving edit permissions with userB in serverB, As userB open the received folder, download files inside, open them. Upload new files. Modify files and delete them. | userB doesn't find any problem while interacting with files. | :gear: |                 |
| Mobile view test with galaxy s9 as "Smallest device" | All elements reachable | :construction: | |
| **Desktop Client**                       |                                          |             |                 |
| Set up two clients with the same user. Change files, add some, delete some, move some, create folders. | Changes sync properly in both clients without errors. | :construction: |                 |
| Share a file using contextual menu with userB. | Option to share appears in the contextual menu and file is correctly shared. | :construction: |                 |
| **Mobile Clients** (iOS \|\| Android)    |                                          |             |                 |
| Connect to server, see files, download one. | No problems while downloading.           | :construction: |                 |
| Upload a file using mobile client.       | No problems while uploading.             | :construction: |                 |
| Share a file with userB using mobile client. | File is correctly shared.                | :construction: |                 |



