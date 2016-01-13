# Regression test for the Desktop Client

## Previous requirements

Have a Desktop Client vX.X.X ready to be used with owncloud.

Prepare a OC server with ssl actived and trusted certificates.

Have a LDAP server ready to be used with owncloud.

Have an Active Directory server ready to be used with owncloud.

Have ready two external storage of your choice (e.g S3)

## Testing

### 1. Settings windows - Login

TestID | Test Case | Steps to reprouce |Expected Result |Result| Related Comment
------------ | ------------- | ------------- | ------- | ----- | ------
1 | Update Installation | 1. You need to have installed a previous version 2. Update the new version ||:construction:| |
2 | Install the new version (with url: HTTPS) | 1. Delete the previous version 2. Install the new version || :construction: | |
3 | Install the new version (with url: HTTP) | 1. Delete the previous version 2. Install the new version || :construction: | |
4 | Verify that you can introduce the server address | 1. Lauch desktop app 2. Introduce the server address 3. Click on Next 4 If it the first time you should accept the certification- click on the checkbox and OK (The lock is shown in green -the server si validated SSL connection window is opened, if it is the first time an you have to accept the certification| | :construction: | https://github.com/owncloud/client/issues/3751 (**backlog**) |
5 | Introduce username/password  | 1. Fill in username and password |If the credentials are not correct it is shown a message "Error: Wrong credentials" |:construction: | |
6 | Verify that all the account is synced in the local folder | 1. Choose to sync everything from server (default option) 2. Select the local folder desirable | All the account is sync in the local folder|:construction: | |
7 | Verify that only he folder selected are sync in the local folder  | 1. Click on Choose what to sync 2. The remote folder are shown, select which you want to sync 3. Select the local folder |The remote folders selecter are sync |:construction: | |
8 | Verify that you can skip folder configuration | 1. Click on skip folders configuration | The setting window is opened neither local and remote folders are configurate  |:construction: | https://github.com/owncloud/client/issues/3846 (**backlog**)|
9 | Install version with SHIB  | 1. Install version 2. Introduce the user account with SHIB  |All the account is sync with the User SHIB| :construction: | |
10 | Sesion expiration with SHIBB | 1. Login with SHIB 2. Wait for SHIB session expiration |The Desktop sync client show the login (WebKit) windows after the SHIB sessions terminates| :construction: | |
11 | Install the new version with LDAP Server | 1. Install the new version with LDAP server || :construction: | |
12 | Install the new version with Active Directory server | 1. Install the new version with Active Directory server || :construction: | |

### 2. Folders

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Verify that you can create one folder  | 1. Go to local sync folder 2. Create a single folder 3. Wait for it to sync to Via Web|The folder is created on Via Website| :construction: | |
2 | Verify that you can create one folder with long name  | 1. Go to local sync folder 2. Create a single folder with a logn name (59 characters+a terminating zero bytes) 3. Wait for it to sync to Via Web |The folder is created on Via Website| :construction: | |
3 | Verify that you can create one folder with special characters in the name | 1. Go to local sync folder 2. Create a single folder with a special characters in the name (e.g $%ñ&) 3. Wait for it to sync to Via Web | The folder is created on Via Website| :construction: | |
4| Verify that you can sync five subfolders | 1. Go to local sync folder 2. Copy a folder with 5 subfolders 3. Wait for it to sync to Via Web |The folder are created on Via Website  |:construction: | |
5| Verify that you can sync five subfolders with files | 1. Go to local sync folder 2. Copy a folder with 5 subfolders + 10 files in each folder 3. Wait for it to sync to Via Web |The folder and the files are created on Via Website |:construction: | |
6| Verify that you can create multiples folders at once | 1. Go to local sync folder 2. Create 400 folders on the root 3. Wait for it to sync to Via Web |The folders are created on Via Website| :construction: | |
7| Verify that you can copy one folder | 1. Go to local sync folder 2. Create a single folder with some files in it 3. Copy and paste the folder 4. Wait for it to sync to Via Web |The folder is created on Via Website| :construction: | |
8| Verify that you can create a subfolder with long name | 1. Go to local sync folder (Desktop client) 2. Create a folder called "Folder1" 3. Create a subfolder called "LUsgzq!0k02sek+szBqrzN5=R#UJpWql&rwhnYVb~Gh!l!” 4. This subfolder had a file called ilppng.PNG inside it 5. let them sync |The files are sync correctly| :construction: | |
9| Verify pre existing folders in local (Desktop client) are copied over to Via Web on startup | 1. Turn off the Desktop client 2. Go to local sync folder 3. Create several folders inside the Desktop Client folder at several different levels 4. Turn ON the Desktop Client 5. Log into Via Web |At Via Web the folder has been sync over| :construction: | |
10| Verify that invalid name in a file are not sync | 1. Go to local sync folder 2. Create a single folder 3. Sync 4.Move a file o folder with an invalid name in the directory (e.g a/a) | The sync status folder represent the status as failed|:construction: | |
11| Verify one empty folder with a leght longer than the allowed limit will not be sync | 1. Go to local sync folder 2. Create a single empty folder with a name longer than that allowed by ILP (more than 59 characters) 3. Look at the Via Web repository 4. Repeat this with a folder at the root level, and in various subfolders up to 5 levels deep 5. Sync |At the Via Web the folder has not been sync| :construction: | |
12| Sync works for .zip/.rar files with elaborate internal folder structures | 1. Create a .zip file with many inernal folders and files 2. Copy the .zip file to the Desktop Client folder 3. Unzip the .zip file inside th Destop Client folder |1. Make sure you get a popup saying that all the extracted files have sync. 2. Loos at Via Web and make sure that the folder has been sync over| :construction: | |
13| Files that error with API should try 3 times, and then blacklist | 1. Try to sync that is has a folder that has more than 65 characters 2. Then sync it with some contents, it should try three times and then be blacklisted 3. If you rename the folder it should try again, and succedd if the name is less than 65 characters |The folder is sync| :construction: | |
14| Invalid system names | 1. Navigate to the Via Web 2. Create a few folders with a invalid Windows sytem name: COM, AUX, COM1, LPT1, PRN, NULL |1. In Mac OS X the folders does sync 2. In Windows OS the folders does not sync| :construction: | |
15| Invalid system names | 1. Navigate to the Via Web 2. Create a few folders with a special characters "%" in the name || :construction: | |

### 3. Files

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Via User should see the single file on Via Web when the file is successfully sync in Desktop Client sync folder | 1. Drop one selected file in Desktop Cllient sync folder 2. User can see end receive notification from System tray that single file is successfully added in Desktop Cliente sync folder 3. Go to Desktop Client system tray icon and select launch Via Web| Verify that user can see that the single file is sync on Desktop Clien Sync folder and is available on Via Web| :construction: | |
2 | Via user should see the multiple file on Via Web when the files or folders are successfully sync in Desktop Client Sync folder | 1. Drop multiple selected files in Desktop Client Sync folder 2. User can see and receive notification from System tray that multiple files or folders are successfully added in Desktop Client Sync folder 3. Go to Desktop Client System tray icon and select launch Via Web|Verify that User can see that multiple files are sync on Desktop Client folder and are available on Via Web| :construction: | |
3| User adds file to the sync folder will show up in repository  | 1. Users see a completed icon overlay on the copied file(s) in the Desktop client folder 2. The Sync Files tab shows the files added in the Desktop Client folder from desktop|| :construction: | |
4| User adds the various types of files | 1. Microsoft word documents, Microsoft Excel, Microsoft Powerpoint, .JPG, .PDF, .MP3|The Sync files tab shoe all type of files added in th Desktop Client folder from desktop| :construction: | |
5| Long file name  | 1. Create a file with this name "dfkjsdfjksdkdfjsdfuidjfkdsjfksdjfksdjfksdjfksdjfksdjfkdsjfksdjfkdsjfkdsfjlsdkfjsdkjflksdjfklsdjfksdjfkdsjfkldsjfkldsjfkdsjfksdjfksdjfklsdjfklsdjflksdjflksdjfklsdjfklsdjfksdjfksdjfksdjfksdjfksdfjskdfjksdjfksdjfksdjfksdjfksd.pdf"|Sync is successful| :construction: | |
6| User copies/drag&drops multiple files at a time to the Sync folder | 1. Users see the completed icon overlay on all type of files in Desktop Client folder on Desktop. 2. The Sync files tab shows all type of files added in the Desktop Client folder from Desktop|Sync is successful| :construction: | |
7| Sync files at the same time| 1. Add a file of 1MB onthe local inside folder, and in the same time, add another file on the same remote folder (make sure that file is on the server before the client finishes)|Look at Via Web and the Desktop Client to make sure that the sync is correct| :construction: | |
8| Same name files, different extension | 1. Create the same name file with two differents extensions|The files are sync corectly| :construction: | |
9| Files with spaces in the name | 1. Move a file under the root sync folder with spaces in the name 2. Let them sync|The files are sync correctly| :construction: | |
10| Create and delete one file with special characters in the name| 1. Go to Desktop Client 2. Create a single folder 3. Move with in this folder a file with a special characters in the name fo example "~`!@#$^&()-_=+{[}];'," 4. Wait for the file to sync to the Via Web 5. Delete the file in Desktop Client |Look at Via Web and make sure that the file got deleted| :construction: | |
11| User copies large files to the Desktop Client folder on the Desktop| 1. User see in-progress overlay icon while upload is in progress in Desktop 2. User sees the completed sync icon overlay once the upload process is done|The Sync files tab shows file added in th Desktop Client folder from desktop| :construction: | |
12| upload 50Mb file| 1. Create a folder under sync folder 2. Copy a large file (50MB) in this folder|After several sync processes the file is correct| :construction: | |
13| Upload 150Mb files| 1. Upload a large .pdf (100-150MB) file through web browser|Sync is successful| :construction: | |
14| Upload 3000Mb files| 1. Upload a large .pdf (3GB) file through web browser|Sync is successful| :construction: | |
15| Upload 2048Mb files| 1. Upload a large file (2GB=2147483648 bytes) through web browser|Sync is successful| :construction: | |
16| Upload 1000Mb files| 1. Upload a folder 1000 file (1Mb each) |Sync is successful| :construction: | |
17| Upload 500Mb+500Mb files| 1. Upload two folders with 500 files each |Sync is successful| :construction: | |
18| Upload 1024Mb file| 1. Upload a 1GB file |Sync is successful| :construction: | |
19| Verify the limit of the quota| 1. Upload the necessary large files to fill the quota |Warning: "The available space of your workspace is running out, please delete some files to free space"| :construction: | |

### 4. Move files and folders

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Move from sublevels to root | 1. Move a couple of files (File1 and File2) with different content under the root sync folder 2. Let them sync 3. Move other file under the root sync folder| The content of files is correct | :construction: | |
2 | Move folder down | 1. Move one folder from sync root to a 5 deep level folder 2. Sync| The content of the folder is correct | :construction: | |
3 | Move folder up | 1. Move one folder from 5 deep level folder to the sync root 2. Sync| The content of the folder is correct | :construction: | |
4 | Move files from one folder another| 1. Move a couple of files under the root sync folder 2. Create a folder 3. Let them sync 4. Move the files to the new folder 5. Let them sync| The files in the correct size in Via Web| :construction: | |
5 | Move two or more folders down | 1. Move two or more folders from sync root to a 5 dep level folder 2. Sync| The content of the folder is correct | :construction: | |
6 | Move two or more folders up | 1. Move one folder from 5 deep level folder to the sync root 2. Sync| The content of the folder is correct | :construction: | |

### 5. Edit Files

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Edit a .txt file| 1. Create a .txt file in a sync folder 2. Edit some text 3. Wait for it to sync 4. Modify the .txt file and add more content 5. Wait for it to sync 6. Modify the .txt file and add more content 7. Wait for it to sync | The file at Via Web had the same contet after the sync is completed| :construction: | |
2 | Edit a .doc file| 1. Create a .doc file in a sync folder 2. Edit some text 3. Wait for it to sync 4. Modify the .doc file and add more content 5. Wait for it to sync 6. Modify the .txt file and add more content 7. Wait for it to sync | The file at Via Web had the same contet after the sync is completed| :construction: | |
3 | Edit a .xls file| 1. Create a .xls file in a sync folder 2. Edit some content 3. Wait for it to sync 4. Modify the .xls file and add more content 5. Wait for it to sync 6. Modify the .xls file and add more content 7. Wait for it to sync | The file at Via Web had the same contet after the sync is completed| :construction: | |
4 | Edit a .pdf file| 1. Create a .pdf file in a sync folder 2. Edit some content 3. Wait for it to sync 4. Modify the .pdf file and add more content 5. Wait for it to sync 6. Modify the .pdf file and add more content 7. Wait for it to sync | The file at Via Web had the same contet after the sync is completed| :construction: | |
5 | Edit a file without refreshing| 1. 1. You should had any kind of file alredy sync 2. Go to Desktop Client 3. Open the file and edit it 4. Go to the Vua Web and leave the page open 5. Sync with the oc-worker 6. Do not refresh the Via Web and download the file edited| The file at Via Web had the same content| :construction: | |
6 | Edit a file while the folder is renaming 1. You should had any kind of file already sync 2. Go to Desktop Client 3. Open the file and edit it 4. Go to the Via Web and rename the folder 5. Sync with the oc-worker 6. Do not refresh the Via Web and download the file edited | The file at Via Web had the same contet| :construction: | |

### 6. Delete Files and Folders

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Delete one file| 1. Go to Desktop Client 2. Create or copy a single file with a short name (less than 20 characters) 3. Wait for the file to sync to the Via Web 4. Delete the file in Desktop Client|The file is been deleted on Via Web| :construction: | |
2 | Delete one file with long name| 1. Go to Desktop Client 2. Create or copy a single file with a long name (more than 240 characters) 3. Wait for the file to sync to the Via Web 4. Delete the file in Desktop Client|The folder is been deleted on Via Web| :construction: | |
3 | Delete one folder| 1. Go to Desktop Client 2. Create a single folder with a short name (more than 20 characters) 3. Wait for the folder to sync to the Via Web 4. Delete the folder in Desktop Client|The folder is been deleted on Via Web| :construction: | |
4 | Delete one folder with long name| 1. Go to Desktop Client 2. Create a single folder with a long name (59 characters+a terminating zero bytes) 3. Wait for the folder to sync to the Via Web 4. Delete the folder in Desktop Client|The folder is been deleted on Via Web| :construction: | |
5 | Delete multiple files| 1. Go to Desktop Client 2. Create or copy a multiple files 3. Wait for the files to sync to the Via Web 4. Delete the file in Desktop Client|The files get deleted on Via Web| :construction: | |
6 | Delete large file (2048Mb)| 1. Go to Desktop Client 2. Create or copy a single big file (2GB) 3. Wait for the file to sync to th Via Web 4. Delete the file in Desktop Client|The file get deleted on Via Web| :construction: | |
7 | Deleting| 1. User tries to delete a file form Via Web that is deleted rom sync folder when the Via Web is not refreshed 2. Users sees the selected gerts deleted in the Desktop Client sync folder 3. user still sees the deleted file on Via Web|1. User gets a warning message while attempting to delete the file 2. User cannot delete the file| :construction: | |

### 7. Sync process

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Move some files while sync| 1. Move a couple of files (File1 and File2) with different content under the root sync folder 2. Let them sync 3. Move other file under the root sync folder and while sync 4. Delete File1 and rename File2 with the name File1| The content of files is correct| :construction: | |
2 | Rename the file while sync| 1. Create a .txt file with some text in it 2. Let it sync 3. Rename the file and let is sync 4. While #3 is sync, edit the content of the .txt file| The content of file is correct| :construction: | |
3 | Deleted folders while sync| 1. Create a tree of folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder) 2. Delete the folders while sync| Look at Via Web and make sure that the folders got deleted| :construction: | |
4 | Deleted folders while sync with two clients| 1. Create a tree of folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder) 2. Delete some folders and keep another while sync 3. Sync with another client at the same time| Look at Via Web and make sure that the folders got deleted and the remains folders sync correctly| :construction: | |
5 | Create a new folder with space ar the end| 1. Create a folder with space at end| Look if is sync| :construction: | |
6 | Deselect to the option "Allow apps to use the Share API"| 1. Install the new version 2. Go to Server Client 3. Sing in as Admin user 4. Go to Admin 5. On Sharing option, deselect to the option "Allow apps to use the Sahre API" 6. Go to the Desktop Client 7. Configure one account 8. Open folder 9. Create new folder (e.g Example1) 10. Right click on the folder Example1 11. Click on "Share with oC" 12. If you introduce the Password and press enter|| :construction: | |
7 | If you share a folder with another user, and then rename the folder on the Desktop does not change the name| 1. Install the new version with 2 accounts (user1, user2) 2. Go to Server Client with user1 3. Create a new folder (e.g. Share with) 4. Click on Share, and share with user2 5. Go to  Desktop Client with user2 6. Wait sync 7. Go to Server client with user1 8. Rename the Folder (Share with) to (Share with user2" 9. Go to Desktop client with user2 11. Wait sync | The folder name has not change. The shared folder is actually a virtual mount point for all recipients, so renaming it doesn't affect all recipients. Only the contents of it will be visible for anyone. Works as expected| :construction: | |

### 8. Without connection

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Upload several files and folder to the sync folder without internet| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server | :construction: | |
2 | Upload several files and folder with special characters to the sync folder without internet| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server | :construction: | |
3 | Upload the same folder from the server and form the client with differente files inside| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server | :construction: | |
4 | Remove folder from the client| 1. Remove one folder from the local folder 2. The connection is back | The folder is not on the server | :construction: | |

### 9. Sharing


#### 9.1 Share link

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Share a Folder/File with special characters| 1. User share a folder (special characters /, <,>,:,?) with you 2. Refresh the parent folder | File/Folder is not displayed as shared| :construction: | |
2 | Share a Folder/File with special characters| 1. User share a folder (special characters in the name $%ñ&) with you 2. Refresh the parent folder | File/Folder is not displayed as shared| :construction: | |
3 | Unshare the Folder/File | 1. User unshare a folder/file with you 2. Refresh the folder/file | File/Folder is not shown as shared| :construction: | |
4 | Unshare the Folder/File | 1. User unshare a folder/file with you 2. Access to the parent folder/file | File/Folder is not shown as shared| :construction: | |
5 | Unshare the Folder with you | 1. Access to a shared file 2. User unshare a folder with you 3. Upload file from Desktop Client | Folder error| :construction: | |
6 | Verify shared icon | 1. User share a folder | When the folder/file are shared show a special icon | :construction: |https://github.com/owncloud/client/issues/3043 |
7 | Verify shared icon | 1. User share a folder | When the folder or file is shared by link show a special icon | :construction: |https://github.com/owncloud/client/issues/3043 |
8 | Move a shared folder with permissions | 1. Move a shared folder with permissions inside another folder from Desktop| The server of both users is updated, if the other folder is not shared with permissions, you can't the other foder | :construction: | |
9 | Move a shared folder with permissions | 1. Move a shared folder with permissions inside another folder from Desktop 2. Create a file inside the sahred folder| The server of both users is updated | :construction: | |
10 | Move a shared folder with permissions | 1. Move a shared folder with permissions inside another folder from Desktop 2. Create a file inside the shared folder 3. Update the file from user1| The Desktop update the file | :construction: | |
11 | Lost of files | 1. Having 80 files shared by user| The Desktop works fine | :construction: | |
12 | Share a Folder with Password protect| 1. Create a new folder 2. Share with oC 3. Check Share link option 4. Ckeck Password protection 5. Introduce the password 6. Press Enter or Click on Set password option | You can write the password| :construction: | |
13 | Share a Folder with Set expiration date| 1. Create a new folder 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date | You can configurate the expiration date | :construction: | |
14 | Share a Folder with Allow editing| Create a new folder 2. Share with oC 3. Check Share link option 4. Ckeck Allow editing option  | The Folder can allow editing| :construction: | |
15 | Share a File with Password protect| 1. Create a new file 2. Share with oC 3. Check Share link option 4. Ckeck Password protection 5. Introduce the password 6. Press Enter or Click on Set password option  | You can write the Password protect | :construction: | |
16 | Share a File with Set expiration date| 1. Create a new file 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date |You can configurate the expiration date | :construction: | |
17 | Modify the Set expiration date option on the server| 1. Create a new file on the Desktop 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date 6. Go to the Server and change the date 7. Go to the Desktop 8. Wait to sync| You can see the new date on Set expiration date | :construction: | |


#### 9.2 Share with Users and Groups


TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Enable encryption app and encryption default module | Encryption is enabled correctly | :construction: |
2 | Share a file with a user that has been already shared another file | Both files appear in server | :construction: |
3 | Share a folder with a user | The folder appears in server | :construction:  |
4 | Share a folder with a user that has been already shared another file | Both folders appear in server | :construction: |
5 | Share a file with a group| The file appears in server | :construction: |
6 | Share a folder with an LDAP user | The folder appears in server | :construction:  |
7 | Share a file with an Active Directory user| The file appears in server | :construction: |
8 | Share a folder with a Shibboleth user autoprovisioned| The folder appears in server | :construction: |
9 | Share a file with a Shibboleth SSO user| The file appears in server | :construction:  |
10 | Try to Share a folder with a user that belongs to a oC server version below 8.2.X| The folder is not on server |:construction:  |
11 | Share a file with one user whose name contains special characters | The file appears in server | :construction: |
12 | Share a folder with one users a file whose name contains special characters | The folder appears in server | :construction:  |
13 | Share a file bigger than 1 GB with one user | The file appears in server | :construction:  |
14 | Try to federate share a file with one user | Not possible yet | :construction:  |
15 | Share a file from S3 with a user | The file appears in server | :construction: |
16 | Share a folder from SMB with a user | The folder appears in server | :construction:  |
17 | Share a file from WND with a user | The file appears in server | :construction: |
18 | Share a folder from Sharepoint with a user | The folder appears in server | :construction:  |
19 | Share a file from a Federated Sharing with a user | The file appears in server | :construction:  |
20 | Share a folder from redirect server with a user | The folder appears in server | :construction: |
21 | Using a redirect server, Share a file with a user | The file appears in server | :construction: |
22 | Share a file with user B with Can Share permissions enabled. Login as User B and reshare it | The file can be reshared in the server with other user| :construction: |
23 | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it  | The file can be edited in the server with other user | :construction: |
24 | Share a file with user B with Change permission enabled. Login as User B and change it  | The file can be changed in the server with other user | :construction: |
25 | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. try to edit it again | The file can be edited in the server with other user | :construction:  |
26 | Share a folder with user B with Can Share permissions enabled. Login as User B and reshare it | The folder can be reshared in the server with other user | :construction:|
27 | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it  | The folder can be edited in the server with other user | :construction: |
28 | Share a folder with user B with Change permission enabled. Login as User B and change it  | The folder can be changed in the server with other user | :construction: |
29 | Share a folder with user B with Create permissions enabled. Login as User B and create a file in it | The folder can be edited creating a file in the server with other user | :construction: |
30 | Share a folder with user B with Create permissions enabled. Login as User B and create a folder in it | The folder can be edited creating a folder in the server with other user | :construction:  |
31 | Share a folder with user B with Can Edit permissions enabled. Login as User B and delete it  | The folder can be edited in the server with other user | :construction:  |
32 | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. Try to edit it again | The folder cannot be edited the second time |  :construction:  |
33 | Share a file with user B without Can Share permission enabled. Login as User B and try to reshare it | The file cannot be reshared |  :construction: |
34 | Share a file with user B without Can Edit permission enabled. Login as User B and try to edit it  | The file cannot be edited | :construction: |
35 | Share a file with user B without Change permission enabled. Login as User B and try to change it  | The file cannot be changed | :construction: |
36 | Share a folder with user B without Can Share permission enabled. Login as User B and try to reshare it | The folder cannot be reshared | :construction:|
37 | Share a folder with user B without Can Edit permissions enabled. Login as User B and try to edit it  | The folder cannot be edited | :construction:  |
38 | Share a folder with user B without Create permissions enabled. Login as User B and try to create a file in it  | The folder cannot be edited creating a file in it | :construction: |
39 | Share a folder with user B without Change permissions enabled. Login as User B and try to change it  | The folder cannot be changed | :construction:|
40 | Share a folder with user B without Delete permissions enabled. Login as User B and try to delete it  | The folder cannot be edited deleting files/folders in it | :construction: |
41 | Share link a file and download it | The file is shared | :construction:  |
42 | Share link a folder and download it | The folder is shared | :construction: |
43 | Share link a file and disable it after | The link should not be enabled any longer | :construction:|
44 | Share link a file and 'add to your owncloud' a user that belongs to the server| The file is shared | :construction: |
45 | Share link a file and 'add to your owncloud' a user that belongs to the server and has been already shared another file| The file is shared | :construction: |
46 | Share link a file and 'add to your owncloud' with a user that belongs to another server| The file is shared | :construction: |
47 | Try to share link a file and 'add to your owncloud' with an LDAP user| The file is shared | :construction:  |
48 | Try to share link a file and 'add to your owncloud' with an Active Directory user| The file is shared | :construction:  |
49 | Try to share link a file and 'add to your owncloud' with a Shibboleth user autoprovisioned| The file is shared | :construction:  |
50 | Try to share link a file and 'add to your owncloud' with a Shibboleth user SSO| The file is shared |:construction:  |
51 | Share link a file and 'add to your owncloud' with a user that belongs to another oC server below 8.2.X version| The file is shared |  |
52 | Share link a file with a user and set a password | The file is shared with a pwd | :construction: |
53 | Share link a file with a user and set a pwd with special characters | The file is shared with a pwd | :construction: |
54 | Share link a file with setting a password and modifiying it later | The file is shared and the pwd is changed | :construction:  |
55 | Share link a file with a user and set a password. Modify Password Policies and retry | The pwd is updated | :construction:  |
56 | With Password Policy App enabled, Share link a file with a user  and set a password that matches with the pwd policy| The file is shared with pwd |:construction:|
57 | With Password Policy App enabled, Share link a file with a user  and set a password that does not match with the pwd policy| An error should be shown | :construction:| https://github.com/owncloud/client/issues/4209
58 | Share link a file with a user and set a valid Expiration date | The file is shared with an expiration date 
 | :construction:  |
59 | Share link a file with a user and set a password and a expiration date | The file is shared with pwd and expiration date |:construction:  |
60 | Share link a file with a user and set a password and a expiration date. Change the expiration date | The file is shared with the updated expiration date | :construction:  |
61 | Share link a file with a user and set a password and a expiration date. Change the pwd | The file is shared with the updated pwd | :construction:  |
62 | Try to search a user that has already been shared the file in the users searchbox | The user should not be shown | :construction: |
63 | Try to search yourself in the users searchbox | The user should not be shown | :construction:|
64 | Search for 'pa' pattern | All users that contains this pattern should be shown |:construction:  |
65 | Try to search a remote user in the users searchbox | The user should not be shown (not developed yet) | :construction:  |
66 | Share a file with more than 4 users | The users should be listed and ordered chronologicaly. If is needed a scrollbar will appear | :construction: |
67 | Sharing API  | The users should be listed and ordered chronologicaly. If is needed a scrollbar will appear | :construction:  |
67 | Enforce password protection  | Password should be always required | :construction:   | https://github.com/owncloud/client/issues/4227
67 | Enforce password protection enabled. Try to disable the pwd  | Password should be always required |:construction: | https://github.com/owncloud/client/issues/4227
68 | Set default expiration date  | The expiration date should be set by default |  :construction:   |
69 | Allow resharing disabled and Can Share enabled  | The user cannot reshare files | :construction:  |
70 | Restrict users to only share with users in their groups | It should appear only the users from the group |:construction:| https://github.com/owncloud/client/issues/4226
71 | Disallow username autocompletion in share dialogs | Full username needs to be entered in order to sharing | :construction: |

### 10. Selective_Sync

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Check that in the setup options after fill in the server and the user you have to choose the server and local folder to sync| 1. Start to setupo oC Desktop 2. Fill in server, user and password 3. The server and local folder to sync is shown|1. On server (you have to choose what do yo want to sync) 2. local folder (the local folder where the date are sync) |:construction: |  |
2 | Check that in the setup options the checkbox is enable to sync all the account by default | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Choose what to sync" | At window is opened with the directory tree |:construction: |  |
3 | Check that all the account is sync when you select to sync all the account| 1. Start to setupo oC Desktop 2. Fill in server, user and pass 3. Click on "Sync everything from server" and wait until all the account is sync| All the account is sync |:construction: |  |
4 | Verify that you can select to sync only one folder | 1. Start to setup the oC Desktop 2. The new window select what folder sync is shown 3. Select to sync only one folder 4. Click on OK | Only one folder is sync |:construction: |  |
5 | Verify that the folder to select are sorted by name/size| 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Select all the folder except one of them| All the account is sync except one folder|:construction: |  |
6 | Check that there oare another option to skip sync so nothing is sync| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration"| The setting windows is openend but any local folder is configured|:construction: |  |

#### 10.1 Choose what to sync from the setup window

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Verify that the folders that you unselect are not sync in Desktop| 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | Check that the folder unselected are not sync|:construction: |  |
2 | The folder without subfolder doesn't show the arrow| 1. Start to setup the oC Desktop app 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolder | When you click on a folder without subfolder the arrows disappear sometimes|:construction: |  |
3 | Verify that the folders that you unselect are not sync in Desktop| 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | The parent folder is sync but not the subfolder|:construction: |  |
4 | Upload from the server some files in a folder which is sync| 1. Start ti setyo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Upload files from server | The files are download in the desktop client|:construction: |  |
5 | Upload from the Desktop some files | 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Upload files from server in a folder wich is not sync | The files are sync with the server|:construction: |  |
6 | Upload from the server some files in a folder which is  not sync | 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolder 4. Upload files from server which is not sync | The files are not downloads in the Desktop client |:construction: |  |
7 | Delete a folder sync, it is removed from the Desktop | 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kids of folder with and witout subfolders 4. Delete a folder sync, it is removed from the desktop | The folder is removed int he server |:construction: |  |
8 | Delete a sync folder from the server | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Delete a sync folder from the server | The folder is removed int he Desktop |:construction: |  |
9 | Create a folder in the root directory from the server | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Create a folder in the root directory from the server | The folder is sync |:construction: |  |
10 | Rename a folder that is sync | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Rename a folder that is sync | It is renamed in the window "Choose what to sync" |:construction: |  |
11 | Delete a folder that is sync | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | It is not shown in the window "Choose what to sync" |:construction: |  |
12 | Verify that when yo unselect all the folder, the root files continue sync| 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | Root files are sync |:construction: |  |
13 | When you click on "Choose what to sync" folder tree is shown | 1. Click on "Choose what to sync" | It takes folder time to appear the folder tree,  |:construction: |  |


#### 10.2 "Skip folders configuration"

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 |Skip folder configuration| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" | 1. No one local folder is sync 2. The setting window is opened and the account is registered|:construction: |  |
2 |Sync only one folder the settings view | 1. Start to setupo oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Settings window/add folder| The folder start to sync and the folder is available from the tray icon|:construction: |  |

#### 10.3 "Add Folder..."

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 |Skip folder configuration from the setup window and select the local and remote folder front he setting window| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Add folder 5. Select the local folder (choose an existing one) 6. Select the remote folder, click on continue 7. Select the subfolders of the remote folder and click on add | 1. The local folder selected is sync wich the remote one|:construction: |  |
2 |Select a remote folder with special characters| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Add folder 5. Select the local folder (create a new folder with special characters) 6. Select the remote folder with special characters, click on continue 7. Select the subfolders of the remote folder and click on add | 1. The local folder selected is sync wich the remote one|:construction: |  |

### 11. Overlay_icons

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | If the system is offlline, there are no overlay icons present | 1. Launch the Desktop 2. The overlay icons are not shown 3. Quit the Desktop | The overlay icons are not shown|:construction: |  |
2 | When you pause the sync, the overlay icons are still shown | 1. Launch the Desktop 2. The overlay icons are still shown 3. Click on Pause | The overlay icons are still shown|:construction: |  |
3 | Green check (All files within the folder (all the way down the tree) are sync with the server, and there are no problems to report) | 1. The account is sync | The green check is shown in all the folders/files|:construction: |  |
4 | Blue spinning icon (Some or all files/folders in the directory are waiting to sync or are actively sync) | 1. The account is sync | The files/folder that are waiting to sync have the blue icon|:construction: |  |
5 | Yellow warning triangle (There is an error in sync somewhere in the directory such as a path longer than 255 characters or a bad character in a name o a file firewall problem) | 1. The account is sync |The files that are not sync because they have a problem... Have a yellow warning triangle |:construction: |  |
6 | Red error Icon (There is a fatal problem in the sync process that can't be resolved) | 1. The account is sync | The files/folders that are not sync because have a problem... Have a red error icon|:construction: |  |