# Smoke test Android

Device & Android version: <br>
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
5 | Upload a file into a folder | 1. Create a new folder <br> 2. Upload a file| File is uploaded into the folder |
6 | Delete a folder  | 1. Access to a folder, the folder has deep structure inside <br> 2. Download some files <br>3. Select delete that folder  | 2. The files are downloaded<br>3. The folder is removed|
7| Copy Folder | 1. Long press to copy a folder <br> 2. Select a location to paste | The folder and all its content is copied in the location, and remains too in the original
8 | Share the folder by link | 1. Create a new folder <br>2. Long press to share the folder by link <br>  | The link is generated and works|
9 | Share the folder by link with pass| 1. Create a new folder <br>2. Long press to share the folder by link <br> 3. Enable the password protection and set a password | The link is generated and only works if the correct password is typed|
10| Unshare the folder by link | 1. Unshare the folder of previous test cases| The link is no more available |
11 | Share the folder with users or groups| 1. Create a new folder <br> 2. Long press to share with users/groups <br> 3. Type one user/group to share with |  The user/group can access to the folder
12| Unshare the folder with users or groups| 1. Unshare the folder in the previous test case | The folder is not more available for the sharees |
13| Sync a folder| 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server|
 


### File

TestID | Test Case | Steps | Expected Result | Result | Related Comment
------------ | ------------- | ------------- | -------------- | ----- | ------
1 | Upload a new file  | 1. Upload a new file | The file is uploaded |
2 | Upload a file with special character | 1. Upload a new file (e.g f%&¨)| The file is uploaded |
3 | Rename a file | 1. Create a new file <br> 2. Rename the file | The file is renamed |
4 | Move a file | 1. Create a new file <br> 2. Move the file | The file is renamed |
5 | Copy a file  | 1. Create a new file <br> 2. Copy the file | The file is copied to the selected location |
6 | Delete a file  | 1. Create a new file <br> 2. Delete the file | The file is deleted |
7 | Share the file by link | 1. Create a file<br> 2. Long press to share the file by link | The link is generated and works|
8 | Share the file by link with pass| 1. Create a file<br> 2. Long press to share the file by link <br> 3. Set a password| The link is generated and works when the correct pass is typed|
9 | Unshare the file by link | 1. Unshare the file of previous test cases |  The link is no more available|
10 | Share the file with users or groups| 1. Create a new file <br> 2. Long press to share with users/groups <br> 3. Type one user/group to share with |  The user/group can access to the file
11| Unshare the file with users or groups| 1. Unshare the file in the previous test case | The file is not more available for the sharees 
12| Download a file| 1. Tap to download a file | The file is downloaded and marked with green arrow|
13| Favourite file | 1. Long press to set as favourite a file | The file is downloaded and set as favourite with the yellow star |
14| Unfavourite file | 1. Long press to unfavourite a favourite file | The file has no more the yellow star |
