###  Txt documents 

#### Pr: https://github.com/owncloud/ios/pull/648 

Devices: iPad Mini v9.1, iPhone v8.1, iPhone v9.1

Server: 9.0.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
| **View** |||||| 
| 1 | New file option - Portrait  | 1. Tap on (...) with the device in Portrait | The option "New txt file" is shown | P t9 m8 | SOLVED: Crash when changing orientation |
| 2 | New file option - Landscape  | 1. Tap on (...) with the device in Landscape | The option "New txt file" is shown | P t9 m8 | SOLVED: Crash when changing orientation | 
| 3 | New file Editor - Portrait  | 1. In portrait, tap on (...) and select "New txt file"<br>2. Save a file  | File can be created, written and saved correctly | P t9 F m8| SOLVED: File name without extension.<br> NO FIX: Saving uploads the file and does not remain locally.<br> SOLVED: Filename chart is not placed correctly. Status bar in black|
| 4 | New file Editor - Landscape  | 1. In landscape, tap on (...) and select "New txt file"<br>2. Save a file  | File can be created, written and saved correctly | P t9 m8|  |
| **File** |||||| 
| 5 | Empty file name | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file with a empty name | The file can not be saved | P t9 m8|  |
| 6 | Special Characters  | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file whose name contains special characters | The file is saved correctly |   P t9 m8|  | 
| 7 | Long file name  | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file whose name is too long (+50characters) | The file is saved correctly | P t9 m8 |  |
| 8 | Duplicated file name (same folder) | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file with a existent file name in the current folder| A conflict is detected and the file can not be saved | P t9 m8|  |
| 9 | Duplicated file name (different folder) | 1. Tap on (...) and select "New txt file"<br> 2. Try to save the file with the name of other file existing in a different folder| The file is correctly saved | P t9 m8|  |
| 10 | Empty content | 1. Tap on (...) and select "New txt file"<br> 2. Try to save a empty file | The file is saved correctly | P t9 m8|  |
| 11 | Deep folder | 1. Tap on (...) and select "New txt file" in a deep folder<br> 2. Try to save the file | The file is saved correctly | P t9 m8|  |
| 12 | Multiaccount | 1. Set multiaccount in the app <br> 2.Tap on (...) and select "New txt file" in an account<br> 3. Repeat the same actions in other/s account/s| All files are saved correctly | P t9 m8|  |
| 13 | No internet connection | 1. Switch the device connection off <br> 2.Tap on (...) and select "New txt file" in an account<br> 3. Save the file<br>4. Switch the connection on| 3. The file is added to the uploads queue waiting for the connection<br>4. The file is correctly saved | P t9 m8|  |
| **Special servers** | One device||||| 
| 14 | Shibboleth | 1. In a shibboleth account, tap on (...) and select "New txt file"<br>2. Create the file and wait until the session expires<br>3. Tap on "save"| The credentials are required, and the file is queued with credentials error | F m9 |  Crash when session expires |
| 15 | Redirected | 1. Tap on (...) and select "New txt file"<br>2. Save a file  | File can be created, written and saved correctly | P m9 |  |