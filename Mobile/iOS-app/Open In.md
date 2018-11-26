#### Open In 

#### PRs: https://github.com/owncloud/ios-app/pull/132

Devices: iPhoneX v12.1<br>
Server: 10.0.10

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| "Open In" option portrait File List| Open In option in card | Correct view of the option in portrait | P m12 | | |
| "Open In" option landscape File List | Open In option in card | Correct view of the option in landscape | P m12 | | |
| "Open In" option portrait Preview| Open In option in card | Correct view of the option in portrait | P m12 | | |
| "Open In" option landscape Preview | Open In option in card | Correct view of the option in landscape | P m12 | | |
| "Open In" option folders| Tap on three dots of a folder | "Open In" does not appear | P m12 | | |
|**Actions file list**||||||
| Not downloaded | Select "open in" of a non-downloaded file| File is downloaded and list of apps to open in. shown | P m12 | |
| Downloaded | Select "open in" of an already downloaded file after switching connection off| List of apps to open in, shown | F m12| Downloaded twice|
| Cancel | Select "open in" of a non-downloaded file<br>Cancel| Nothing happens | P m12 | |
| Filtered | Enter a pattern in search bar that matchs any file<br>Try to "open in" the file| List of apps opened | P m12 | |
| File open | Select "Open In" from three-dot-point menu | List of apps to open in, shown | P m12 | |
|**Issues**||||||
| No connection | Remove connection from device<br>Select "Open In" of any file | Not posible, lack of connection | | |
| Connection lost | Select "Open In" of any non-downloaded file<br>Remove connection from device before it finishes| Downloaded cancelled after timeout | | |
| Server not reached | Select "Open In" of any non-downloaded file<br>Switch server off before it finishes| Downloaded cancelled after timeout | | |
| File removed | Select "Open In" of any non-downloaded file<br>Remove file from server before confirming| Can not open the file | | |
|**Regression**||||||
| Remove File list | Select "Remove" of any item of the file list | Item removed | | |
| Move File list | Select "Move" of any item of the file list | Item moved | | |
| Delete File list | Select "Delete" of any item of the file list | Item deleted | | |
| Remove Preview | Select "Remove" from an opened item  | Item removed | | |
| Move Preview | Select "Move" from an opened item  | Item moved | | |
| Delete Preview | Select "Delete" from an opened item  | Item deleted | | |