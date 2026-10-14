Regression test after refactor done in 

https://github.com/owncloud/android/pull/5002

to check everything is in place

Execution date: 8/10/2026

### Add member


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Space manager | As a space manager, Open `Members` | `+` option available. Check both orientations | P m15 | |
| Space editor |  As a space editor, Open `Members` | `+` option not available. Check both orientations | P m15 | |
| Space viewer |  As a space viewer, Open `Members` | `+` option not available. Check both orientations | P m15 | |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer<br>3. Reopen `Members` | 1. `+` option available.<br>2. `+` option not available.  | P m15 | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager<br>3. Reopen `Members` | 1. `+` option not available.<br>2. `+` option available.  | P m15 | |
|**Search new member**| Space manager|||
| Header  | Click on `+`<br>| View with header: item name and space quota . Check both orientations | P m15 |  |
| Type 1 char  | 1. Click on `+`<br>2. Type 1 character in search field | No results. Check both orientations | P m15 |  |
| Type 2 chars | 1. Click on `+`<br>2. Type 2 characters in search field | No results. Check both orientations | P m15 |  |
| Remove 3rd char | 1. Click on `+`<br>2. Type 3 characters in search field that match at least a user/group<br>3. Remove one character | No results displayed, required 3 for results. Check both orientations | P m15 |  |
| Match users - Admin platform | 1. An admin platform clicks on `+`<br>2. Type at least 3 characters that match an existing username or displayname | User listed as result with username, displayname and mark of user. Check both orientations | P m15 |  |
| Match users - No Admin platform | 1. Any user that is not admin platform clicks on `+`<br>2. Type at least 3 characters that match an existing username or displayname | User listed as result with displayname and mark of user. Check both orientations | P m15 |  |
| Match groups  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name | Group listed as result with group name and mark of group. Check both orientations | P m15 |  |
| Mixed match  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name, username or display name | Every match listed as result with username, displayname and mark of user, or group name and mark of group. Check both orientations | P m15 |  |
| Match existing users  | 1. Click on `+`<br>2. Type characters in search field that match at least a user that is already a member of the space | User not listed as result. Check both orientations | P m15 |  |
| Match existing groups  | 1. Click on `+`<br>2. Type characters in search field that match at least a group that is already a member of the space | Group not listed as result. Check both orientations |  P m15|  |
| No results  | 1. Click on `+`<br>2. Type characters that don't match with any existing group or user | `No results` displayed. Check both orientations  | P m15 |  |
| Long result  | 1. Click on `+`<br>2. Type characters that match with a existing group or user whose name is very long (more that 50 chars) | Name ellipsized. Check both orientations  | P m15 |  |
| Long list | 1. Click on `+`<br>2. Type characters that match a long list of results (at least 30) | Long list displayed and scrolled smoothly. Check both orientations  | P m15 |  |
| Typing | 1. Click on `+`<br>2. Type and remove characters quickly | Result list updates after every character with the matches in a smooth way with correct transitions |P m15
|**Select member**| Space manager |||
| Member selection | Click over user or group in results view | Member setup view displayed | P m15 | |
|**Set up member**| Member already selected |||
| Header  | | View with header: member, item name and space quota . Check both orientations |  P m15|  |
| No permission  | Try to submit the member with no permission selected | Not posible, button disabled | P m15 |
| Can View  | 1. Select `Can View`<br>2. Click on `Invite ` | Member added and listed with `Can View`. Check in web | P m15 |
| Can Edit  | 1. Select `Can Edit`<br>2. Click on `Invite ` | Member added and listed with `Can Edit`. Check in web | P m15 |
| Can Manage  | 1. Select `Can Manage`<br>2. Click on `Invite ` | Member added and listed with `Can manage`. Check in web | P m15 |
| Add expiration date  | 1. Select any permission level<br>2. Open expiration date picker and choose a valid date<br>3.  Click on `Add` | Member added and listed with the chosen permission and the correct expiration date. Check in web | P m15 |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on `+` and search for members<br>3. Select a member and give new permission<br>4. Before submitting, manager is downgraded to editor/viewer<br>5. Click on `Invite` | Error `Member could not be invited`<br>` because permission error`| P m15 | |
| No connection - Members search | 1. Open `Members`<br>2. Click on `+`<br>3. Remove connection from device<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results |P m15
| No connection - Members invitation | 1. Open `Members`<br>2. Click on `+`<br>3. Search and choose a member<br>4. In invite view, remove connection from device<br>5. Select a permission and click on `Invite` | Error `device is not connected to a network`  | P m15| |
| Server down - Members search | 1. Open `Members`<br>2. Click on `+`<br>3. Switch server off<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results |P m15 | |
| Server down - Members invitation | 1. Open `Members`<br>2. Click on `+`<br>3. Switch server off<br>4. In invite view, remove connection from device<br>5. Select a permission and click on `Invite` | Error `connecting to the server` | P m15| |
| Existing member | 1. In app, search for a new member and select a permission without submitting<br>2. In web, add the same user as a member <br>3. Submit invitation in app | Error `is already a space member` | P m15 | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` and `Add Member` views | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` and `Add Member` views | Every field in the view is selected and no dead paths in navigation  | P m15 |  |  |


### Edit member


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Space manager (1 manager) | As a space manager, Open `Members` | Edit (pencil) option not available. Check both orientations | P m15 | |
| Space manager (+1 manager) | As a space manager, open `Members` of a space with several members and more than 1 manager| Edit (pencil) in every row. Check both orientations | P m15 | |
| Remove penultimate manager | 1. As a space manager, open `Members` of a space with three managers<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with Edit (pencil) icon<br>3. The remaining manager with no Edit (pencil) icon because is the only one in the space | P m15 | |
| Add more managers | 1. As a space manager, open `Members` of a space with one manager<br>2. Add one manager<br>3. Add another manager | 1. Manager without Edit (pencil) icon<br>2. Both Managers with Edit (pencil) icon<br>3. All Managers with Edit (pencil) icon | P m15 | |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer<br>3. Reopen `Members` | 1. Edit (pencil) option available.<br>2. Edit (pencil) option not available.  |P m15 | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager<br>3. Reopen `Members` | 1. Edit (pencil) option not available.<br>2. Edit (pencil) option available.  | P m15| |
| Space editor |  As a space editor, Open `Members` | Edit (pencil) option not available. Check both orientations | P m15 | | |
| Space viewer |  As a space viewer, Open `Members` | Edit (pencil) option not available. Check both orientations | P m15 || |
|**Edit member**| Space manager|||
| Header | Click on Edit (pencil)| View with header: item name and space quota . Check both orientations | P m15| |  |
| Can view | 1. On a member with `Can manage`, click on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Member has now `Can view` in the members list. Snackbar with correct edition displayed. Check in web | P m15 |  |
| Can edit | 1. On a member with `Can manage`, click on Edit (pencil)<br>2. Change permission to `Can edit`<br>3. Click on `Edit` | Member has now `Can edit` in the members list. Snackbar with correct edition displayed. Check in web | P m15 |  |
| Can manage | 1. On a member with `Can edit`, click on Edit (pencil)<br>2. Change permission to `Can manage`<br>3. Click on `Edit` | Member has now `Can manage` in members the list. Snackbar with correct edition displayed. Check in web | P m15 |  |
| No permission | Try to edit a member by removing permission | Not possible | P m15 |
| Add expiration date  | 1. Click on Edit (pencil) on any member without expiration date<br>2. Set an expiration date for the member<br>3. Click on `Edit` | Member has now an expiration date in the members list. Snackbar with correct edition displayed. Check in web|P m15  |
| Edit expiration date  | 1. Click on Edit (pencil) on any member with expiration date<br>2. Set a different expiration date for the member<br>3. Click on `Edit` | Member has the right expiration date in the members list. Snackbar with correct edition displayed. Check in web|P m15  |
| Remove expiration date  | 1. Click on Edit (pencil) on any member with expiration date<br>2. Remove the expiration date for the member<br>3. Click on `Edit` | Member has now no expiration date in the members list. Snackbar with correct edition displayed. Check in web| P m15 |
| Cancel edition of expiration date  | 1. Click on Edit (pencil) on any member with expiration date<br>2. Open the date picker<br>3. `Cancel` | Member keeps the same expiration date. Check in web|  P m15 |  |
|**Errors**|  |
| Managers with expiration | As a space manager, open `Members` of a space with three managers<br>2. Add expiration dates to all of them | First and second editions work. The latest manager could not be added an expiration date with error `Permission error` | P m15|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on Edit (pencil) over any member<br>3. Give new permission<br>4. Before submitting, manager is downgraded to editor/viewer<br>5. Click on `Edit` | Error `Member could not be edited`<br>` because permission error`| P m15 | |
| No connection | 1. Open `Members`<br>2. Click on Edit (pencil)<br>3. Remove connection from device<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server`| P m15
| Server down | 1. Open `Members`<br>2. Click on Edit (pencil)<br>3. Switch server off<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server` |  P m15| |
| Edit removed member | 1. Open `Members`<br>2. Click on Edit (pencil)<br>3. Remove member from space using other client (web)<br>4. Change permissions<br>5. Click on `Edit` | Error `member removed from space` |  P m15 | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` and `Edit Member` views | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` and `Edit Member` views | Every field in the view is selected and no dead paths in navigation  | P m15 |  |  |


### Remove member


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**||||
| Space manager (1 manager) | As a space manager, open `Members` of a space with several members but only 1 manager| Trashbin icon in every row but in the manager row. Check both orientations | P m15 | |
| Space manager (+1 manager) | As a space manager, open `Members` of a space with several members and more than 1 manager| Trashbin icon in every row. Check both orientations | P m15 | |
| Remove penultimate manager | 1. As a space manager, open `Members` of a space with three managers<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with trahsbin icon<br>3. The remaining manager with no trashbin icon because is the only one in the space | P m15 | |
| Remove penultimate manager - expiration | 1. As a space manager, open `Members` of a space with three managers with expiration dates<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with trahsbin icon and expiration dates<br>3. The remaining manager with no trashbin icon and no expiration date because it is the only one in the space | P m15 | |
| Add more managers | 1. As a space manager, open `Members` of a space with one manager<br>2. Add one manager<br>3. Add another manager | 1. Manager without trashbin icon<br>2. Both Managers with trashbin icon<br>3. All Managers with trashbin icon |P m15 | |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer| 1. Trashbin icon available in every row<br>2. Trahsbin icon not available in any row  |P m15 | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager | 1. Trahsbin icon not available in any row<br>2. Trahsbin icon available in every row  |P m15 | |
| Space editor |  As a editor, open `Members` of a space with several members | No trashbin icon. Check both orientations |P m15 | |
| Space viewer |  As a viewer, open `Members` of a space with several members | No trashbin icon. Check both orientations| P m15| |
|**Delete member**| Space manager|||
| Delete user | 1. As a space manager, open `Members` on a space with at least, one user as a member<br>2. Click on the trashbin icon of any user<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members updated without the removed user. Snackbar to notify success.  Check in web. |P m15 | |
| Delete group | 1. As a space manager, open `Members` on a space with at least, one group as a member<br>2. Click on the trashbin icon of the group<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members updated without the removed group. Snackbar to notify success. Check in web. | P m15| |
| Delete yourself | 1. As a space manager, open `Members` on a space with at least, two managers<br>2. Click on the trashbin icon of yourself<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. Moved to the space list, since user is not member of the space anymore | P m15| |
| Cancelled deletion | 1. As a space manager, open `Members`<br>2. Click on the trashbin icon of any member<br>3. Cancel the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members with same members as before 2. Check in web. |P m15 | |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Member could not be removed`<br>` because permission error`| P m15| |
| No connection | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Remove connection from device<br>4. Submit the deletion | Error `device is not connected to a network` |P m15
| Server down | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Switch server off<br>4. Submit deletion | Error `connecting to the server` | P m15| |
| Already removed member |  1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Before submitting, remove the same member from other client (web)<br>4. Submit deletion in app | Dialog closed and list updated without the removed member | P m15| |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` view to remove a member from the space | Every field is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` to remove a member from the space | Every field is selected and no dead paths in navigation  | P m15 |  |  |


### Create Share NG

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Sharing permission - Personal | Select `Share` of any item with Share `R` permission | `+` option available in `Share with people`. Check both orientations | P m15| |
| Sharing permission - Custom | Select `Share` of any item in a space manager  | `+` option available in `Share with people`. Check both orientations |P m15 | |
| No Sharing permission - Custom | Select `Share` of any item in a editor/viewer space | `+` option not available in `Share with people`. Check both orientations | P m15| |
|**Search user**| search\_min\_length = 3|||
| Header  | Click on `+`<br>| View with header: item name and size (only files). Check both orientations | P m15 |  |
| Type 1 char  | 1. Click on `+`<br>2. Type 1 character in search field | No results. Check both orientations |  P m15|  |
| Type 2 chars | 1. Click on `+`<br>2. Type 2 characters in search field | No results. Check both orientations | P m15 |  |
| Remove 3rd char | 1. Click on `+`<br>2. Type 3 characters in search field that match at least a user/group<br>3. Remove one character | No results displayed, required 3 for results. Check both orientations |  P m15|  |
| Match users | 1. Click on `+`<br>2. Type at least 3 characters that match an existing username or displayname | User listed as result with displayname, username and mark of user. Check both orientations | P m15 |  |
| Match groups  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name | Group listed as result with group name and mark of group. Check both orientations |  P m15|  |
| Mixed match  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name, username or display name | Every match listed as result with username, displayname and mark of user, or group name and mark of group. Check both orientations | P m15 |  |
| Match user itself  | 1. Click on `+`<br>2. Type characters in search field that match the current user | User not listed as result. Check both orientations | P m15 |  |
| Match existing users  | 1. Click on `+`<br>2. Type characters in search field that match at least a user, the item is already shared with | User not listed as result. Check both orientations |P m15  |  |
| Match existing groups  | 1. Click on `+`<br>2. Type characters in search field that match at least a group, the item is already shared with | Group not listed as result. Check both orientations | P m15 |  |
| Special chars | 1. Click on `+`<br>2. Type special characters in search field like `?` or `$`| No results. Check both orientations | P m15 |  |
| No results  | 1. Click on `+`<br>2. Type characters that don't match with any existing group or user | `No results` displayed. Check both orientations  | P m15  |  |
| Long result  | 1. Click on `+`<br>2. Type characters that match with a existing group or user whose name is very long (more that 50 chars) | Name ellipsized. Check both orientations  | P m15   |  |
| Typing | 1. Click on `+`<br>2. Type and remove characters | Result list updates after every character with the matches in a smooth way with correct transitions | P m15 
| Typing fast | 1. Click on `+`<br>2. Type characters very fast | Request over users and groups are only sent when stopping typing | P m15 
| search\_min\_length | Set up an oCIS server with a different value of `search_min_length`, for example, n<br>2. Type n-1 characters<br>3. Type another character | 2. No search is triggered<br>3. Search is triggered  |P m15 
|**Select member**||||
| Member selection | Click over user or group in results view | Share setup view displayed | P m15| |
|**Set up member**| User already selected |||
| Header  | | View with header: username, item name and size (if file). Check both orientations | P m15 |  |
| No permission  | Try to submit the share with no permission selected | Not posible, button disabled | P m15  |
| Can View  | 1. Select `Can View`<br>2. Click on `Share ` | Share added and listed with `Can View`. Check in web | P m15  |
| Can Edit  | 1. Select `Can Edit`<br>2. Click on `Share ` | Share added and listed with `Can Edit`. Check in web | P m15  |
| Can Edit with Trashbin  | 1. Select `Can Edit with Trashbin` (only folders)<br>2. Click on `Share` | Share added and listed with `Can Edit with Trashbin`. Check in web |P m15   |
| Add expiration date  | 1. Select any permission level<br>2. Open expiration date picker and choose a valid date<br>3.  Click on `Add` | Share added and listed with the chosen permission and the correct expiration date. Check in web |P m15   |
|**Errors**|  |
| No permissions | 1. In a custom space, a space admin open `Share` of any item<br>2. Click on `+` and search for user/group<br>3. Select a user/group and give permission<br>4. Before submitting, the space manager is downgraded to editor/viewer of the space by another manager<br>5. Click on `Share` | Error `Share could not be created`<br>` because permission error`| P m15 | |
| No connection - Share search | 1. Open `Share`<br>2. Click on `+`<br>3. Remove connection from device<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results |P m15 
| No connection - Share submission | 1. Open `Share`<br>2. Click on `+`<br>3. Search and choose a member<br>4. In share view, remove connection from device<br>5. Select a permission and click on `Share` | Error `device is not connected to a network`  | P m15 | |
| Server down - Share search | 1. Open `Share`<br>2. Click on `+`<br>3. Switch server off<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results |P m15  | |
| Server down - Share submission | 1. Open `Share`<br>2. Click on `+`<br>3. Switch server off<br>4. In share view, remove connection from device<br>5. Select a permission and click on `Share` | Error `connecting to the server` | P m15  | |
| Existing share | 1. In app, search for a new user/group and select a permission without submitting<br>2. In web, add the same user/group<br>3. Submit invitation in app | Error `is already a space member` |P m15 | |
|**Accessibility**| One device | P m15 
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` and `Add Share` views | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` and `Add Share` views | Every field in the view is selected and no dead paths in navigation  | P m15 |  |  |


### Edit Share NG

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Sharing permission - Personal | Select `Share` of any item with Share `R` permission | pencil  option available in `Share with people`. Check both orientations | P m15 | |
| Sharing permission - Custom | Select `Share` of any item of a space manager with Share `R` permission | pencil option available in `Share with people`. Check both orientations | P m15 | |
| No Sharing permission - Custom | Select `Share` of any item in a editor/viewer space with Share `R` permission| pencil option not available in `Share with people`. Check both orientations | NA | |
|**Edit member - Personal Space**||||
| Header | Click on Edit (pencil)| View with header: item name, and size  for files (not folders). Check both orientations | P m15 |  |
| Can view | 1. On a file or folder with `Can edit`, click on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can view` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 |  |
| Can edit | 1. On a file or folder with `Can view`, click on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can edit` in the shares list. Snackbar with correct edition displayed. Check in web |  P m15|  |
| Can edit with trashbin | 1. On a folder with `Can edit`, click on Edit (pencil)<br>2. Change permission to `Can edit with trashbin`<br>3. Click on `Edit` | Share has now `Can edit with trashbin` in the shares list. Snackbar with correct edition displayed. Check in web | P m15 |  |
| No permission | Try to edit a share by removing permission | Not possible | P m15 |
| Add expiration date  | 1. Click on Edit (pencil) on any file or folder without expiration date<br>2. Set an expiration date for the share<br>3. Click on `Edit` | Share has now an expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15 |
| Edit expiration date  | 1. Click on Edit (pencil) on any file or folder with expiration date<br>2. Set a different expiration date for the share<br>3. Click on `Edit` | Member has the right expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15 |
| Remove expiration date  | 1. Click on Edit (pencil) on any file or folder with expiration date<br>2. Remove the expiration date for the share<br>3. Click on `Edit` | Share has now no expiration date in the members list. Snackbar with correct edition displayed. Check in web|  P m15|
| Cancel edition of expiration date  | 1. Click on Edit (pencil) on any file or folder with expiration date<br>2. Open the date picker<br>3. `Cancel` | Share keeps the same expiration date. Check in web|  P m15 |  |
|**Edit member - Custom Space**||||
| Manager | An space `Manager` clicks on `Share` of any item in the space list of files| Edit (pencil) is available. Check both orientations | P m15  |  |
| Editor | An space `Editor` clicks on `Share` of any item in the space list of files| Edit (pencil) is not available. Check both orientations |  P m15 |  |
| Viewer | An space `Viewer` clicks on `Share` of any item in the space list of files| Edit (pencil) is not available. Check both orientations | P m15  |  |
| Can view | 1. On a file or folder with `Can edit`, a different `Manager` clicks on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can view` in the shares list. Snackbar with correct edition displayed. Check in web | P m15  |  |
| Can edit | 1. On a file or folder with `Can view`, a different `Manager` clicks on Edit (pencil)<br>2. Change permission to `Can view`<br>3. Click on `Edit` | Share has now `Can edit` in the shares list. Snackbar with correct edition displayed. Check in web | P m15  |  |
| Can edit with trashbin | 1. On a folder with `Can edit`, a different `Manager` clicks on Edit (pencil)<br>2. Change permission to `Can edit with trashbin`<br>3. Click on `Edit` | Share has now `Can edit with trashbin` in the shares list. Snackbar with correct edition displayed. Check in web | P m15  |  |
| Add expiration date  | 1. A different `Manager` clicks on Edit (pencil) on any file or folder without expiration date<br>2. Set an expiration date for the share<br>3. Click on `Edit` | Share has now an expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15  |
| Edit expiration date  | 1. A different `Manager` clicks on Edit (pencil) on any file or folder with expiration date<br>2. Set a different expiration date for the share<br>3. Click on `Edit` | Member has the right expiration date in the shares list. Snackbar with correct edition displayed. Check in web| P m15  |
| Remove expiration date | 1. A different `Manager` clicks on Edit (pencil) on any file or folder with expiration date<br>2. Remove the expiration date for the share<br>3. Click on `Edit` | Share has now no expiration date in the members list. Snackbar with correct edition displayed. Check in web| P m15  |
| Cancel edition of expiration date  | 1. A different `Manager` clicks on Edit (pencil) on any file or folder with expiration date<br>2. Open the date picker<br>3. `Cancel` | Share keeps the same expiration date. Check in web| P m15  |  |
|**Errors**|  |
| No permissions | 1. In a custom space, space manager opens `Share` of any shared item<br>2. Click on Edit (pencil) over any member<br>3. Give new permission<br>4. Before submitting, manager is downgraded to editor/viewer by other `Manager`<br>5. Click on `Edit` | Error `Share could not be edited`<br>` because permission error`| P m15| |
| No connection | 1. Open `Share` of any item<br>2. Click on Edit (pencil)<br>3. Remove connection from device<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server`|P m15
| Server down | 1. Open `Share`<br>2. Click on Edit (pencil)<br>3. Switch server off<br>4. Change permissions<br>5. Click on `Edit` | Error `connecting to the server` | P m15| |
| Edit removed member | 1. Open `Share`<br>2. Click on Edit (pencil)<br>3. Remove share using other client (web)<br>4. In app, change permissions<br>5. Click on `Edit` | Error `share removed from space` | P m15| |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` and `Edit share` views | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` and `Edit share` views | Every field in the view is selected and no dead paths in navigation  | P m15 |  |  |

### Remove share

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**||||
| Sharing permission - Personal | Select `Share` of any item with Share `R` permission | trashbin option available in `Share with people`. Check both orientations | P m15 | |
| Sharing permission - Custom | Select `Share` of any item in a custom space for a manager | trashbin option available in `Share with people`. Check both orientations | P m15 | |
| No Sharing permission - Custom | Select `Share` of any item in a custom space for editor/viewer | trashbin option not available in `Share with people`. Check both orientations | NA |  |
|**Remove share - Personal space**||||
| Remove share - user | 1. Click on the trashbin icon of any shared item with several users<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed user. Snackbar to notify success. Check in web. |P m15 | |
| Remove share - group | 1. Click on the trashbin icon of any shared item with several groups<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed group. Snackbar to notify success. Check in web. | P m15| |
| Remove last share  | 1. Click on the trashbin icon of any shared item with one user/group<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares empty `No data shared with users yet`. Snackbar to notify success. Check in web. | P m15| |
| Cancelled deletion | 1. Click on the trashbin icon of any shared item with several users/groups<br>2. Cancel the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares with same users/groups as before. Check in web. |P m15 | |
|**Remove share - Custom space**||||
| Remove share - user | 1. Another `Manager` clicks on the trashbin icon of any shared item with several users<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed user. Snackbar to notify success. Check in web. | P m15| |
| Remove share - group | 1. Another `Manager` clicks on the trashbin icon of any shared item with several groups<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed group. Snackbar to notify success. Check in web. |P m15 | |
| Remove last share  | 1. Another `Manager` clicks on the trashbin icon of any shared item with one user/group<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares empty `No data shared with users yet`. Snackbar to notify success. Check in web. | P m15| |
| Cancelled deletion | 1. Another `Manager` clicks on the trashbin icon of any shared item with several users/groups<br>2. Cancel the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares with same users/groups as before. Check in web. |P m15 | |
|**Errors**|  |
| No permissions | 1. In custom space, space `Manager` opens `Share` on any item<br>2. Click on trashbin<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Share could not be removed`<br>` because permission error`| P m15| |
| No connection | 1. Click on the trashbin icon of any shared item<br>2. Remove connection from device<br>3. Submit the deletion | Error `device is not connected to a network` |P m15
| Server down | 1. Click on the trashbin icon of any shared item<br>2. Switch server down<br>3. Submit the deletion | Error `connecting to the server` | P m15| |
| Already removed share | 1. Click on the trashbin icon of any shared item<br>2. Before submitting, remove the same share from other client (web)<br>3. Submit deletion in app | Dialog closed and list updated without the removed share |P m15 | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` view to remove a user/group from the share | Every field is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` to remove a member from the space | Every field is selected and no dead paths in navigation  |  P m15|  |  |