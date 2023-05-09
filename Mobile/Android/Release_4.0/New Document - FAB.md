###  New file (oCIS)


**Devices**: Pixel 2 Android 12<br>
**Server**: oCIS 3.0-rc1, oC10.12.1


---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Availability**||
| oC10 | 1. Authenticate in a oC10 server<br>2. In list of files, click on FAB | `New document` option not available | P m12 |  |  |
| oCIS without app provider | 1. Authenticate in a oCIS server with no application provider support<br>2. In list of files, click on FAB | `New document` option not available | P m12 |  |  |
| oCIS with app provider | 1. Authenticate in a oCIS server with application provider support<br>2. In list of files, click on FAB | `New document` option available | P m12 |  |  |
|**View**||
| oCIS with app provider | 1. In list of files, click on FAB<br>2. Click on `New Document` | Available options of files to create are displayed. Check with web that options are the same | P m12 |  |  |
|**Create new document**| In oCIS server with app provider|
| New name | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Add a correct name for the file<br>5. Save the file in the web<br>6. Close web editor | Back to the app, showing list of files that includes the new file<br>Check in web that content was saved | P m12 |  |  |
|**Errors**| 
| Existing name | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Add a name for the file that already exist in the current folder (same extension)| Error:  | P m12 | Server issue: https://github.com/owncloud/ocis/issues/6140 |  |
| Empty name | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Let file name empty and submit| Error: Filename must not be empty | P m12 |  |  |
| Forbidden characters | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Set a file name that contains forbidden characters ("/" , "\\")| Error: Filename must not be empty | P m12 | To improve |  |
| Created other client | 1. In web (or other client), create new file of an specific type and let it open in the browser<br>2. In app, click on `New Document`<br>3. Select same type as in 1.<br>4. Add same name as 1.| Error: File could not be created because permission error | P m12 |  |  |
| Modify other client | 1. In web (or other client), create new file of an specific type and let it open in the browser<br>2. In app, try to rename/remove/move the file while is open in the web| Error: File could not be created because permission error | P m12 |  |  |
| No internet connection | 1. In list of files, click on FAB<br>2. Click on `New Document`<br>3. Select any type<br>4. Add a name for the file | Error: File could not be created because device is not connected to a network | P m12 |  |  |