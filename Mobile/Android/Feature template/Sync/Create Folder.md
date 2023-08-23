### Create folder

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 
--

Tests: 10<br>
Automated: 3 (33%)

| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Create folder**||||||
| New folder in root | 1. Open FAB in list of files, root folder<br>2. Select `New folder`<br>3. Enter a correct name<br>4. Click `OK`| Folder created in root folder. Check in web |  [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature) |  |
| New folder in non-root | 1. Open FAB in list of files, non-root folder<br>2. Select `New folder`<br>3. Enter a correct name<br>4. Click `OK` | Folder created in non-root folder. Check in web | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature) |  |
| New folder - empty | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Let empty name | `OK` not clickable |  |  |
|**Errors**||||||
| Create folder no connection | 1. Remove device connection<br>2. Open FAB in list of files<br>3. Select `New folder`<br>4. Enter a correct name<br>5. Click `OK` | Error: `Folder could not be`<br>` created because device is`<br>` not connected to a network` |  |  |
| Rename item no server connection | 1. Switch server off<br>2. Open FAB in list of files<br>3. Select `New folder`<br>4. Enter a correct name<br>5. Click `OK`| Error: `Folder could not be created`<br>` because an error occurred`<br>` while connecting to the server` |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Open FAB in list of files<br>3. Select `New folder`<br>4. Enter a correct name<br>5. Click `OK` | Error: `System in maintenance mode` |   |  |
| New folder - existing name | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Enter a name of an existing folder in the current folder<br>4. Click `OK` | Error: `The resource you tried`<br>` to create already exists` |  [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/createfolder.feature) |  |
| New folder - long name | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Enter a name longer than 255 characters<br>4. Click `OK` | Error: `Folder could not be created`<br>` because folder name could not be that long` |  |  |
| Forbidden character \"/\" | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Enter a name that contains \"/\" | Error: `Folder could not be created`<br>` because folder name contains`<br>` at least one forbidden character `|  |   |
| Forbidden character \"\\" | 1. Open FAB in list of files<br>2. Select `New folder`<br>3. Enter a name that contains\"\\" | Error: `Folder could not be created`<br>` because file name contains`<br>` at least one forbidden character ` |   |   |
