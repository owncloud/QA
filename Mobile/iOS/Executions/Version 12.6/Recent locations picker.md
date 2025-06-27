### Recent locations picker


**Server(s)**: oCIS 7.1.2<br>
**Device(s)**: iPhone XR v18.4, iPadAir v18.4<br>
**Execution date**: 09/06/2025<br>
**Tester**: jrecio<br>
**Context**:  <br>


| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
|**View**||||||
| Fresh install | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Click on `Choose destination directory...` | Recent locations section is NOT displayed on the top of the folder picker. Check in both orientations | P m18 t18|  |
| One location | 1. Perform a copy operation over any item and account<br>2. Open the operation list of any item in the list and click on `Copy`<br>3. Click on `Choose destination directory...` | Recent locations section is displayed on the top of the folder picker with the location of the operation in step 1. Check in both orientations | P m18 t18|  |
| Cell | 1. Perform a copy operation over any item and account<br>2. Open the operation list of any item in the list and click on `Copy` | The cell should show: <br>- Icon<br>- Folder name<br>- Space (if oCIS)<br>- Display name | P m18 t18 | FIXED: [BUG](https://github.com/owncloud/ios-app/pull/1467#issuecomment-2955692861)<br> [BUG](https://github.com/owncloud/ios-app/pull/1467#issuecomment-2955704542) |
|**Sources**| Location list not empty |||||
| Copy | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Click on `Choose destination directory...` | Recent locations displayed  | P m18 t18|  |
| Move | 1. Open the operation list of any item in the list and click on `Move`| Recent locations displayed  | P m18 t18| FIXED: [BUG](https://github.com/owncloud/ios-app/pull/1467#issuecomment-2955428253) |
| Share with | 1. Open the `Photos` app and select an item to share with oC | Recent locations displayed  | P m18 t18|  |
| Auto uploads Photos | 1. In `Settings`> `Media upload`, enable `Auto Upload Photos` | Recent locations displayed  | P m18 t18|  |
| Auto uploads Videos | 1. In `Settings`> `Media upload`, enable `Auto Upload Videos` | Recent locations displayed  | P m18 t18|  |
|**Targets**| Location list not empty. At least two accounts added ||||
| Copy | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Click on `Choose destination directory...` | Show only targets in the current account, including spaces | P m18 t18|  |
| Move | 1. Open the operation list of any item in the list and click on `Move`| Show only targets in the current space | P m18 t18 |  |
| Share with | 1. Open the `Photos` app and select an item to share with oC | Show targets in any account and space | P m18 t18 |  |
| Auto uploads | 1. In `Settings`> `Media upload`, enable `Auto Upload Photos` | Show targets in any account and space | P m18 t18|  |
|**Locations**| Location list not empty |||||
| Cancel | 1. Open the operation list of any item in the list and click on `Move`<br>2. Before submitting, cancel the operation<br>| Location not added to the list of recent locations | P m18 t18 |  |
| New location | 1. Open the operation list of any item in the list and click on `Move`<br>2. Select a new location from the accounts and submit the operation| Location added to the list of recent locations in first position | P m18 t18 |  |
| Existing location | 1. Open the operation list of any item in the list and click on `Move`<br>2. Select an existing location from the accounts (not from the recent locations) and submit the operation | Location reallocated to the list of recent locations to the first position | P m18 t18|  |
| Deep location | 1. Open the operation list of any item in the list and click on `Move`<br>2. Select a location that is in a deep subfolder of the structure<br>3. Submit the operation | Location displayed correctly |  P m18 t18|  |
| Many locations | 1. Perform many copy/move operations (more than 20)<br>2. Open the operation list of any item in the list and click on `Move` | Recent locations section is displayed on the top of the folder picker with the last 10 locations of the operations done in step 1. Check in both orientations | P m18 t18 |  |
| Custom space | 1. Open the operation list of any item in the list and click on `Copy`<br>2. Select a location in a different space and submit the operation | Location with the correct space in list of recent locations | P m18 t18|  |
| To itself | 1. Open the operation list of any folder in the list and click on `Move`<br>2. Select as location the folder itself  | Not allowed | P m18 t18 |  |
| Multiaccount | 1. Add two accounts to the device<br>2. Do some copy/move operations on both accounts | Every account keeps its own list of recent locations | P m18 t18 |  |
| Rename target locally | 1. In the app, rename a folder that is the list of location pickers<br>2. Copy any file | The list shows the folder with its new name | NA | WONT FIX: [BUG](https://github.com/owncloud/ios-app/pull/1467#issuecomment-2955460826) |
| Rename target remote | 1. In the web, rename a folder that is the list of location pickers<br>2. Copy any file | The list shows the folder with its new name | NA | WONT FIX: Item not renamed |
| Move target locally| 1. In the app, move a folder that is the list of location pickers to another location<br>2. Copy any file<br>3. In the recent locations, click on the moved one | Shows the new location in the breadcrumb | NA  | WONT FIX [BUG](https://github.com/owncloud/ios-app/pull/1467#issuecomment-2955460826) |
| Move target remote| 1. In the web, move a folder that is the list of location pickers to another location<br>2. Copy any file<br>3. In the recent locations, click on the moved one | Shows the new location in the breadcrumb | NA | Not moved |
| Remove target locally | 1. In the app, remove a folder that is the list of location pickers<br>2. Copy any file | The list does not show the folder in the list of recent locations |  NA | WONT FIX: [BUG](https://github.com/owncloud/ios-app/pull/1467#issuecomment-2955460826) |
| Remove target remote | 1. In the web, remove a folder that is the list of location pickers<br>2. Copy any file | The list does not show the folder in the list of recent locations | NA | WONT FIX: Item not removed |
|**Upgrade**| 
| Upgrade from previous| 1. Install previous version and add some accounts<br>2. Update to current<br>3. Copy/Move any item | Recent location displayed | P m18 |
|**oC10**| 
| oC10 | Copy/Move items in oC10 server | Recent location displayed with no space information | P m18 |