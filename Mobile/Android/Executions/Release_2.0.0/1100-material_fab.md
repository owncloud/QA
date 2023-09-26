###  Material Design: Floating Action Button 

#### Pr: https://github.com/owncloud/android/pull/1100

Devices: Nexus5 v5.0.1, Tablet Nexus7 v4.3, Tablet Nexus9 v6

Server: v9


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----: | :-------------- |
| **View**||||||
| 1 | Portrait |  1. Set the device in portrait<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder",  "Content from other apps"    | P m5 t4 t6|  |
| 2 | Landscape |  1. Set the device in landscape<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder", "Content from other apps"    | P m5 t4 t6|  |
| 3 | List view |  1. Set the file view in list<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder", "Content from other apps"    | P m5 t4 t6|  |
| 4 | Grid view |  1. Set the file view in grid<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder", "Content from other apps"    | P m5 t4 t6|  |
| 5 | Collapse |  1. Tap on fab<br>2. Tap again on "parent" fab<br>3. Tap again to open the FAB and change orientation  |  1. Three options are shown:  "Upload", "Create folder", "Content from other apps"<br>2. The three options collapsed<br>The three options do not collapse and remain viewable   | P m5 t4 t6|  |
| **Actions (root)**||||||
| 6 | Upload (copy) |  1. Tap on fab in root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option copy| The files are upload correctly. The options collapsed  | P m5 t4 t6|  |
| 7 | Upload (move) |  1. Tap on fab in root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option move | The files are upload correctly, being deleted from origin. The options collapsed  | P m5 t4 t6|  |
| 8 | New folder |  1. Tap on fab in root folder<br>2. Tap on "New folder"<br>3. Input the folder's name | The folder is created correctly. The options collapsed  | P m5 t4 t6|  |
| 9 | Content from other apps |  1. Tap on fab in root folder<br>2. Tap on "Content from other apps"<br>3. Select a file or files to upload from other apps | The files are upload correctly. The options collapsed  | P m5 t4 t6|  |
| 10 | Browse back |  1. Browse to a folder<br>2. Tap on FAB<br>3. Browse back | 2. FAB is opened and the options are displayed<br>3. FAB is collapsed | P m5 t4 t6|  |
| 11 | Drawer |  1. Tap on FAB<br>2. Open Drawer<br>3. Close Drawer | 1. FAB is opened and the options are displayed<br>2. FAB keeps on opened<br>3. FAB keeps on opened | P m5 t4|  |
| 12 | Long click |  1. Tap on FAB<br>2. Long clock in the options | A Toast naming the option is displayed | P m5 t4 t6|  |
| **Actions (no root)**||||||
| 13 | Upload (copy) |  1. Tap on fab in a no root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option copy | The files are upload correctly. The options collapsed  | P m5 t4 t6|  |
| 14 | Upload (move) |  1. Tap on fab in no root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option move | The files are upload correctly, being deleted from origin. The options collapsed  | P m5 t4 t6|  |
| 15 | New folder |  1. Tap on fab in a no root folder<br>2. Tap on "New folder"<br>3. Input the folder's name | The folder is created correctly. The options collapsed  | P m5 t4 t6|  |
| 16 | Content from other apps |  1. Tap on fab in a no root folder<br>2. Tap on "Content from other apps"<br>3. Select a file or files to upload from other apps | The files are upload correctly. The options collapsed  | P m5 t4 t6|  |
| **Branding**||||||
| 17 | Branded button |   | Button colour: color of the primary button<br>Press colour: action bar colour<br>   | P m5 t4 t6|  |