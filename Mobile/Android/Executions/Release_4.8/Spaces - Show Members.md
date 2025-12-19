###  Spaces - Show members

**Server(s)**: oCIS 7.3.0<br>
**Device(s)**: Xiaomi Redmi Note 13, Android 15. Galaxy Tab A8, Android 15<br>
**Execution date**: 17/12/2025<br>
**Tester**: jrecio<br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Member list**| **No role dependency** |
| Members option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Members` option is listed | P m15 t15 |  |  |
| Just one member | 1. Use a space with one member (manager)<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Manager listed as `Can manage` (check in web and both orientations) | P m15 t15 | FIXED [BUG: Crash rotating](https://github.com/owncloud/android/pull/4728#issuecomment-3665283282)  |
| Long username | 1. Use a space with one member (manager) which username is very long<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Long username is displayed, ellipsized (check in web and both orientations) | P m15 t15 | FIXED: [No ellipsized](https://github.com/owncloud/android/pull/4728#issuecomment-3665328610) |  |
| Group | 1. Use a space with a group as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with the group (check in web and both orientations)  | P m15 t15 |  |  |
| Expiration date - user | 1. Use a space with a user who has an expiration date as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Member is listed with the correct expiration date (check in web and both orientations)  | P m15 t15|  |  |
| Expiration date - group | 1. Use a space with a group who has an expiration date as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Group is listed with the correct expiration date (check in web and both orientations)  | P m15 t15 |  |  |
| Groups & users | 1. Use a space with a users and groups as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct including all groups and members (check in web and both orientations)  | P m15 t15|  |  |
| Long list - different roles | 1. Use a space with 50 members (different roles) and expiration dates<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles and expiration dates (check in web and both orientations)  | P m15 t15 |  |  |
| Space with links | 1. Use a space with links created in the web<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles and expiration dates (check in web and both orientations)  | P m15 t15 | FIXED: [BUG](https://github.com/owncloud/android/pull/4728#issuecomment-3669331144) Members not listed |  |
|**Roles**|
| Manager | 1. Use a space with several users and groups, using different roles<br>2. Login with a member with `manager` role<br>3. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles, sorted by role: first managers, the editors, finally viewers  | P m15 t15|  |  |
| Editor | 1. Use a space with several users and groups, using different roles<br>2. Login with a member with `editor` role<br>3. Click on `Spaces` on the bottom bar<br>4. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles, sorted by role: first managers, the editors, finally viewers  | P m15 t15|  |  |
| Viewer | 1. Use a space with several users and groups, using different roles<br>2. Login with a member with `viewer` role<br>3. Click on `Spaces` on the bottom bar<br>4. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles, sorted by role: first managers, the editors, finally viewers  | P m15 t15|  |  |
| Double role | 1. Use a space with several users and groups, using different roles<br>2. Login with a member with `viewer` role that belongs to a group with `manager` role<br>3. Click on `Spaces` on the bottom bar<br>4. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles, sorted by role: first managers, the editors, finally viewers  | P m15 t15 |  |  |
| Triple role | 1. Use a space with several users and groups, using different roles<br>2. Login with a member with `editor` role that belongs to a group with `manager` role, and to a group with `viewer` role<br>3. Click on `Spaces` on the bottom bar<br>4. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles, sorted by role: first managers, the editors, finally viewers  | P m15 t15 |  |  |
|**External changes**|  |
| Add member | 1. Open `Members` in the app<br>2. In web, add a new member to the space | New member added to the list | P m15 t15|  |  |
| Edit member I | 1. Open `Members` in the app<br>2. In web, edit an existing member, changing the role and adding expiration date | Member role and expiration edited  | P m15 t15 |  |  |
| Edit member II | 1. Open `Members` in the app<br>2. In web, edit an existing member with expiration date, removing the expiration date | Member's expiration date removed  | P m15 t15 |  |  |
| Edit user name | 1. Open `Members` in the app<br>2. In web, change the display name of a space member | New member name listed | P m15 t15 | Not immediate, needs a little time |  |
| Edit group name| 1. Open `Members` in the app<br>2. In web, change the name of a group in the space | New group name listed | P m15 t15 |  Not immediate, needs a little time |  |
| Remove member | 1. Open `Members` in the app<br>2. In web, remove an existing member from the space | Member removed from the list | P m15 t15|  |  |
|**Errors**|  |
| No connection | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over a space | `Members` hidden, not possible to check availability with no connection | P m15 t15 |  |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` dialog | Every field in the dialog is correctly spelt  | P m15 | FIXED: [Improvement](https://github.com/owncloud/android/pull/4728#issuecomment-3666126116) |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` dialog | Every field in the dialog is selected and no dead paths in navigation  | NA | Check when list is clickable |  |