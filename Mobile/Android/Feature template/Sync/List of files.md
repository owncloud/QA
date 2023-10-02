### List of files

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 
| Test Case | Steps | Expected | Result | Related Comment / Defect  | 
| :-------- | :---- | :------- | :----: | :------------------------ | 
|**View**||||||
| Top bar | Open list of files | Top bar includes: <br>- Hamburger button (root folder)<br>- Back arrow button (non root folder)<br>- `ownCloud` label<br>- Lens icon to filter<br>- Avatar (root folder)<br>- Sharing icon (non root folder)<br>- 3-dot-button (non root folder) <br>- Selector for sorting types<br>- Grid/List view selector|  |  |
| Bottom bar | Open list of files | Bottom bar includes: <br>- Files (oC10)<br>-  Personal (oCIS)<br>- Links (oC10)<br>- Uploads<br>- Offline<br>- Shares (oCIS)<br>- Spaces (oCIS) |  |  |
| View body | Open list of files | List of files and folders match. Check with web  |  |  |
| Empty list of files | Open list of files of an empty folder | `No files in here` placeholder message  |  |  |
|**Top bar actions**||||||
| Hamburger | Click on hamburger button | Sidebar menu opened  |  |  |
| Search | 1. Click on lens icon<br>2. Enter some different strings | 1. Top bar shows the `Search this folder` message to enter the pattern<br>2. Check that the list of files is filtered, showing only the items which name match with the input  |  |  |
| Empty Search | 1. Click on lens icon<br>2. Enter a string that does not match with any item in the list | `No files in here` placeholder message |  |  |
| Cancelled Search | 1. Click on lens icon<br>2. Enter a string that matches with some items in the list<br>3. Click on `x` to cancel<br>4. Click again on `x` | 2. List filtered with the pattern<br>3. All files listed with no filters<br>4. Filter field is closed and `ownCloud` displayed again |  |  |
| Avatar | Click on avatar button | `Manage accounts` view displayed|  |  |
| Sort by name | 1. Click on sorting selector<br>2. Choose "Name &uarr;" <br>3. Choose "Name &darr;"| 2. List sorted by name ascending without obeying files and folders<br>3. List sorted by name descending without obeying files and folders |  |  | 
| Sort by date | 1. Click on sorting selector<br>2. Choose "Date &uarr;" <br>3. Choose "Date &darr;"| 2. List sorted by date ascending (oldest first)<br>3. List sorted by date descending (newest first) |  |  | 
| Sort by size | 1. Click on sorting selector<br>2. Choose "Size &uarr;" <br>3. Choose "Size &darr;"| 2. List sorted by size ascending (smallest first)<br>3. List sorted by date descending (biggest first) |  |  |
| Grid/List | 1. Click on grid/list selector<br>2. Click again on grid/list selector| 1. Files in grid mode in all accounts and subfolders<br>2. Files in list mode in all accounts and subfolders |  |  |  
