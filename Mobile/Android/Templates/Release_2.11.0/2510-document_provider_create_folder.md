#### Document provider - Create Folder

#### Pr: https://github.com/owncloud/android/pull/2510



---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Create folder root | Using document provider, create a folder in root folder | Correct created, check in the app or web UI |  |
| 2 | Create folder non-root | Using document provider, create a folder in non-root folder | Correct created, check in the app or web UI |  |
| 3 | Create folder existing | Using document provider, create a folder with existing name | Correct error |  |
| 4 | Folder with special characters | Using document provider, create folder with special characters like &%ä^ | Correct error |  |
| 5 | Folder with forbidden characters | Using document provider, create folder with for6bidden characters like \ or / | Correct error |  |
| 6 | Folder with longer name as allowed | Using document provider, create folder with a longer than 256 characters name | Correct error |  |
| 7 | No internet connection | Using document provider, create folder with no internet connection| Correct error |  |
| 8 | No server connection | Using document provider, create folder with no server connection| Correct error |  |
| 9 | Maintenance mode | Using document provider, create folder with server in maintenance mode| Correct error |  |