#### Open In 

#### PRs: https://github.com/owncloud/ios-app/pull/132

Devices: 
Server: 

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Open In option portrait| Open In option in card | Correct view of the option in portrait | | | |
| Open in option landscape| Open In option in card | Correct view of the option in landscape | | | |
| Open in option folders| Tap on three dots of a folder | Open In does not appear | | | |
|**Actions**||||||
| Not downloaded | 1. Select "open in" of a non-downloaded file| File is downloaded and list of apps to poen in. shown | | |
| Downloaded | 1. Select "open in" of an already downloaded file after switching connection off| List of apps to open in, shown | | |
| Cancel | 1. Select "open in" of a non-downloaded file<br>Cancel| Nothing happens | | |
| Filtered | 1. Enter a pattern in search bar that matchs any file<br>Try to "open in" the file| List of apps opened | | |
|**Issues**||||||
| No connection | Remove connection from device<br>Select "open in" of any file| Not posible, lack of connection | | |
| Connection lost | Select "open in" of any non-downloaded file<br>Remove connection from device before it finishes| Downloaded cancelled after timeout | | |
| File removed | Select "open in" of any non-downloaded file<br>Remove file from server before confirming| Can not open the file | | |