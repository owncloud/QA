# Smoke test Android 

Device & Android version: 
Android app version: 
Server version: 


### Login

Test Case | Expected Result | Result | Related Comment
| :------- | :---------------: | :------ | :-----------------: | 
Login with one account (HTTPS)  | It is possible to access | :white_check_mark: |
Login with one account (HTTP)  | It is possible to access  | :white_check_mark: |



### Folder

TestID | Test Case | Steps | Expected Result | Result | Related Comment
------------ | ------------- | ----------- | -------------- | ----- | ------
1 | Create a new folder  | 1. Tap on create a new folder |The folder is created| :white_check_mark: basic<br>:white_check_mark: OAuth2  |
2 | Create a folder with special character | 1. Tap on create a new folder <br> 2. Use a name with special characters (e.g $%&¨)| The folder is created with special character  | :white_check_mark: basic<br>:white_check_mark: OAuth2 |
3 | Rename a folder | 1. Create a new folder<br> 2. Rename the folder|  Folder is renamed|:white_check_mark: basic<br>:white_check_mark: OAuth2
4 | Move a folder | 1. Create a new folder <br> 2. Move the folder| Folder is moved to the specifield location |:white_check_mark: basic<br>:white_check_mark: OAuth2
5 | Upload a file into a folder | 1. Create a new folder <br> 2. Upload a file| File is uploaded into the folder |:white_check_mark: basic<br>:white_check_mark: OAuth2
6 | Delete a folder  | 1. Access to a folder, the folder has deep structure inside <br> 2. Download some files <br>3. Select delete that folder  | 2. The files are downloaded<br>3. The folder is removed|:white_check_mark: basic<br>:white_check_mark: OAuth2
7| Copy Folder | 1. Long press to copy a folder <br> 2. Select a location to paste | The folder and all its content is copied in the location, and remains too in the original|:white_check_mark: basic<br>:white_check_mark: OAuth2
8 | Share the folder by link | 1. Create a new folder <br>2. Long press to share the folder by link <br>  | The link is generated and works|:white_check_mark: basic<br>:white_check_mark: OAuth2
9 | Share the folder by link with pass| 1. Create a new folder <br>2. Long press to share the folder by link <br> 3. Enable the password protection and set a password | The link is generated and only works if the correct password is typed|:white_check_mark: basic<br>:white_check_mark: OAuth2
10| Unshare the folder by link | 1. Unshare the folder of previous test cases| The link is no more available |:white_check_mark: basic<br>:white_check_mark: OAuth2
11 | Share the folder with users or groups| 1. Create a new folder <br> 2. Long press to share with users/groups <br> 3. Type one user/group to share with |  The user/group can access to the folder|:white_check_mark: basic<br>:white_check_mark: OAuth2
12| Unshare the folder with users or groups| 1. Unshare the folder in the previous test case | The folder is not more available for the sharees |:white_check_mark: basic<br>:white_check_mark: OAuth2
13| Sync a folder| 1. Create a folder <br> 2. In web app, upload some files in the folder <br> 3. Long press to sync the folder  | The folder is sync with the content on server|:white_check_mark: basic<br>:white_check_mark: OAuth2
 


### File

TestID | Test Case | Steps | Expected Result | Result | Related Comment
------------ | ------------- | ------------- | -------------- | ----- | ------
1 | Upload a new file  | 1. Upload a new file | The file is uploaded | :white_check_mark: basic<br>:white_check_mark: OAuth2
2 | Upload a file with special character | 1. Upload a new file (e.g f%&¨)| The file is uploaded |:white_check_mark: basic<br>:white_check_mark: basic<br>:white_check_mark: OAuth2
3 | Rename a file | 1. Create a new file <br> 2. Rename the file | The file is renamed |:white_check_mark: basic<br>:white_check_mark: OAuth2
4 | Move a file | 1. Create a new file <br> 2. Move the file | The file is renamed |:white_check_mark: basic<br>:white_check_mark: OAuth2
5 | Copy a file  | 1. Create a new file <br> 2. Copy the file | The file is copied to the selected location |:white_check_mark: basic<br>:white_check_mark: OAuth2
6 | Delete a file  | 1. Create a new file <br> 2. Delete the file | The file is deleted |:white_check_mark: basic<br>:white_check_mark: OAuth2
7 | Share the file by link | 1. Create a file<br> 2. Long press to share the file by link | The link is generated and works|:white_check_mark: basic<br>:white_check_mark: OAuth2
8 | Share the file by link with pass| 1. Create a file<br> 2. Long press to share the file by link <br> 3. Set a password| The link is generated and works when the correct pass is typed|:white_check_mark: basic<br>:white_check_mark: OAuth2
9 | Unshare the file by link | 1. Unshare the file of previous test cases |  The link is no more available|:white_check_mark: basic<br>:white_check_mark: OAuth2
10 | Share the file with users or groups| 1. Create a new file <br> 2. Long press to share with users/groups <br> 3. Type one user/group to share with |  The user/group can access to the file|:white_check_mark: basic<br>:white_check_mark: OAuth2
11| Unshare the file with users or groups| 1. Unshare the file in the previous test case | The file is not more available for the sharees |:white_check_mark: basic<br>:white_check_mark: OAuth2
12| Download a file| 1. Tap to download a file | The file is downloaded and marked with green arrow|:white_check_mark: basic<br>:white_check_mark: OAuth2
13| Av Offline file | 1. Long press to set as Av Offline a file | The file is downloaded and set as Av Offline with the yellow arrow |:white_check_mark: basic<br>:white_check_mark: OAuth2
14| Av Offline file | 1. Long press to unset an Av Offline a Av Offline file | The file has no more the yellow arrow |:white_check_mark: basic<br>:white_check_mark: OAuth2
