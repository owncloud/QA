### Remove member from Space

Server(s): oCIS 7.3.1<br>
Device(s): Xiaomi Readmi Note 13, Android 15<br>
Execution date: 11/02/2026<br>
Tester: jrecio <br>
Context: <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**||||
| Space manager (1 manager) | As a space manager, open `Members` of a space with several members but only 1 manager| Trashbin icon in every row but in the manager row. Check both orientations | P m15 t15| |
| Space manager (+1 manager) | As a space manager, open `Members` of a space with several members and more than 1 manager| Trashbin icon in every row. Check both orientations | P m15 t15 | |
| Remove penultimate manager | 1. As a space manager, open `Members` of a space with three managers<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with trahsbin icon<br>3. The remaining manager with no trashbin icon because is the only one in the space | P m15 t15| |
| Remove penultimate manager - expiration | 1. As a space manager, open `Members` of a space with three managers with expiration dates<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with trahsbin icon and expiration dates<br>3. The remaining manager with no trashbin icon and no expiration date because it is the only one in the space | | [Server issue](https://github.com/owncloud/reva/pull/452) it keeps the expiration date. To check in oCIS 8.0|
| Add more managers | 1. As a space manager, open `Members` of a space with one manager<br>2. Add one manager<br>3. Add another manager | 1. Manager without trashbin icon<br>2. Both Managers with trashbin icon<br>3. All Managers with trashbin icon | P m15 t15| FIXED: [BUG](https://github.com/owncloud/android/pull/4768#issuecomment-3883823744) |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer| 1. Trashbin icon available in every row<br>2. Trahsbin icon not available in any row  |P m15 t15| |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager | 1. Trahsbin icon not available in any row<br>2. Trahsbin icon available in every row  | P m15 t15| |
| Space editor |  As a editor, open `Members` of a space with several members | No trashbin icon. Check both orientations | P m15 t15| |
| Space viewer |  As a viewer, open `Members` of a space with several members | No trashbin icon. Check both orientations| P m15 t15| |
|**Delete member**| Space manager|||
| Delete user | 1. As a space manager, open `Members` on a space with at least, one user as a member<br>2. Click on the trashbin icon of any user<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members updated without the removed user. Snackbar to notify success.  Check in web. | P m15 t15| |
| Delete group | 1. As a space manager, open `Members` on a space with at least, one group as a member<br>2. Click on the trashbin icon of the group<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members updated without the removed group. Snackbar to notify success. Check in web. | P m15 t15| |
| Delete yourself | 1. As a space manager, open `Members` on a space with at least, two managers<br>2. Click on the trashbin icon of yourself<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. Moved to the space list, since user is not member of the space anymore | P m15 t15| |
| Cancelled deletion | 1. As a space manager, open `Members`<br>2. Click on the trashbin icon of any member<br>3. Cancel the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members with same members as before 2. Check in web. | P m15 t15| |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Member could not be removed`<br>` because permission error`| P m15 t15| |
| No connection | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Remove connection from device<br>4. Submit the deletion | Error `device is not connected to a network` | P m15 t15 | | |
| Server down | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Switch server off<br>4. Submit deletion | Error `connecting to the server` | P m15 t15 | |
| Already removed member |  1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Before submitting, remove the same member from other client (web)<br>4. Submit deletion in app | Dialog closed and list updated without the removed member | P m15 t15| Bug in server, it returns 5xx instead of 4xx |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` view to remove a member from the space | Every field is correctly spelt  | P m15 | DONE: [IMPROVEMENT](https://github.com/owncloud/android/pull/4768#issuecomment-3884197634) |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` to remove a member from the space | Every field is selected and no dead paths in navigation  | P m15 |  |  |