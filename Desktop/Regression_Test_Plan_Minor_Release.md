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
4 | Verify that you can sync a folder with many subfolders | 1. Outside the sync root, create a folder with 5 empty subfolders and 5 subfolders containing files<br>2. Move that folder into the sync root<br>3. Wait for sync to complete | All 10 subfolders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
5 | Verify that you can sync many folders at once | 1. Create 400 folders outside the sync root<br>2. Move those folders into the sync root<br>3. Wait for sync to complete | All 400 folders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
6 | Verify that you can copy a folder | 1. Open local sync folder<br>2. Create a folder with some files in it<br>3. Copy and paste that folder<br>4. Wait for sync to complete | Both original and copied folders appear on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
7 | Verify that you can create a subfolder with long name | 1. Open local sync folder<br>2. Create a folder<br>3. Create a subfolder with long name (~220 characters)<br>4. Wait for sync to complete | Folder and subfolder are available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
8 | Verify that pre-existing folders are synced to the server | 1. Quit the desktop client<br>2. Goto the local sync folder<br>3. Create folders at several levels<br>4. Open the desktop client<br>5. Wait for sync to complete | All folders appear on the server | :construction: ||
9 | Sync works for .zip/.rar files with elaborate internal folder structures | 1. Create a zip file with many internal folders and files<br>2. Copy that zip file into the sync root<br>3. Unzip that zip file inside the sync root | All extracted files and folders are available on the server | :construction: ||
10 | Files that error with API should try 3 times, and then blacklist | 1. Try to sync a folder that has more than 65 characters<br>2. Then sync it with some contents, it should try three times and then be blacklisted<br>3. If you rename the folder, it should try again and succeed if the name is less than 65 characters | The folder is synced | :construction: ||
11 | Invalid system names | 1. On the server, create folders `CON`, `COM1` and `test%` and files `PRN` and `foo%`<br>2. Add that account to desktop client | - MacOS client syncs down `CON`, `COM1` and `PRN` but not `test%` and `foo%`<br>- Windows client syncs down `test%` and `foo%` but not `CON`, `COM1` and `PRN`<br>- Linux client syncs down all | :construction: Win<br>:construction: macOS<br>:heavy_check_mark: Linux | tst_syncing | :robot: oC10<br>:robot: oCIS
12 | Long path on Windows (VFS OFF) syncs ** | 1. On the server, create a file (~30 chars) inside 6 subfolders (each ~50 chars) to get a path length > 260 chars (> MAX_PATH)<br>2. Start desktop client and add that account with VFS OFF<br>3. Open local sync folder and enter the subfolders<br>4. Create a new file | 1. All subfolders and a file are available in the local sync folder<br>2. New file is synced to the server | :construction: Win ||
13 | Long path on Windows (VFS ON) syncs ** | 1. On the server, create a file (~30 chars) inside 6 subfolders (each ~50 chars) to get a path length > 260 chars (> MAX_PATH)<br>2. Start desktop client and add that account with VFS ON<br>3. Open local sync folder and enter the subfolders<br>4. Create a new file | 1. All subfolders and a file are available in the local sync folder<br>2. New file is synced to the server | :construction: Win ||
14 | Long path explorative testing on Windows ** | Use test scenarios 12-13 to perform tests like: create more files/subfolders in Explorer or in terminal (PowerShell), move files/folders, rename, edit a file, etc. | Folder/files are synced without errors | :construction: Win ||

** Make sure LongPathsEnabled in Windows registry is 'off' (see https://docs.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=cmd). Nevertheless the client should handle the long path > 260 correctly.

### 3. Files

Note: "Via Web" means check files on server in web browser

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Verify that you can create a file | 1. Add an account to desktop client<br/>2. Open local sync folder<br>3. Create a file | - observe a BLUE progress icon followed by a GREEN icon in the file explorer<br>- the file is available on the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
2 | Add various types of files | 1. Open local sync folder<br>2. Create/upload various types of files `Microsoft Word`, `Microsoft Excel`, `Microsoft Powerpoint`, `JPG`, `PDF`, `MP3`, etc |- the Sync files tab shows all the files as synced<br>- all files are available on the server | :heavy_check_mark: | tst_syncing |:robot: oC10<br>:robot: oCIS
3 | File with long name can be synced | 1. Open local sync folder<br/>2. Create a file with long name: `thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIsAVeryLongFileNameToCheckThatItWorks-thisIs.txt` | Sync is successful | :heavy_check_mark: | tst_syncing |:robot: oC10<br>:robot: oCIS
4 | File with a name having 233 characters or more cannot be synced | 1. Open local sync folder<br/>2. Create a file having >=233 characters<br>3. Observe the sync process | The "Not synced" tab shows an error, the file is blacklisted | :heavy_check_mark: | tst_syncing |:robot: oC10
5 | User copies/drag&drops multiple files at a time to the Sync folder | 1. Copy some files to the local sync folder<br>2. Drag&Drop some files to the lcoal sync folder | - user can see the completed GREEN icon overlay on all types of files<br>- the Sync files tab shows all files as synced | :construction: ||
6 | Sync files (from server and desktop client) at the same time | 1. Add a file of 1MB inside the local sync folder, and in the same time, add another file on the same remote folder (make sure that the server file is uploaded before the client finishes) | Look at Via Web and the Desktop Client to make sure that the sync is correct | :construction: ||
7 | Same name files but with different extensions | 1. Open local sync folder<br/>2. Create two files with same name but different extensions | Both files sync correctly | :construction: ||
8 | File with spaces in the name | 1. Open local sync folder<br/>2. Create, copy or move a file (having space in its name) in the local sync folder | File syncs correctly | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
9 | Create and delete a file with special characters in the name | 1. Open local sync folder<br/>2. Create/upload a file with special characters in its name (e.g. **~`!@#$^&()-_=+{[}];',**)<br>3. Wait for sync to complete<br>4. Delete the file from the local sync folder | Look via the Web and make sure that the file got deleted | :construction: ||
10 | Upload a 50MB file | 1. Create a folder inside the local sync folder<br>2. Copy a large file (50MB) in this folder | The file is synced to the server | :construction: ||
11 | Upload a 3GB file | 1. On the server, upload a large 3GB file<br>2. Add that account to desktop client | File is synced to the desktop client | :construction: ||
12 | Upload multiple files (resulting to 1000MB) | 1. Open local sync folder<br/>2. Upload a folder containing 1000 files (1MB each) | All files are synced to the server | :construction: ||
13 | Upload 500MB + 500MB files | 1. Open local sync folder<br/>2. Upload two folders containing 500 files each (1MB per file) | All files are synced to the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
14 | Upload a 1024MB file | 1. Open local sync folder<br/>2. Upload a 1GB file | The file is synced to the server | :heavy_check_mark: | tst_syncing | :robot: oC10<br>:robot: oCIS
15 | Verify the limit of the quota | 1. Open local sync folder<br/>2. Upload the necessary large files to fill up the quota | Warning: "The available space of your workspace is running out, please delete some files to free space" | :construction: ||

### 4. Move files and folders
#### NOTE: Could be automated using move functions from python

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Move from sub-levels to root | 1. Move couple of files and folders from different sub-levels to the sync root<br>2. Wait for sync to complete<br>3. Check the contents of files and folders | The contents are correct (on the server) | :construction: ||
2 | Move a folder down to sub-folder | 1. Move a folder from sync root to a 5 level deep sub-folder<br>2. Wait for sync to complete<br/>3. Check the folder content | The content of the folder is correct (on the server) | :construction: ||
3 | Move a folder up from sub-folder to the root | 1. Move a folder from a 5 level deep folder to the sync root<br>2. Wait for sync to complete<br/>3. Check the folder content | The content of the folder is correct (on the server) | :construction: ||
4 | Move files from one folder to another | 1. Move some files from `Folder1` to `Folder2`<br>2. Wait for sync to complete<br/>3. Check both folders contents | Both folders have the correct content (on the server) | :construction: ||
5 | Move two or more folders down to sub-folder | 1. Move two or more folders from sync root to a 5 level deep sub-folder<br/>2. Wait for sync to complete<br/>3. Check the folders contents | The contents of the all the folders are correct (on the server) | :construction: ||
6 | Move two or more folders up from sub-folder to the root | 1. Move two or more folders from a 5 level deep folder to the sync root<br/>2. Wait for sync to complete<br/>3. Check the folders contents | The contents of the all the folders are correct (on the server) | :construction: ||

### 5. Edit Files

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Edit a .txt file | 1. Create a .txt file in the local sync folder<br>2. Add some text<br>3. Wait for it to sync<br>4. Modify the .txt file and add more content<br>5. Wait for it to sync<br>6. Modify the .txt file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :heavy_check_mark: | tst_editFiles | :robot: oC10<br>:robot: oCIS
2 | Edit a .doc file | 1. Create a .doc file in the local sync folder<br>2. Add some text<br>3. Wait for it to sync<br>4. Modify the .doc file and add more content<br>5. Wait for it to sync<br>6. Modify the .doc file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :construction: ||
3 | Edit a .xls file | 1. Create a .xls file in the local sync folder<br/>2. Add some text<br/>3. Wait for it to sync<br/>4. Modify the .xls file and add more content<br/>5. Wait for it to sync<br/>6. Modify the .xls file and add more content<br/>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :construction: ||
4 | Replace a .pdf file | 1. Create a .pdf file in the local sync folder<br>2. Replace it with a same name pdf file having different content<br>3. Wait for it to sync<br>4. Modify the .pdf file and add more content<br>5. Wait for it to sync<br>6. Modify the .pdf file and add more content<br>7. Wait for it to sync | The file at the server had the same content after the sync is completed | :construction: ||
5 | Edit a file while the folder is renaming | 1. Add an account to desktop client that has a folder containing a file in it<br/>2. From the file explorer, open that file and edit it<br>3. From the web, rename the folder<br>4. Sync with the oc-worker<br>5. Do not refresh the browser and download the file edited | The file on the server has the same content | :construction: ||
6 | Rename file and folder at the same time | 1. Add an account to desktop client that has a folder containing a file in it<br>2. From the web, rename that folder and at the same time from the file explorer, rename a file contained in that folder | File and folder should be renamed both in the server and locally | :construction: ||

### 6. Delete Files and Folders

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Delete a file | 1. On the server, create a file<br>2. Add that account to the desktop client<br>3. Open the local sync folder<br>4. Delete that file | The file is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders | :robot: oC10<br>:robot: oCIS
2 | Delete a file with long name | 1. On the server, create a file with long name<br/>2. Add that account to the desktop client<br/>3. Open the local sync folder<br/>4. Delete that file | The file is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders (Maximum length of filename is 228 chraracter) | :robot: oC10<br/>:robot: oCIS
3 | Delete a folder | 1. On the server, create a folder<br/>2. Add that account to the desktop client<br/>3. Open the local sync folder<br/>4. Delete that folder | The folder is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders | :robot: oC10<br>:robot: oCIS
4 | Delete a folder with long name | 1. On the server, create a folder with long name<br/>2. Add that account to the desktop client<br/>3. Open the local sync folder<br/>4. Delete that folder | The folder is deleted on the server | :heavy_check_mark: | tst_deletFilesFolders | :robot: oC10<br/>:robot: oCIS
5 | Delete multiple files | 1. On the server, create some files<br/>2. Add that account to the desktop client<br/>3. Open the local sync folder<br/>4. Delete some files | The files get deleted on the server | :construction: ||
6 | Delete a large file (2048MB) | 1. On the server, create a large file (2048MB)<br/>2. Add that account to the desktop client<br/>3. Open the local sync folder<br/>4. Delete that file | The file gets deleted on the server | :construction: ||


### 7. Sync process

ID | Test Case | Steps to reproduce | Expected Result | Result | Related Comment (Squish-test) | Server
-- | --------- | ------------------ | --------------- | ------ | ----------------------------- | ------
1 | Move a file while in sync | 1. Move couple of files (`File1` and `File2`) with different contents to the root sync folder<br>2. Let them sync<br>3. Move other files to the root sync folder and while in sync,  delete `File1` and rename `File2` to`File1` | The content of file is correct | :construction: ||
2 | Edit a file while in sync | 1. Create a .txt file with some content<br>2. Let it sync<br>3. Rename the file and while in sync, edit the content of the .txt file | The content of file is correct | :construction: ||
3 | Delete folders while in sync | 1. Create folders tree folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder)<br>2. Delete some folders while in sync | Folders get deleted on the server | :construction: ||
4 | Delete folders while sync with two clients | 1. Create a tree of folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder)<br>2. Delete some folders and while in sync, sync with another client at the same time | In the server, make sure that the folders got deleted and the remaining folders sync correctly | :construction: ||
5 | Create a new folder with space at the end | 1. Open the local sync folder<br>2. Create a folder with space at the end | Look if it syncs | :construction: | If you create a folder with a space at the end, your os (nautilus @ ubuntu) will remove this space. The folder is syncing |
6 | Try to share with "Allow apps to use the Share API" disabled | 1. In the server, disable `Allow apps to use the Share API` from Sharing settings<br>2. Add an account to the desktop client<br>3. Open the local sync folder<br>4. Create a new folder<br>5. From file explorer, try to share this folder: `Right click on folder` -> `ownCloud option` | There is no "Share" option while navigating to ownCloud menu option | :construction: ||
7 | Sharing a folder with another user and then renaming it will not change the folder name for another user (sharee) | 1. As `user1`, share a folder with `user2` from the server<br>2. Add `user2` to the desktop client<br>3. As `user1`, rename the shared folder to something else in the server<br>4. As `user2`, wait for sync from desktop client | The folder name for `user1` is not changed. (The shared folder is actually a virtual mount point for all recipients, so renaming it doesn't affect all recipients. Only the contents of it will be visible for anyone) | :construction: ||

### 8. Spaces and permissions

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment | Server
------------ | ------------- | -------------- | ----- | ------ | ------ | -----
1 | Viewer can view files in Space | 1. Add a space as a user with Viewer permissions 2. Open a file from the space | The file has been opened | | |
2 | Viewer cannot edit files in Space | 1. Add a space as a user with Viewer permissions  2. Make changes in a file 3. Save the file | Changes are not synced | | |
3 | Editor can rename files in Space | 1. Add a space as a user with Editor permissions 2. Rename a file in the space | Change has been saved and synced | | |
4 | Manager can add new folders in Space | 1. Add a space as a user with Manager permissions 2. Create a new folder in the space | Folder has been synced | | |

### 9. Without connection
#### NOTE: It would be better to have the following tested manually instead of automating them

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment | Server
------------ | ------------- | -------------- | ----- | ------ | ------ | -----
1 | Upload several files and folder to the sync folder without internet| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server |  :construction:  | |
2 | Upload several files and folder with special characters to the sync folder without internet| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server |  :construction:  | |
3 | Upload the same folder from the server and form the client with differente files inside| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server | :construction:   | |
4 | Remove folder from the client| 1. Remove one folder from the local folder 2. The connection is back | The folder is not on the server | :construction:  | |

### 10. Sharing

#### 10.1 Share link

TestID | Test Case | Steps to reprouce| Expected Result | Result             | Related Comment | Server
------------ | ------------- | -------------- | ----- |--------------------|--------------------------------------------------------------------------- | -----
1 :robot: | Share a Folder/File with special characters| 1. User share a folder (special characters /, <,>,:,?) with you; 2. On the server accept the share, (if needed);  3. Refresh the parent folder | File/Folder is not displayed as shared| :heavy_check_mark: | tst_sharing |:robot: oC10 |
2 :robot: | Share a Folder/File with special characters| 1. User share a folder (special characters in the name $%ñ&) with you 2. Refresh the parent folder | File/Folder is displayed as shared | :heavy_check_mark: | sharing works on Linux and window. TODO: try mac tst_sharing |:robot: oC10 |
3 :robot: | Unshare the Folder/File | 1. User unshare a folder/file with you 2. Refresh the folder/file | File/Folder is not shown as shared| :heavy_check_mark: | tst_sharing   |:robot: oC10 |
4 | Unshare the Folder with you | 1. at client navigate to shared folder with file browse or shell; 2. User unshares this folder with you 3. Upload file from Desktop Client | New unshared folder | :construction: | |
5 | Verify shared icon, Ubuntu | 1. Install nemo extension, 2. assert that both owncloud plugins are enabled in nemo, 3. Share a folder/file | A fork-icon is overlayed on shared folders/files | :construction: | |
6 | Verify shared icon, Win+non-VFS | 1. User share a folder | When the folder or file is shared by link show a special icon | :construction:  |  |
7 | Verify shared icon, Win+VFS | 1. User share a folder | No sharing indicator (only status) is shown in VFS mode | :construction:  |  |
8 | Move a shared folder with permissions | 1. Move a shared folder with permissions inside another shared folder from Desktop; 2. The needed permission is Edit-Write on the "other" folder. | Cannot move to another shared folder (403 Forbidden) | :construction: |     |
11 :robot: | Share a file with many users | 1. Having one file shared with 80 users | The Desktop works fine, list of users can be scrolled | :heavy_check_mark: :construction: | (automated with 3 users, tst_sharing) - prefer manual testing for larger users             |:robot: oC10 |
12 :robot: | Share a Folder with public link and Password protect| 1. Create a new folder 2. Share with oC 3. Check Share link option 4. Check Password protection 5. Introduce the password 6. Press Enter or Click on Set password option | You can write the password| :heavy_check_mark: | tst_sharing |:robot: oC10 |
13 :robot: | Share a Folder with public link and Set expiration date| 1. Create a new folder 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date | You can configurate the expiration date | :heavy_check_mark: | tst_sharing |:robot: oC10 |
14 :robot: | Share a Folder with Allow editing| Create a new folder 2. Share with oC 3. Check Share link option 4. Check Allow editing option  | The Folder can allow editing|  :heavy_check_mark: | tst_sharing   |:robot: oC10 |
15 :robot: | Share a File with Public link and Password protect| 1. Create a new file 2. Share with oC 3. Check Share link option 4. Check Password protection 5. Introduce the password 6. Press Enter or Click on Set password option  | You can write the Password protect | :heavy_check_mark: | tst_sharing |:robot: oC10 |
16 :robot: | Share a File with public link and Set expiration date| 1. Create a new file 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date |You can configurate the expiration date | :heavy_check_mark: | tst_sharing |:robot: oC10 |
17 | Modify the Set expiration date option on the server| 1. Create a new file on the Desktop 2. Share with oC 3. Create Public link at the client; 4. Check the Set expiration date 5. Introduce one day for expiration date 6. Go to the Server and change the date 7. Go to the Desktop 8. Wait to sync | You can see the new date on Set expiration date | :heavy_check_mark: | tst_sharing  |
18 :robot: | Public link a file and download it | 1) right click a file - open the share menu; 2) Create and copy public link to clipboard; 3) paste link in a web browser; 4) download | The file can be downloaded | :heavy_check_mark: | tst_sharing        | :robot: oC10 |
19 :robot: | Public link a folder and download it | 1) right click a folder - open the share menu; 2) Create public link; 3) 3dots menu -> "copy public link to clipboard (direct download)"; 4) paste link in a web browser | A zip archive of the folder can be downloaded | :heavy_check_mark: | tst_sharing        |:robot: oC10 |
20 :robot: | Public link to a file and disable it after | use the sharing menu to delete the public link | The link reports File not found. | :heavy_check_mark: |  tst_sharing  |:robot: oC10 |
21 | Public link to a folder with 'Upload only (File Drop) | 1) classic web UI create the public link as another user,</br>2) as your user, paste the link to "add to your owncloud",</br>3) wait for sync, visit the folder on the deskop,</br>4) Rename a file in the folder | Rename fails, an error message is shown | :construction: | FIXME: 2.10.0 silently duplicates the file |
22 | Try to reshare a file originally received from an LDAP user | | The file can be reshared, if "Allow Share" was set, otherwise it cannot be reshared | :construction:  | (2.9.0 issue https://github.com/owncloud/client/issues/8941 ) |
23 :robot: | Public link to a file and set a password with special characters | | The file is shared with a pwd |  :heavy_check_mark: | tst_sharing  |:robot: oC10 |
24 | Public link to a file and set a password. Modify Password Policies and retry | 1) enable Password Policy server app allow passwords with 4 chars; 2) share with a 4 char password; 3) change password policy to min 8 chars. 4) use client sharing dialog to remove the password, and re-enter the short password; 5) enter a password with 8 chars  | An error appears stating min passwiord length 8 for the short password; a longer than 8 chars password works  | :construction: |  |


#### 10.2 Share with Users and Groups

TestID | Test Case | Expected Result | Result | Related Comment | Server
------ | --------- | --------------- | ------ | --------------- | -----
1 :robot: | Share a file with a user that has been already shared another file | Both files appear in server | :heavy_check_mark:| tst_sharing |:robot: oC10 |
2 :robot: | Share a folder with a user | The folder appears in server | :heavy_check_mark:| tst_sharing |:robot: oC10 |
3 :robot: | Share a folder with a user that has been already shared another folder and another file | Both folders appear and the file in server | :heavy_check_mark:| tst_sharing |:robot: oC10 |
4 :robot: | Share a file with a group| The file appears in server |:heavy_check_mark:| tst_sharing |:robot: oC10 |
5 | Share a folder with an LDAP user | The folder appears in server |  :construction:|  |
6 | Share a folder with remote user on a 10.2.1 server| The folder appears |:construction:|  |
10 | Receive a federated share from a 10.2.1 server | When auto-accept is disabled: Notification with Dismiss/Accept/decline appears in the "Server Activity" tab | :construction:|    |
11 :robot: | Share a file with one user whose name contains special characters | The file appears in server |:heavy_check_mark:| tst_sharing |:robot: oC10 |
12 :robot: | Share a folder with one users a file whose name contains special characters | The folder appears in server |:heavy_check_mark:| tst_sharing |:robot: oC10 |
13 | Share a file bigger than 1 GB with one user | The file appears in server | :construction:| |
14 | Try to federate share a file with one user | The file appears in server, expect delays |:construction:|  |
15 | Share a file from SFTP with a user | The file appears in server |:construction:| |
19 | Share a file from a Federated Sharing with a user | The file appears in server |:construction:| |
22 :robot: | Share a file with user B with Can Share permissions enabled. Login as User B and reshare it | The file can be reshared in the server with other user| :heavy_check_mark:| tst_sharing | :robot: oC10 |
23 :robot: | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it  | The file can be edited in the server with other user | :heavy_check_mark:| tst_sharing | :robot: oC10 |
24 :robot: | Share a file with user B with Change permission enabled. Login as User B and change it  | The file can be changed in the server with other user | :heavy_check_mark:| tst_sharing | :robot: oC10 |
25 :robot: | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. try to edit it again | The file can be edited in the server with other user | :heavy_check_mark: | tst_sharing | :robot: oC10 |
26 :robot: | Share a folder with user B with Can Share permissions enabled. Login as User B and reshare it | The folder can be reshared in the server with other user |:heavy_check_mark:| tst_sharing | :robot: oC10 |
27 :robot: | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it  | The folder can be edited in the server with other user | :heavy_check_mark:| tst_sharing | :robot: oC10 |
28 :robot: | Share a folder with user B with Change permission enabled. Login as User B and change it  | The folder can be changed in the server with other user | :heavy_check_mark:| tst_sharing | :robot: oC10 |
29 :robot: | Share a folder with user B with Create permissions enabled. Login as User B and create a file in it | The folder can be edited creating a file in the server with other user | :heavy_check_mark:| tst_sharing | :robot: oC10 |
30 :robot: | Share a folder with user B with Create permissions enabled. Login as User B and create a folder in it | The folder can be edited creating a folder in the server with other user | :heavy_check_mark:| tst_sharing | :robot: oC10 |
31 :robot: | Share a folder with user B with Can Edit permissions enabled. Login as User B and delete it  | The folder can be deleted in the server with other user | :heavy_check_mark: | tst_sharing | :robot: oC10 |
32 :robot: | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. Try to edit it again | The folder cannot be edited the second time | :heavy_check_mark: | tst_sharing | :robot: oC10 |
33 :robot: | Share a file with user B without Can Share permission enabled. Login as User B and try to reshare it | The file cannot be reshared |  :heavy_check_mark:| tst_sharing | :robot: oC10 |
34 :robot: | Share a file with user B without Can Edit permission enabled. Login as User B and try to edit it  | The file cannot be edited | :heavy_check_mark: | tst_sharing | :robot: oC10 |
35 :robot: | Share a file with user B without Change permission enabled. Login as User B and try to change it  | The file cannot be changed | :heavy_check_mark: | tst_sharing | :robot: oC10 |
36 :robot: | Share a folder with user B without Can Share permission enabled. Login as User B and try to reshare it | The folder cannot be reshared | :heavy_check_mark:| tst_sharing | :robot: oC10 |
37 :robot: | Share a folder with user B without Can Edit permissions enabled. Login as User B and try to edit it  | The folder cannot be edited, i.e. neither creating or deleting a file nor changing a file content is possible |  :heavy_check_mark:| tst_sharing | :robot: oC10 |
38 :robot: | Share a folder with user B without Create permissions enabled. Login as User B and try to create a file in it  | Creating a file inside the folder isn't possible | :heavy_check_mark: | tst_sharing  | :robot: oC10 |
39 :robot: | Share a folder with user B without Change permissions enabled. Login as User B and try to change a file inside the folder | The file content cannot be changed | :heavy_check_mark: | tst_sharing | :robot: oC10 |
40 :robot: | Share a folder with user B without Delete permissions enabled. Login as User B and try to delete it  | Deleting the folder or files in it isn't possible | :heavy_check_mark: | tst_sharing  | :robot: oC10 |
43| Share link a file with a user and set a password and a expiration date | The file is shared with pwd and expiration date | :heavy_check_mark:| tst_sharing |
44 | Share link a file with a user and set a password and a expiration date. Change the expiration date | The file is shared with the updated expiration date | :heavy_check_mark:| tst_sharing |
45 | Share link a file with a user and set a password and a expiration date. Change the pwd | The file is shared with the updated pwd |   :heavy_check_mark:| tst_sharing |
46 :robot: | Try to search a user that has already been shared the file in the users searchbox | The user should not be shown | :heavy_check_mark:| tst_sharing | :robot: oC10
47 | Try to search yourself in the users searchbox | The user should not be shown | :heavy_check_mark:| tst_sharing |
48 :robot: | Search with minimum characters required. For example: 'pat' | All users that contains this pattern should be shown | :heavy_check_mark:| tst_sharing | :robot: oC10
49 | Try to search a remote user in the users searchbox | The user should be shown |  :construction:| |
50 :robot: | Share a file with more than 4 users | The users should be listed and ordered chronologicaly. If is needed a scrollbar will appear | :heavy_check_mark:| tst_sharing | :robot: oC10
51 | Sharing Dialog<br>1)use a server with user01, user02, user03, ...<br>2)enter 'us' prefix in the search<br>3)matching users are listed.  | The users are listed alphabetically. An exact match is listed first. |  :construction:|  |
52 :robot: | Enforce password protection on public links | Password should be always required | :heavy_check_mark:| tst_sharing | :robot: oC10
53 | Enforce password protection on public links<br>Try to disable the pwd | Password should be always required | :heavy_check_mark:| tst_sharing |
54 :robot: | Set default expiration date  on public link | The expiration date should be set by default | :heavy_check_mark:| tst_sharing | :robot: oC10
55 | Allow resharing disabled and Can Share enabled  | The user cannot reshare files | :heavy_check_mark:| tst_sharing |
56 | Restrict users to only share with users in their groups | It should appear only the users from the group |:construction:| |
57 | Disallow username autocompletion in share dialogs | Full username needs to be entered in order to sharing | :heavy_check_mark:| tst_sharing |

### 11. Selective_Sync

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment | Server
------------ | ------------- | -------------- | ----- | ------ | ------ | -----
1  :robot: | Check that in the setup options after fill in the server and the user you have to choose the server and local folder to sync| 1. Start to setupo oC Desktop 2. Fill in server, user and password 3. The server and local folder to sync is shown|1. On server (you have to choose what do yo want to sync) 2. local folder (the local folder where the data are sync) | :heavy_check_mark: | tst_syncing | :robot: oC10,<br> :robot: oCIS |
2a :robot: | Linux+Mac: Check that in the setup options the checkbox is enable to sync all the account by default | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Choose what to sync" | At window is opened with the directory tree |:heavy_check_mark:  | tst_syncing | :robot: oC10 | 
2b | Win10: Check that in the setup options the checkbox is enable to "use virtual files" default | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Synchronize everything from server"; 4. "Choose what to sync" | At window is opened with the directory tree | :construction: |  |
3 :robot: | Check that all files and folders are synced when you select to sync all | 1. Start to setup oC Desktop 2. Fill in server, user and pass 3. Click on "Sync everything from server" and wait until everything is sync| Everything is synced | :heavy_check_mark: | tst_syncing | :robot: oC10,<br> :robot: oCIS |
4 :robot: | Verify that you can select to sync only one folder | 1. Start to setup the oC Desktop 2. The new window select what folder sync is shown 3. Select to sync only one folder 4. Click on OK | Only one folder is sync |:heavy_check_mark:  | tst_syncing | :robot: oC10 |
5 | Verify that the folder to select are sorted by name/size| 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Select all the folder except one of them| Everything except one folder is synced  |:heavy_check_mark:  | tst_syncing |
6 | Check that there are another option: skip sync, so that nothing is synced | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Manually create folder sync connection"| The settings windows is openend but no local folder is configured| :heavy_check_mark: | tst_syncing |

#### 11.1 Choose what to sync from the setup window

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment | Server
------------ | ------------- | -------------- | ----- | ------ | ------ | -----
1 :robot: | Verify that the folders that you unselect are not sync in Desktop| 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | Check that the folder unselected are not sync| :heavy_check_mark: | tst_syncing | :robot: oC10|
2 | The folder without subfolder doesn't show the arrow| 1. Start to setup the oC Desktop app 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolder | When you click on a folder without subfolder the arrows disappear sometimes|:construction: | |
3 :robot: | Verify that the folders that you unselect are not sync in Desktop| 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | The parent folder is sync but not the subfolder| :heavy_check_mark: | tst_syncing | :robot: oC10
4 | Upload from the server some files in a folder which is sync| 1. Start to setup the oC Desktop app 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Upload files from server | The files are download in the desktop client|:construction:  |  |
5 | Upload from the Desktop some files | 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Upload files from server in a folder wich is not sync | The files are sync with the server| :construction: |  |
6 | Upload from the server some files in a folder which is  not sync | 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolder 4. Upload files from server which is not sync | The files are not downloads in the Desktop client | :construction: |  |
7 | Delete a folder sync, it is removed from the Desktop | 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kids of folder with and witout subfolders 4. Delete a folder sync, it is removed from the desktop | The folder is removed int he server |:construction:  |  |
8 | Delete a sync folder from the server | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Delete a sync folder from the server | The folder is removed int he Desktop | :construction: |  |
9 | Create a folder in the root directory from the server | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Create a folder in the root directory from the server | The folder is sync | :construction: |  |
10 | Rename a folder that is sync | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Rename a folder that is sync | It is renamed in the window "Choose what to sync" |:construction:  |  |
11 | Delete a folder that is sync | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | It is not shown in the window "Choose what to sync" | :construction: |  |
12 | Verify that when yo unselect all the folder, the root files continue sync| 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | Root files are sync |:construction:  |  |
13 | When you click on "Choose what to sync" folder tree is shown | 1. Click on "Choose what to sync" | It takes folder time to appear the folder tree,  | :heavy_check_mark: | tst_syncing | |


#### 11.2 "Skip folders configuration"

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment | Server
------------ | ------------- | -------------- | ----- | ------ | ------ | -----
1 |Skip folder configuration| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" | 1. No one local folder is sync 2. The setting window is opened and the account is registered| :construction:  | There is no skip button. The only way to reproduce this case is to mark "Manually create folder sync connection" on and click the "connect" button |
2 |Sync only one folder the settings view | 1. Start to setupo oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Settings window/add folder| The folder start to sync and the folder is available from the tray icon| :construction: |  |

#### 11.3 "Add Folder..."

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment | Server
------------ | ------------- | -------------- | ----- | ------ | ------ | -----
1 |Skip folder configuration from the setup window and select the local and remote folder front he setting window| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Add folder 5. Select the local folder (choose an existing one) 6. Select the remote folder, click on continue 7. Select the subfolders of the remote folder and click on add | 1. The local folder selected is sync wich the remote one| :construction:   |  |
2 |Select a remote folder with special characters| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Add folder 5. Select the local folder (create a new folder with special characters) 6. Select the remote folder with special characters, click on continue 7. Select the subfolders of the remote folder and click on add | 1. The local folder selected is sync wich the remote one|  :construction:  |  |

### 12. Overlay_icons

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment| Server
------------ | ------------- | -------------- | ----- | ------ | ------| -----
1 | If the system is offline, there are no overlay icons present | 1. Launch the Desktop 2. The overlay icons are not shown 3. Quit the Desktop | The overlay icons are not shown| :construction: |  |
2 | When you pause the sync, the overlay icons are still shown | 1. Launch the Desktop 2. The overlay icons are shown 3. Click on Pause | The overlay icons disappear | :construction:   |  |
3 | Green check (All files within the folder (all the way down the tree) are sync with the server, and there are no problems to report) | 1. The account is sync | The green check is shown in all the folders/files| :construction:  |  |
4 | Blue spinning icon (Some or all files/folders in the directory are waiting to sync or are actively sync) | 1. The account is sync | The files/folder that are waiting to sync have the blue icon|  :construction:  |  |
5 | Yellow warning triangle (There is an error in sync somewhere in the directory such as a path longer than 255 characters or a bad character in a name o a file firewall problem) | 1. The account is sync |The files that are not sync because they have a problem... Have a yellow warning triangle | :construction:   |  |
6 | Red error Icon (There is a fatal problem in the sync process that can't be resolved) | 1. The account is sync | The files/folders that are not sync because have a problem... Have a red error icon| :construction:   |  |

