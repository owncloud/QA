#### Open In 

#### PRs: https://github.com/owncloud/ios-app/pull/132

Devices: iPhoneX v12.1, iPadAir v12<br>
Server: 10.0.10

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| "Open In" option portrait File List| Open In option in card | Correct view of the option in portrait | P m12 t12 | | |
| "Open In" option landscape File List | Open In option in card | Correct view of the option in landscape | P m12 t12| | |
| "Open In" option portrait Preview| Open In option in card | Correct view of the option in portrait | P m12 t12 | | |
| "Open In" option landscape Preview | Open In option in card | Correct view of the option in landscape | P m12 t12 | | |
| "Open In" option folders| Tap on three dots of a folder | "Open In" does not appear | P m12 t12 | | |
|**Actions file list**||||||
| Not downloaded | Select "open in" of a non-downloaded file| File is downloaded and list of apps to open in. shown | P m12 t12 | Message, Mail, ownCloud |
| Downloaded | Select "open in" of an already downloaded file after switching connection off| List of apps to open in, shown | F m12 t12 | Downloaded twice|
| Cancel | Select "open in" of a non-downloaded file<br>Cancel| Nothing happens | P m12 t12| |
| Filtered | Enter a pattern in search bar that matchs any file<br>Try to "open in" the file| List of apps opened | P m12 t12 | |
| File open | Select "Open In" from three-dot-point menu | List of apps to open in, shown | P m12 t12 | |
|**Issues**||||||
| No connection | Remove connection from device<br>Select "Open In" of any file | Not posible, lack of connection | F t12 | Try to start |
| Connection lost | Select "Open In" of any non-downloaded file<br>Remove connection from device before it finishes| Downloaded cancelled after timeout | P t12 | |
| Server not reached | Select "Open In" of any non-downloaded file<br>Switch server off before it finishes| Downloaded cancelled after timeout | P t12 | |
| File removed | Select "Open In" of any non-downloaded file<br>Remove file from server before confirming| Can not open the file | F t12 | Becomes unestable |
|**Regression**||||||
| Rename File list | Select "Rename" of any item of the file list | Item renamed | P t12  |  |
| Move File list | Select "Move" of any item of the file list | Item moved | F m12 | Lag in deletion from source|
| Delete File list | Select "Delete" of any item of the file list | Item deleted | P t12 | Deleted before cancelling |
| Duplicate File list | Select "Duplicate" of any item of the file list | Item duplicated | P t12 | Deleted before cancelling |
| Rename Preview | Select "Rename" from an opened item  | Item removed | P t12 | |
| Move Preview | Select "Move" from an opened item  | Item moved | P m12 | |
| Delete Preview | Select "Delete" from an opened item  | Item deleted | P t12 | |
| Duplicate Preview | Select "Duplicate" from an opened item  | Item duplicated | P t12 | |