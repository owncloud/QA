###  Spaces - Set icon

**Server(s)**: oCIS 7.3.0<br>
**Device(s)**: Xiaomi Redmi Note 13, Android 15<br>
**Execution date**: 26/11/2025<br>
**Tester**: jrecio<br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list**| **Space manager**|
| Set icon option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Set icon` option is listed | P m15 t15|  |  |
| Set icon |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Set icon`<br>4. Choose any icon from the list | Space is edited with the new icon as image (check also in web).<br>Snackbar with `Space image updated correctly`<br>Upload removed from `Uploads`view | P m15 t15 | [GLITCH](https://github.com/owncloud/android/pull/4708#issuecomment-3581394685) |  |
|**Spaces list**| **Space viewer / editor**|
| Set icon option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Set icon` option is not listed | P m15 t15 |  |  |
| Spaces with different permission | 1. User has two spaces, one with manager permission and other with no manager pemission<br>2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the first space<br>4. Click on the 3-dot-button on the second space |3. `Set icon` option is listed<br> 4. `Set icon` option is not listed | P m15 t15|  |  |
|**Role change**| |
| Add admin/space admin permission | 1. Open `Spaces` of regular user with no `manager` permission over a space<br>2. In admin account, grant admin/space admin permissions to the user<br>3. Reopen the app and click on the 3-dot-button of any space<br>| 1. `Set icon` not available in the 3-dot-menu of the space <br>3. `Set icon` not available in the 3-dot-menu of the space | P m15 t15 |  |  |
| Revoke admin/space admin permission  | 1. Open `Spaces` of admin/space admin user that is `manager` in the space<br>2. In admin account, revoke admin/space admin permissions to the user<br>3. Reopen the app and click on the 3-dot-button of any space| 1. `Set icon` available in the 3-dot-menu of the space<br>3. `Set icon` available in the 3-dot-menu of the space | P m15 t15 |  |  |
| Add manager permission  | 1. Open `Spaces` of regular user with no `manager` permission over an specific space<br>2. An space `manager` grants `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space<br>| 1. `Set icon` not available in the 3-dot-menu of the space <br>3. `Set icon` available in the 3-dot-menu of the space | P m15 t15|  |  |
| Revoke manager permission  | 1. Open `Spaces` of manager of the space<br>2. An space `manager` revokes `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space| 1. `Set icon` available in the 3-dot-menu of the space<br>2. `Set icon` not available in the 3-dot-menu of the space | P m15 t15|  |  |
| Permission error | 1. Open `Spaces` of `manager` of one space<br>2. Without closing the app, click on 3-dot-button of the space<br>3. Another space `manager` revokes `manager` permission and turns it to `viewer`<br>4. Click on `Set icon`<br>5. Choose image and submit| Error in snackbar `Space not updated`<br>` because permission error`. Space not updated (check in web)| P m15 t15|  |  |
|**Errors**|  |
| No connection  | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over a space with admin/manager permissions | `Set icon` hidden, not possible to check availability with no connection | P m15 t15 | |  |
| No connection II | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over a space with `manager` permissions<br>3. Click on `Set icon`<br>4. Remove connection from device<br>5. Choose image and submit, staying at spaces view<br>6. Recover connection | 5. Enqueued in uploads view<br>6. Image updated | P m15 t15 |  |  |
| No connection III | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over a space with `manager` permissions<br>3. Click on `Set icon`<br>4. Remove connection from device<br>5. Choose image and submit<br>6. Browse to other view like uploads view<br>7. Recover connection | Image updated | P m15 t15 |   [Expected](https://github.com/owncloud/android/pull/4708#issuecomment-3582144299) [Check this](https://github.com/owncloud/android/pull/4708#issuecomment-3584989064) |  |
| No connection IV | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over a space with `manager` permissions<br>3. Click on `Set icon`<br>4. Switch server off<br>5. Choose image and submit | Uploads view shows the file as failed<br>Error in snackbar `Image could`<br>` not be updated` | P m15 t15 | |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Set icon` dialog | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Set icon` dialog | Every field in the dialog is selected and no dead paths in navigation  | P m15 |  |  |