#### Document provider - Delete

#### Pr: https://github.com/owncloud/android/pull/2511

Devices: Nexus 5X v8, Pixel2 v9

Server: 10.1


---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Delete file root | Using document provider, delete a file in root folder | Correct deleted, check in the app or web UI | P m8 m9|
| 2 | Delete file non-root | Using document provider, delete a file in non-root folder | Correct deleted, check in the app or web UI | P m8 m9|
| 3 | Delete folder root | Using document provider, delete a folder in root folder | Correct deleted, check in the app or web UI | P m8 m9|
| 4 | Delete folder non-root | Using document provider, delete a folder in non-root folder | Correct deleted, check in the app or web UI | P m8 m9|
| 5 | Delete item with no permision | Using document provider, delete any shared item over which, there is no delete permission | Correct error | P m8 m9| Error in notification
| 6 | Delete deleted item | Using document provider, delete any item that has just deleted from web UI | Correct error | P m8 m9| Item deleted anyway
| 7 | Delete item with no internet connection | Using document provider, delete any item with no internet connection| Correct error | P m8 m9| Error in notification
| 8 | Delete item with no server connection | Using document provider, delete any item with no server connection| Correct error | P m8 m9| Error in notification
| 9 | Delete item with server in maintenance mode | Using document provider, delete any item with server in maintenance mode| Correct error | P m8 m9| Error in notification
| 10 | Delete several  | Using document provider, delete several items at the time| Correct  deleted | P m8 m9|