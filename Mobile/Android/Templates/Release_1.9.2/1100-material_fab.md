###  Material Floating Action Button 

#### Pr: https://github.com/owncloud/android/pull/1100

Devices:

Server: 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----:| :-------- | :---- | :-------------- | :----- | :-------------- |
| **View**||||||
| 1 | Portrait |  1. Set the device in portrait<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder",  "Content from other apps"    |  |  |
| 2 | Landscape |  1. Set the device in landscape<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder", "Content from other apps"    |  |  |
| 3 | List view |  1. Set the file view in list<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder", "Content from other apps"    |  |  |
| 4 | Grid view |  1. Set the file view in grid<br>2. Tap on fab  |  1. The ( + ) floating button is shown in the bottom-right of the screen<br>2. Three options are shown:  "Upload", "Create folder", "Content from other apps"    |  |  |
| **Actions (root)**||||||
| 5 | Upload (copy) |  1. Tap on fab in root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option copy| The files are upload correctly  |  |  |
| 6 | Upload (move) |  1. Tap on fab in root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option move | The files are upload correctly, being deleted from origin  |  |  |
| 7 | New folder |  1. Tap on fab in root folder<br>2. Tap on "New folder"<br>3. Input the folder's name | The folder is created correctly  |  |  |
| 8 | Content from other apps |  1. Tap on fab in root folder<br>2. Tap on "Content from other apps"<br>3. Select a file or files to upload from other apps | The files are upload correctly  |  |  |
| **Actions (no root)**||||||
| 9 | Upload (copy) |  1. Tap on fab in a no root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option copy | The files are upload correctly  |  |  |
| 10 | Upload (move) |  1. Tap on fab in root folder<br>2. Tap on "Upload"<br>3. Select a file or files to upload with option move | The files are upload correctly, being deleted from origin  |  |  |
| 11 | New folder |  1. Tap on fab in a no root folder<br>2. Tap on "New folder"<br>3. Input the folder's name | The folder is created correctly  |  |  |
| 12 | Content from other apps |  1. Tap on fab in a no root folder<br>2. Tap on "Content from other apps"<br>3. Select a file or files to upload from other apps | The files are upload correctly  |  |  |