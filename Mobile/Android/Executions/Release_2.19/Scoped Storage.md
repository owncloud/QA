### Scoped Storage


#### PR: https://github.com/owncloud/android/pull/3269

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.8



| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Fresh install** |   |  |
| Files downoaded | Fresh install<br>Add two accounts<br>Download files | Check with a File Explorer that the downloaded files are not available.<br>Check with Device Explorer (Android Studio), that files are correctly stored inside the sandbox  | P m11 m7| 
| Folder downloaded | Fresh install<br>Add accounts<br>Download a folder with sobfolders | Check with a File Explorer that the downloaded folders are not available.<br>Check with Device Explorer (Android Studio), that folders and subfolders are correctly stored inside the sandbox  | P m11 m7 | 
| Copy downloaded file | Fresh install<br>Add one account<br>Copy a downloaded file to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file  is correctly copied inside the sandbox | P m11 m7 | 
| Copy several downloaded file | Fresh install<br>Add one account<br>Copy some downloaded files to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that files are correctly copied inside the sandbox | P m11 m7 | 
| Copy folder | Fresh install<br>Add one account<br>Copy folder to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correctly copied inside the sandbox | NA | Copying folders do not create local files
| Copy several folder | Fresh install<br>Add one account<br>Copy some folders with subfolders to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder and subfolders are correctly copied inside the sandbox |  NA | Copying folders do not create local files | 
| Move file | Fresh install<br>Add one account<br> Move a downloaded file to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file  is correctly moved inside the sandbox | P m11 m7 | 
| Move several file | Fresh install<br>Add one account<br> Move some downloaded files to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that files are correctly moved inside the sandbox | P m11 m7 | 
| Move folder | Fresh install<br>Add one account<br> Move folder with at least one downloaded file to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correctly moved inside the sandbox | P m11 m7| 
| Move several folder | Fresh install<br>Add one account<br> Move some folders with downloaded files with subfolders to another location | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder and subfolders are correctly moved inside the sandbox | P m11 m7 | 
| Create folder root | Fresh install<br>Add one account<br> Create a folder in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty created in root, inside the sandbox | P m11 m7| 
| Create folder non-root | Fresh install<br>Add one account<br> Create a folder in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty created in non-root, inside the sandbox | P m11 m7| 
| Rename file root | Fresh install<br>Add one account<br> Rename a downloaded file in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty renamed in root, inside the sandbox | P m11 m7 | 
| Rename folder root | Fresh install<br>Add one account<br> Rename a folder with downloaded files in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty renamed in root, inside the sandbox | P m11 m7 | 
| Rename file non-root | Fresh install<br>Add one account<br> Rename a downloaded file in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty renamed in non-root, inside the sandbox | P m11 m7 | 
| Rename folder non-root | Fresh install<br>Add one account<br> Rename a folder with downloaded files in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty renamed in non-root, inside the sandbox | P m11 m7 | 
| Remove locally file root | Fresh install<br>Add one account<br> Remove a downloaded file in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in root, inside the sandbox |   P m11 m7 | 
| Remove locally folder root | Fresh install<br>Add one account<br> Remove a downloaded folder in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in root, inside the sandbox |  P m11 m7| 
| Remove locally file non-root | Fresh install<br>Add one account<br> Remove a downloaded file in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in non-root, inside the sandbox |  P m11 m7 | 
| Remove locally folder non-root | Fresh install<br>Add one account<br> Remove a downloaded folder in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in non-root, inside the sandbox |  P m11 m7| 
| Remove remote file root | Fresh install<br>Add one account<br> Remove a downloaded file in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in root, inside the sandbox | P m11 m7| 
| Remove remote folder root | Fresh install<br>Add one account<br> Remove a downloaded folder in root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in root, inside the sandbox |  P m11 m7| 
| Remove remote file non-root | Fresh install<br>Add one account<br> Remove a downloaded file in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is correclty removed in non-root, inside the sandbox | P m11 m7| 
| Remove remote folder non-root | Fresh install<br>Add one account<br> Remove a downloaded folder in non-root | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that folder is correclty removed in non-root, inside the sandbox | P m11 m7| 
| Send, non-downloaded | Fresh install<br>Add one account<br> Select a non-downloaded file<br>Select `Send`| Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is downloaded inside the sandbox | P m11 m7| 
| Logs stored | Fresh install<br>Add one account<br>Enable Logs in `Settings` | Check with a File Explorer that the created logs are not available.<br>Check with Device Explorer (Android Studio), that logs are correctly stored inside the sandbox  | P m11 m7 | FIXED: Not stored
| **Upgrade** |   |  |
| Av. offline root | 1. Install previous version and add an account<br>2. Set a file and a folder  with content in root as av. offline<br>3. Upgrade | Av. offline content is correctly downloaded and acesible with no network| P m11 m7
| Av. offline non-root | 1. Install previous version and add an account<br>2. Set a file and a folder  with content in non-root as av. offline<br>3. Upgrade | Av. offline content is correctly downloaded | P m11 m7
| **Others** |   |  |
|Multiaccount| 1. Add three different accounts<br>2. Download content from all of them | Check with a File Explorer that the files are not available.<br> Check with Device Explorer (Android Studio), that file is downloaded inside the sandbox for every account, correctly | P m11 m7 |  |  |

**Devices' size** 

|| Android12beta 128GB | Android11 64GB | Android7 32GB | Android6 16GB |
|:-:| :-: | :-: |  :-: |  :-: |  
| 5GB | ✅  | ✅  | ✅  | ✅  |
| 10GB | ✅  | ✅  |  Device ran out of memory after 8GB| - |
| 20GB | ✅  | ✅  |  - | - |
| 50GB | ✅  | - |  - | - |