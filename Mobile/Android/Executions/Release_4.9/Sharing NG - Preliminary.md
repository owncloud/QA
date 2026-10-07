### Sharing NG - Preliminary

Server(s): oCIS 8.0.5<br>
Device(s):<br> Xiaomi Redmi 13 - Android 15, Samsung Galaxy Tab A8 - Android 14<br>
Execution date: 22/07/2026<br>
Tester: jrecio<br>
Context: <br>

--

| Title | Steps | Expected result | Result | Comments |
| :---- | :---- | :-------------- | :----: | :------: |
| **Backend** |
| Sharing dialog ownCloud Classic | 1. Log in to an ownCloud Classic account.<br>2. Click on three-dot-button of any item (file/folder)<br>3. Click on `Share` | The existing legacy sharing dialog is opened. Correct in both orientations  | P m15 t15 |  |
| Sharing dialog oCIS | 1. Log in to an oCIS account.<br>2. Click on three-dot-button of any item (file/folder)<br>3. Click on `Share` | The new sharing dialog is opened Correct in both orientations   | P m15 t15|  |
| **Sharing** | Dialog opened |
| Header | Inspect the fragment header. Check in both orientations | `Share` as title and back arrow<br>Thumbnail<br>Item name and size (for files) | P m15 t15 |  |
| Personal | 1. Open the Personal space<br>2. Click on the three-dot-button of a file or folder | `Share` action is available | P m15 t15 |  |
| Custom space with permission| 1. Open the custom space in which user has sharing permission<br>2. Click on the three-dot-button of a file or folder inside the space<br>3. Click on `Share` | `Share` action is available. The new Sharing NG view opens for the selected item. | P m15 t15 |  |
| Custom space without permission| 1. Open the custom space in which user does not have sharing permission<br>2. Click on the three-dot-button of a file or folder inside the space. | `Share` action is not available.  | P m15 t15 |  |
| Badge in list of files (oCIS) | 1. In oCIS web client, share files and folders with users, and by link<br>2. In the app, open the file list in list view<br>3. Switch to grid view | 2. Shared items show the sharing badge<br>3. Shared items show the sharing badge| P m15 |  |
| Badge in list of files (oC Classic) | 1. In oC Classic web client, share files and folders with users, and by link<br>2. In the app, open the file list in list view<br>3. Switch to grid view | 2. Shared items show the sharing badge<br>3. Shared items show the sharing badge| F m15 | Will open issue, not refreshing correctly |
| Both Badges in list of files (oCIS) | 1. In oC Classic web client, share both files and folders with users, and by link<br>2. In the app, open the file list in list view<br>3. Switch to grid view | 2. Shared items show the sharing badge<br>3. Shared items show the sharing badge|  P m15|  |
| Both Badges in list of files (oC Classic) | 1. In oC Classic web client, share both files and folders with users, and by link<br>2. In the app, open the file list in list view<br>3. Switch to grid view | 2. Shared items show the sharing badge<br>3. Shared items show the sharing badge| F m15 | Will open issue, not refreshing correctly |
| Remove Badges (oCIS) | 1. In oCIS web client, unshare files and folders and remove links<br>2. In the app, open the file list in list view<br>3. Switch to grid view | 2. Shared items do not show the sharing badge<br>3. Shared items do not show the sharing badge| P m15 |  |
| Remove badges (oC Classic) | 1. In oC Classic web client, unshare files and folders and remove links<br>2. In the app, open the file list in list view<br>3. Switch to grid view | 2. Shared items do not show the sharing badge<br>3. Shared items do not show the sharing badge| F m15 | Will open issue, not refreshing correctly |
|**Accessibility**| One device |
| Talkback | 1. Enable Talkback in device<br>2. Navigate through the `Share` view | Every field in the dialog is correctly spelt  | NA | No options to talk |  |
| Keyboard | 1. Attach physical keyboard to device via BT<br>2. Navigate through the `Share` views | Every field in the view is selected and no dead paths in navigation  | NA | No options to navigate |  |