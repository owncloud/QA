# Smoke test for the mani Server Version

## Previous requirements

Have a Desktop Client v2.1.0 ready to be used with owncloud

Prepare a OC server with ssl.

## Testing

### Update the version 

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Login with one account (HTTPS)  | It is possible to access |  |
2 | Login with one account (HTTP)  | It is possible to access  |  |
3 | Login with one account (SHIB Autoprovisioned user)|  It is possible to access|  |
4 | Login with one account (SHIB SSO user )  | It is posible to access | |


### New installation

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Login with one account (HTTPS)  | It is posible to access | |
2 | Login with one account (HTTP)  | It is posible to access |  |
3 | Login with one account (SHIB Autoprovisioned user)| It is posible to access  |  |
4 | Login with one account (SHIB SSO user )  | It is posible to access |  |

### Folder

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Create a new folder  | The folder is created|  |
2 | Create a folder with special character | The folder is created with special character (e.g $%&¨) |  |
3 | Rename a folder | 1. Create a new folder 2. Rename the folder|  |
4 | Move a folder | 1. Create a new folder 2. Move the folder| |
5 | Delete a folder  | 1. Access to a folder, the folder has a 5 level folders inside 2. Upload some files 3. Download some files 4. Select delete that folder (The folder is removed) |  |
6 | Share the folder by link | 1. Create a new folder 2. Right click in the folder 3. Click on Share with oC 4. Check the option "Share link" 5. Uncheck the option "Password protect" 6. Introduce a password 7. Press Enter (The folder link is generated) | |
7 | Unshare the folder by link | 1. Create a new folder 2. Right click in the folder 3. Click on Share with oC 4. Uncheck the option "Share link" |  |
8 | Share the folder with users or groups| 1. Create a new folder 2. Right click in the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups (The folder is Share with user/group) |  |
9 | Unshare the folder with users or groups| 1. Create a new folder 2. Right click on the folder 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups 5. Click on Delete (The folder is not Share with user/group) |  |

### File

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Create a new file  | The file is created | |
2 | Create a file with special character | The file is created with special character (e.g f%&¨)|
3 | Rename a file | 1. Create a new file 2. Rename the file |  |
4 | Move a file | 1. Create a new file 2. Move the file |  |
5 | Delete a file  | 1. Create a new file 2. Delete the file |  |
6 | Share the file by link | 1. Create a file 2. Right click on the file 3. Click on Share with oC 4. Check the option "Share link" 5. Check the option "Password protect" 6. Introduce a password 7. Press Enter (The file link is generated) | |
7 | Unshare the file by link | 1. Create a file 2. Right click in the file 3. Click on Share with oC 4. Uncheck the option "Share link" |  |
8 | Share the file with users or groups| 1. Create a file 2. Right click on the file 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups (The file is Share with user/group) |  |
8 | Unshare the file with users or groups| 1. Create a file 2. Right click on the file 3. Click on Share with oC 4. Introduce one user/group on the option Share with users or groups 5. Click on Delete (The file is not Share with user/group) |  |