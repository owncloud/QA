###  New Bottom Navigation Bar

#### Pr: https://github.com/owncloud/android/pull/2845

Devices: Pixel2 v10, Huawei P20Lite v9<br>
Server: 10.4

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- | 
| **View** |||||
| Portrait List | Open list of files in portrait | Bottom bar is correctly displayed | P m10 m9 |  |  |
| Landscape List | Open list of files in landscape | Bottom bar is correctly displayed |  P m10 m9 |  |  |
| Portrait Grid | Open grid of files in portrait | Bottom bar is correctly displayed | P m10 m9 |  |  |
| Landscape Grid | Open grid of files in landscape | Bottom bar is correctly displayed | P m10 m9 |  |  |
| Shortcuts names | Open file list<br>Click in every icon of the bottom bar | Every icon displays the correct text | P m10 m9 |  |  |
| Drawer | Open drawer | Shortcuts are not there anymore. Only Settings, Feedback and Help | P m10 m9 |  |  |  |
| Multiselection | Long press on any item of the list | Multiselection mode open and bottom bar hidden | P m10 m9 |  |  |  |
| Snackbar | Open an OAuth2 session<br>In web UI, revoke the token | Android app shows the snackbar in front of the bottom navigation bar | P m10 m9 |  |  |  |
| Snackbar II | Set the server in maintenance mode | Android app shows the snackbar just above the navigation bar | P m10 m9 |  |  |  |
| Other options | Open file list | Check that the other operations (share, create folder, upload, delete, copy, move, open in, details, av. offline) keep being available | P m10 m9 |  | 
| **Shortcuts** |||||
| All Files - non root | Browse to other folder<br>Click the option "All files" | Moved to the root folder | P m10 m9|  |  |
| All Files - root | Open root folder<br>Click the option "All files" | Nothing happens | P m10  m9|  |  |
| All Files - other view | Click on other shortcut<br>Click the option "All files" | Moved to files view, in root folder | P m10 m9 |  |  |
| Uploads | Click on "Uploads" | Moved to the uploads view | P m10 m9 |  |  |
| Av. offline | Click on "Available offline" | Moved to the available offline view | P m10 m9 |  |  |
| Shared by link | Click on "Shared by link" | Moved to the shared by link view | P m10 m9 |  |  |
| Empty list uploads | With no uploads in the list, switch to the uploads view from any other tab | "No uploads available" message is displayed | P m10 m9 |  |  |
| Empty list av. offline | With no av. offline in the list, switch to the av. offline view from any other tab | "No av. offline available" message is displayed | P m10 m9 | FIXED: switched with shared by link |  |
| Empty list shared by link | With no share by link items in the list, switch to the shared by link view from any other tab | "No shared by link" message is displayed | P m10 m9 | FIXED: switched with av .offline |  |

