### Remove link from Space

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**||||
| Space manager | As a manager, open `Members` of a space with several links | Trashbin icon in every link row. Check both orientations | | |
| Space editor |  As a editor, open `Members` of a space with several links | No trashbin icon. Check both orientations | | |
| Space viewer |  As a viewer, open `Members` of a space with several links | No trashbin icon. Check both orientations| | |
| From manager to editor/viewer | 1. As a space manager, open `Members` of a space with several links<br>2. In web, change the role to editor/viewer| 1. Trashbin icon available for  every link<br>2. Trashbin icon not available for any link  | | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members` of a space with several links<br>2. In web, change the role to manager | 1. Trashbin icon not available for any link<br>2. Trashbin icon available for every link  | | |
|**Delete link**| Space manager|||
| Delete one link | 1. As a space manager, open `Members` on a space with more than one link<br>2. Click on the trashbin icon of any link<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of links updated without the removed link. Snackbar to notify success. Check in web. | | |
| Delete all links | 1. As a space manager, open `Members` on a space with one link<br>2. Click on the trashbin icon of the link<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of links empty. Snackbar to notify success. Check in web. | | |
| Cancelled deletion | 1. As a space manager, open `Members` on a space with at least one link<br>2. Click on the trashbin icon of any link<br>3. Cancel the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members with same links as before 2. Check in web. | | |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Link could not be removed`<br>` because permission error`| | |
| No connection | 1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Remove connection from device<br>4. Submit the deletion | Error `device is not connected to a network` |
| Server down | 1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Switch server off<br>4. Submit deletion | Error `connecting to the server` | | |
| Already removed link |  1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Before submitting, remove the same link from other client (web)<br>4. Submit deletion in app | Dialog closed and list updated without the removed member | | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` view to remove a link from the space | Every field is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` to remove a link from the space | Every field is selected and no dead paths in navigation  |  |  |  |