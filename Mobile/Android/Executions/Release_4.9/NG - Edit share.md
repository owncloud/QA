### Sharing NG: Edit share

**Server(s):** oCIS 8.2.0<br>
**Device(s):** Xiaomi Redmi 13, Android 15. Samsung Galaxy Tab A8, Android 14<br>
**Execution date:** 28/09/2026<br>
**Tester:** jrecio <br>
**Context:** Sharing NG implementation<br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Sharing permission - Personal | Select `Share` of any item with Share `R` permission | pencil  option available in `Share with people`. Check both orientations | P m15 t14 | |
| Sharing permission - Custom | Select `Share` of any item of a space manager with Share `R` permission | pencil option available in `Share with people`. Check both orientations | P m15 t14| |
| No Sharing permission - Custom | Select `Share` of any item in a editor/viewer space with Share `R` permission| pencil option not available in `Share with people`. Check both orientations | P m15 t14 | Share option not available |
|**Edit member - Personal Space**||||
| Header | Click on Edit (pencil)| View with header: item name, and size for files (not folders). Check both orientations | P m15 t14 |  |
| Can view | 1. On a file or folder with `Can edit`, click on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can view` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 t14 |  |
| Can edit | 1. On a file or folder with `Can view`, click on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can edit` in the shares list. Snackbar with correct edition displayed. Check in web |  P m15 t14|  |
| Can edit with trashbin | 1. On a folder with `Can edit`, click on Edit (pencil)<br>2. Change permission to `Can edit with trashbin`<br>3. Click on `Edit` | Share has now `Can edit with trashbin` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 t14 |  |
| No permission | Try to edit a share by removing permission | Not possible | P m15 t14 |
| Add expiration date  | 1. Click on Edit (pencil) on any file or folder without expiration date<br>2. Set an expiration date for the share<br>3. Click on `Edit` | Share has now an expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15 t14  |
| Edit expiration date  | 1. Click on Edit (pencil) on any file or folder with expiration date<br>2. Set a different expiration date for the share<br>3. Click on `Edit` | Member has the right expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15 t14  |
| Remove expiration date  | 1. Click on Edit (pencil) on any file or folder with expiration date<br>2. Remove the expiration date for the share<br>3. Click on `Edit` | Share has now no expiration date in the members list. Snackbar with correct edition displayed. Check in web| P m15 t14  |
| Cancel edition of expiration date  | 1. Click on Edit (pencil) on any file or folder with expiration date<br>2. Open the date picker<br>3. `Cancel` | Share keeps the same expiration date. Check in web| P m15 t14 |  |
|**Edit member - Custom Space**||||
| Manager | An space `Manager` clicks on `Share` of any item in the space list of files| Edit (pencil) is available. Check both orientations | P m15 t14 |  |
| Editor | An space `Editor` clicks on `Share` of any item in the space list of files| Edit (pencil) is not available. Check both orientations | NA | `Share`option not available at this point |
| Viewer | An space `Viewer` clicks on `Share` of any item in the space list of files| Edit (pencil) is not available. Check both orientations | NA | `Share`option not available at this point |
| Can view | 1. On a file or folder with `Can edit`, a different `Manager` clicks on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can view` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 t14|  |
| Can edit | 1. On a file or folder with `Can view`, a different `Manager` clicks on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can edit` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 t14 |  |
| Can edit with trashbin | 1. On a folder with `Can edit`, a different `Manager` clicks on Edit (pencil)<br>2. Change permission to `Can edit with trashbin`<br>3. Click on `Edit` | Share has now `Can edit with trashbin` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 t14 |  |
| Add expiration date  | 1. A different `Manager` clicks on Edit (pencil) on any file or folder without expiration date<br>2. Set an expiration date for the share<br>3. Click on `Edit` | Share has now an expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15 t14 |
| Edit expiration date  | 1. A different `Manager` clicks on Edit (pencil) on any file or folder with expiration date<br>2. Set a different expiration date for the share<br>3. Click on `Edit` | Member has the right expiration date in the shares list. Snackbar with correct edition displayed. Check in web|  P m15 t14|
| Remove expiration date | 1. A different `Manager` clicks on Edit (pencil) on any file or folder with expiration date<br>2. Remove the expiration date for the share<br>3. Click on `Edit` | Share has now no expiration date in the members list. Snackbar with correct edition displayed. Check in web| P m15 t14 |
| Cancel edition of expiration date  | 1. A different `Manager` clicks on Edit (pencil) on any file or folder with expiration date<br>2. Open the date picker<br>3. `Cancel` | Share keeps the same expiration date. Check in web| P m15 t14 |  |
|**Errors**|  |
| No permissions | 1. In a custom space, space manager opens `Share` of any shared item<br>2. Click on Edit (pencil) over any member<br>3. Give new permission<br>4. Before submitting, manager is downgraded to editor/viewer by other `Manager`<br>5. Click on `Edit` | Error `Share could not be edited`<br>` because permission error`| P m15 t14  | |
| No connection | 1. Open `Share` of any item<br>2. Click on Edit (pencil)<br>3. Remove connection from device<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server`| P m15 t14 
| Server down | 1. Open `Share`<br>2. Click on Edit (pencil)<br>3. Switch server off<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server` | P m15 t14  | |
| Edit removed member | 1. Open `Share`<br>2. Click on Edit (pencil)<br>3. Remove share using other client (web)<br>4. In app, change permissions<br>5. Click on `Edit` | Error `share removed from space` | P m15 t14  | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` and `Edit share` views | Every field in the dialog is correctly spelt  | P m15 | FIXED: [BUG](https://github.com/owncloud/android/pull/4978#issuecomment-5886228956) |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` and `Edit share` views | Every field in the view is selected and no dead paths in navigation  | P m15 | Issue: top bar unreachable, regression |  |