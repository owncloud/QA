###  Txt documents 

#### Pr: https://github.com/owncloud/ios/pull/648 

Devices:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| **View** |||||| 
| 1 | New file option - Portrait  | 1. Tap on (...) with the device in Portrait | The option "New txt file" is shown |  |  |
| 2 | New file option - Landscape  | 1. Tap on (...) with the device in Landscape | The option "New txt file" is shown |  |  |
| 3 | New file Editor - Portrait  | 1. In portrait, tap on (...) and select "New txt file"<br>2. Save a file  | File can be created, written and saved correctly |  |  |
| 4 | New file Editor - Landscape  | 1. In landscape, tap on (...) and select "New txt file"<br>2. Save a file  | File can be created, written and saved correctly |  |  |
| **File** |||||| 
| 5 | Empty file name | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file with a empty name | The file can not be saved |  |  |
| 6 | Special Characters  | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file whose name contains special characters | The file is saved correctly |  |  |
| 7 | Long file name  | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file whose name is too long (+50characters) | The file is saved correctly |  |  |
| 8 | Duplicated file name (same folder) | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file with a existent file name in the current folder| A conflict is detected and the file can not be saved |  |  |
| 9 | Duplicated file name (different folder) | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file with a existent file name in the a different folder| The file is correctly saved |  |  |
| 10 | Empty content | 1. Tap on (...) and select "New txt file"<br> 2. Try to save a empty file | The file is saved correctly |  |  |
| 11 | Deep folder | 1. Tap on (...) and select "New txt file" in a deep folder<br> 2. Try to save the file | The file is saved correctly |  |  |
| 12 | Multiaccount | 1. Set multiaccount in the app <br> 2.Tap on (...) and select "New txt file" in an account<br> 3. Repeat the same actions in other/s account/s| All files are saved correctly |  |  |
| 13 | No internet connection | 1. Switch the device connection off <br> 2.Tap on (...) and select "New txt file" in an account<br> 3. Save the file<br>4. Switch the connection on| 3. The file is added to the uploads queue waiting for the connection<br>4. The file is correctly saved |  |  |
| **Special servers** |||||| 
| 14 | Shibboleth | 1. In a shibboleth account, tap on (...) and select "New txt file"<br>2. Create the file and wait until the session expires<br>3. Tap on "save"| The credentials are required, after that the file can be saved |  |  |
| 15 | Redirected | 1. Tap on (...) and select "New txt file"<br>2. Save a file  | File can be created, written and saved correctly |  |  |