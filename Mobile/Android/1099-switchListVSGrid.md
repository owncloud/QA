### Switch List vs Grid

#### Pr: https://github.com/owncloud/android/pull/1099

Devices: Phone Nexus v5

Server version: 8.2.2

<br>

Test Case ID | Test case   | Steps| Expected behavior | Result | Related Comments
|:----:|:------------- |:-------------|:------------|:-------------:|:----------
Menu option|
1|Menu option|1. Tap on (...) menu| An option "Switch to (grid/list) view" appears| P m5
Orientations| 
2|Portrait| 1. In a folder, switch to grid/list in portrait and change the orientation several times|The files are displayed correctly as grid and list|P m5
3|Landscape| 1. In a folder, switch to grid/list in landscape and change the orientation several times|The files are displayed correctly as grid and list|P m5
Switching views|
4|Switch to grid (root)| 1. In root folder, switch to grid view |The files are displayed as grid|P m5
5|Switch to list (root)| 1. In root folder, switch to list view |The files are displayed as list|P m5
6|Switch recursive| 1. Set the root folder as list<br>2. Browse to a folder<br>3. Set that folder to grid<br>4. Browse another deeper folder into the one in 2. step<br>5. Set that folder to list |2. The folder is displayed as list<br> 3. The folder is displayed as grid and the ancestor (root) as list<br>4. The folder is displayed as grid <br>5. The folder is displayed as list, the ancestor as grid, and the last ancestor (root) as list| P m5
7|Switch recursive II| 1. Set the root folder as grid<br>2. Browse to a folder<br>3. Set that folder to list<br>4. Browse another deeper folder into the one in 2. step<br>5. Set that folder to grid |2. The folder is displayed as grid<br> 3. The folder is displayed as list and the ancestor (root) as grid<br>4. The folder is displayed as list <br>5. The folder is displayed as grid, the ancestor as list, and the last ancestor (root) as grid
Persistance|
8|Changing account|1. Repeat steps from 6 or 7<br>2. Change to another account<br>3. Change again to the first account<br>|The configured views of all folders persists|P m5
9|Kill the app|1. Repeat steps from 6 or 7<br>2. Kill or close the app<br>3. Open the app<br>|The configured views of all folders persists | P m5
10|Changing password|1. Repeat steps from 6 or 7<br>2. In server, change the account password<br>3. Refresh<br>4. Input new credentials<br>|The configured views of all folders persists| P m5
Badgets|
11|Share with users|1. Share a file/folder with users<br>2. Change view and orientations<br>|1. Badget is displayed<br>2. Badget is correctly displayed in both views and orientations| P m5
12|Share link|1. Share a file/folder by link<br>2. Change view and orientations<br>|1. Badget is displayed<br>2. Badget is correctly displayed in both views and orientations| P m5
13|Download|1. Download a file<br>2. Change view and orientations<br>|1. Badget is displayed<br>2. Badget is correctly displayed in both views and orientations| P m5
14|Favourite|1. Set a file as a favourite<br>2. Change view and orientations<br>|1. Badget is displayed<br>2. Badget is correctly displayed in both views and orientations| P m5
Shibboleth|
15|Change views|1. In a shibb account, change views and browse|Change of views is performed correctly
16|Expired session|1. Set several folders as grid/list<br>2. When the session expires, input credentials|The configured views of all folders persists


