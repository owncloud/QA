### Edit member in Space

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Space manager (1 manager) | As a space manager, Open `Members` | Edit (pencil) option not available. Check both orientations | | |
| Space manager (+1 manager) | As a space manager, open `Members` of a space with several members and more than 1 manager| Edit (pencil) in every row. Check both orientations | | |
| Remove penultimate manager | 1. As a space manager, open `Members` of a space with three managers<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with Edit (pencil) icon<br>3. The remaining manager with no Edit (pencil) icon because is the only one in the space | | |
| Remove penultimate manager - expiration | 1. As a space manager, open `Members` of a space with three managers with expiration dates<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with Edit (pencil) icon and expiration dates<br>3. The remaining manager with no Edit (pencil) icon and no expiration date because it is the only one in the space | | As a server check |
| Add more managers | 1. As a space manager, open `Members` of a space with one manager<br>2. Add one manager<br>3. Add another manager | 1. Manager without Edit (pencil) icon<br>2. Both Managers with Edit (pencil) icon<br>3. All Managers with Edit (pencil) icon | | |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer<br>3. Reopen `Members` | 1. Edit (pencil) option available.<br>2. Edit (pencil) option not available.  | | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager<br>3. Reopen `Members` | 1. Edit (pencil) option not available.<br>2. Edit (pencil) option available.  | | |
| Space editor |  As a space editor, Open `Members` | Edit (pencil) option not available. Check both orientations | | |
| Space viewer |  As a space viewer, Open `Members` | Edit (pencil) option not available. Check both orientations | | |
|**Edit member**| Space manager|||
| Header | Click on Edit (pencil)| View with header: item name and space quota . Check both orientations |  |  |
| Can view | 1. On a member with `Can manage`, click on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Member has now `Can view` in the members list. Snackbar with correct edition displayed. Check in web |  |  |
| Can edit | 1. On a member with `Can manage`, click on Edit (pencil)<br>2. Change permission to `Can edit`<br>3. Click on `Edit` | Member has now `Can edit` in the members list. Snackbar with correct edition displayed. Check in web |  |  |
| Can manage | 1. On a member with `Can edit`, click on Edit (pencil)<br>2. Change permission to `Can manage`<br>3. Click on `Edit` | Member has now `Can manage` in members the list. Snackbar with correct edition displayed. Check in web |  |  |
| No permission | Try to edit a member by removing permission | Not possible |  |
| Add expiration date  | 1. Click on Edit (pencil) on any member without expiration date<br>2. Set an expiration date for the member<br>3. Click on `Edit` | Member has now an expiration date in the members list. Snackbar with correct edition displayed. Check in web|  |
| Edit expiration date  | 1. Click on Edit (pencil) on any member with expiration date<br>2. Set a different expiration date for the member<br>3. Click on `Edit` | Member has the right expiration date in the members list. Snackbar with correct edition displayed. Check in web|  |
| Remove expiration date  | 1. Click on Edit (pencil) on any member with expiration date<br>2. Remove the expiration date for the member<br>3. Click on `Edit` | Member has now no expiration date in the members list. Snackbar with correct edition displayed. Check in web|  |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on Edit (pencil) <br>3. Give new permission<br>4. Before submitting, manager is downgraded to editor/viewer<br>5. Click on `Edit` | Error `Member could not be edited`<br>` because permission error`| | |
| No connection | 1. Open `Members`<br>2. Click on Edit (pencil)<br>3. Remove connection from device<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server`|
| Server down | 1. Open `Members`<br>2. Click on Edit (pencil)<br>3. Switch server off<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server` | | |
| Edit removed member | 1. Open `Members`<br>2. Click on Edit (pencil)<br>3. Remove member from space using other client (web)<br>4. Change permissions<br>5. Click on `Edit` | Error `member removed from space` | | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` and `Edit Member` views | Every field in the dialog is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` and `Edit Member` views | Every field in the view is selected and no dead paths in navigation  |  |  |  |