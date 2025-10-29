###  Spaces - Disable, Enable, Delete

**Server(s)**: oCIS 7.3.0<br>
**Device(s)**: Xiaomi Redmi 13 Android 15, Galaxy Tab A8 Android 15<br>
**Execution date**: 29/10/2025<br>
**Tester**: jrecio<br>
**Context**: Space management<br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list**| **Space manager**|
| Disable option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Disable space` option is listed | P m15 t15 |  |  |
| Disable space |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Disable space`<br>4. Confirm the operation | Space is listed as disabled (check in web) | P m15 t15|  |  |
| Enable space |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on a disabled space<br>3. Click on `Enable space`<br>4. Confirm the operation | Space is listed (check in web) | P m15 t15|  |  |
| Delete space |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on a disabled space<br>3. Click on `Delete space`<br>4. Confirm the operation | Space is not listed anymore (check in web) | P m15 t15|  |  |
|**Spaces list**| **Space editor or viewer**|
| Admin or Space admin |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Disable space` option is listed | P m15 t15 |  |  |
| User or User light |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Disable space` option is not listed | P m15 t5| [BUG](https://github.com/owncloud/android/pull/4696#issuecomment-3460266299) won't fix |  |
|**Role change**| One device |
| Add manager permission  | 1. Open `Spaces` of regular user with no `manager` permission over a space<br>2. In admin account, grant space admin permissions to the user on that space<br>3. Reopen the app<br>4. Click on the 3-dot-button of the space<br>| 1. `Disable space` not available in the 3-dot-menu of the space<br>4. `Disable space` available in the 3-dot-menu of the space (check in web)   | P m15 |  |  |
| Revoke manager permission  | 1. Open `Spaces` of regular user with `manager` permission over a space<br>2. An space admin revokes `manager` permissions on that space to the user<br>3. Reopen the app<br>4. Click on the 3-dot-button of the space| 1. `Disable space` available in the 3-dot-menu of the space<br>4. `Disable space` not available in the 3-dot-menu of the space| P m15 |  |  |
| Permission error I | 1. An space manager opens 3-dot-button over an enabled space<br>2. Before any operation, another space manager revokes `manager` permission and turns it to `viewer`<br>3. Click on `Disable`| Error in snackbar `Space not updated`<br>` because permission error`. Space not disabled (check in web)| P m15 | `it was not found`. Server returns 404 instead 401|  |
| Permission error II | 1. An space manager opens 3-dot-button over a disabled space<br>2. Before any operation, another space manager revokes `manager` permission and turns it to `viewer`<br>3. Click on `Enable`| Error in snackbar `Space not updated`<br>` because permission error`. Space not enabled (check in web)| P m15 | `it was not found`. Server returns 404 instead 401 |  |
| Permission error III | 1. An space manager opens 3-dot-button over a disabled space<br>2. Before any operation, another space manager revokes `manager` permission and turns it to `viewer`<br>3. Click on `Delete`| Error in snackbar `Space not updated`<br>` because permission error`. Space not deleted, still disabled (check in web)| P m15 | `it was not found`. Server returns 404 instead 401 |  |
|**Errors**| One device |
| No connection I | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over an enabled space with manager permissions | `Disable space` hidden, not possible to check availability with no connection | P m15 |  |  |
| No connection II | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over an enabled space with `manager` permission<br>3. Click on `Disable space`<br>4. Remove connection from device<br>5. Submit | `Error while connecting`<br>`to the server`| P m15 |  |  |
| No connection III | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over a disabled space with `manager` permission<br>3. Click on `Enable space`<br>4. Remove connection from device<br>5. Submit | `Error while connecting`<br>`to the server`| P m15 |  |  |
| No connection IV | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over a disabled space with `manager` permission<br>3. Click on `Delete space`<br>4. Remove connection from device<br>5. Submit | `Error while connecting`<br>`to the server`|  P m15 |  |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Disable Space`/`Enable Space`/`Delete Space` dialog | Every field in the dialog is correctly spelt  | P m15 |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Disable Space`/`Enable Space`/`Delete Space` dialog | Every field in the dialog is selected and no dead paths in navigation  | P t15 |  |  |