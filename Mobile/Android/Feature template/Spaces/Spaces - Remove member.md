### Remove member from Space

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**||||
| Space manager (1 manager) | As a space manager, open `Members` of a space with several members but only 1 manager| Trashbin icon in every row but in the manager row. Check both orientations | | |
| Space manager (+1 manager) | As a space manager, open `Members` of a space with several members and more than 1 manager| Trashbin icon in every row. Check both orientations | | |
| Remove penultimate manager | 1. As a space manager, open `Members` of a space with three managers<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with trahsbin icon<br>3. The remaining manager with no trashbin icon because is the only one in the space | | |
| Remove penultimate manager - expiration | 1. As a space manager, open `Members` of a space with three managers with expiration dates<br>2. Remove one manager<br>3. Remove another manager | 2. The remaining 2 managers with trahsbin icon and expiration dates<br>3. The remaining manager with no trashbin icon and no expiration date because it is the only one in the space | | |
| Add more managers | 1. As a space manager, open `Members` of a space with one manager<br>2. Add one manager<br>3. Add another manager | 1. Manager without trashbin icon<br>2. Both Managers with trashbin icon<br>3. All Managers with trashbin icon | | |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer<br>3. Reopen `Members` | 1. Trashbin icon available in every row<br>2. Trahsbin icon not available in any row  | | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager<br>3. Reopen `Members` | 1. Trahsbin icon not available in any row<br>2. Trahsbin icon available in every row  | | |
| Space editor |  As a editor, open `Members` of a space with several members | No trashbin icon. Check both orientations | | |
| Space viewer |  As a viewer, open `Members` of a space with several members | No trashbin icon. Check both orientations| | |
|**Delete member**| Space manager|||
| Delete | 1. As a space manager, open `Members`<br>2. Click on the trashbin icon of any member<br>3.  Confirm the deletion | 2. Dialog con confirm the deletion is displayed<br>3. List of members updated without the removed member. Check in web. | | |
| Cancelled deletion | 1. As a space manager, open `Members`<br>2. Click on the trashbin icon of any member<br>3. Cancel the deletion | 2. Dialog con confirm the deletion is displayed<br>3. List of members with same members as before 2. Check in web. | | |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Member could not be removed`<br>` because permission error`| | |
| No connection | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Remove connection from device<br>4. Submit the deletion | Error `device is not connected to a network` |
| Server down | 1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Switch server off<br>4. Submit deletion | Error `connecting to the server` | | |
| Already removed member |  1. Space manager opens `Members`<br>2. Click on trashbin of any member<br>3. Before submitting, remove the same member from other client (web)<br>4. Submit deletion in app | Dialog closed and list updated without the removed member | | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` view to remove a member from the space | Every field is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` to remove a member from the space | Every field is selected and no dead paths in navigation  |  |  |  |