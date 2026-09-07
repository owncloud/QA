### Sharing NG: Create Share

Server(s): oCIS 8.2.0<br>
Device(s): Xiaomi Redmi 13, Android 15. Galaxy Tab A8, Android 14 <br>
Execution date: 28/08/2026<br>
Tester:  jrecio<br>
Context: Sharing NG epic<br>

--

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Operation available**||||
| Sharing permission - Personal | Select `Share` of any item with Share `R` permission | `+` option available in `Share with people`. Check both orientations | P m15 t14 | |
| Sharing permission - Custom | Select `Share` of any item in a space manager  | `+` option available in `Share with people`. Check both orientations | P m15 t14| |
| No Sharing permission - Custom | Select `Share` of any item in a editor/viewer space | `+` option not available in `Share with people`. Check both orientations | P m15 t14 | |
|**Search user**| search\_min\_length = 3|||
| Header  | Click on `+`<br>| View with header: item name and size (only files). Check both orientations | P m15 t14|  |
| Type 1 char  | 1. Click on `+`<br>2. Type 1 character in search field | No results. Check both orientations | P m15 t14|  |
| Type 2 chars | 1. Click on `+`<br>2. Type 2 characters in search field | No results. Check both orientations | P m15 t14|  |
| Remove 3rd char | 1. Click on `+`<br>2. Type 3 characters in search field that match at least a user/group<br>3. Remove one character | No results displayed, required 3 for results. Check both orientations | P m15 t14|  |
| Match users | 1. Click on `+`<br>2. Type at least 3 characters that match an existing username or displayname | User listed as result with displayname, username and mark of user. Check both orientations | P m15 t14 |  |
| Match groups  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name | Group listed as result with group name and mark of group. Check both orientations | P m15 t14|  |
| Mixed match  | 1. Click on `+`<br>2. Type at least 3 characters that match an existing group name, username or display name | Every match listed as result with username, displayname and mark of user, or group name and mark of group. Check both orientations | P m15 t14 |  |
| Match user itself  | 1. Click on `+`<br>2. Type characters in search field that match the current user | User not listed as result. Check both orientations | P m15 t14 |  |
| Match existing users  | 1. Click on `+`<br>2. Type characters in search field that match at least a user, the item is already shared with | User not listed as result. Check both orientations | P m15 t14 |  |
| Match existing groups  | 1. Click on `+`<br>2. Type characters in search field that match at least a group, the item is already shared with | Group not listed as result. Check both orientations | P m15 t14 |  |
| Special chars | 1. Click on `+`<br>2. Type special characters in search field like `?` or `$`| No results. Check both orientations | P m15 t14|  |
| No results  | 1. Click on `+`<br>2. Type characters that don't match with any existing group or user | `No results` displayed. Check both orientations  | P m15 t14 |  |
| Long result  | 1. Click on `+`<br>2. Type characters that match with a existing group or user whose name is very long (more that 50 chars) | Name ellipsized. Check both orientations  |  P m15 t14 |  |
| Long list | 1. Click on `+`<br>2. Type characters that match a long list of results (at least 30) | Long list displayed and scrolled smoothly. Check both orientations  | P m15 t14 |  |
| Typing | 1. Click on `+`<br>2. Type and remove characters | Result list updates after every character with the matches in a smooth way with correct transitions | P m15 t14
| Typing fast | 1. Click on `+`<br>2. Type characters very fast | Request over users and groups are only sent when stopping typing | P m15 t14
| search\_min\_length | Set up an oCIS server with a different value of `search_min_length`, for example, n<br>2. Type n-1 characters<br>3. Type another character | 2. No search is triggered<br>3. Search is triggered  | P m15 t14
|**Select member**||||
| Member selection | Click over user or group in results view | Share setup view displayed | P m15 t14 | |
|**Set up member**| User already selected |||
| Header  | | View with header: username, item name and size (if file). Check both orientations | P m15 t14  |  |
| No permission  | Try to submit the share with no permission selected | Not posible, button disabled | P m15 t14  |
| Can View  | 1. Select `Can View`<br>2. Click on `Share ` | Share added and listed with `Can View`. Check in web | P m15 t14  |
| Can Edit  | 1. Select `Can Edit`<br>2. Click on `Share ` | Share added and listed with `Can Edit`. Check in web | P m15 t14  |
| Can Edit with Trashbin  | 1. Select `Can Edit with Trashbin` (only folders)<br>2. Click on `Share` | Share added and listed with `Can Edit with Trashbin`. Check in web | P m15 t14  |
| Add expiration date  | 1. Select any permission level<br>2. Open expiration date picker and choose a valid date<br>3.  Click on `Add` | Share added and listed with the chosen permission and the correct expiration date. Check in web | P m15 t14|
|**Errors**|  |
| No permissions | 1. In a custom space, a space admin open `Share` of any item<br>2. Click on `+` and search for user/group<br>3. Select a user/group and give permission<br>4. Before submitting, the space manager is downgraded to editor/viewer of the space by another manager<br>5. Click on `Share` | Error `Share could not be created`<br>` because permission error`| P m15 t14 | |
| No connection - Share search | 1. Open `Share`<br>2. Click on `+`<br>3. Remove connection from device<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results | P m15 t14
| No connection - Share submission | 1. Open `Share`<br>2. Click on `+`<br>3. Search and choose a member<br>4. In share view, remove connection from device<br>5. Select a permission and click on `Share` | Error `device is not connected to a network`  | P m15 t14| |
| Server down - Share search | 1. Open `Share`<br>2. Click on `+`<br>3. Switch server off<br>4. Type 3 chars in the search field | Error `connecting to the server`<br>No results | P m15 t14 | |
| Server down - Share submission | 1. Open `Share`<br>2. Click on `+`<br>3. Switch server off<br>4. In share view, remove connection from device<br>5. Select a permission and click on `Share` | Error `connecting to the server` | P m15 t14 | |
| Existing share | 1. In app, search for a new user/group and select a permission without submitting<br>2. In web, add the same user/group<br>3. Submit invitation in app | Error `is already a space member` | P m15 t14 | |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` and `Add Share` views | Every field in the dialog is correctly spelt  | F m15 | [BUG](https://github.com/owncloud/android/pull/4952#issuecomment-5511303261) |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` and `Add Share` views | Every field in the view is selected and no dead paths in navigation  | P m15 | Navigation skips header -> open issue |  |