### Add link to Space

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Space manager | As a space manager, Open `Members` | `+` option available for both `Members` and `Links`. Check both orientations | | |
| Space editor |  As a space editor, Open `Members` | `+` option not available for `Members` and `Links`. Check both orientations | | |
| Space viewer |  As a space viewer, Open `Members` | `+` option not available for `Members` and `Links`. Check both orientations | | |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer<br>3. Reopen `Members` | 1. `+` option available for `Members` and `Links`.<br>3. `+` option not available for `Members` and `Links`  | | |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager<br>3. Reopen `Members` | 1. `+` option not available for `Members` and `Links`.<br>3. `+` option available for `Members` and `Links`  | | |
|**Set up link**| Space manager on `Add Link`|||
| Header  | | View with header: member, item name, space quota and permanent link . Check both orientations |  |  |
| Add Name  | 1. Add a name to the link<br>2. Select any permission<br>3. Generate any password<br>4. Click on `Create ` | Link added and listed with the correct name. Check in web |  |
| Add Empty Name  | 1. Let name empty <br>2. Select any permission<br>3. Generate any password<br>4. Click on `Create ` | Link added and listed with `Unnamed Link` name. Check in web |  |
| Add Long Name  | 1. Add a name to the link that exceeds 255 chars| Not posible, input restricted to maximum 255 chars|  |
| Can View  | 1. Select `Can View` as permission<br>2. Generate any password<br>3. Click on `Create ` | Link created and listed with `Can View` permission. Check in web |  |
| Can Edit  | 1. Select `Can Edit` as permission<br>2. Generate password<br>3. Click on `Create ` | Link added and listed with `Can Edit` permission. Check in web |  |
| Secret File Drop  | 1. Select `Secret File Drop` as pemission<br>2. Generate any password<br>3. Click on `Create ` | Link added and listed with `Secret File Drop` permission. Check in web |  |
| Password Generated  | 1. Add password to the link with the generator<br>2. Select any permission<br>3. Click on `Copy`<br>4. Click on `Create ` | Link added and listed. Check in web that the link works with the generated password, that is copied in the clipboard |  |
| Password Set - not compliant  | 1. Add password that is not compliant with the password policy<br>2. Select any permission| `Create` button disabled |  |
| Password Set - compliant  | 1. Add manually a password that is compliant with the password policy<br>2. Select any permission<br>3. Click on `Copy`<br>4. Click on `Create`| Link added and listed. Check in web that the link works with the generated password that is copied in the clipboard |  |
| Add expiration date | 1. Select any permission level<br>2. Generate password<br>3. Open expiration date picker and choose a valid date<br>4. Click on `Create` |  Link added and listed with the correct expiration date. Check in web|  |
| All Fields together | 1. Add a valid name<br>2. Select any permission level<br>3. Generate password<br>4. Open expiration date picker and choose a valid date<br>5. Click on `Create` |  Link added and listed with the correct name, permission, password and expiration date. Check in web|  |
| No permission & Password | 1. Add a password to the link<br>2. Don't select a permission |  `Create ` button disabled |  |
| Permission & No Password | 1. Add a permission to the link<br>2. Don't add a password |  `Create ` button disabled |  |
| No Permission & No Password | Don't add neither permission nor password | `Create ` button disabled |  |
|**Errors**|  |
| No permissions | 1. Click on `+` on the `Links` section<br>2. Select a permission and a password<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Click on `Create` | Error `Link could not be created`<br>` because permission error`| | |
| No connection | 1. Click on `+` on `Links` section<br>2. Remove connection from device<br>3. Select a permission and a password<br>4. Click on `Invite`| Error `connecting to the server`<br>No results |
| Server down  | 1. Click on `+` on the `Links` section<br>2. Switch server off<br>3. Select a permission and a password<br>4. Click on `Invite` | Error `connecting to the server`<br>No results | | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Add Link` view | Every field in the dialog is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Add Link` view | Every field in the view is selected and no dead paths in navigation  |  |  |  |