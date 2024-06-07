### Shortcuts

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 
--

Tests: <br>
Automated:

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| New shortcut | Open FAB | Option `New shortcut` displayed. Correct in both orientations |  |  |
| Shortcut dialog | 1. Open FAB<br>2. Click on `New shortcut` | Dialog to create shortcut is displayed with inputs for name and url |  |  |
|**Creation**||||||
| Empty name | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Let empty name  | `Create` button is disabled |  |  |
| Empty URL | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Let empty URL  | `Create` button is disabled |  |  |
| Long name | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Set a name longer than 256 chars (max file length) | `Create` button is disabled showing error |  |  |
| Incorrect characters | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Set a name that includes forbidden characters ( `\`, `/`) | `Create` button is disabled showing error|  |  |
| Correct Shortcut in root | 1. Open FAB in root folder<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter correct name like `shortcut.url`<br>5. Click on `Create`  | `shortcut.url` created in the root folder. Check in uploads view. |  |  |
| Correct Shortcut in non-root | 1. Open FAB in non-root folder<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter correct name like `shortcut.url`<br>5. Click on `Create`  | `shortcut.url` created in the non-root folder. Check in uploads view.  |  |  |
| Correct Shortcut in space | 1. Open FAB in custom space<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter correct name like `shortcut.url`<br>5. Click on `Create`  | `shortcut.url` created in the space folder. Check in uploads view.  |  |  |
| Existing name | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter name as an existing file name in the folder<br>5. Click on `Create` | `shortcut (1).url` created in the space folder. Check in uploads view.  |  |  |
| External | 1. Open FAB <br>2. Click on `New shortcut`<br>3. Enter correct URL and name<br>4. Using another client (web, iOS), open the shortcut there | Shortcut is correctly opened |  |  |  |
|**Open shortcut**||||||
| Link dialog | Click over an existing and correct `.url` file | Dialog is displayed asking user for confirmation, showing the URL to open. Check in both orientations |  |  |
| Long URL | Click over an existing and correct `.url` file that contains a very long URL | Dialog is displayed asking user for confirmation, showing the long URL correctly. Check in both orientations |  |  |
| Open Link | 1. Click over an existing and correct `.url` file<br>2. Click on `Open` | Default browser opens to show the linked URL |  |  |
| Cancel | 1. Click over an existing and correct `.url` file<br>2. Click on `Cancel` | Dialog dismissed |  |  |
| External | 1. Using another client (web, iOS), create a shortcut.<br>2. Sync in Android app to get the shortcut<br>3. Click on the shortcut | Default browser opens to show the linked URL |  |  |  |
