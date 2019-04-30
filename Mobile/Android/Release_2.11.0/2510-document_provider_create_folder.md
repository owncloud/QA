#### Document provider - Create Folder

#### Pr: https://github.com/owncloud/android/pull/2510

Devices: Nexus 6P v7<br>
Server: 10.1

---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Create folder root | Using document provider, create a folder in root folder | Correct created, check in the app or web UI | F m7 | Needed refresh
| 2 | Create folder non-root | Using document provider, create a folder in non-root folder | Correct created, check in the app or web UI | F m7 | Needed refresh
| 3 | Create folder existing | Using document provider, create a folder with existing name | Correct error | P m7 |
| 4 | Folder with special characters | Using document provider, create folder with special characters like &%ä^ | Correct error | P m7 |
| 5 | Folder with forbidden characters | Using document provider, create folder with for6bidden characters like \ or / | Correct error | F m7 |
| 6 | Folder with longer name as allowed | Using document provider, create folder with a longer than 256 characters name | Correct error | P m7 |
| 7 | No internet connection | Using document provider, create folder with no internet connection| Correct error | P m7 |
| 8 | No server connection | Using document provider, create folder with no server connection| Correct error | P m7 |
| 9 | Maintenance mode | Using document provider, create folder with server in maintenance mode| Correct error | P m7 |