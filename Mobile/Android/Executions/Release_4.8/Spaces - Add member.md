### Add member to Space

**Server(s):** oCIS 7.3.0 <br>
**Device(s):** Xiaomi Redmi Note 13 Android 15, Samsung Galaxy A8 Android 15 <br>
**Execution date:** 21/01/2026<br>
**Tester:** jrecio <br>
**Context:** <br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Space manager | As a space manager, Open `Members` | `+` option available. Check both orientations | P m15 t15| |
| Space editor |  As a space editor, Open `Members` | `+` option not available. Check both orientations | P m15 t15| |
| Space viewer |  As a space viewer, Open `Members` | `+` option not available. Check both orientations | P m15 t15| |
| From manager to editor/viewer | 1. As a space manager, open `Members`<br>2. In web, change the role to editor/viewer<br>3. Reopen `Members` | 1. `+` option available.<br>2. `+` option not available.  | P m15 t15| |
| From editor/viewer to manager | 1. As a space editor/viewer, open `Members`<br>2. In web, change the role to manager<br>3. Reopen `Members` | 1. `+` option not available.<br>2. `+` option available.  | P m15 t15| |
|**Search new member**| Space manager|||
| Header  | Click on `+`<br>| View with header: item name and space quota . Check both orientations | P m15 t15|  |
| Type 1 char  | 1. Click on `+`<br>2. Type 1 character in search field | No results. Check both orientations | P m15 t15|  |
| Type 2 chars | 1. Click on `+`<br>2. Type 2 characters in search field | No results. Check both orientations | P m15 t15|  |
| Remove 3rd char | 1. Click on `+`<br>2. Type 3 characters in search field that match at least a user/group<br>3. Remove one character | No results displayed, required 3 for results. Check both orientations |P m15 t15 | |
| Match users - Admin platform | 1. An admin platform clicks on `+`<br>2. Type at least 3 characters that match an existing username or displayname | User listed as result with username, displayname and mark of user. Check both orientations | P m15 t15 | FIXED: [BUG](https://github.com/owncloud/android/pull/4754#issuecomment-3778299732) |
| Match users - No Admin platform | 1. Any user that is not admin platform clicks on `+`<br>2. Type at least 3 characters that match an existing username or displayname | User listed as result with displayname and mark of user. Check both orientations | P m15 t15|  |
| Match groups  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name | Group listed as result with group name and mark of group. Check both orientations | P m15 t15 |  |
| Mixed match  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name, username or display name | Every match listed as result with username, displayname and mark of user, or group name and mark of group. Check both orientations | P m15 t15 |  |
| Match existing users  | 1. Click on `+`<br>2. Type characters in search field that match at least a user that is already a member of the space | User not listed as result. Check both orientations | P m15 t15|  |
| Match existing groups  | 1. Click on `+`<br>2. Type characters in search field that match at least a group that is already a member of the space | Group not listed as result. Check both orientations | P m15 t15|  |
| Special chars | 1. Click on `+`<br>2. Type special characters in search field like `?` or `$`| No results. Check both orientations | P m15 t15 | FIXED: [BUG](https://github.com/owncloud/android/pull/4754#issuecomment-3778309880) |
| No results  | 1. Click on `+`<br>2. Type characters that don't match with any existing group or user | `No results` displayed. Check both orientations | P m15 t15 | FIXED: [BUG](https://github.com/owncloud/android/pull/4754#issuecomment-3778392254) |  |
| Long result  | 1. Click on `+`<br>2. Type characters that match with a existing group or user whose name is very long (more that 50 chars) | Name ellipsized. Check both orientations  | P m15 t15 |  |
| Long list | 1. Click on `+`<br>2. Type characters that match a long list of results (at least 30) | Long list displayed and scrolled smoothly. Check both orientations  | P m15 t15|  |
| Typing | 1. Click on `+`<br>2. Type and remove characters quickly | Result list updates after every character with the matches in a smooth way with correct transitions | P m15 t15 | FIXED: [IMPVMT](https://github.com/owncloud/android/pull/4754#issuecomment-3783157085) FIXED: [[BUG]](https://github.com/owncloud/android/pull/4754#issuecomment-3789875850)
|**Select member**| Space manager |||
| Member selection | Click over user or group in results view | Member setup view displayed | | |
|**Set up member**| Member already selected |||
| Header  | | View with header: member, item name and space quota . Check both orientations |  |  |
| No permission  | Try to submit the member with no permission selected | Not posible, button disabled |  |
| Can View  | 1. Select `Can View`<br>2. Click on `Add` | Member added and listed with `Can View`. Check in web |  |
| Can Edit  | 1. Select `Can Edit`<br>2. Click on `Add` | Member added and listed with `Can Edit`. Check in web |  |
| Can Manage  | 1. Select `Can Manage`<br>2. Click on `Add` | Member added and listed with `Can manage`. Check in web |  |
| Add expiration date  | 1. Select any permission level<br>2. Open expiration date picker and choose a valid date<br>3.  Click on `Add` | Member added and listed with the chosen permission and the correct expiration date. Check in web |  |
|**Errors**|  |
| No permissions | 1. Space manager opens `Members`<br>2. Click on `+` and search for members<br>3. Select a member and give new permission<br>4. Before submitting, manager is downgraded to editor/viewer<br>5. Click on `Invite` | Permissions error|
| No connection - Members search | 1. Open `Members`<br>2. Click on `+`<br>3. Remove connection from device<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results | P m15 t15
| No connection - Members invitation | 1. Open `Members`<br>2. Click on `+`<br>3. Search and choose a member<br>4. In invite view, remove connection from device<br>5. Select a permission and click on `Invite` | Error `connecting to the server` |
| Server down - Members search | 1. Open `Members`<br>2. Click on `+`<br>3. Switch server off<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results | P m15 t15
| Server down - Members invitation | 1. Open `Members`<br>2. Click on `+`<br>3. Switch server off<br>4. In invite view, remove connection from device<br>5. Select a permission and click on `Invite` | Error `connecting to the server` |
| Existing member | 1. In app, search for a new member and select a permission without submitting<br>2. In web, add the same user as a member <br>3. Submit invitation in app | Error `add grant: error: already exists` (by server)|
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` and `Add Member` views | Every field in the dialog is correctly spelt  |  |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` and `Add Member` views | Every field in the view is selected and no dead paths in navigation  | F m15  | NOT FIXED: [BUG](https://github.com/owncloud/android/pull/4754#issuecomment-3783304368). Dependency from customization layer |  |