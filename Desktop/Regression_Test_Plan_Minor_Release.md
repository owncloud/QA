1. Create a new testplan ticket in the owncloud/client repo, copy the text below into it:

```
# Regression test for the Desktop Client

[Test Plan Template](https://github.com/owncloud/QA/blob/master/Desktop/Regression_Test_Plan_Minor_Release.md)

## Previous requirements

Have a Desktop Client vX.X.0 ready to be used for testing.
 -> download URL
Prepare a 10.2.1 server with ssl activated and trusted certificates.
 - `env OC10_VERSION=10.2 bash make_oc10_apps.sh --`
 -> server URL
 
Have the lastest released OC server ready with LDAP and two external storages of your choice (SFTP and WND) used for specific tests
 - `env OC10_DNSNAME=oc1080-ldap-DATE bash make_oc10_apps.sh oauth2 user_ldap  password_policy files_pdfviewer windows_network_drive=2.0.0`
 -> server URL

Optional: Have an Active Directory server ready to be used with owncloud.

Avoid to use the same server for all persons who are testing but prepare an indivdual latest server in docker `env OC10_VERSION=latest bash make_oc10_apps.sh --`

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

### 1. Settings windows - Login

TestID | Test Case | Steps to reproduce |Expected Result |Result | Related Comment (Squish-Test)
------------ | ------------- | ------------- | ------- | ----- | ------
1 | Update Installation | 1. You need to have installed a previous version 2. Update to the new version |Test on Win, macOS, Linux| :construction: Win,<br>  :construction: macOS,<br> :construction: Linux  | |
2 | Install the new version | 1. Delete the previous version 2. Install the new version || :construction: Win,<br>:construction: macOS,<br> :construction: Linux | |
3 :robot: | Verify that you can enter a server address (valid server cert)| 1. Launch desktop app 2. enter a server address 3. Click on Next 4. The lock is shown closed - SSL details on mouse over| | :heavy_check_mark: | tst_addAccount |
4 :robot: | Verify that you can enter a server address (self signed cert)| 1. Launch desktop app 2. enter a server address 3. Click on Next 4. If it is the first time you should accept the certificate - click on the checkbox and OK (The lock is shown in closed - the server validated SSL connection window is opened)| |:heavy_check_mark: | tst_addAccount |
5 :robot: | Introduce username/password  | 1. Fill in username and password |If the credentials are not correct a message is shown "Error: Wrong credentials" | :heavy_check_mark: | tst_addAccount |
6 :robot: | Verify that all contents of the server account is synced to the local folder | 1. Choose to sync everything from server (default option) 2. Select the local folder desired | All the files/folders are synced down | :heavy_check_mark: | tst_addAccount |
7 :robot: | Verify that only the folder(s) selected are synced in the local folder  | 0. Disable VFS, 1. Click on Choose what to sync 2. The remote folder(s) are shown, select which you want to sync 3. Select the local folder |The selected folders selected are synced | :heavy_check_mark: | tst_syncing |
8 :robot: | Verify that you can skip folder configuration | 1. Click on "Manually create folder sync connection" | No settings dialog opens, the account shows only an "Add Folder Sync Connection" button.  | :heavy_check_mark: | tst_syncing  |
9 | Connect to a server with LDAP (or optinally AD) | 0. Only for minor releases, 1. Setup owncloud server with openldap, 2. Connect. | Make sure no technical user name shows up in UI (e.g. account name, sharing...) | :construction:  |  |
10 | Connect to a 8.1.x server | 0. Only for minor releases, 1. `docker run -ti -p 8181:80 owncloud:8.1`, 2. Connect.  A warning appears: "The server version 8.1.12.2 is unsupported", but syncing works. | | :construction: | |


### 2. Folders

- 'Go to local sync folder and create a folder' means: "Open folder" on client dot ... menu, create a new folder in file browser
- 'Verify on the server' means:  the folder is sent from client to server / check either with a) web browser, b) another client, or c) via server introspection

TestID | Test Case | Steps to reproduce| Expected Result | Result | Related Comment (Squish-test)
------------ | ------------- | -------------- | ----- | ------ | ------
1 :robot: | Verify that you can create one folder  | 1. Go to local sync folder 2. Create a single folder 3. Wait for sync | The folder is visible on the server | :heavy_check_mark: | tst_syncing |
2 :robot: | Verify that you can create one folder with long name  | 1. Go to local sync folder 2. Create a single folder with a long name (about 100 characters) 3. Wait for sync |The folder visible on the server | :heavy_check_mark: | tst_syncing |
3 :robot: | Verify that you can create one folder with special characters in the name | 1. Go to local sync folder 2. Create a single folder with a special character(s) in the name (e.g $%ñ&) 3. Wait for sync | The folder appears on the server | :heavy_check_mark: | tst_syncing |
4 :robot: | Verify that you can sync many subfolders | 1. Go to local sync folder 2. Copy a folder with 5 empty subfolders and 5 folders containing files 3. Wait for sync | All 10 subfolders are visible on the server | :heavy_check_mark: | tst_syncing |
5 | Verify that you can create multiples folders at once | 1. Create a folder with 400 subfolders outside the sync root, 2. Move that into the sync root, 3. Wait for sync  | All 400 folders appear on the server | :construction: | |
6 :robot: | Verify that you can copy one folder | 1. Go to local sync folder 2. Create a single folder with some files in it 3. Copy and paste the folder 4. Wait for sync | Both copies appears on the server | :heavy_check_mark: | tst_syncing |
7 :robot: | Verify that you can create a subfolder with long name | 1. Go to local sync folder, 2. Create a folder called "Folder1" 3. Create a subfolder called "LUsgzq!0k02sek+szBqrzN5=R#UJpWql&rwhnYVb~Gh!l!”  (optionally up to 255 characters), 4. This subfolder had a file called ilppng.PNG inside it 5. Wait for sync |The files are synced correctly| :heavy_check_mark: | tst_syncing |
8 :robot: | Verify pre existing folders in local (Desktop client) are copied over to the server | 1. Turn off the Desktop client 2. Go to local sync folder 3. Create several folders inside the Desktop Client folder at several different levels, 4. Turn ON the Desktop Client  | Folders appear on the server | :heavy_check_mark: | tst_syncing |
9 :robot: | Filenames that are rejected by the server are reported | 1. Go to local sync folder, 2. Create a file called `"a\\a"` (or another name not accepted by the server), 3. Wait for sync | The sync status reports an error, the file s not synced| :heavy_check_mark: | tst_syncing |
10| Sync works for .zip/.rar files with elaborate internal folder structures | 1. Create a .zip file with many internal folders and files 2. Copy the .zip file to the Desktop Client folder 3. Unzip the .zip file inside the Destop Client folder |1. Make sure you get a popup saying that all the extracted files have synced. 2. Look at Via Web and make sure that the folder has been synced over| :construction: | |
11| Files that error with API should try 3 times, and then blacklist | 1. Try to sync a folder that has more than 65 characters 2. Then sync it with some contents, it should try three times and then be blacklisted 3. If you rename the folder it should try again, and succeed if the name is less than 65 characters |The folder is synced| :construction: | |
12| Invalid system names | 1. On the server, create folders named 'CON', 'COM1' and 'test%' and two files named 'PRN' and 'foo%' | A MacOS client syncs down 'CON', 'COM1' and 'PRN' but not 'test% or 'foo%' |:construction: | |
13| Invalid system names | 1. On the server, create folders named 'CON', 'COM1' and 'test%' and two files named 'PRN' and 'foo%' | A windows client syncs down 'test%' and 'foo%' but not 'CON', 'COM1' or 'PRN' | :construction:  | |
14 :robot: | Invalid system names | 1. On the server, create folders named 'CON', 'COM1' and 'test%' and two files named 'PRN' and 'foo%' | A Linux client syncs down all. | :heavy_check_mark: | tst_syncing |

### 3. Files

TestID | Test Case | Steps to reproduce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 :robot: | Via User should see the single file on Via Web when the file is successfully sync in Desktop Client sync folder | 1. Drop one selected file in Desktop Client sync folder 2. User can see end receive notification from System tray that single file is successfully added in Desktop Client sync folder 3. Go to Desktop Client system tray icon and select launch Via Web| Verify that user can see that the single file is sync on Desktop Clien Sync folder and is available on Via Web| :heavy_check_mark: | tst_syncing |
2 | Via user should see the multiple file on Via Web when the files or folders are successfully sync in Desktop Client Sync folder | 1. Drop multiple selected files in Desktop Client Sync folder 2. User can see and receive notification from System tray that multiple files or folders are successfully added in Desktop Client Sync folder 3. Go to Desktop Client System tray icon and select launch Via Web|Verify that User can see that multiple files are sync on Desktop Client folder and are available on Via Web| :construction: | File is synced. But no Popup Notification will be shown |
3| User adds file to the sync folder will show up in repository  | 1. Users see a completed icon overlay on the copied file(s) in the Desktop client folder 2. The Sync Files tab shows the files added in the Desktop Client folder from desktop|| :construction:  | |
4| User adds the various types of files | 1. Microsoft word documents, Microsoft Excel, Microsoft Powerpoint, .JPG, .PDF, .MP3|The Sync files tab shoe all type of files added in th Desktop Client folder from desktop| :construction:  | All files snyced and shown in Activities Tab under synchronization protocol |
5| Long file name  | 1. Create a file with this name "dfkjsdfjksdkdfjsdfuidjfkdsjfksdjfks djfksdjfksdjfksdjfkdsjfks djfkdsjfkdsfjlsdkfjsdkjflksdjfk lsdjfksdjfkdsjfkldsjfkldsjfkdsjfksd jfksdjfklsdjfklsdjflksdjflksdjfklsdj fklsdjfksdjfksdjfksdjfksdjfksdfj skdfjksdjfksdjfksdjfksdjfksd.pdf"|Sync is successful| :construction: | |
6| User copies/drag&drops multiple files at a time to the Sync folder | 1. Users see the completed icon overlay on all type of files in Desktop Client folder on Desktop. 2. The Sync files tab shows all type of files added in the Desktop Client folder from Desktop|Sync is successful| :construction:  | |
7| Sync files at the same time| 1. Add a file of 1MB onthe local inside folder, and in the same time, add another file on the same remote folder (make sure that file is on the server before the client finishes)|Look at Via Web and the Desktop Client to make sure that the sync is correct| :construction: | |
8| Same name files, different extension | 1. Create the same name file with two differents extensions|The files are sync corectly|  :construction: | |
9| Files with spaces in the name | 1. Move a file under the root sync folder with spaces in the name 2. Let them sync|The files are sync correctly|  :construction: | |
10| Create and delete one file with special characters in the name| 1. Go to Desktop Client 2. Create a single folder 3. Move with in this folder a file with a special characters in the name fo example "~`!@#$^&()-_=+{[}];'," 4. Wait for the file to sync to the Via Web 5. Delete the file in Desktop Client |Look at Via Web and make sure that the file got deleted| :construction: | |
11| User copies large files to the Desktop Client folder on the Desktop| 1. User see in-progress overlay icon while upload is in progress in Desktop 2. User sees the completed sync icon overlay once the upload process is done|The Sync files tab shows file added in th Desktop Client folder from desktop| :construction:  | |
12| upload 50Mb file| 1. Create a folder under sync folder 2. Copy a large file (50MB) in this folder|After several sync processes the file is correct| :construction:   | |
13| Upload 150Mb files| 1. Upload a large .pdf (100-150MB) file through web browser|Sync is successful| :construction:  | |
14| Upload 3000Mb files| 1. Upload a large .pdf (3GB) file through web browser|Sync is successful| :construction:  | |
15| Upload 2048Mb files| 1. Upload a large file (2GB=2147483648 bytes) through web browser|Sync is successful|  :construction:  | |
16| Upload 1000Mb files| 1. Upload a folder 1000 file (1Mb each) |Sync is successful| :construction:  | |
17| Upload 500Mb+500Mb files| 1. Upload two folders with 500 files each |Sync is successful| :construction:  | |
18| Upload 1024Mb file| 1. Upload a 1GB file |Sync is successful| :construction:  | |
19| Verify the limit of the quota| 1. Upload the necessary large files to fill the quota |Warning: "The available space of your workspace is running out, please delete some files to free space"| :construction: | |

### 4. Move files and folders
#### NOTE: To automate these test we need to use files explorer instead of the client UI. So, these tests cannot be added.

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Move from sublevels to root | 1. Move a couple of files (File1 and File2) with different content under the root sync folder 2. Let them sync 3. Move other file under the root sync folder| The content of files is correct |  :construction: | |
2 | Move folder down | 1. Move one folder from sync root to a 5 deep level folder 2. Sync| The content of the folder is correct | :construction:  | |
3 | Move folder up | 1. Move one folder from 5 deep level folder to the sync root 2. Sync| The content of the folder is correct |  :construction:  | |
4 | Move files from one folder another| 1. Move a couple of files under the root sync folder 2. Create a folder 3. Let them sync 4. Move the files to the new folder 5. Let them sync| The files in the correct size in Via Web| :construction:   | |
5 | Move two or more folders down | 1. Move two or more folders from sync root to a 5 dep level folder 2. Sync| The content of the folder is correct |:construction:   | |
6 | Move two or more folders up | 1. Move one folder from 5 deep level folder to the sync root 2. Sync| The content of the folder is correct | :construction:    | |

### 5. Edit Files

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment(Squish-test)
------------ | ------------- | -------------- | ----- | ------ | ------
1 :robot: | Edit a .txt file| 1. Create a .txt file in a sync folder 2. Edit some text 3. Wait for it to sync 4. Modify the .txt file and add more content 5. Wait for it to sync 6. Modify the .txt file and add more content 7. Wait for it to sync | The file at the server had the same content after the sync is completed| :heavy_check_mark:  |tst_editFiles |
2 :robot: | Edit a .doc file| 1. Create a .doc file in a sync folder 2. Edit some text 3. Wait for it to sync 4. Modify the .doc file and add more content 5. Wait for it to sync 6. Modify the .doc file and add more content 7. Wait for it to sync | The file at the server had the same content after the sync is completed| :heavy_check_mark: |tst_editFiles|
3 :robot: | Edit a .xls file| 1. Create a .xls file in a sync folder 2. Edit some content 3. Wait for it to sync 4. Modify the .xls file and add more content 5. Wait for it to sync 6. Modify the .xls file and add more content 7. Wait for it to sync | The file at the server had the same content after the sync is completed| :heavy_check_mark:  |tst_editFiles|
4 :robot: | Replace a .pdf file| 1. Create a .pdf file in a sync folder 2. Replace it with a different pdf (but same name) 3. Wait for it to sync 4. Modify the .pdf file and add more content 5. Wait for it to sync 6. Modify the .pdf file and add more content 7. Wait for it to sync | The file at the server had the same content after the sync is completed| :heavy_check_mark:  |tst_editFiles|
5 | Edit a file while the folder is renaming | 1. You should had any kind of file already sync 2. Go to Desktop Client 3. Open the file and edit it 4. Go to the Via Web and rename the folder 5. Sync with the oc-worker 6. Do not refresh the browser at the server and download the file edited | The file at the server had the same content| :construction:  | |
6 | Rename file and folder at the same time | 1. Go to web, and rename a folder <br>2. Rename a file contained in the folder from the file explorer on your local computer | File and folder should rename both in server and locally | :construction: | |

### 6. Delete Files and Folders

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 :robot: | Delete one file| 1. Go to Desktop Client 2. Create or copy a single file with a short name (less than 20 characters) 3. Wait for the file to sync to the Via Web 4. Delete the file in Desktop Client|The file is been deleted on Via Web|  :heavy_check_mark:   |tst_deletFilesFolders |
2 :robot: | Delete one file with long name| 1. Go to Desktop Client 2. Create or copy a single file with a long name (more than 240 characters) 3. Wait for the file to sync to the Via Web 4. Delete the file in Desktop Client|The folder is been deleted on Via Web| :heavy_check_mark: |tst_deletFilesFolders Maximum length of filename is 228 chraracter |
3 :robot: | Delete one folder| 1. Go to Desktop Client 2. Create a single folder with a short name (more than 20 characters) 3. Wait for the folder to sync to the Via Web 4. Delete the folder in Desktop Client|The folder is been deleted on Via Web|   :heavy_check_mark:  |tst_deletFilesFolders |
4 :robot: | Delete one folder with long name| 1. Go to Desktop Client 2. Create a single folder with a long name (59 characters+a terminating zero bytes) 3. Wait for the folder to sync to the Via Web 4. Delete the folder in Desktop Client|The folder is been deleted on Via Web| :heavy_check_mark: |tst_deletFilesFolders |
5 | Delete multiple files| 1. Go to Desktop Client 2. Create or copy a multiple files 3. Wait for the files to sync to the Via Web 4. Delete the file in Desktop Client|The files get deleted on Via Web| :construction: | |
6 | Delete large file (2048Mb)| 1. Go to Desktop Client 2. Create or copy a single big file (2GB) 3. Wait for the file to sync to th Via Web 4. Delete the file in Desktop Client|The file get deleted on Via Web| :construction: | |


### 7. Sync process

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Move some files while sync| 1. Move a couple of files (File1 and File2) with different content under the root sync folder 2. Let them sync 3. Move other file under the root sync folder and while sync 4. Delete File1 and rename File2 with the name File1| The content of files is correct| :construction:   | |
2 | Rename the file while sync| 1. Create a .txt file with some text in it 2. Let it sync 3. Rename the file and let is sync 4. While #3 is sync, edit the content of the .txt file| The content of file is correct| :construction: | |
3 | Deleted folders while sync| 1. Create a tree of folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder) 2. Delete the folders while sync| Look at Via Web and make sure that the folders got deleted| :construction:  | |
4 | Deleted folders while sync with two clients| 1. Create a tree of folders+subfolders (e.g folder1, folder2, folder3 and some .txt files in this folder) 2. Delete some folders and keep another while sync 3. Sync with another client at the same time| Look at Via Web and make sure that the folders got deleted and the remains folders sync correctly| :construction:   | |
5 | Create a new folder with space ar the end| 1. Create a folder with space at end| Look if is sync| :question:  | If you create a folder with a space at the end, your os (nautilus @ ubuntu) will remove this space. The folder is syncing  |
6 | Deselect to the option "Allow apps to use the Share API"| 1. Install the new version 2. Go to Server Client 3. Sing in as Admin user 4. Go to Admin 5. On Sharing option, deselect to the option "Allow apps to use the Sahre API" 6. Go to the Desktop Client 7. Configure one account 8. Open folder 9. Create new folder (e.g Example1) 10. Right click on the folder Example1 11. Click on "Share with oC" 12. If you introduce the Password and press enter|| :question: | There is no option "share with oc". Sharing with disabled Shareing Api doesn't work. |
7 | If you share a folder with another user, and then rename the folder on the Desktop does not change the name| 1. Install the new version with 2 accounts (user1, user2) 2. Go to Server Client with user1 3. Create a new folder (e.g. Share with) 4. Click on Share, and share with user2 5. Go to  Desktop Client with user2 6. Wait sync 7. Go to Server client with user1 8. Rename the Folder (Share with) to (Share with user2" 9. Go to Desktop client with user2 11. Wait sync | The folder name has not change. The shared folder is actually a virtual mount point for all recipients, so renaming it doesn't affect all recipients. Only the contents of it will be visible for anyone. Works as expected| :construction:  | |

### 8. Without connection
#### NOTE: It would be better to have the following tested manually instead of automating them

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | Upload several files and folder to the sync folder without internet| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server |  :construction:  | |
2 | Upload several files and folder with special characters to the sync folder without internet| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server |  :construction:  | |
3 | Upload the same folder from the server and form the client with differente files inside| 1. Upload several files and folder without internet 2. The connection is back | The files and folder are sync with the server | :construction:   | |
4 | Remove folder from the client| 1. Remove one folder from the local folder 2. The connection is back | The folder is not on the server | :construction:  | |

### 9. Sharing

#### 9.1 Share link

TestID | Test Case | Steps to reprouce| Expected Result | Result             | Related Comment
------------ | ------------- | -------------- | ----- |--------------------|---------------------------------------------------------------------------
1 :robot: | Share a Folder/File with special characters| 1. User share a folder (special characters /, <,>,:,?) with you; 2. On the server accept the share, (if needed);  3. Refresh the parent folder | File/Folder is not displayed as shared| :heavy_check_mark: | tst_sharing |
2 :robot: | Share a Folder/File with special characters| 1. User share a folder (special characters in the name $%ñ&) with you 2. Refresh the parent folder | File/Folder is displayed as shared | :heavy_check_mark: | sharing works on Linux and window. TODO: try mac tst_sharing |
3 :robot: | Unshare the Folder/File | 1. User unshare a folder/file with you 2. Refresh the folder/file | File/Folder is not shown as shared| :heavy_check_mark: | tst_sharing   |
4 | Unshare the Folder with you | 1. at client navigate to shared folder with file browse or shell; 2. User unshares this folder with you 3. Upload file from Desktop Client | New unshared folder | :construction: | |
5 | Verify shared icon, Ubuntu | 1. Install nemo extension, 2. assert that both owncloud plugins are enabled in nemo, 3. Share a folder/file | A fork-icon is overlayed on shared folders/files | :construction: | |
6 | Verify shared icon, Win+non-VFS | 1. User share a folder | When the folder or file is shared by link show a special icon | :construction:  |  |
7 | Verify shared icon, Win+VFS | 1. User share a folder | No sharing indicator (only status) is shown in VFS mode | :construction:  |  |
8 | Move a shared folder with permissions | 1. Move a shared folder with permissions inside another shared folder from Desktop; 2. The needed permission is Edit-Write on the "other" folder. | Cannot move to another shared folder (403 Forbidden) | :construction: |     |
11 :robot: | Share a file with many users | 1. Having one file shared with 80 users | The Desktop works fine, list of users can be scrolled | :heavy_check_mark: :construction: | (automated with 3 users, tst_sharing) - prefer manual testing for larger users             |
12 :robot: | Share a Folder with Password protect| 1. Create a new folder 2. Share with oC 3. Check Share link option 4. Check Password protection 5. Introduce the password 6. Press Enter or Click on Set password option | You can write the password| :heavy_check_mark: | tst_sharing |
13 :robot: | Share a Folder with Set expiration date| 1. Create a new folder 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date | You can configurate the expiration date | :heavy_check_mark: | tst_sharing |
14 :robot: | Share a Folder with Allow editing| Create a new folder 2. Share with oC 3. Check Share link option 4. Check Allow editing option  | The Folder can allow editing|  :heavy_check_mark: | tst_sharing   |
15 :robot: | Share a File with Password protect| 1. Create a new file 2. Share with oC 3. Check Share link option 4. Check Password protection 5. Introduce the password 6. Press Enter or Click on Set password option  | You can write the Password protect | :heavy_check_mark: | tst_sharing |
16 :robot: | Share a File with Set expiration date| 1. Create a new file 2. Share with oC 3. Check Share link option 4. Check the Set expiration date 5. Introduce one day for expiration date |You can configurate the expiration date | :heavy_check_mark: | tst_sharing |
17 :robot: | Modify the Set expiration date option on the server| 1. Create a new file on the Desktop 2. Share with oC 3. Create Public link at the client; 4. Check the Set expiration date 5. Introduce one day for expiration date 6. Go to the Server and change the date 7. Go to the Desktop 8. Wait to sync | You can see the new date on Set expiration date | :heavy_check_mark: | tst_sharing  |
18 :robot: | Public link a file and download it | 1) right click a file - open the share menu; 2) Create and copy public link to clipboard; 3) paste link in a web browser; 4) download | The file can be downloaded | :heavy_check_mark: | tst_sharing        |
19 :robot: | Public link a folder and download it | 1) right click a folder - open the share menu; 2) Create public link; 3) 3dots menu -> "copy public link to clipboard (direct download)"; 4) paste link in a web browser | A zip archive of the folder can be downloaded | :heavy_check_mark: | tst_sharing        |
20 :robot: | Public link to a file and disable it after | use the sharing menu to delete the public link | The link reports File not found. | :heavy_check_mark: |  tst_sharing  |
21 | Public link to a folder with 'Upload only (File Drop) | 1) classic web UI create the public link as another user,</br>2) as your user, paste the link to "add to your owncloud",</br>3) wait for sync, visit the folder on the deskop,</br>4) Rename a file in the folder | Rename fails, an error message is shown | :construction: | FIXME: 2.10.0 silently duplicates the file |
22 | Try to reshare a file originally received from an LDAP user | | The file can be reshared, if "Allow Share" was set, otherwise it cannot be reshared | :construction:  | (2.9.0 issue https://github.com/owncloud/client/issues/8941 ) |
23 :robot: | Public link to a file and set a password with special characters | | The file is shared with a pwd |  :heavy_check_mark: | tst_sharing  |
24 :robot: | Public link to a file and set a password. Modify Password Policies and retry | 1) enable password policy app allow passwords with 4 chars; 2) share with a 4 char password; 3) change password policy to min 8 chars. 4) use client sharing dialog to remove the password, and re-enter the same; 5) enter a password with 8 chars  | An error appears stating min passwiord length 8 for the short password; a longer password works  | :heavy_check_mark: | tst_sharing  |


#### 9.2 Share with Users and Groups

TestID | Test Case | Expected Result | Result | Related Comment
------ | --------- | --------------- | ------ | ---------------
1 :robot: | Share a file with a user that has been already shared another file | Both files appear in server | :heavy_check_mark:| tst_sharing |
2 :robot: | Share a folder with a user | The folder appears in server | :heavy_check_mark:| tst_sharing |
3 :robot: | Share a folder with a user that has been already shared another folder and another file | Both folders appear and the file in server | :heavy_check_mark:| tst_sharing |
4 :robot: | Share a file with a group| The file appears in server |:heavy_check_mark:| tst_sharing |
5 | Share a folder with an LDAP user | The folder appears in server |  :construction:|  |
6 | Share a folder with remote user on a 10.2.1 server| The folder appears |:construction:|  |
10 | Receive a federated share from a 10.2.1 server | When auto-accept is disabled: Notification with Dismiss/Accept/decline appears in the "Server Activity" tab | :construction:|    |
11 :robot: | Share a file with one user whose name contains special characters | The file appears in server |:heavy_check_mark:| tst_sharing |
12 :robot: | Share a folder with one users a file whose name contains special characters | The folder appears in server |:heavy_check_mark:| tst_sharing |
13 | Share a file bigger than 1 GB with one user | The file appears in server | :construction:| |
14 | Try to federate share a file with one user | The file appears in server, expect delays |:construction:|  |
15 | Share a file from SFTP with a user | The file appears in server |:construction:| |
19 | Share a file from a Federated Sharing with a user | The file appears in server |:construction:| |
22 :robot: | Share a file with user B with Can Share permissions enabled. Login as User B and reshare it | The file can be reshared in the server with other user| :heavy_check_mark:| tst_sharing |
23 :robot: | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it  | The file can be edited in the server with other user | :heavy_check_mark:| tst_sharing |
24 :robot: | Share a file with user B with Change permission enabled. Login as User B and change it  | The file can be changed in the server with other user | :heavy_check_mark:| tst_sharing |
25 :robot: | Share a file with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. try to edit it again | The file can be edited in the server with other user | :heavy_check_mark: | tst_sharing |
26 :robot: | Share a folder with user B with Can Share permissions enabled. Login as User B and reshare it | The folder can be reshared in the server with other user |:heavy_check_mark:| tst_sharing |
27 :robot: | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it  | The folder can be edited in the server with other user | :heavy_check_mark:| tst_sharing |
28 :robot: | Share a folder with user B with Change permission enabled. Login as User B and change it  | The folder can be changed in the server with other user | :heavy_check_mark:| tst_sharing |
29 :robot: | Share a folder with user B with Create permissions enabled. Login as User B and create a file in it | The folder can be edited creating a file in the server with other user | :heavy_check_mark:| tst_sharing |
30 :robot: | Share a folder with user B with Create permissions enabled. Login as User B and create a folder in it | The folder can be edited creating a folder in the server with other user | :heavy_check_mark:| tst_sharing |
31 :robot:| Share a folder with user B with Can Edit permissions enabled. Login as User B and delete it  | The folder can be edited in the server with other user | :heavy_check_mark: | tst_sharing |
32 :robot: | Share a folder with user B with Can Edit permissions enabled. Login as User B and edit it. Change via Desktop the permissions. Try to edit it again | The folder cannot be edited the second time | :heavy_check_mark: | tst_sharing |
33 :robot: | Share a file with user B without Can Share permission enabled. Login as User B and try to reshare it | The file cannot be reshared |  :heavy_check_mark:| tst_sharing |
34 :robot: | Share a file with user B without Can Edit permission enabled. Login as User B and try to edit it  | The file cannot be edited | :heavy_check_mark: | tst_sharing |
35 :robot: | Share a file with user B without Change permission enabled. Login as User B and try to change it  | The file cannot be changed | :heavy_check_mark: | tst_sharing |
36 :robot: | Share a folder with user B without Can Share permission enabled. Login as User B and try to reshare it | The folder cannot be reshared | :heavy_check_mark:| tst_sharing |
37 :robot: | Share a folder with user B without Can Edit permissions enabled. Login as User B and try to edit it  | The folder cannot be edited |  :heavy_check_mark:| tst_sharing |
38 | Share a folder with user B without Create permissions enabled. Login as User B and try to create a file in it  | The folder cannot be edited creating a file in it | :construction: |  |
39 | Share a folder with user B without Change permissions enabled. Login as User B and try to change it  | The folder cannot be changed | :construction: |  |
40 | Share a folder with user B without Delete permissions enabled. Login as User B and try to delete it  | The folder cannot be edited deleting files/folders in it | :construction: |  |
41 | With Password Policy App enabled, Share link a file with a user  and set a password that matches with the pwd policy | The file is shared with pwd |:construction:|  |
42 | With Password Policy App enabled, Share link a file with a user  and set a password that does not match with the pwd policy | An error should be shown | :construction:| |
43 :robot: | Share link a file with a user and set a password and a expiration date | The file is shared with pwd and expiration date | :heavy_check_mark:| tst_sharing |
44 :robot: | Share link a file with a user and set a password and a expiration date. Change the expiration date | The file is shared with the updated expiration date | :heavy_check_mark:| tst_sharing |
45 :robot: | Share link a file with a user and set a password and a expiration date. Change the pwd | The file is shared with the updated pwd |   :heavy_check_mark:| tst_sharing |
46 :robot: | Try to search a user that has already been shared the file in the users searchbox | The user should not be shown | :heavy_check_mark:| tst_sharing |
47 :robot: | Try to search yourself in the users searchbox | The user should not be shown | :heavy_check_mark:| tst_sharing |
48 :robot: | Search with minimum characters required. For example: 'pat' | All users that contains this pattern should be shown | :heavy_check_mark:| tst_sharing |
49 | Try to search a remote user in the users searchbox | The user should be shown |  :construction:| |
50 :robot: | Share a file with more than 4 users | The users should be listed and ordered chronologicaly. If is needed a scrollbar will appear | :heavy_check_mark:| tst_sharing |
51 | Sharing Dialog<br>1)use a server with user01, user02, user03, ...<br>2)enter 'us' prefix in the search<br>3)matching users are listed.  | The users are listed alphabetically. An exact match is listed first. |  :construction:|  |
52 :robot: | Enforce password protection on public links | Password should be always required | :heavy_check_mark:| tst_sharing |
53 :robot: | Enforce password protection on public links<br>Try to disable the pwd | Password should be always required | :heavy_check_mark:| tst_sharing |
54 :robot: | Set default expiration date  on public link | The expiration date should be set by default | :heavy_check_mark:| tst_sharing |
55 :robot: | Allow resharing disabled and Can Share enabled  | The user cannot reshare files | :heavy_check_mark:| tst_sharing |
56 | Restrict users to only share with users in their groups | It should appear only the users from the group |:construction:| |
57 :robot: | Disallow username autocompletion in share dialogs | Full username needs to be entered in order to sharing | :heavy_check_mark:| tst_sharing |

### 10. Selective_Sync

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 :robot: | Check that in the setup options after fill in the server and the user you have to choose the server and local folder to sync| 1. Start to setupo oC Desktop 2. Fill in server, user and password 3. The server and local folder to sync is shown|1. On server (you have to choose what do yo want to sync) 2. local folder (the local folder where the data are sync) | :heavy_check_mark: | tst_syncing |
2a :robot: | Linux+Mac: Check that in the setup options the checkbox is enable to sync all the account by default | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Choose what to sync" | At window is opened with the directory tree |:heavy_check_mark:  | tst_syncing |
2b | Win10: Check that in the setup options the checkbox is enable to "use virtual files" default | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Synchronize everything from server"; 4. "Choose what to sync" | At window is opened with the directory tree | :construction: |  |
3 :robot: | Check that all files and folders are synced when you select to sync all | 1. Start to setup oC Desktop 2. Fill in server, user and pass 3. Click on "Sync everything from server" and wait until everything is sync| Everything is synced | :heavy_check_mark: | tst_syncing |
4 :robot: | Verify that you can select to sync only one folder | 1. Start to setup the oC Desktop 2. The new window select what folder sync is shown 3. Select to sync only one folder 4. Click on OK | Only one folder is sync |:heavy_check_mark:  | tst_syncing |
5 :robot: | Verify that the folder to select are sorted by name/size| 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Select all the folder except one of them| Everything except one folder is synced  |:heavy_check_mark:  | tst_syncing |
6 :robot: | Check that there are another option: skip sync, so that nothing is synced | 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Manually create folder sync connection"| The settings windows is openend but no local folder is configured| :heavy_check_mark: | tst_syncing |

#### 10.1 Choose what to sync from the setup window

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 :robot: | Verify that the folders that you unselect are not sync in Desktop| 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | Check that the folder unselected are not sync| :heavy_check_mark: | tst_syncing |
2 | The folder without subfolder doesn't show the arrow| 1. Start to setup the oC Desktop app 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolder | When you click on a folder without subfolder the arrows disappear sometimes|:construction: | |
3 :robot: | Verify that the folders that you unselect are not sync in Desktop| 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | The parent folder is sync but not the subfolder| :heavy_check_mark: | tst_syncing |
4 | Upload from the server some files in a folder which is sync| 1. Start to setup the oC Desktop app 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Upload files from server | The files are download in the desktop client|:construction:  |  |
5 | Upload from the Desktop some files | 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Upload files from server in a folder wich is not sync | The files are sync with the server| :construction: |  |
6 | Upload from the server some files in a folder which is  not sync | 1. Start to setupo the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolder 4. Upload files from server which is not sync | The files are not downloads in the Desktop client | :construction: |  |
7 | Delete a folder sync, it is removed from the Desktop | 1. Start to setup the oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kids of folder with and witout subfolders 4. Delete a folder sync, it is removed from the desktop | The folder is removed int he server |:construction:  |  |
8 | Delete a sync folder from the server | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Delete a sync folder from the server | The folder is removed int he Desktop | :construction: |  |
9 | Create a folder in the root directory from the server | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Create a folder in the root directory from the server | The folder is sync | :construction: |  |
10 | Rename a folder that is sync | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders 4. Rename a folder that is sync | It is renamed in the window "Choose what to sync" |:construction:  |  |
11 | Delete a folder that is sync | 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | It is not shown in the window "Choose what to sync" | :construction: |  |
12 | Verify that when yo unselect all the folder, the root files continue sync| 1. Start to setup th oC Desktop 2. The new window to select what folder sync is shown 3. Unselect different kinds of folder with and without subfolders | Root files are sync |:construction:  |  |
13 :robot: | When you click on "Choose what to sync" folder tree is shown | 1. Click on "Choose what to sync" | It takes folder time to appear the folder tree,  | :heavy_check_mark: | tst_syncing |


#### 10.2 "Skip folders configuration"

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 |Skip folder configuration| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" | 1. No one local folder is sync 2. The setting window is opened and the account is registered| :construction:  | There is no skip button. The only way to reproduce this case is to mark "Manually create folder sync connection" on and click the "connect" button |
2 |Sync only one folder the settings view | 1. Start to setupo oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Settings window/add folder| The folder start to sync and the folder is available from the tray icon| :construction: |  |

#### 10.3 "Add Folder..."

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 |Skip folder configuration from the setup window and select the local and remote folder front he setting window| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Add folder 5. Select the local folder (choose an existing one) 6. Select the remote folder, click on continue 7. Select the subfolders of the remote folder and click on add | 1. The local folder selected is sync wich the remote one| :construction:   |  |
2 |Select a remote folder with special characters| 1. Start to setup oC Desktop 2. Fill in server, user and password 3. Click on "Skip folders configuration" 4. Click on Add folder 5. Select the local folder (create a new folder with special characters) 6. Select the remote folder with special characters, click on continue 7. Select the subfolders of the remote folder and click on add | 1. The local folder selected is sync wich the remote one|  :construction:  |  |

### 11. Overlay_icons

TestID | Test Case | Steps to reprouce| Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------ | ------
1 | If the system is offline, there are no overlay icons present | 1. Launch the Desktop 2. The overlay icons are not shown 3. Quit the Desktop | The overlay icons are not shown| :construction: |  |
2 | When you pause the sync, the overlay icons are still shown | 1. Launch the Desktop 2. The overlay icons are shown 3. Click on Pause | The overlay icons disappear | :construction:   |  |
3 | Green check (All files within the folder (all the way down the tree) are sync with the server, and there are no problems to report) | 1. The account is sync | The green check is shown in all the folders/files| :construction:  |  |
4 | Blue spinning icon (Some or all files/folders in the directory are waiting to sync or are actively sync) | 1. The account is sync | The files/folder that are waiting to sync have the blue icon|  :construction:  |  |
5 | Yellow warning triangle (There is an error in sync somewhere in the directory such as a path longer than 255 characters or a bad character in a name o a file firewall problem) | 1. The account is sync |The files that are not sync because they have a problem... Have a yellow warning triangle | :construction:   |  |
6 | Red error Icon (There is a fatal problem in the sync process that can't be resolved) | 1. The account is sync | The files/folders that are not sync because have a problem... Have a red error icon| :construction:   |  |

