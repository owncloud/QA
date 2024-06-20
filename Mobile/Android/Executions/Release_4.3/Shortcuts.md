### Shortcuts

Server(s): oCIS 5.0.5 <br>
Device(s): Pixel 2, Android 11, Samsung Galaxy A8 Android 13<br>
Execution date: 14/06/2024<br>
Tester: jrecio <br>
Context: <br>
 
--

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| New shortcut | Open FAB | Option `New shortcut` displayed. Correct in both orientations | P m11 t13 |  |
| Shortcut dialog | 1. Open FAB<br>2. Click on `New shortcut` | Dialog to create shortcut is displayed with inputs for name and url. Correct in both orientations |  P m11 t13 |  |
|**Creation**||||||
| Empty name | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Let empty name  | `Create` button is disabled | P m11 t13 |  |
| Empty URL | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Let empty URL  | `Create` button is disabled | P m11 t13 |  |
| Long name | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Set a name longer than 256 chars (max file name length) | `Create` button is disabled showing error | P m11 t13 | FIXED: 223 chars show the error files |
| Incorrect characters | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Set a name that includes forbidden characters ( `\`, `/`) | `Create` button is disabled showing error| P m11 t13 |  |
| Spaces | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Set a URL that contain spaces | `Create` button is disabled showing error:<br>`URL cannot contain blanks`| P m11 t13 |  |
| Correct Shortcut in root | 1. Open FAB in root folder<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter correct name like `shortcut.url`<br>5. Click on `Create`  | `shortcut.url` created in the root folder. Check in uploads view. |  P m11 t13 |  |
| Correct Shortcut in non-root | 1. Open FAB in non-root folder<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter correct name like `shortcut.url`<br>5. Click on `Create`  | `shortcut.url` created in the non-root folder. Check in uploads view.  |  P m11 t13 |  |
| Correct Shortcut in space | 1. Open FAB in custom space<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter correct name like `shortcut.url`<br>5. Click on `Create`  | `shortcut.url` created in the space folder. Check in uploads view.  | P m11 t13 |  |
| Existing name | 1. Open FAB<br>2. Click on `New shortcut`<br>3. Enter correct URL<br>4. Enter name as an existing file name in the folder<br>5. Click on `Create` | `shortcut (1).url` created in the space folder. Check in uploads view.  | P m11 t13 |  |
| External | 1. Open FAB <br>2. Click on `New shortcut`<br>3. Enter correct URL and name<br>4. Using another client (web, iOS), open the shortcut there | Shortcut is correctly opened | P m11 t13 | Need to wait some seconds in web |  |
|**Open shortcut**||||||
| Link dialog | Click over an existing and correct `.url` file | Dialog is displayed asking user for confirmation, showing the URL to open. Check in both orientations | P m11 t13 |  |
| Long URL | Click over an existing and correct `.url` file that contains a very long URL | Dialog is displayed asking user for confirmation, showing the long URL correctly. Check in both orientations | P m11 t13 | FIXED: Wrong ellipsis |
| Open Link | 1. Click over an existing and correct `.url` file<br>2. Click on `Open` | Default browser opens to show the linked URL | P m11 t13 |  |
| Cancel | 1. Click over an existing and correct `.url` file<br>2. Click on `Cancel` | Dialog dismissed | P m11 t13 |  |
| External | 1. Using another client (web, iOS), create a shortcut.<br>2. Sync in Android app to get the shortcut<br>3. Click on the shortcut | Default browser opens to show the linked URL | P m11 t13 | Need alignment with other clients |  |
