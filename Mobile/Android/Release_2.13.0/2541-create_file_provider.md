###  Create new file from provider

#### PR: https://github.com/owncloud/android/pull/2541

Devices: Nexus 5X v8, Samsung S9 v9, Nexus 6P v7<br>
Server: 10.2.1

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved | P m8 m9 m7 | MSWord, MSExcel |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder | P m8 m9 m7| MSWord, MSExcel |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder  | P m8 m9 m7 | MSWord does not allow many special characters in name |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | added a numeral to the file name | P m8 m9 m7 |  |  |
| Conflict II | From a 3rd party app, create new file and save in oC, setting an existing name from a previous conflict | added a second numeral to the file name | P m8 m9 m7 |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in local and in oC in different accounts and target folders | File is correctly saved in all accounts | P m9 m8 m7 |  |  |
|**Errors**||||||
| No connection | Create the new file with no connection | Correct error (No connection) | P m8 m9 m7 |  |  |
| Auth failure | Change credentials before uploading the file | Correct error (No credentials) | P m8 m9 m7 |  |  |
| Remove target folder | Remove the target folder before submitting the new file | Correct error (Folder error) | P m8 m9 m7 |  |  |
| No permission | Share a folder with no edit permission<br>Create the file inside the folder | Correct error (No permission) | P m8 m9 m7 |  |  |
|**Regression**||||||
| Edit file | Open a file stored in oC<br>Modify the file | File is saved in oC with the update | P m8 m9 m7 | file is only updated when it is opened |  |