1. Create a new testplan ticket in the [owncloud/client](https://github.com/owncloud/client) repo, copy the text below into it:

```
# Regression test for the Desktop Client

[Test Plan Template](https://github.com/owncloud/QA/blob/master/Desktop/Regression_Test_Plan_Minor_Release.md)

## Previous requirements

Have a Desktop Client vX.X.0 ready to be used for testing.
 -> download URL
Prepare a 10.x.x server with ssl activated and trusted certificates.
 - `env OC10_VERSION=10.x bash deploy_oc10_apps.sh --`
 -> server URL
 
Have the lastest released OC server ready with LDAP and two external storages of your choice (SFTP and WND) used for specific tests
 - `env OC10_DNSNAME=oc1080-ldap-DATE bash deploy_oc10_apps.sh oauth2 user_ldap  password_policy files_pdfviewer windows_network_drive=2.0.0`
 -> server URL

Optional: Have an Active Directory server ready to be used with owncloud.

Avoid to have the same test server for all who are testing. You can use an individual latest docker server, e.g.:
 - docker run --rm -ti -p 8080:8080 owncloud/server:latest
 - browser: http://localhost:8080
but testing should be also done with a 'real' server, for that the BTR team can provide some test servers. 

## Testing

- For each test set, choose a random platform win/linux/mac, unless test items specify otherwise. Record which platform was used.
- "Enable logging to temporary folder" and "Log Http traffic" (tab 'Settings', button 'Log Settings') to have log-files available if needed to report an issue.
- Manual testing is only required for tests not covered by automated squish testing (marked as :robot:)
- Make sure all [squish tests](https://confluence.owncloud.com/display/OG/Squish+Testing#SquishTesting-Testplan) run successful in CI 
- If more persons are testing, please write your name beside the section you are currently working on, e.g. @tester1
- Add the test result to the 'Result' column. For success: :heavy_check_mark:, failure: :x: (link the reported #issue to 'Related Comment')

## Testplan Minor Release

* [ ] 1. Install/Update - Connect - Login  @tester1
  -> https://github.com/owncloud/client/issues/xxxx#issuecomment-xxxxxxxxx
* [ ] 2. Folders
  -> ...
* [ ] 3. Files
  -> ...
* [ ] 4. Move files and folders
  -> ...
* [ ] 5. Edit Files
  -> ...
* [ ] 6. Delete Files and Folders
  -> ...
* [ ] 7. Sync process
  -> ...
* [ ] 8. Without connection
  -> ...
* [ ] 9. Sharing
  -> ...
* [ ] 9.1 Share link
* [ ] 9.2 Share with Users and Groups
  -> ...
* [ ] 10. Selective_Sync
* [ ] 10.2 "Skip folders configuration"
* [ ] 10.3 "Add Folder..."
  -> ...
* [ ] 11. Overlay_icons
  -> ...
```

2. Add the [Regression_Test_Plan_Patch](https://github.com/owncloud/QA/blob/master/Desktop/Regression_Test_Plan_Patch_Release.md) items in a separate comment (test all platforms + migration).

3. Copy each set (1. - 11.) of the minor release tests into a separate comment and add the links above.

---

### Minor Release Tests

### 1. Install - Login

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-Test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Update Installation | 1. You need to have installed a previous version<br>2. Update to the new version || :construction: Win<br>:construction: macOS<br>:construction: Linux ||
2 | Install the new version | 1. Delete the previous version<br>2. Install the new version || :construction: Win<br>:construction: macOS<br>:construction: Linux ||
3 | Verify that you can enter a server address (self signed cert) | 1. Launch desktop client<br>2. Enter a server address<br>3. Click on Next<br>4. If it is the first time you should accept the certificate || :heavy_check_mark: | tst_addAccount | :robot: oC10<br>:robot: oCIS|
4 | Valid Login | 1. Log in with the correct username and password | Login successful | :heavy_check_mark: | tst_addAccount | :robot: oC10<br>:robot: oCIS
5 | Invalid Login | 1. Try to log in with wrong username or password | Error message `Login failed: username and/or password incorrect` is shown | :heavy_check_mark: | tst_addAccount | :robot: oC10<br>:robot: oCIS
6 | Connect to a server with LDAP (or optionally AD) | 1. Setup owncloud server with openldap<br>2. Add an account to desktop client | Make sure no technical user name shows up in UI (e.g. account name, sharing...) | :construction:  ||
7 | Connect to an old server (v8.x.x) | 1. Setup an old server:`docker run -ti -p 8181:80 owncloud:8.1`<br>2. Add an account to desktop client | Unsupported warning message is displayed | :construction: ||


### 2. Folders

- 'Go to local sync folder and create a folder' means: "Open folder" on client dot ... menu, create a new folder in file browser
- 'Verify on the server' means:  the folder is sent from client to server / check either with a) web browser, b) another client, or c) via server introspection

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Verify that you can create a folder | 1. Add an account to desktop client<br>2. Open local sync folder<br>3. Create a folder<br>4. Wait for sync to complete | The folder is available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
2 | Verify that you can create a folder with long name | 1. Create a folder with a long name (~100 characters)<br>2. Wait for sync to complete | The folder is available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
3 | Verify that you can create a folder with special characters | 1. Create a folder with special characters (e.g. `$%ñ&`)<br>2. Wait for sync to complete | The folder is available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
4 | Create a new folder with space at the end | 1. Open the local sync folder<br>2. Create a folder with space at the end | Look if it syncs | :construction: | If you create a folder with a space at the end, your os (nautilus @ ubuntu) will remove this space. The folder is syncing |
5 | Verify that you can sync a folder with many subfolders | 1. Outside the sync root, create a folder with 5 empty subfolders and 5 subfolders containing files<br>2. Move that folder into the sync root<br>3. Wait for sync to complete | All 10 subfolders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
6 | Verify that you can sync many folders at once | 1. Create 400 folders outside the sync root<br>2. Move those folders into the sync root<br>3. Wait for sync to complete | All 400 folders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
7 | Verify that you can copy a folder | 1. Open local sync folder<br>2. Create a folder with some files in it<br>3. Copy and paste that folder<br>4. Wait for sync to complete | Both original and copied folders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
8 | Verify that you can create a subfolder with long name | 1. Open local sync folder<br>2. Create a folder<br>3. Create a subfolder with long name (~220 characters)<br>4. Wait for sync to complete | Folder and subfolder are available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
9 | Verify that pre-existing folders are synced to the server | 1. Quit the desktop client<br>2. Goto the local sync folder<br>3. Create folders at several levels<br>4. Open the desktop client<br>5. Wait for sync to complete | All folders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
10 | Sync works for .zip/.rar files with elaborate internal folder structures | 1. Create a zip file with many internal folders and files<br>2. Copy that zip file into the sync root<br>3. Unzip that zip file inside the sync root | All extracted files and folders are available on the server | :construction: ||
11 | Files that error with API should try 3 times, and then blacklist | 1. Try to sync a folder that has more than 65 characters<br>2. Then sync it with some contents, it should try three times and then be blacklisted<br>3. If you rename the folder, it should try again and succeed if the name is less than 65 characters | The folder is synced | :construction: ||
12 | Invalid system names | 1. On the server, create folders `CON`, `COM1` and `test%` and files `PRN` and `foo%`<br>2. Add that account to desktop client | - MacOS client syncs down `CON`, `COM1` and `PRN` but not `test%` and `foo%`<br>- Windows client syncs down `test%` and `foo%` but not `CON`, `COM1` and `PRN`<br>- Linux client syncs down all | :construction: Win<br>:construction: macOS<br>:heavy_check_mark: Linux | tst_syncing | :robot: oC10<br>:robot: oCIS
13 | Long path on Windows (VFS OFF) syncs ** | 1. On the server, create a file (~30 chars) inside 6 subfolders (each ~50 chars) to get a path length > 260 chars (> MAX_PATH)<br>2. Start desktop client and add that account with VFS OFF<br>3. Open local sync folder and enter the subfolders<br>4. Create a new file | 1. All subfolders and a file are available in the local sync folder<br>2. New file is synced to the server | :construction: Win ||
14 | Long path on Windows (VFS ON) syncs ** | 1. On the server, create a file (~30 chars) inside 6 subfolders (each ~50 chars) to get a path length > 260 chars (> MAX_PATH)<br>2. Start desktop client and add that account with VFS ON<br>3. Open local sync folder and enter the subfolders<br>4. Create a new file | 1. All subfolders and a file are available in the local sync folder<br>2. New file is synced to the server | :construction: Win ||
15 | Long path explorative testing on Windows ** | Use test scenarios 12-13 to perform tests like: create more files/subfolders in Explorer or in terminal (PowerShell), move files/folders, rename, edit a file, etc. | Folder/files are synced without errors | :construction: Win ||

** Make sure LongPathsEnabled in Windows registry is 'off' (see https://docs.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=cmd). Nevertheless the client should handle the long path > 260 correctly.

### 3. Files

Note: "Via Web" means check files on server in web browser

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Verify that you can create a file | 1. Add an account to desktop client<br>2. Open local sync folder<br>3. Create a file | - observe a BLUE progress icon followed by a GREEN icon in the file explorer<br>- the file is available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
2 | Add various types of files | 1. Open local sync folder<br>2. Create/upload various types of files `Microsoft Word`, `Microsoft Excel`, `Microsoft Powerpoint`, `JPG`, `PDF`, `MP3`, etc |- the Sync files tab shows all the files as synced<br>- all files are available on the server | :heavy_check_mark: | tst_syncing |:robot: oC10<br>:robot: oCIS
3 | File with long name can be synced | 1. Open local sync folder<br>2. Create a file with long name: `thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIs.txt` | Sync is successful | :heavy_check_mark: | tst_syncing |:robot: oC10<br>:robot: oCIS
4 | File with a name having 233 characters or more cannot be synced | 1. Open local sync folder<br>2. Create a file having >=233 characters<br>3. Observe the sync process | The "Not synced" tab shows an error, the file is blacklisted | :heavy_check_mark: | tst_syncing |:robot: oC10
5 | User copies/drag&drops multiple files at a time to the Sync folder | 1. Copy some files to the local sync folder<br>2. Drag&Drop some files to the lcoal sync folder | - user can see the completed GREEN icon overlay on all types of files<br>- the Sync files tab shows all files as synced | :construction: ||
6 | Sync files (from server and desktop client) at the same time | 1. Add a file of 1MB inside the local sync folder, and in the same time, add another file on the same remote folder (make sure that the server file is uploaded before the client finishes) | Look at Via Web and the Desktop Client to make sure that the sync is correct | :construction: ||
7 | Same name files but with different extensions | 1. Open local sync folder<br>2. Create two files with same name but different extensions | Both files sync correctly | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
8 | File with spaces in the name | 1. Open local sync folder<br>2. Create, copy or move a file (having space in its name) in the local sync folder | File syncs correctly | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
9 | Create and delete a file with special characters in the name | 1. Open local sync folder<br>2. Create/upload a file with special characters in its name (e.g. **~`!@#$^&()-_=+{[}];',**)<br>3. Wait for sync to complete<br>4. Delete the file from the local sync folder | Look via the Web and make sure that the file got deleted | :construction: ||
10 | Upload a 50MB file | 1. Create a folder inside the local sync folder<br>2. Copy a large file (50MB) in this folder | The file is synced to the server | :construction: ||
11 | Upload a 3GB file | 1. On the server, upload a large 3GB file<br>2. Add that account to desktop client | File is synced to the desktop client | :construction: ||
12 | Upload multiple files (resulting to 1000MB) | 1. Open local sync folder<br>2. Upload a folder containing 1000 files (1MB each) | All files are synced to the server | :construction: ||
13 | Upload 500MB + 500MB files | 1. Open local sync folder<br>2. Upload two folders containing 500 files each (1MB per file) | All files are synced to the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
14 | Upload a 1024MB file | 1. Open local sync folder<br>2. Upload a 1GB file | The file is synced to the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
15 | Verify the limit of the quota | 1. Open local sync folder<br>2. Upload the necessary large files to fill up the quota | Warning: "The available space of your workspace is running out, please delete some files to free space" | :construction: ||

### 4. Move files and folders
#### NOTE: Could be automated using move functions from python

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Move from sub-levels to root | 1. Move couple of files and folders from different sub-levels to the sync root<br>2. Wait for sync to complete<br>3. Check the contents of files and folders | The contents are correct (on the server) | :construction: ||
2 | Move a folder down to sub-folder | 1. Move a folder from sync root to a 5 level deep sub-folder<br>2. Wait for sync to complete<br>3. Check the folder content | The content of the folder is correct (on the server) | :construction: ||
3 | Move a folder up from sub-folder to the root | 1. Move a folder from a 5 level deep folder to the sync root<br>2. Wait for sync to complete<br>3. Check the folder content | The content of the folder is correct (on the server) | :construction: ||
4 | Move files from one folder to another | 1. Move some files from `Folder1` to `Folder2`<br>2. Wait for sync to complete<br>3. Check both folders contents | Both folders have the correct content (on the server) | :construction: ||
5 | Move two or more folders down to sub-folder | 1. Move two or more folders from sync root to a 5 level deep sub-folder<br>2. Wait for sync to complete<br>3. Check the folders contents | The contents of the all the folders are correct (on the server) | :construction: ||
6 | Move two or more folders up from sub-folder to the root | 1. Move two or more folders from a 5 level deep folder to the sync root<br>2. Wait for sync to complete<br>3. Check the folders contents | The contents of the all the folders are correct (on the server) | :construction: ||

### 5. Edit Files

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Edit a .txt file | 1. Create a .txt file in the local sync folder<br>2. Add some text<br>3. Wait for it to sync<br>4. Modify the .txt file and add more content<br>5. Wait for it to sync<br>6. Modify the .txt file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :heavy_check_mark: | tst_editFiles | :robot: oC10<br>:robot: oCIS
2 | Edit a .doc file | 1. Create a .doc file in the local sync folder<br>2. Add some text<br>3. Wait for it to sync<br>4. Modify the .doc file and add more content<br>5. Wait for it to sync<br>6. Modify the .doc file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :construction: ||
3 | Edit a .xls file | 1. Create a .xls file in the local sync folder<br>2. Add some text<br>3. Wait for it to sync<br>4. Modify the .xls file and add more content<br>5. Wait for it to sync<br>6. Modify the .xls file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :construction: ||
4 | Replace a .pdf file | 1. Create a .pdf file in the local sync folder<br>2. Replace it with a same name pdf file having different content<br>3. Wait for it to sync<br>4. Modify the .pdf file and add more content<br>5. Wait for it to sync<br>6. Modify the .pdf file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :construction: ||
5 | Edit a file while the folder is renaming | 1. Add an account to desktop client that has a folder containing a file in it<br>2. From the file explorer, open that file and edit it<br>3. From the web, rename the folder<br>4. Sync with the oc-worker<br>5. Do not refresh the browser and download the file edited | The file on the server has the same content | :construction: ||
6 | Rename file and folder at the same time | 1. Add an account to desktop client that has a folder containing a file in it<br>2. From the web, rename that folder and at the same time from the file explorer, rename a file contained in that folder | File and folder should be renamed both in the server and locally | :construction: ||

### 6. Delete Files and Folders

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Delete a file | 1. On the server, create a file<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete that file | The file is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders | :robot: oC10<br>:robot: oCIS
2 | Delete a file with long name | 1. On the server, create a file with long name<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete that file | The file is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders (Maximum length of filename is 228 chraracter) | :robot: oC10<br>:robot: oCIS
3 | Delete a folder | 1. On the server, create a folder<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete that folder | The folder is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders | :robot: oC10<br>:robot: oCIS
4 | Delete a folder with long name | 1. On the server, create a folder with long name<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete that folder | The folder is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders | :robot: oC10<br>:robot: oCIS
5 | Delete multiple files | 1. On the server, create some files<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete some files | The files get deleted on the server | :construction: ||
6 | Delete a large file (2048MB) | 1. On the server, create a large file (2048MB)<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete that file | The file gets deleted on the server | :construction: ||


### 7. Sync process

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Move a file while in sync | 1. Move couple of files (`File1` and `File2`) with different contents to the root sync folder<br>2. Let them sync<br>3. Move other files to the root sync folder and while in sync,  delete `File1` and rename `File2` to`File1` | The content of file is correct | :construction: ||
2 | Edit a file while in sync | 1. Create a .txt file with some content<br>2. Let it sync<br>3. Rename the file and while in sync, edit the content of the .txt file | The content of file is correct | :construction: ||
3 | Delete folders while in sync | 1. Create folders tree folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder)<br>2. Delete some folders while in sync | Folders get deleted on the server | :construction: ||
4 | Delete folders while sync with two clients | 1. Create a tree of folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder)<br>2. Delete some folders and while in sync, sync with another client at the same time | In the server, make sure that the folders got deleted and the remaining folders sync correctly | :construction: ||

### 8. Spaces and permissions

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Viewer can view files in Space | 1. In the server, create a space, upload a file in it and add a user with Viewer role<br>2. As a space member (Viewer), add that space to the desktop client<br>3. Open the local sync folder and open that file | The file can be opened | :construction: ||
2 | Viewer cannot edit files in Space | 1. In the server, create a space, upload a file in it and add a user with Viewer role<br>2. As a space member (Viewer), add that space to the desktop client<br>3. Open the local sync folder<br>4. Edit that file and save it | Changes are not synced | :construction: ||
3 | Editor can rename files in Space | 1. In the server, create a space, upload a file in it and add a user with Editor role<br>2. As a space member (Editor), add that space to the desktop client<br>3. Open the local sync folder<br>4. Rename that file | The files is renamed and synced | :construction: ||
4 | Manager can add new folders in Space | 1. In the server, create a space, upload a file in it and add a user with Manager role<br>2. As a space member (Manager), add that space to the desktop client<br>3. Open the local sync folder<br>4. Create a new folder | New folder is synced | :construction: ||

### 9. Without connection
#### NOTE: We could give it a try to automate

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Upload several files and folder to the sync folder without Internet | 1. Add an account to the desktop client<br>2. Disconnect the Internet<br>3. Upload several files and folder in the sync folder<br>4. Connect the Internet<br>5. Wait for sync | The files and folder are synced to the server | :construction: ||
2 | Upload several files and folder with special characters to the sync folder without Internet | 1. Add an account to the desktop client<br>2. Disconnect the Internet<br>3. Upload several files and folder (having special characters) in the sync folder<br>4. Connect the Internet<br>5. Wait for sync | The files and folder are sync with the server | :construction: ||
3 | Upload the same folder from the server and form the client with different files inside | 1. Add an account to the desktop client<br>2. Disconnect the Internet<br>3. In the server, upload a folder with some files<br>4. In the local sync folder, upload same named folder with different files in it<br>5. Connect the Internet<br>6. Wait for sync | The files and folder are synced to the server | :construction: ||
4 | Remove folder from the client without Internet | 1. Add an account to the desktop client<br>2. Disconnect the Internet<br>3. Remove a folder from the local sync folder<br>4. Connect the Internet<br>5. Wait for sync | The folder is deleted from the server | :construction: ||

### 10. Sharing

**NOTE: To open sharing dialog `Right click on the resource` -> `Select ownCloud option from menu` -> `Share`** 

#### 10.1 Share overlay icon

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | **Linux**: Verify shared icon on user share | [Install `owncloud nautilus` library]<br>1. Share a folder/file with another user from Desktop client UI | Share overlay icon is shown on the shared file/folder | :construction: Linux ||
2 | **Linux**: Verify shared icon on public link share | [Install `owncloud nautilus` library]<br>1. Create a public link share from Desktop client UI | Share overlay icon is shown on the shared file/folder | :construction: Linux ||
3 | **Win-VFS-OFF**: Verify shared icon on user share | 1. Disable the VFS<br>2. Share a folder/file with another user from Desktop client UI | Share overlay icon is shown on the shared file/folder | :construction: Win ||
4 | **Win-VFS-OFF**: Verify shared icon on public link share | 1. Disable the VFS<br>2. Create a public link share from Desktop client UI | Share overlay icon is shown on the shared file/folder | :construction: Win ||
5 | **Win-VFS-ON**: Verify shared icon on user share | 1. Enable the VFS<br>2. Share a folder/file with another user from Desktop client UI | No sharing indicator, only status is shown | :construction: Win ||
6 | **Win-VFS-ON**: Verify shared icon on public link share | 1. Enable the VFS<br>2. Create a public link share from Desktop client UI | No sharing indicator, only sync status is shown | :construction: Win ||
7 | Unshare a file/folder | 1. Create a file share to another user<br>2. Add an account to Desktop client<br>3. Check the share icon on the shared file<br>4. Unshare the file | No sharing indicator, only sync status is shown | :construction: ||

#### 10.2 Share via link

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Create a public link share of a folder | 1. Open the sharing dialog<br>2. Move to **Public Links** tab<br>3. Create the link share | Public link share is available | :heavy_check_mark: | tst_sharing | :robot: oC10
2 | Create a password protected public link share of a folder | 1. From the Public link sharing dialog,  check the **Password protect**<br>2. Set the password<br>3. Create the link share | You can set the password and the link share is available | :heavy_check_mark: | tst_sharing | :robot: oC10
3 | Create a public link share of a folder with expiration date | 1. From the Public link sharing dialog,  check the **Set expiration date**<br>2. Set the expiration date<br>3. Create the link share | You can set the expiration date and the link share is available | :heavy_check_mark: | tst_sharing | :robot: oC10
4 | Create a public link share of a file | 1. Open the sharing dialog<br>2. Move to **Public Links** tab<br>3. Create the link share | Public link share is available | :heavy_check_mark: | tst_sharing | :robot: oC10
5 | Create a password protected public link share of a file | 1. From the Public link sharing dialog,  check the **Password protect**<br>2. Set the password<br>3. Create the link share | You can set the password and the link share is available | :heavy_check_mark: | tst_sharing | :robot: oC10
6 | Create a public link share of a file with expiration date | 1. From the Public link sharing dialog,  check the **Set expiration date**<br>2. Set the expiration date<br>3. Create the link share | You can set the expiration date and the link share is available | :heavy_check_mark: | tst_sharing | :robot: oC10
7 | Create a public link share with password and expiration date | 1. Open the public link share dialog<br>2. Set password and expiration date<br>3. Create the link share | The file is shared with password and expiration date | :heavy_check_mark: | tst_sharing | :robot: oC10
8 | Public link a folder and download it using direct download option | 1. Open Public link dialog<br>2. Create the link share<br>3. Open `...` menu of the create link<br>4. Select **copy public link to clipboard (direct download)**<br>5. Paste link in the browser and download it | zip archive of the folder can be downloaded | :construction: ||
9 | Create a public link share of a file using right click menu | 1. Right click a file<br>2. Open the **ownCloud** menu item<br>3. Click **Create and copy public link to clipboard**<br>4. Paste link in the browser and download it | The file can be downloaded | :construction: ||
10 | Create a public link of a file with password containing special characters | 1. From the Public link sharing dialog,  check the **Password protect**<br>2. Set the password (with special characters)<br>3. Create the link share | Public link is created with the password | :heavy_check_mark: | tst_sharing | :robot: oC10
11 | Modify the expiration date from the server | 1. Open public link share dialog and create a share with an expiration date<br>2. From the server, change the expiration date of that link share<br>3. Check the new expiration date in the sharing dialog | You can see the new expiration date | :heavy_check_mark: | tst_sharing | :robot: oC10
12 | Create a public link share and delete it | 1. Create the public link share and copy the link<br>2. Delete the link share<br>3. Paste link in the browser and check | The link reports File not found | :heavy_check_mark: | tst_sharing | :robot: oC10
13 | Create a public link share of a folder with Edit permission | 1. Open the public link share dialog<br>2. Check **Download/View/Edit** role<br>3. Create the link share<br>4. Open the link share in the browser and perform upload, edit, delete actions | The folder can allow editing | :heavy_check_mark: | tst_sharing | :robot: oC10
14 | Create a public link share of a folder with Upload permission only | 1. Open the public link share dialog<br>2. Check **Upload only** role<br>3. Create the link share<br>4. Open the link share in the browser and check that you can only upload | Only upload is possible | :heavy_check_mark: | tst_sharing | :robot: oC10
15 | Enforce password protection | 1. In the server, enable `Enforce password protection`<br>2. From the Public link sharing dialog, try to create the link share | Password enforced error message is shown | :construction: ||
16 | Enforce password protection and try to disable the password | 1. From the server, create a public link share with a password<br>2. Enable `Enforce password protection` in the server<br>2. From the Public link sharing dialog, try to uncheck the password | Password enforced error message is shown | :construction: ||
17 | Enforce expiration date | 1. In the server, enable `Set default expiration date` -> `Enforce expiration date`<br>2. From the Public link sharing dialog, create the link share | The expiration date should be set by default | :construction: |  |
18 | Create a public link with a password. In the server, modify `Password Policies` and edit password | 1. In the server, enable `Password Policy` app and set minimum password to 4 characters<br>2. Open the public link share dialog and create the link share with password<br>3. In the server, change password policy to minimum 8 characters<br>4. From link sharing dialog, edit the password of that link share with short password (< 8 chars)<br>5. Edit password with 8 or more characters | - An error appears stating min password length 8 for the short password<br>- Longer than 8 chars password works | :construction: ||
19 | Try to re-share a file originally received from an LDAP user | 1. LDAP user shares a file with `admin` (with allow share)<br>2. Add `admin` account to desktop client<br>3. Open the sharing dialog of the shared file<br>4. Re-share the with another user<br>5. LDAP user removes share permission from the share<br>6. From desktop client, try to re-share with another user | The file can be re-shared if "Allow Share" was set, otherwise it cannot be re-shared | :construction: ||

#### 10.3 Share with Users and Groups

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Share a folder with a user | 1. Open the sharing dialog<br>2. Search and share with user | Folder is shared with the user (check in the server) | :heavy_check_mark: | tst_sharing | :robot: oC10
2 | Share a file with a group | 1. Open the sharing dialog<br>2. Search and share with group | The file appears in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
3 | Share a file with a user who already has another share | 1. Open the sharing dialog<br>2. Search and share with user | Both files appear in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
4 | Share a folder with a user who already has another file share and folder share | 1. Open the sharing dialog<br>2. Search and share with user | New share and existing shares appear in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
5 | Share a file with a user whose name contains special characters | 1. Open the sharing dialog<br>2. Search the user with special characters and share | Shared file appears in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
6 | Share a file containing special characters with a user | 1. Open the sharing dialog for the file (containing special characters)<br>2. Search and share with user | Shared file appears in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
7 | Share a file bigger than 1 GB with a user | 1. Open the sharing dialog for the file ( > 1GB)<br>2. Search and share with user | Shared file appears in the server | :construction: ||
8 | Try to share with a user that has already received the share | 1. From the server as `user1`, share a file with `user2`<br>2. Add `user1` to the desktop client<br>3. Open the sharing dialog for that shared file<br>4. Try to share with `user2` | The user should not be shown | :heavy_check_mark: | tst_sharing | :robot: oC10
9 | Try to share with yourself | 1. Open the sharing dialog<br>2. Search yourself in the search box | The user should not be shown | :heavy_check_mark: | tst_sharing | :robot: oC10
10 | Search with minimum characters required. For example: 'use' | 1. Open the sharing dialog<br>2. Type minimum search characters (e.g. `use`) in the search box | All users that contains this pattern should be shown | :heavy_check_mark: | tst_sharing | :robot: oC10
11 | Share receivers are listed chronologically | 1. From the server, share a file to multiple users<br>2. Add sharer account to the desktop client<br>3. Open the sharing dialog for that shared file | The users should be listed and ordered chronologically | :heavy_check_mark: | tst_sharing | :robot: oC10
12 | Matching users are listed alphabetically | 1. In the server, create users: `user01`, `user02`, `user03`, ...<br>2. Open the sharing dialog<br>3. Type 'use' in the search box | - Exact match is listed first<br>- Other users are listed alphabetically | :construction: ||
13 | Search a remote user in the search box | 1. Open the sharing dialog<br>2. Search the remote user | The remote user should be shown | :construction: ||
14 | (Federate share) Share a folder with a remote user | 1. Open the sharing dialog for a folder<br>2. Search and share with remote user | The folder appears in the remote server | :construction: ||
15 | (Federate share) Share a file with a remote user | 1. Open the sharing dialog for a file<br>2. Search and share with remote user | The file appears in the remote server | :construction: ||
16 | Share a file with a user from SFTP |  | The file appears in the server | :construction: ||
17 | Share a folder with an LDAP user | 1. Open the sharing dialog for a folder<br>2. Search and share with LDAP user | The folder appears in the server | :construction: ||
18 | Share a file with Reshare permission | 1. Open the sharing dialog and share with user<br>2. Check that `can share` is checked | The file can be reshared with other user by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
19 | Share a folder with Reshare permission | 1. Open the sharing dialog and share with user<br>2. Check that `can share` is checked | The folder can be reshared with other user by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
20 | Share a file with Edit permission | 1. Open the sharing dialog and share with user<br>2. Check that `can edit` is checked | The file can be edited by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
21 | Share a folder with Edit permission | 1. Open the sharing dialog and share with user<br>2. Check that `can edit` is checked | The folder can be edited by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
22 | Share a folder with Change permission | 1. Open the sharing dialog and share with user<br>2. Check that `change` permission is checked (`...` menu) | The folder can be changed by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
23 | Share a folder with Create permission and create a file in it | 1. Open the sharing dialog and share with user<br>2. Check that `create` permission is checked (`...` menu) | Files can be created in the shared folder by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
24 | Share a folder with Create permission and create a folder in it | 1. Open the sharing dialog and share with user<br>2. Check that `create` permission is checked (`...` menu) | Folders can be created in the shared folder by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
25 | Share a folder with Delete permission and delete a file from it | 1. Open the sharing dialog and share with user<br>2. Check that `delete` permission is checked (`...` menu) | Files can be deleted from the shared folder by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
26 | Share a file without Edit permission | 1. Open the sharing dialog and share with user<br>2. Uncheck the `can edit` permission | The file cannot be edited by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10 
27 | Share a folder without Edit permission | 1. Open the sharing dialog and share with user<br>2. Uncheck the `can edit` permission | The file in the shared folder cannot be edited by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
28 | Share a file without Share permission | 1. Open the sharing dialog and share with user<br>2. Uncheck the `can share` permission | The file cannot be reshared by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
29 | Share a folder without Share permission | 1. Open the sharing dialog and share with user<br>2. Uncheck the `can share` permission | The folder cannot be reshared by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
30 | Share a folder without Create permission and try to create a file in it | 1. Open the sharing dialog and share with user<br>2. Uncheck the `create` permission (`...` menu) | File cannot be created inside the shared folder by sharee in the server | :heavy_check_mark: | tst_sharing  | :robot: oC10
31 | Share a folder without Change permission and try to edit a file from it | 1. Open the sharing dialog and share with user<br>2. Uncheck the `change` permission (`...` menu) | File contents cannot be changed from the shared folder by sharee in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
32 | Share a folder without Delete permission and try to delete a file from it | 1. Open the sharing dialog and share with user<br>2. Uncheck the `delete` permission (`...` menu) | Sharee cannot delete the file/folder from the shared folder in the server | :heavy_check_mark: | tst_sharing | :robot: oC10
33 | Disable `Allow resharing` and share a file with Share permission | 1. In the server, disabled `Allow resharing`<br>2. Share a file to user with Share permission in the server<br>3. As share receiver, open the local sync folder<br> 4. Try to reshare the received file using Right click menu | Resharing not allowed option is shown | :construction: ||
34 | Restrict users to only share with users in their groups | 1. In the server, enable `Restrict users to only share with their group members`<br>2. Open the sharing dialog<br>3. Search the users to share | Only the users from the group are shown | :construction: ||
35 | Share with autocompletion disabled | 1. In the server, disabled `Allow user autocompletion`<br>2. Open the sharing dialog and search the users | Full username needs to be entered in order to share | :construction: ||
36 | Try to share with `Allow apps to use the Share API` disabled | 1. In the server, disable `Allow apps to use the Share API`<br>2. Open the local sync folder<br>3. Try to share a folder: `Right click on folder` -> `ownCloud option` | There is no "Share" option while navigating to ownCloud menu option | :construction: ||
37 | Sharing a folder with another user and then renaming it will not change the folder name for another user (sharee) | 1. As `user1`, share a folder with `user2` from the server<br>2. Add `user2` to the desktop client<br>3. As `user1`, rename the shared folder to something else in the server<br>4. As `user2`, wait for sync from desktop client | The folder name for `user1` is not changed. (The shared folder is actually a virtual mount point for all recipients, so renaming it doesn't affect all recipients. Only the contents of it will be visible for anyone) | :construction: ||

### 11. Syncing

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Check that you can choose the local download directory | 1. Start the desktop client and fill in server, user and password<br>2. Check the option to choose local directory in the advanced configuration | Option to choose local sync folder in available | :construction: ||
2.a | **Linux**+**Mac**: Check that the `Download everything` is selected by default | 1. Start the desktop client and fill in server, user and password<br>2. Check the advanced configuration | `Download everything` option is selected | :construction: macOS<br>:construction: linux ||
2.b | **Win**: Check that the `Use virtual files` is selected by default | 1. Start the desktop client and fill in server, user and password<br>2. Check the advanced configuration | `Use virtual files` option is selected | :construction: win ||
3 | Check that all files and folders are synced when you choose to sync all | 1. Start the desktop client and fill in server, user and password<br>2. Finish the account setup | Everything is synced | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
9 | Create a folder in the root directory from the server | 1. Add an account to desktop client<br>2. From the server, add a folder in the root<br>3. Wait for sync | The new folder is synced to the local sync folder | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS

#### 11.1 Skip sync folder configuration

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Skip folder configuration | 1. Start the desktop client and fill in server, user and password<br>2. From the advanced configuration, choose `Configure synchronization manually`<br>3. Connect the account | - No local sync folder is created<br>- The setting window is opened and the account is registered | :construction: ||
2 | Add local sync folder from the settings window | 1. Add an account to desktop client with manual sync configuration<br>2. From the opened settings window, choose the local sync folder and remote folder, and add the connection | The folder start to sync and the folder is available | :construction: ||

#### 11.2 Selective sync

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Verify that you can select to sync only one folder | 1. Add an account to desktop client with manual sync configuration<br>2. In the `Add Folder...` window, choose the local folder and remote folder  and Next<br>3. Select only one folder and add the connection | Only one folder is synced | :heavy_check_mark: | tst_syncing | :robot: oC10
2 | Verify that the unselected folders are not synced | 1. Add an account to desktop client with manual sync configuration<br>2. In the `Add Folder...` window, choose the local folder and remote folder and Next<br>3. Unselect various remote folders from `Deselect remote folders...` window and add the connection | Unselected folders are not synced | :heavy_check_mark: | tst_syncing | :robot: oC10
3 | Verify that the subfolders that you unselect are not synced | 1. From the `Deselect remote folders...` window, select a folder that has many subfolders<br>2. Extend that folder and unselect some subfolders<br>3. Add the connection | The parent folder is synced but not the unselected subfolders | :construction: ||
4 | Folder without subfolder doesn't show the arrow | 1. From the `Deselect remote folders...` window, observe the arrow of different folders with or without subfolders | When you click/sort folders without subfolder the arrow disappear sometimes | :construction: ||
5 | Upload some files from the server in a folder which is selected to be synced | 1. From the `Deselect remote folders...` window, select a folder to sync and add connection<br>2. From the server, upload some files on that folder<br>3. Wait for sync | The added files are synced down | :construction: ||
6 | Upload some files from the file explorer in the synced folder | 1. From the `Deselect remote folders...` window, select a folder to sync and add connection<br>2. From the file explorer, upload some files on that folder<br>3. Wait for sync | The files are synced to the server | :construction: ||
7 | Upload some files from the server in a folder which is  not synced | 1. From the `Deselect remote folders...` window, unselect a folder and add connection<br>2. From the server, upload some files in that unselected folder | The folder and files are not available in the sync folder | :construction: ||
8 | Delete a synced folder from the file explorer | 1. From the `Deselect remote folders...` window, select a folder to sync and add connection<br>2. From the local sync folder, delete that folder<br>3. Wait for sync | The folder is removed in the server | :construction: ||
9 | Delete a synced folder from the server | 1. From the `Deselect remote folders...` window, select a folder to sync and add connection<br>2. From the server, delete that folder<br>3. Wait for sync | The folder is removed from the local sync folder | :construction: ||
10 | Verify that when yo unselect all the folders, the root files continue to sync | 1. From the `Deselect remote folders...` window, unselect all the folders<br>2. Add the connection | Root files are synced | :construction: ||
11 | Verify that the folders to select are sorted by name/size | 1. In the `Add Folder...` window, choose the local folder and remote folder and Next<br>2. Sort the folders by name and size | Sorting works | :heavy_check_mark: | tst_syncing | :robot: oC10

#### 11.3 "Add Folder Sync Connection"

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Skip folder configuration from the setup window and select the local and remote folder from the setting window | 1. Start the desktop client and fill in server, user and password<br>2. Choose `Configure synchronization manually` from the advanced configuration<br>3. Finish the setup<br>4. Click on `Add Folder Sync Connection`<br>5. Select the local folder (choose an existing one)<br>6. Select the remote folder and Next<br>7. Select the sub-folders of the remote folder and click on `Add Sync Connection` | The local folder selected is synced with the remote one | :construction: ||
2 | Select a remote folder with special characters | 1. Add an account to desktop client with manual sync configuration<br>2. Click on `Add Folder Sync Connection`<br>3. Select the local folder (create a new folder with special characters)<br>4. Select the remote folder with special characters and Next<br>5. Select the sub-folders of the remote folder and click on `Add Sync Connection` | The local folder selected is synced with the remote one | :construction: ||

### 12. Overlay icons

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | If the system is offline, there are no overlay icons present | 1. Disconnect the Internet<br>2. Launch the Desktop client<br>3. Check the overlay icons in the local sync folder | The overlay icons are not shown| :construction: ||
2 | When you pause the sync, the overlay icons are still shown | 1. Launch the Desktop client<br>2. Check the overlay icons<br>3. Pause the sync<br>4. Check the overlay icons | The overlay icons disappear | :construction: ||
3 | Green check (All files within a folder all the way down the tree are synced with the server) | 1. Open the local sync folder<br>2. Add a folder having multiple nested files and folders<br>3. Check the overlay icons | The green check is shown in all the folders/files | :construction: ||
4 | Blue spinning icon (Some or all files/folders in the directory are waiting to sync or are actively in sync) | 1. Open the local sync folder<br>2. Add some files and folders<br>3. Check the overlay icons | The files/folder that are waiting to sync have the blue icons | :construction: ||
5 | Yellow warning triangle (There is an error in sync somewhere in the directory such as a path longer than 255 characters, a bad character in a name or a file firewall problem) | 1. Open the local sync folder<br>3. Add a problematic file<br>3. Check the overlay icons | The files that are not synced due to a problem have the yellow warning triangle icons | :construction: ||
6 | Red error Icon (There is a fatal problem in the sync process that can't be resolved) | 1. Open the local sync folder<br>3. Create a sync error<br>3. Check the overlay icons | The files/folders that are not synced due to a fatal problem have the red error icons | :construction: ||

