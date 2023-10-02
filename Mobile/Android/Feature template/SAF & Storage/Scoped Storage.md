### Scoped Storage


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>




| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Fresh install** |   |  |
| Files downoaded | 1. Fresh install<br>2. Add two accounts<br>3. Download files | Check with a File Explorer that the downloaded files are not available.<br>Check with Device Explorer (Android Studio), that files are correctly stored inside the sandbox  |  | 
| Folder downloaded | 1. Fresh install<br>2. Add accounts<br>3. Download a folder with subfolders | Check with a File Explorer that the downloaded folders are not available.<br>Check with Device Explorer (Android Studio), that folders and subfolders are correctly stored inside the sandbox  | | 
| Copy downloaded file | 1. Fresh install<br>2. Add one account<br>3. Copy a downloaded file to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file  is correctly copied inside the sandbox |  | 
| Copy several downloaded file | 1. Fresh install<br>2. Add one account<br>3. Copy some downloaded files to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that files are correctly copied inside the sandbox |  | 
| Copy folder | 1. Fresh install<br>2. Add one account<br>3. Copy folder to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correctly copied inside the sandbox |  | Copying folders do not create local files
| Copy several folder | 1. Fresh install<br>2. Add one account<br>3. Copy some folders with subfolders to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder and subfolders are correctly copied inside the sandbox |   | Copying folders do not create local files | 
| Move file | 1. Fresh install<br>2. Add one account<br>3. Move a downloaded file to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file  is correctly moved inside the sandbox |  | 
| Move several file | 1. Fresh install<br>2. Add one account<br>3. Move some downloaded files to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that files are correctly moved inside the sandbox |  | 
| Move folder | 1. Fresh install<br>2. Add one account<br>3. Move folder with at least one downloaded file to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correctly moved inside the sandbox | | 
| Move several folder | 1. Fresh install<br>2. Add one account<br>3. Move some folders with downloaded files with subfolders to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder and subfolders are correctly moved inside the sandbox |  | 
| Create folder root | 1. Fresh install<br>2. Add one account<br>3. Create a folder in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty created in root, inside the sandbox | | 
| Create folder non-root | 1. Fresh install<br>2. Add one account<br>3. Create a folder in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty created in non-root, inside the sandbox | | 
| Rename file root | 1. Fresh install<br>2. Add one account<br>3. Rename a downloaded file in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty Renamed in root, inside the sandbox |  | 
| Rename folder root | 1. Fresh install<br>Add one account<br>2. Rename a folder with downloaded files in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty Renamed in root, inside the sandbox |  | 
| Rename file non-root | 1. Fresh install<br>Add one account<br>2. Rename a downloaded file in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty Renamed in non-root, inside the sandbox |  | 
| Rename folder non-root | 1. Fresh install<br>2. Add one account<br> Rename a folder with downloaded files in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty Renamed in non-root, inside the sandbox |  | 
| Remove locally file root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded file in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in root, inside the sandbox |    | 
| Remove locally folder root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded folder in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in root, inside the sandbox |  | 
| Remove locally file non-root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded file in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in non-root, inside the sandbox |   | 
| Remove locally folder non-root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded folder in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in non-root, inside the sandbox |  | 
| Remove remote file root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded file in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in root, inside the sandbox | | 
| Remove remote folder root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded folder in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in root, inside the sandbox |  | 
| Remove remote file non-root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded file in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in non-root, inside the sandbox | | 
| Remove remote folder non-root | 1. Fresh install<br>2. Add one account<br>3. Remove a downloaded folder in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in non-root, inside the sandbox | | 
| Send, non-downloaded | 1. Fresh install<br>2. Add one account<br>3. Select a non-downloaded file<br>Select `Send`| Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is downloaded inside the sandbox | | 
| Logs stored | 1. Fresh install<br>2. Add one account<br>3. Enable Logs in `Settings` | Check with a File Explorer that the created logs are not available.<br>Check with Device Explorer (Android Studio), that logs are correctly stored inside the sandbox  |  |  |
| **Upgrade** |   |  |
| Av. offline root | 1. Install previous version and add an account<br>2. Set a file and a folder  with content in root as av. offline<br>3. Upgrade | Av. offline content is correctly downloaded and acesible with no network| 
| Av. offline non-root | 1. Install previous version and add an account<br>2. Set a file and a folder  with content in non-root as av. offline<br>3. Upgrade | Av. offline content is correctly downloaded | 
| **Others** |   |  |
|Multiaccount| 1. Add three different accounts<br>2. Download content from all of them | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is downloaded inside the sandbox for every account, correctly |  |  |  |

**Devices' size** 

|| Android12beta 128GB | Android11 64GB | Android7 32GB | Android6 16GB |
|:-:| :-: | :-: |  :-: |  :-: |  
| 5GB |   |   |   |   |
| 10GB |   |  |  |  |
| 20GB |   |   |  |  |
| 50GB |   |  |   |  |