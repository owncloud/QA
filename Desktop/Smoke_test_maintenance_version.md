# Smoke test for the maintenance Server Version

## Previous requirements

Have a Desktop Client v2.1.0 ready to be used with owncloud

Prepare a OC server with ssl.

## Testing

### Update the version 

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Login with one account (HTTPS)  | It is possible to access | :construction: |
2 | Login with one account (HTTP)  | It is possible to access  | :construction: |
3 | Login with one account (SHIB Autoprovisioned user)|  It is possible to access| :construction: |
4 | Login with one account (SHIB SSO user )  | It is posible to access | :construction: |


### New installation

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Login with one account (HTTPS)  | It is posible to access | :construction: |
2 | Login with one account (HTTP)  | It is posible to access | :construction: |
3 | Login with one account (SHIB Autoprovisioned user)| It is posible to access  | :construction: |
4 | Login with one account (SHIB SSO user )  | It is posible to access | :construction: |

### Folder

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Create a new folder  | The folder is created| :construction: |
2 | Create a folder with special character | The folder is created with special character (e.g $%&¨) | :construction: |
3 | Rename a folder | 1. Create a new folder 2. Rename the folder| :construction: |
4 | Move a folder | 1. Create a new folder 2. Move the folder| :construction:|
5 | Delete a folder  | 1. Access to a folder, the folder has a 5 level folders inside 2. Upload some files 3. Download some files 4. Select delete that folder (The folder is removed) | :construction: |
6 | Share the folder by link | 1. Create a new folder 2. Right click in the folder 3. Click on Share with oC 4. Check the option "Share link" 5. Uncheck the option "Password protect" 6. Introduce a password 7. Press Enter (The folder link is generated) | :construction:|
7 | Unshare the folder by link | 1. Create a new folder 2. Right click in the folder 3. Click on Share with oC 4. Uncheck the option "Share link" | :construction: |
8 | Share the folder with users or groups| 1. Create a new folder 2. Right click in the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups (The folder is Share with user/group) | :construction: |
9 | Unshare the folder with users or groups| 1. Create a new folder 2. Right click on the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups 5. Click on Delete (The folder is not Share with user/group) | :construction: |
10 | share the folder with users or groups (Federated sharing)| 1. Create a new folder 2. Right click on the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups (The folder is Share with user/group) | :construction: |
11 | Unshare the folder with users or groups (Federated sharing)| 1. Create a new folder 2. Right click on the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups 5. Click on Delete (The folder is not Share with user/group) | :construction: |

### File

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Create a new file  | The file is created |:construction: |
2 | Create a file with special character | The file is created with special character (e.g f%&¨)|:construction:|
3 | Rename a file | 1. Create a new file 2. Rename the file | :construction: |
4 | Move a file | 1. Create a new file 2. Move the file | :construction: |
5 | Delete a file  | 1. Create a new file 2. Delete the file | :construction: |
6 | Share the file by link | 1. Create a file 2. Right click on the file 3. Click on Share with oC 4. Check the option "Share link" 5. Check the option "Password protect" 6. Introduce a password 7. Press Enter (The file link is generated) | :construction:|
7 | Unshare the file by link | 1. Create a file 2. Right click in the file 3. Click on Share with oC 4. Uncheck the option "Share link" | :construction: |
8 | Share the file with users or groups| 1. Create a file 2. Right click on the file 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups (The file is Share with user/group) | :construction: |
9 | Unshare the file with users or groups| 1. Create a file 2. Right click on the file 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups 5. Click on Delete (The file is not Share with user/group) | :construction: |
10 | Share the file with users or groups (Federated sharing)| 1. Create a new folder 2. Right click on the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups (The folder is Share with user/group) | :construction: |
11 | Unshare the file with users or groups (Federated sharing)| 1. Create a new folder 2. Right click on the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups 5. Click on Delete (The folder is not Share with user/group) | :construction: |

### Overlay_icons

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | If the system is offlline, there are no overlay icons present | 1. Lauch the Desktop 2. The overlay icons are not shown 3. Quit the Desktop (The overlay icons are not shown)|:construction: |  |
2 | When you pause the sync, the overlay icons are still shown | 1. Lauch the Desktop 2. The overlay icons are shown 3. Click on Pause (The overlay icons are still shown)|:construction: |  |
3 | Green check (All files within the folder (all the way down the tree) are sync with the server, and there are no problems to report) | 1. The account is sync | The green check is shown in all the folders/files|:construction: |  |
4 | Blue spinning icon (Some or all files/folders in the directory are waiting to sync or are actively sync) | 1. The account is sync | The files/folder that are waiting to sync have the blue icon|:construction: |  |
5 | Yellow warning triangle (There is an error in sync somewhere in the directory such as a path longer than 255 characters or a bad character in a name o a file firewall problem) | 1. The account is sync |The files that are not sync because they have a problem... Have a yellow warning triangle |:construction: |  |
6 | Red error Icon (There is a fatal problem in the sync process that can't be resolved) | 1. The account is sync | The files/folders that are not sync because have a problem... Have a red error icon|:construction: |  |