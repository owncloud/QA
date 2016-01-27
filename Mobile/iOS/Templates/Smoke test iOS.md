# Smoke test iOS

Device & iOS version: <br>
Server version:



### Login

TestID | Test Case | Expected Result | Result | Related Comment
------------ | ------------- | -------------- | ----- | ------
1 | Login with one account (HTTPS)  | It is possible to access |  |
2 | Login with one account (HTTP)  | It is possible to access  |  |
3 | Login with one account (SHIB Autoprovisioned user)|  It is possible to access|  |
4 | Login with one account (SHIB SSO user )  | It is posible to access | |




### Folder

TestID | Test Case | Steps | Expected Result | Result | Related Comment
------------ | ------------- | ----------- | -------------- | ----- | ------
1 | Create a new folder  | 1. Tap on create a new folder |The folder is created|  |
2 | Create a folder with special character | 1. Tap on create a new folder <br> 2. Use a name with special characters (e.g $%&¨)| The folder is created with special character  |  |
3 | Rename a folder | 1. Create a new folder<br> 2. Rename the folder|  Folder is renamed|
4 | Move a folder | 1. Create a new folder <br> 2. Move the folder| Folder is moved to the specifield location |
5 | Delete a folder  | 1. Access to a folder, the folder has deep structure inside <br> 2. Upload some files <br>3. Download some files <br>4. Select delete that folder  | 2. The files  are uploaded <br> 3. The files are downloaded<br>4. The folder is removed|
6 | Share the folder by link | 1. Create a new folder <br>2. Swipe to share the folder by link <br>  | The link is generated and works|
7 | Share the folder by link with pass| 1. Create a new folder <br>2. Swipe to share the folder by link <br> 3. Enable the password protection and set a password | The link is generated and only works if the correct password is typed|
8| Unshare the folder by link | 1. Unshare the folder of previous test cases| The link is no more available |
9 | Share the folder with users or groups| 1. Create a new folder <br> 2. Swipe to share with users/groups <br> 3. Type one user/group to share with |  The user/group can access to the folder
10| Unshare the folder with users or groups| 1. Unshare the folder in the previous test case | The folder is not more available for the sharees |
11| Download a folder| 1. Swipe to download a folder  | All the files into the folder are downloaded and marked with green arrow|
12| Download a folder in background| 1. Swipe to download a folder which contains several levels of folders with files | All the files into the folder are downloaded and marked with green arrow|
13| Favourite Folder | 1. Swipe to set as favourite a folder which contains several levels of folders with files | The folder and all its content is downloaded and set as favourite with the yellow star |
14| Unfavourite Folder | 1. Swipe to unfavourite a favourite folder | The folder is not marked with yellow star |


### File

TestID | Test Case | Steps | Expected Result | Result | Related Comment
------------ | ------------- | ------------- | -------------- | ----- | ------
1 | Upload a new file  | 1. Upload a new file | The file is uploaded |
2 | Upload a file with special character | 1. Upload a new file (e.g f%&¨)| The file is uploaded |
3 | Rename a file | 1. Create a new file <br> 2. Rename the file | The file is renamed |
4 | Move a file | 1. Create a new file <br> 2. Move the file | The file is renamed |
5 | Delete a file  | 1. Create a new file <br> 2. Delete the file | The file is deleted |
6 | Share the file by link | 1. Create a file<br> 2. Swipe to share the file by link | The link is generated and works|
7 | Share the file by link with pass| 1. Create a file<br> 2. Swipe to share the file by link <br> 3. Set a password| The link is generated and works when the correct pass is typed|
8 | Unshare the file by link | 1. Unshare the file of previous test cases |  The link is no more available|
9 | Share the file with users or groups| 1. Create a new file <br> 2. Swipe to share with users/groups <br> 3. Type one user/group to share with |  The user/group can access to the file
10| Unshare the file with users or groups| 1. Unshare the file in the previous test case | The file is not more available for the sharees 
11| Download a file| 1. Tap to download a file | The file is downloaded and marked with green arrow|
12| Favourite file | 1. Swipe to set as favourite a file | The file is downloaded and set as favourite with the yellow star |
13| Unfavourite file | 1. Swipe to unfavourite a file (the one of las test case, e.g.) | The file is unfavourited and marked with green arrow |
