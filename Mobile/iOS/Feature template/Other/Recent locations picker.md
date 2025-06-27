### Recent locations picker


**Server(s)**:  <br>
**Device(s)**:  <br>
**Execution date**: <br>
**Tester**: <br>
**Context**:  <br>


| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**View**||||||
| Fresh install | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Click on `Choose destination directory...` | Recent locations section is NOT displayed on the top of the folder picker. Check in both orientations | |  |
| One location | 1. Perform a copy operation over any item and account<br>2. Open the operation list of any item in the list and click on `Copy`<br>3. Click on `Choose destination directory...` | Recent locations section is displayed on the top of the folder picker with the location of the operation in step 1. Check in both orientations | |  |
| Cell | 1. Perform a copy operation over any item and account<br>2. Open the operation list of any item in the list and click on `Copy` | The cell should show: <br>- Icon<br>- Folder name<br>- Space (if oCIS)<br>- Display name |  | |
|**Sources**| Location list not empty |||||
| Copy | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Click on `Choose destination directory...` | Recent locations displayed  | |  |
| Move | 1. Open the operation list of any item in the list and click on `Move`| Recent locations displayed  | |  |
| Share with | 1. Open the `Photos` app and select an item to share with oC | Recent locations displayed  | |  |
| Auto uploads Photos | 1. In `Settings`> `Media upload`, enable `Auto Upload Photos` | Recent locations displayed  | |  |
| Auto uploads Videos | 1. In `Settings`> `Media upload`, enable `Auto Upload Videos` | Recent locations displayed  | |  |
|**Targets**| Location list not empty. At least two accounts added ||||
| Copy | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Click on `Choose destination directory...` | Show only targets in the current account, including spaces | |  |
| Move | 1. Open the operation list of any item in the list and click on `Move`| Show only targets in the current space |  |  |
| Share with | 1. Open the `Photos` app and select an item to share with oC | Show targets in any account and space |  |  |
| Auto uploads | 1. In `Settings`> `Media upload`, enable `Auto Upload Photos` | Show targets in any account and space | |  |
|**Locations**| Location list not empty |||||
| Cancel | 1. Open the operation list of any item in the list and click on `Move`<br>2. Before submitting, cancel the operation<br>| Location not added to the list of recent locations |  |  |
| New location | 1. Open the operation list of any item in the list and click on `Move`<br>2. Select a new location from the accounts and submit the operation| Location added to the list of recent locations in first position |  |  |
| Existing location | 1. Open the operation list of any item in the list and click on `Move`<br>2. Select an existing location from the accounts (not from the recent locations) and submit the operation | Location reallocated to the list of recent locations to the first position | |  |
| Deep location | 1. Open the operation list of any item in the list and click on `Move`<br>2. Select a location that is in a deep subfolder of the structure<br>3. Submit the operation | Location displayed correctly |  |  |
| Many locations | 1. Perform many copy/move operations (more than 20)<br>2. Open the operation list of any item in the list and click on `Move` | Recent locations section is displayed on the top of the folder picker with the last 10 locations of the operations done in step 1. Check in both orientations |  |  |
| Custom space | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Select a location in a different space and submit the operation | Location with the correct space in list of recent locations | |  |
| To itself | 1. Open the operation list of any folder in the list and click on `Move`<br>2. Select as location the folder itself  | Not allowed |  |  |
| Multiaccount | 1. Add two accounts to the device<br>2. Do some copy/move operations on both accounts | Every account keeps its own list of recent locations |  |  |
|**Upgrade**| 
| Upgrade from previous| 1. Install previous version and add some accounts<br>2. Update to current<br>3. Copy/Move any item | Recent location displayed | |
|**oC10**| 
| oC10 | Copy/Move items in oC10 server | Recent location displayed with no space information |  |