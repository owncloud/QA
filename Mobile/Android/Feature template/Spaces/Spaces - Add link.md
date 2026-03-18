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
| No permission | Don't select any permission |  `Create` button disabled. Password and expiration date are gone |  |
| Password & Expiration visible  | Select any permission | Password and expiration date are now visible |  |
| Can View  | 1. Select `Can View` as permission<br>2. Generate any password<br>3. Click on `Create ` | Link created and listed with `Can View` permission. Check in web |  |
| Can Edit  | 1. Select `Can Edit` as permission<br>2. Generate password<br>3. Click on `Create ` | Link added and listed with `Can Edit` permission. Check in web |  |
| Secret File Drop  | 1. Select `Secret File Drop` as pemission<br>2. Generate any password<br>3. Click on `Create ` | Link added and listed with `Secret File Drop` permission. Check in web |  |
| Password mandatory | In a [server with mandatory password](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select any permission | Password is now visible and mandatory for every permission level, `Create` is locked until a password is set, password switch is gone and `Set` is displayed |  | |
| Password not mandatory | In a [server with not mandatory password](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select any permission | Password is now visible and not mandatory for every permission level, `Create` is enabled, switch is displayed |  | |
| Password not compliant | 1. In a server with password policy, select any permission<br>2. Enable the password switch or click on `Set`<br>3. Try to add password to the link, that is not compliant with the password policy | `Set` button disabled |  |
| Password not always mandatory I | 1. In a [server with mandatory password for writeable links](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select `Can View`<br>2. Click on `Create` | 1. Password is not mandatory, `Create` is available with no password set<br>2. Link added and listed. Check in web that the link works without password  |  | |
| Password not alyways mandatory II | In a [server with mandatory password for writeable links](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select `Can Edit` | Password is mandatory, `Create` disabled |  | |
| Password not alyways mandatory III | In a [server with mandatory password for writeable links](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select `Secret File Drop` | Password is mandatory, `Create` disabled |  | |
| Password switch permission | 1. In a [server with mandatory password for writeable links](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-writeable-public-links), select `Can View`<br> 2. Select `Can Edit`<br>3. Select `Secret File Drop`<br>4. Select `Can View` | 1. Password not mandatory, `Create` enabled<br>2. Password mandatory `Create` disabled<br>3. Password mandatory, `Create` disabled<br>4. Password not mandatory, `Create` enabled |  | |
| Password removed I | 1. In a [server with mandatory password](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select any permission<br>2. Click on `Set` and add any password to the link<br>3. Select any permission<br>4. Click on `Remove` to remove the created password | `Create` disabled, `Set` displayed and `****` removed |  |
| Password removed II | 1. In a [server with not mandatory password](https://doc.owncloud.com/ocis/next/deployment/services/s-list/frontend.html#password-enforcement-for-all-public-links), select any permission<br>2. Click on `Set` and add any password to the link<br>3. Select any permission<br>4. Click on `Remove` to remove the created password<br>5. Click on `Create`| 4. `Create` enabled, `Set` displayed and `****` removed<br>5. Link created and listed. Check in web that the link works without password |  |
| Password generated | 1. Select any permission<br>2. Click on `Set` or enable the password switch<br>3. In the password dialog, click on `Generate`<br>4. Click on `Copy`<br>5. Click on `Set`<br>6. Click on `Create` | 5. `Password` set with `****`<br>6. Link added and listed. Check in web that the link works with the generated password, that is copied in the clipboard |  |
| Password custom |  1. Select any permission<br>2. Click on `Set` or enable the password switch<br>3. In the password dialog, type a password that complains the password policy<br>4. Click on `Copy`<br>5. Click on `Set`<br>6. Click on `Create` | 5. `Password` set with `****`<br>6. Link added and listed. Check in web that the link works with the typed password, that is copied in the clipboard |  |
| No password policy | 1. In a server with no password policy, select any permission<br>2. Click on `Set` or enable the password switch<br>3. In the password dialog, add any unsafe password to the link<br>4. Click on `Copy`<br>5. Click on `Set`<br>6. Click on `Create ` | 5. `Password` set with `****`<br>6. Link added and listed. Check in web that the link works with the generated password, that is copied in the clipboard |  |
| Add expiration date | 1. Select any permission level<br>2. Generate password<br>3. Open expiration date picker and choose a valid date<br>4. Click on `Create` |  Link added and listed with the correct expiration date. Check in web |  |
| Remove expiration date | 1. Select any permission level<br>2. Generate password<br>3. Open expiration date picker and choose a valid date<br>4. Switch expiration date off<br>5. Click on `Create` | 3. Expiration date displayed<br>5. Link added and listed with no expiration date. Check in web |  |
| All Fields together | 1. Add a valid name<br>2. Select any permission level<br>3. Generate password<br>4. Open expiration date picker and choose a valid date<br>5. Click on `Create` |  Link added and listed with the correct name, permission, password and expiration date. Check in web that name, permission, password and expiration date are correct |  |
| Permission & No Password (mandatory)| 1. Add a permission to the link<br>2. Don't add a mandatory password |  `Create ` button disabled |  |
| No Permission & No Password (mandatory) | Don't add neither permission nor (mandatory) password | `Create ` button disabled |  |
|**Errors**|  |
| No permissions | 1. Click on `+` on the `Links` section<br>2. Select a permission and a password<br>3. Before submitting, manager is downgraded to editor/viewer<br>4. Click on `Create` | Error `Link could not be created`<br>` because permission error`| | |
| No connection | 1. Click on `+` on `Links` section<br>2. Remove connection from device<br>3. Select a permission and a password<br>4. Click on `Invite`| Error `connecting to the server`<br>No results |
| Server down  | 1. Click on `+` on the `Links` section<br>2. Switch server off<br>3. Select a permission and a password<br>4. Click on `Invite` | Error `connecting to the server`<br>No results | | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Add Link` and `Password` views | Every field in the dialog is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Add Link` and `Password` views | Every field in the view is selected and no dead paths in navigation  |  |  |  |