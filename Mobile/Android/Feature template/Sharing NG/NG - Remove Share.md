### Remove share NG

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**||||
| Sharing permission - Personal | Select `Share` of any item with Share `R` permission | trashbin option available in `Share with people`. Check both orientations | | |
| Sharing permission - Custom | Select `Share` of any item in a custom space for a manager | trashbin option available in `Share with people`. Check both orientations | | |
| No Sharing permission - Custom | Select `Share` of any item in a custom space for editor/viewer | trashbin option not available in `Share with people`. Check both orientations | | |
|**Remove share - Personal space**||||
| Remove share - user | 1. Click on the trashbin icon of any shared item with several users<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed user. Snackbar to notify success. Check in web. | | |
| Remove share - group | 1. Click on the trashbin icon of any shared item with several groups<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed group. Snackbar to notify success. Check in web. | | |
| Remove last share  | 1. Click on the trashbin icon of any shared item with one user/group<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares empty `No data shared with users yet`. Snackbar to notify success. Check in web. | | |
| Cancelled deletion | 1. Click on the trashbin icon of any shared item with several users/groups<br>2. Cancel the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares with same users/groups as before. Check in web. | | |
|**Remove share - Custom space**||||
| Remove share - user | 1. Another `Manager` clicks on the trashbin icon of any shared item with several users<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed user. Snackbar to notify success. Check in web. | | |
| Remove share - group | 1. Another `Manager` clicks on the trashbin icon of any shared item with several groups<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares updated without the removed group. Snackbar to notify success. Check in web. | | |
| Remove last share  | 1. Another `Manager` clicks on the trashbin icon of any shared item with one user/group<br>2. Confirm the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares empty `No data shared with users yet`. Snackbar to notify success. Check in web. | | |
| Cancelled deletion | 1. Another `Manager` clicks on the trashbin icon of any shared item with several users/groups<br>2. Cancel the deletion | 1. Dialog to confirm the deletion is displayed<br>2. List of shares with same users/groups as before. Check in web. | | |
|**Errors**|  |
| No permissions | 1. In custom space, space `Manager` opens `Share` on any item<br>2. Click on trashbin<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Share could not be removed`<br>` because permission error`| | |
| No connection | 1. Click on the trashbin icon of any shared item<br>2. Remove connection from device<br>3. Submit the deletion | Error `device is not connected to a network` |
| Server down | 1. Click on the trashbin icon of any shared item<br>2. Switch server down<br>3. Submit the deletion | Error `connecting to the server` | | |
| Already removed share | 1. Click on the trashbin icon of any shared item<br>2. Before submitting, remove the same share from other client (web)<br>3. Submit deletion in app | Dialog closed and list updated without the removed share | | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` view to remove a user/group from the share | Every field is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` to remove a member from the space | Every field is selected and no dead paths in navigation  |  |  |  |