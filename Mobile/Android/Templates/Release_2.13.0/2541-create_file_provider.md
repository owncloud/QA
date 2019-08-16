###  Create new file from provider

#### Pr: https://github.com/owncloud/android/pull/2541


---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
| Create new file root| From a 3rd party app, create new file and save in oC, selecting the root folder | new file is correctly saved |  |  |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | new file is correctly saved in the folder |  |  |  |
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | new file is correctly saved in the folder |  |  |  |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | conflict arose, user fix |  |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save in oC, in different accounts and target folders | File is correctly saved in all accounts |  |  |  |
|**Errors**||||||
| No connection | Create the new file with no connection | Correct error |  |  |  |
| Auth failure | Change credentials before uploading the file | Correct error |  |  |  |
| Remove target folder | Remove the target folder before submitting the new file | Correct error |  |  |  |