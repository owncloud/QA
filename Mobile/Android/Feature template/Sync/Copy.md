### Copy

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

Tests: 15<br>
Automated: 8 (53%)


| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Copy**||||||
| Copy non-downloaded file | 1. Select a file from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a correct target location (including space in case of oCIS account) | File in the new location and not removed from original location.<br>Check in web that items were correctly copied to the correct location. |   [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) | |
| Copy downloaded file  | 1. Download a file by clicking on it<br>2. Select the file from the list by clicking on the 3-dot-button and click on `Copy`<br>3. Select a correct target location (including space in case of oCIS account) | File in the new location (not downloaded) and not removed from original location (downloaded).<br>Check in web that items were correctly copied to the correct location.<br>Check in internal storage that original file is still downloaded and copied file is not (Android Studio's Device File Explorer will help with app in debug build)|   |  |
| Copy non-downloaded folder | 1. Select a folder that contains subfolders with files from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a correct location (including space in case of oCIS account) | Folder in the new location and not removed from original location.<br>Check in web that items were correctly copied to the correct location.|  [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) | |
| Copy downloaded folder | 1. Download a folder with subfolders and files by long pressing on it and then, clicking on sync button (circle arrow) on the top<br>2. Select the downloaded folder again, and in 3-dot-button, select `Copy`<br>3. Select a correct location (including space in case of oCIS account) | Folder with files and subfolders inside copied to the new location (not downloaded) and not removed from original location (downloaded).<br>Check in web that items were correctly copied to the correct location.<br>Check in internal storage that original folder is still downloaded and copied folder is not (Android Studio's Device File Explorer will help with app in debug build) |  |  |
| Copy item to other space (oCIS) | 1. In oCIS account, select a file from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a different space that the current one<br>3. Select any location inside the space | File is correctlu copied inside the space. Check in web. | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) |  |
| Copy item to same location | 1. Select a file from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select as location the current location of the item | File is copied adding (1) to its name | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) |  |
| Conflict (keep both)| 1. Using web or other client, create in the target folder an item with the same name as the original<br>2. In 3-dot-button, select `Copy`<br>3. Select the target folder that contains the item with same name<br>4. Fix the conflict with `keep both` | 3. Conflict happens<br>4. File is copied adding (1) to its name | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)  |  |
| Conflict (replace)| 1. Using web or other client, create in the target folder an item with the same name as the original<br>2. In 3-dot-button, select `Copy`<br>3. Select the target folder that contains the item with same name<br>4. Fix the conflict with `replace` | 3. Conflict happens<br>4. New file replaces old one| [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) |  |
| Conflict (skip)| 1. Using web or other client, create in the target folder an item with the same name as the original<br>2. In 3-dot-button, select `Copy`<br>3. Select the target folder that contains the item with same name<br>4. Fix the conflict with `skip` | 3. Conflict happens<br>4. File not copied|  |  |
|**Errors**||||||
| Copy item no connection | 1. Select a file from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a correct target location | Error: `Device is not connected`<br>`to a network` |  |  |
| Copy item no server connection | 1. Switch server off<br>2. Select a item from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select a correct target location | Error: |   |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select a item from the list by clicking on the 3-dot-button and click on `Copy`<br>3. Select a correct target location | Error: `System in maintenance mode` |   |  |
| Copy folder to itself | 1. Select a folder from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select as target location the same folder | Error: `It's not posible to copy`<br>`a folder into a descendant` | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature)  |   
| Copy folder to a descendant | 1. Select a folder from the list by clicking on the 3-dot-button and click on `Copy`<br>2. Select as target folder any subfolder that is inside the selected folder | Error: `It's not posible to copy`<br>` a folder into a descendant` | [AUTO](https://github.com/owncloud/android-scenario-testing/blob/master/src/test/resources/io/cucumber/copy.feature) |  |
| Copy to inexistent location | 1. Select a item from the list by clicking on the 3-dot-button and click on `Copy`<br>2. In web or other client, remove the intended target folder<br>4. Select as target folder the removed folder (still appears in the app) | Error: `An error occurred `<br>`in the destination folder` |  |  |
