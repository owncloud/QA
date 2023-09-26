###  New document (oCIS)


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>



---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Availability**||
| oC10 without provider | 1. Authenticate in a oC10 server with no application provider<br>2. In list of files, click on FAB | `New document` option not available |  |  |  |
| oCIS without app provider | 1. Authenticate in a oCIS server with no application provider support<br>2. In list of files, click on FAB | `New document` option not available |  |  |  |
| oCIS with app provider | 1. Authenticate in a oCIS server with application provider support<br>2. In list of files, click on FAB | `New document` option available |  |  |  |
|**View**||
| oCIS with app provider | 1. In list of files, click on FAB<br>2. Click on `New Document` | Available options of files to create are displayed. Compare with web that displayed options are the same |  |  |  |
|**Create new document**| In server with app provider|
| New name | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Add a correct name for the file<br>5. Save the file in the web<br>6. Close web editor | Back to the app, showing list of files that includes the new file<br>Check in web that content was saved |  |  |  |
|**Errors**| 
| Existing name | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Add a name for the file that already exist in the current folder (same extension)| Error: `File could not be opened`<br>`because permission error` |  | [Server issue](https://github.com/owncloud/ocis/issues/6140)|  |
| Empty name | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Let file name empty and submit| Error: `Filename must not be empty` |  |  |  |
| Forbidden characters | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Set a file name that contains forbidden characters ("/" , "\\")| Error: `Forbidden characters / \` |  |   |  |
| Created other client | 1. In web (or other client), create new file of an specific type and let it open in the browser<br>2. In app, click on `New Document`<br>3. Select same type as in 1.<br>4. Add same name as 1.| Error: `File could not be created`<br>`because permission error` |  |  |  |
| Modify other client | 1. In web (or other client), create new file of an specific type and let it open in the browser<br>2. In app, try to rename/remove/move the file while is open in the web| Error: `File could not be created`<br>`because permission error` |  |  |  |
| No internet connection | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Add a name for the file | Error: `File could not be created `<br>`because device is not connected to a network` |  |  |  |