### Sharing NG: Remove link

**Server(s):** oCIS 8.2.1<br>
**Device(s):** Xiaomi Redmi 13, Android 15. Galaxy Tab A68, Android 14<br>
**Execution date:** 12/11/2026<br>
**Tester:** jrecio<br>
**Context:** <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation availability**|||||
| File – user with delete permission | 1. Log in to an oCIS account.<br> 2. Navigate to a file inside a space. <br>3. Open the sharing panel. 4. Ensure the file has at least one public link. | Trashbin icon shown on every link row. Check both orientations. | P m15 t14 | |
| File – user without delete permission | 1. Log in as a user that does not hold `libre.graph/driveItem/permissions/delete` on the file. <br>2. Open the sharing panel on a file with at least one public link. | No trashbin icon on any link row; links are still listed and readable. Check both orientations. | P m15 t14| |
| Folder – user with delete permission | 1. Log in to an oCIS account.<br> 2. Navigate to a folder inside a space.<br> 3. Open the sharing panel. 4. Ensure the folder has at least one public link. | Trashbin icon shown on every link row. | P m15 t14 | |
| Folder – user without delete permission | 1. Log in as a user that does not hold `libre.graph/driveItem/permissions/delete` on the folder.<br> 2. Open the sharing panel on a folder with at least one public link. | No trashbin icon on any link row; links are still listed and readable. | P m15 t14| |
| Permission revoked while panel is open | 1. With delete permission, open the sharing panel on a file or folder with public links.<br> 2. From the web, revoke `libre.graph/driveItem/permissions/delete` from the user.<br> 3. Pull to refresh. | Trashbin icons disappear from all link rows; links remain listed. |P m15 t14 | |
|**Delete link**| Space manager|||
| Delete one link | 1. As a space manager, open `Members` on a space with more than one link<br>2. Click on the trashbin icon of any link<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of links updated without the removed link. Snackbar to notify success. Check in web. | P m15 t14 | |
| Delete all links | 1. As a space manager, open `Members` on a space with one link<br>2. Click on the trashbin icon of the link<br>3. Confirm the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of links empty. Snackbar to notify success. Check in web. |P m15 t14  | |
| Cancelled deletion | 1. As a space manager, open `Members` on a space with at least one link<br>2. Click on the trashbin icon of any link<br>3. Cancel the deletion | 2. Dialog to confirm the deletion is displayed<br>3. List of members with same links as before 2. Check in web. | P m15 t14 | |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Submit the deletion | Error `Link could not be removed`<br>` because permission error`| P m15  t14| |
| No connection | 1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Remove connection from device<br>4. Submit the deletion | Error `device is not connected to a network` | P m15 t14 | | 
| Server down | 1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Switch server off<br>4. Submit deletion | Error `connecting to the server` | P m15 t14 | |
| Already removed link |  1. Space manager opens `Members`<br>2. Click on trashbin of any link<br>3. Before submitting, remove the same link from other client (web)<br>4. Submit deletion in app | Error `was not found` | P m15 t14 | |
|**Regression**|  |
| Regression – space link removal still works | 1. As a space manager, open the `Members` panel of a space with at least one public link.<br> 2. Tap the trashbin icon on a link.<br> 3. Confirm. | Dialog opens, deletion succeeds, success snackbar shown, link disappears from the list. Check in web. | P m15 t14| |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` view to remove a link from the space | Every field is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` to remove a link from the space | Every field is selected and no dead paths in navigation  | P m15 |  |  |