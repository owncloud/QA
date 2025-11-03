###  Spaces - Edit image

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces list**| **Space manager**|
| Edit image option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Edit image` option is listed | |  |  |
| Edit image - jpg |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit image`<br>4. Choose a .jpg image | Space is edited with the new image (check also in web).<br>Snackbar with `Space image updated correctly` | |  |  |
| Edit image - jpeg |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit image`<br>4. Choose a .jpeg image | Space is edited with the new image (check also in web).<br>Snackbar with `Space image updated correctly` | |  |  |
| Edit image - png |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit image`<br>4. Choose a .png image | Space is edited with the new image (check also in web).<br>Snackbar with `Space image updated correctly` | |  |  |
| Edit image - bmp |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit image`<br>4. Choose a .bmp image | Space is edited with the new image (check also in web).<br>Snackbar with `Space image updated correctly` | |  |  |
| Edit image - gif |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit image`<br>4. Choose a .gif image | Space is edited with the new image (check also in web).<br>Snackbar with `Space image updated correctly` | |  |  |
| Edit image - other formats |   1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space<br>3. Click on `Edit image`<br>4. Try to choose a .heic, .ico, .svg or .webp images | Not posible | |  |  |
|**Spaces list**| **Space viewer / editor**|
| Edit image option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Edit image` option is not listed | |  |  |
| Spaces with different permission | 1. User has two spaces, one with manager permission and other with no manager pemission<br>2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the first space<br>4. Click on the 3-dot-button on the second space |3. `Edit image` option is listed<br> 4. `Edit image` option is not listed |  |  |  |
|**Role change**| |
| Add admin/space admin permission | 1. Open `Spaces` of regular user with no `manager` permission over a space<br>2. In admin account, grant admin/space admin permissions to the user<br>3. Reopen the app and click on the 3-dot-button of any space<br>| 1. `Edit image` not available in the 3-dot-menu of the space <br>3. `Edit image` not available in the 3-dot-menu of the space | |  |  |
| Revoke admin/space admin permission  | 1. Open `Spaces` of admin/space admin user that is `manager` in the space<br>2. In admin account, revoke admin/space admin permissions to the user<br>3. Reopen the app and click on the 3-dot-button of any space| 1. `Edit image` available in the 3-dot-menu of the space<br>3. `Edit image` available in the 3-dot-menu of the space | |  |  |
| Add manager permission  | 1. Open `Spaces` of regular user with no `manager` permission over an specific space<br>2. An space `manager` grants `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space<br>| 1. `Edit image` not available in the 3-dot-menu of the space <br>3. `Edit image` available in the 3-dot-menu of the space | |  |  |
| Revoke manager permission  | 1. Open `Spaces` of manager of the space<br>2. An space `manager` revokes `manager` permissions on that space to the user<br>3. Click on the 3-dot-button of the space| 1. `Edit image` available in the 3-dot-menu of the space<br>2. `Edit image` not available in the 3-dot-menu of the space | |  |  |
| Permission error | 1. Open `Spaces` of `manager` of one space<br>2. Without closig the app, click on 3-dot-button of the space<br>3. Another space `manager` revokes `manager` permission and turns it to `viewer`<br>4. Click on `Edit image`<br>5. Choose image and submit| Error in snackbar `Space not updated`<br>` because permission error`. Space not updated (check in web)|  |  |  |
|**Errors**|  |
| No connection  | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over a space with admin/manager permissions | `Edit space` hidden, not possible to check availability with no connection | |  |  |
| No connection II | 1. Click on `Spaces` on the bottom bar<br>2. Click on 3-dot-button over a space with `manager` permissions<br>3. Click on `Edit image`<br>4. Remove connection from device<br>5. Choose image and submit | Uploads view shows the file as pending |  |  |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Edit Image` dialog | Every field in the dialog is correctly spelt  | |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Edit Image` dialog | Every field in the dialog is selected and no dead paths in navigation  |  |  |  |