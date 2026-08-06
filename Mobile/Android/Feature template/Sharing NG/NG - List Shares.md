### Sharing NG - List shares

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Shares list**|  |
| No shares | Open the share view of an item with no shares | `No data shares with users yet` (check both orientations) |  |  |  |
| One share - user | Open the share view of an item with one existing share that is a user | Only one user in the list with correct icon of user, showing display name and permission (check in web and both orientations) |  |  |  |
| One share - group | Open the share view of an item with one existing share that is a group | Only one group in the list with correct icon of group, showing group name and permission (check in web and both orientations) |  |  |  |
| Long username | Open the share view of an item with one existing share (user) which name is very long | Long username is displayed, ellipsized (check in web and both orientations) |  |  |  |
| Long group name | Open the share view of an item with one existing share (group) which name is very long | Long group name is displayed, ellipsized (check in web and both orientations) |  |  |  |
| File permissions |  Open the share view of any file and compare the available permissions with the availble ones in the web  | Permissions match: `Can view` and `Can edit` by default |  |  |  |
| Folder permissions |  Open the share view of any folder and compare the available permissions with the availble ones in the web  | Permissions match: `Can view`, `Can edit` and `Can edit with trashbin` by default |  |  |  |
| Can view |  Open the share view of any item with `Can view` permission | Permission displayed correctly just below the name (check in web and both orientations)  |  |  |  |
| Can edit |  Open the share view of any item with `Can edit` permission | Permission displayed correctly just below the name (check in web and both orientations)  |  |  |  |
| Can edit with trashbin |  Open the share view of any folder with `Can edit with trashbin` permission | Permission displayed correctly just below the name (check in web and both orientations)  |  |  |  |
| Expiration date - user | Open the share view of an item with an existing share (user) who has an expiration date | Share is listed with the correct expiration date (check in web and both orientations)  |  |  |  |
| Expiration date - group | Open the share view of an item with an existing share (group) that has an expiration date | Share is listed with the correct expiration date (check in web and both orientations)  |  |  |  |
| Groups & users | Open the share view of an item with users and groups as shares | List of shares is correct including all groups and users with proper icons (check in web and both orientations)  |  |  |  |
| Long list - different permissions | Open the share view of an item with 20 shares (different permissions) and expiration dates | List of shares is correct with proper permissions and expiration dates (check in web and both orientations)  |  |  |  |
| Links | Open the share view of an item with shares and links created in the web | List of shares is correct with proper roles and expiration dates (check in web and both orientations)  |  |  |  |
|**External changes**|  |
| Add share | 1. Open the share view of an item<br>2. In web, add a new share to the item<br>3. Pull to refresh | New share added to the list |  |  |  |
| Edit share - permission | 1. Open the share view of an item<br>2. In web, edit an existing share by changing permission<br>3. Pull to refresh | Share shows the new permission |  |  |  |
| Edit share - add expiration | 1. Open the share view of an item without expiration date<br>2. In web, edit the share by adding an expiration date<br>3. Pull to refresh | Share shows the new expiration date |  |  |  |
| Edit share - change expiration | 1. Open the share view of an item with expiration date<br>2. In web, edit the share by changing an expiration date<br>3. Pull to refresh | Share shows the new expiration date |  |  |  |
| Edit share - remove expiration | 1. Open the share view of an item with expiration date<br>2. In web, edit the share by removing the expiration date<br>3. Pull to refresh | Share does not show expiration date |  |  |  |
| Edit user name | 1. Open the share view of an item shared with a user<br>2. In web, change the display name of the user | New share name listed |  |  |  |
| Edit group name | 1. Open the share view of an item shared with a group<br>2. In web, change the display name of the group | New share name listed |  |  |  |
| Remove share | 1. Open the share view of an item shared with several users/groups<br>2. In web, remove an existing share<br>3. Pull to refresh in the app<br>4. In web, remove all existing shares<br>5. Pull to refresh in the app | 3. Share removed from the app<br>5. All shares removed and `No data shares with users yet` displayed |  |  |  |
|**Errors**|  |
| No connection | 1. Remove connection from device<br>2. Open `Share` of any item | `Device not connected to a network` |  |  |  |
| Item or space null | Simulate that item or space are null by changing values in `GraphShareViewModel` | `some data could not be retrieved`<br>Lists are empty |  |  |  |
| Shares not retrieved | Simulate a break in the request by changing in the code the endpoint name | `It was not found`<br>Lists are empty |  |  |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` dialog | Every field in the dialog is correctly spelt  | |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` dialog | Every field in the dialog is selected and no dead paths in navigation  |  |  |  |