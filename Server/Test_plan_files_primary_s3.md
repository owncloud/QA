| Test Case                                | Expected Result                          | Result         | Related Comment |
| ---------------------------------------- | ---------------------------------------- | -------------- | --------------- |
| *Previous requirements: Have a primary storage configured for every file in the system (Scality or Ceph preferred, Minio is not officially supported)* |                                          |                |                 |
| Create 3 users, upload several files with user1, share some with user2, using user2 share some with user3. Using user3 download one of the files. | No problems. User3 can download the file. | :construction: |                 |
| Rename a file, in root and in a subsubfolder. | Files are renamed without problems.      | :construction: |                 |
| Using cadaver, copy a file from root to a subsubfolder. | Files are copied without problems.       | :construction: |                 |
| Connect desktop client. Sync a small file of about 1MiB. | File is uploaded and downloaded correctly. | :construction: |                 |
| Connect desktop client. Sync a file up to 256MiB, download it. | File is uploaded and downloaded correctly. | :construction: |                 |
| Federate share a folder and a file with another server which doesn't use objectstore. | Receiver can interact with the folder and file shared. | 🚧             |                 |
| Federate share a folder and a file from another server which doesn't use objectstore with the server using objectstore. | User in objectstore server can interact with the folder shared. | 🚧             |                 |
| Favorite several files and folders. Unfavorite them. Refresh page. | Files are favorited and unfavorited without problems. Check that state remains after refreshing. | :construction: |                 |
| Public share a folder and a file.        | Folder and file can be used normally by anonymous users. | :construction: |                 |
| Add comments to a shared file with several users. | No errors found.                         | :construction: |                 |
| Add comments to a shared folder with several users. | No errors found.                         | :construction: |                 |
| Add tags to a shared folder with several users. | No errors found.                         | :construction: |                 |
| Search tags previously assigned.         | No errors found.                         | :construction: |                 |
| Check that activity is correctly recorded. | No errors found.                         | :construction: |                 |
| Set logging level to INFO. Check that user file actions are logged by admin audit. | Actions are logged correctly.            | :construction: |                 |
| Using the URL provided by user1: 1. enter the link.(without being logged in, use a different browser or have the cache cleaned) 2. Upload an existing file. | You can choose between cancel the upload and renaming the file. | :construction: |                 |
| Enable encryption. Upload files, download it, move them. | Files can be uploaded and downloaded without problems. | :construction: |                 |
| **Known issues from the past**           |                                          |                |                 |
| As admin user create a user "user1" and share a folder "SHARED" with "user1". As "user1" upload some files to root folder. Favorite them, add comments and tags. Move those files into "SHARED" folder received from admin user. | FileID should be kept after moving to a shared folder as recipient. All metadata must still be there, favorites, comments and tags. | :construction: |                 |
| As admin user upload a file bigger than 5GB using web ui. | File can be uploaded, finishing correctly joining the chunks without problems. | :construction: |                 |
| As admin user connect desktop client and sync a file bigger than 5GB. | File can be uploaded, finishing correctly joining the chunks without problems. | :construction: |                 |
| As admin user upload a new file to the root folder. Check versions of that file. | It doesn't have any version. No version is created when uploading a new file. | :construction: |                 |
| As admin user create three users "user1", "user2" and "user3".  As "user1" upload a file "file.txt".  As "user1" share "file.txt" with "user3".  Run occ files:transfer-ownership user1 user2. | "user2" gets "user1"'s files, including shares."user3" can still have access to the shared file "file.txt". | :construction: |                 |
