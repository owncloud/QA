### Rename

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 
--

Tests: 13<br>
Automated: 3 (23%)

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Rename**||||||
| Rename non-downloaded file | 1. Select a file from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a correct name<br>3. Click `OK` | File renamed in list. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature) |  |
| Rename downloaded file  | 1. Download a file by clicking on it<br>2. Select the file from the list by clicking on the 3-dot-button and click on `Rename`<br>3. Enter a correct name<br>4. Click `OK`  | File renamed in list.<br> Check in web.<br> Check in internal storage that file was renamed (Android Studio's Device File Explorer will help with app in debug build)|  |  |
| Rename folder | 1. Select a folder with subfolders from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a correct name<br>4. Click `OK` | Folder renamed in list. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature)  | |
|**Errors**||||||
| Rename item no connection | 1. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a correct name<br>3. Click `OK` | Error: `Rename could not be completed`<br>` because device is not connected to a network` |  |  |
| Rename item no server connection | 1. Switch server off<br>2. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>3. Enter a correct name<br>4. Click `OK`| Error: `Rename could not be completed`<br>` because an error occurred while`<br>` connecting to the server` |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>3. Enter a correct name<br>4. Click `OK` | Error: `System in maintenance mode` |   |  |
| Empty name | 1. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter empty name<br>3. Click `OK` | Error: `Rename could not be completed`<br>` because file name cannot be empty` |  |   
| Max length folder name | 1. Select a folder from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a 249 character name and click `OK`<br>3. Enter a 250 character name and click `OK` | 2. Allowed<br>3. Error: `Rename could not be completed`<br>` because file name cannot be that long` |  |  
| Max length file name | 1. Select a folder from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a 249 character name<br>3. Enter a 250 character name (extension is part of the name)<br>4. Click `OK` | 2. Allowed<br>3. Error: `Rename could not be completed`<br>` because file name cannot be that long`  | |   
| Forbidden character \"/\" | 1. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a name that contains \"/\"<br>3. Click `OK` | Error: `Rename could not be completed`<br>` because file name contains`<br>` at least one forbidden character `|  |   |
| Forbidden character \"\\" | 1. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a name that contains \"\\"<br>3. Click `OK` | Error: `Rename could not be completed`<br>` because file name contains`<br>` at least one forbidden character ` |   |   |
| Rename existing name | 1. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter as name an existing name in the same location<br>3. Click `OK` | Error: `Rename could not be completed`<br>` because file already exists` | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/rename.feature)  |  |
| Rename inexistent item | 1. Select an item from the list by clicking on the 3-dot-button and click on `Rename`<br>2. Enter a correct name<br>3. Before submitting, remove the item in web or other client<br>4. Submit the renaming | Error: `Rename could not be completed`<br>` because it was not found` |   |  |