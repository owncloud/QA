###  Spaces - Edit

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list**| **Admin or Space admin user**|
| Edit option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Edit space` option is listed | |  |  |
| Edit space name |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Change space name<br>5. Click on `Save` | Space is edited with the new name (check also in web).<br>Snackbar with `Space updated correctly` | |  |  |
| Edit space subtitle |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Change space subtitle<br>5. Click on `Save` | Space is edited with the new subtitle (check also in web).<br>Snackbar with `Space updated correctly` | |  |  |
| Edit space quota |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Change space quota value<br>5. Click on `Save`<br>6. Repeat with different quota values | Space is edited with the new quota value (check also in web).<br>Snackbar with `Space updated correctly` | |  |  |
| Edit all together |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Change name, subtitle, and space quota value<br>5. Click on `Save`<br>6. Repeat with different quota values | Space is edited with new values of name, subtitle and quota (check also in web).<br>Snackbar with `Space updated correctly` | |  |  |
| Empty name |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Empty the space name| `Save` is disabled because no name.<br> `Space name must not be empty` | |  | 
| Long name | 1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Change the name for another name longer than 255 chars | `Save` is disabled because title overflows. `Space name must not be `<br>`longer than 255 characters` | |  | 
| Forbidden characters | 1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit space`<br>4. Change the name for another one that includes any of the following characters: `/ \ . : ? * " > < \|'` | `Save` is disabled because forbidden characters.<br>`Forbidden characters`  | |  |
| Cancel option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Modify the name, subtitle and quota<br> 4. Click on `Cancel` | Space is not edited (check also in web)| |  |  |
|**Spaces list**| **Regular user or user light**|
| Space Manager |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Edit space` option is listed | |  |  |
| Space Editor or viewer |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Edit space` option is not listed | |  |  |
|**Role change**| |
| Add admin permission  | 1. Open `Spaces` of regular user with no `manager` permission over a space<br>2. In admin account, grant admin permissions to the user<br>3. Click on the 3-dot-button of any space<br>| 1. `Edit space`not available in the 3-dot-menu of the space <br>3. `Edit space` available in the 3-dot-menu of the space | |  |  |
| Add space admin permission  | 1. Open `Spaces` of regular user with no `manager` permission over a space<br>2. In admin account, grant space admin permissions to the user<br>3. Click on the 3-dot-button of any space<br>| 1. `Edit space`not available in the 3-dot-menu of the space <br>3. `Edit space` available in the 3-dot-menu of the space | |  |  |
| Add manager permission  | 1. Open `Spaces` of regular user with no `manager` permission over an specific space<br>2. An space admin grants `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space<br>| 1. `Edit space` not available in the 3-dot-menu of the space <br>3. `Edit space` available in the 3-dot-menu of the space | |  |  |
| Remove admin/space admin permission  | 1. Open `Spaces` of admin/space admin user<br>2. In admin account, revoke admin/space admin permissions to the user<br>3. Reopen the app and Open `Spaces`| 1. `Edit space` available in the 3-dot-menu of the space<br>2. `Edit space` not available in the 3-dot-menu of the space | |  |  |
| Remove manager permission  | 1. Open `Spaces` of manager of the space, who is not admin or space admin<br>2. An space admin revokes `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space| 1. `Edit space` available in the 3-dot-menu of the space<br>2. `Edit space` not available in the 3-dot-menu of the space | |  |  |
| Remove manager permission II | 1. Open `Spaces` of manager of the space, who is admin or space admin<br>2. An space admin revokes `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space| 1. `Edit space` available in the 3-dot-menu of the space<br>2. `Edit space` available in the 3-dot-menu of the space | |  |  |
|**Errors**|  |
| No connection  | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over a space with admin/manager permissions | `Edit space` hidden, not possible to check availability with no connection | |  |  |
|**Accesibility**|  |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Edit Space` dialog | Every field in the dialog is correctly spelt  | |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Edit Space` dialog | Every field in the dialog is selected and no dead paths in navigation  |  |  |  |