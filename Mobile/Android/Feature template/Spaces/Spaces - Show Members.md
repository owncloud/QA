###  Spaces - Show members

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Member list**| **No role dependency** |
| Members option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Members` option is listed |  |  |  |
| Just one member | 1. Use a space with one member (manager)<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Manager listed as `Can manage` (check in web and both orientations) |  |  |  |
| Different roles | 1. Use a space with three members (different roles)<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles (check in web and both orientations)  |  |  |  |
| Group | 1. Use a space with a group as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with the group (check in web and both orientations)  |  |  |  |
| Expiration date - user | 1. Use a space with a user who has an expiration date as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Member is listed with the correct expiration date (check in web and both orientations)  |  |  |  |
| Expiration date - group | 1. Use a space with a group who has an expiration date as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Group is listed with the correct expiration date (check in web and both orientations)  |  |  |  |
| Groups & users | 1. Use a space with a users and groups as member<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct including all groups and members (check in web and both orientations)  |  |  |  |
| Long list - different roles | 1. Use a space with 50 members (different roles) and expiration dates<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of members is correct with proper roles and expiration dates (check in web and both orientations)  |  |  |  |
|**External changes**|  |
| Add member | 1. Open `Members` in the app<br>2. In web, add a new member to the space | New member added to the list |  |  |  |
| Edit member I | 1. Open `Members` in the app<br>2. In web, edit an existing member, changing the role and adding expiration date | Member role and expiration edited  |  |  |  |
| Edit member II | 1. Open `Members` in the app<br>2. In web, edit an existing member with expiration date, removing the expiration date | Member's expiration date removed  |  |  |  |
| Edit user name | 1. Open `Members` in the app<br>2. In web, change the display name of a space member | New member name listed |  |  |  |
| Edit group name| 1. Open `Members` in the app<br>2. In web, change the name of a group in the space | New group name listed |  |  |  |
| Remove member | 1. Open `Members` in the app<br>2. In web, remove an existing member from the space | Member removed from the list |  |  |  |
|**Errors**|  |
| No connection | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over a space | `Members` hidden, not possible to check availability with no connection |  |  |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Members` dialog | Every field in the dialog is correctly spelt  | |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Members` dialog | Every field in the dialog is selected and no dead paths in navigation  |  |  |  |