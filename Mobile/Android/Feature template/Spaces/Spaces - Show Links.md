###  Spaces - Show Links

**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Link list**| **No role dependency** |
| Links option |  1. Click on `Spaces` on the bottom bar<br>2. Click on the 3-dot-button on the space | `Members` option is listed |  |  |  |
| No links | 1. Use a space with no links<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Link section empty with the warning `Anyone with the link has access` and the message `No public links created`. Check in both orientations |  |  |  |
| Space with members and links | 1. Use a space with both members and links created in the web<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Lists of members and links are correct with proper roles and expiration dates (check in web and both orientations)  |  |  |  |
| Long link name | 1. Use a space with one link which name is very long<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Long link name is displayed and ellipsized (check in web and both orientations) |  |  |  |
| Expiration date | 1. Use a space with a link that has an expiration date<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | Link is listed with the correct expiration date (check in web and both orientations)  |  |  |  |
| Long list - different roles | 1. Use a space with 50 links (different permissions) and expiration dates<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` | List of links is correct with proper roles and expiration dates (check in web and both orientations). Correct scrolling. |  |  |  |
| Copy link | 1. Use a space with some links<br> 2. Click on `Spaces` on the bottom bar<br>3. Click on the 3-dot-button on the space and select `Members` <br>4. Copy on the chain icon of any link<br>5. Paste it in the browser | Copied link works and points to the right space |  |  |  |
|**External changes**|  |
| Add link | 1. Open `Members` in the app<br>2. In web, add a new link to the space | New link added to the list after reopening the view. Newest link on the top.|  |  |  |
| Edit link name | 1. Open `Members` in the app<br>2. In web, change the name of a link | New link name listed after reopening the view |  |  |  |
| Edit link permission | 1. Open `Members` in the app<br>2. In web, edit an existing link changing the permission | Link permission changed after reopening the view  |  |  |  |
| Edit expiration date I | 1. Open `Members` in the app<br>2. In web, edit an existing link without expiration date, adding a expiration date | Link's expiration date added after reopening the view |  |  |  |
| Edit expiration date II | 1. Open `Members` in the app<br>2. In web, edit an existing link with expiration date, changing the expiration date | Link's expiration date changed after reopening the view |  |  |  |
| Edit expiration date III | 1. Open `Members` in the app<br>2. In web, edit an existing link with expiration date, removing the expiration date | Link's expiration date removed after reopening the view |  |  |  |
| Remove link | 1. Open `Members` in the app<br>2. In web, remove an existing link from the space | Link removed from the list after reopening the view|  |  |  |
| Remove all links | 1. Open `Members` in the app<br>2. In web, remove all existing link from the space | All links removed from the list after reopening the view, showing<br> `No public links created`|  |  |  |
|**Errors**|  |
| No connection | 1. Remove connection from device<br>2. Click on `Spaces` on the bottom bar<br>3. Click on 3-dot-button over a space | `Members` hidden, not possible to check availability with no connection |  |  |  |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Links` section | Every field in the dialog is correctly spelt  | |  |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Links` section | Every field in the dialog is selected and no dead paths in navigation  |  |  |  |