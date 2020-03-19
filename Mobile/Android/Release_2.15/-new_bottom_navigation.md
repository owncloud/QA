###  New Bottom Navigation Bar

#### Pr: https://github.com/owncloud/android/pull/

Devices: <br>
Server: 

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- | 
| **View** |||||
| Portrait List | Open list of files in portrait | Bottom bar is correctly displayed |  |  |  |
| Landscape List | Open list of files in landscape | Bottom bar is correctly displayed |  |  |  |
| Portrait Grid | Open grid of files in portrait | Bottom bar is correctly displayed |  |  |  |
| Landscape Grid | Open grid of files in landscape | Bottom bar is correctly displayed |  |  |  |
| Shortcuts names | Open file list<br>Click in every icon of the bottom bar | Every icon displays the correct text |  |  |  |
| Drawer | Open drawer | Shortcuts are not there anymore. Only Settings, Feedback and Help | |  |  |  |
| Other options | Open file list | Check that the other operations (share, create folder, upload, delete, copy, move, open in, details, av. offline) keep being available |  | |  |  |  |
| **Shortcuts** |||||
| All Files - non root | Browse to other folder<br>Click the option "All files" | Moved to the root folder |  |  |  |
| All Files - root | Open root folder<br>Click the option "All files" | Nothing happens |  |  |  |
| All Files - other view | Click on other shortcut<br>Click the option "All files" | Moved to files view, in root folder |  |  |  |
| Uploads | Click on "uploads" | Moved to the uploads view |  |  |  |
| Av. offline | Click on "Available offline" | Moved to the available offline view |  |  |  |
| Shared by link | Click on "Shared by link" | Moved to the shared by link view |  |  |  |


