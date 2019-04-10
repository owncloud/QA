#### Document provider - Rename

#### Pr: https://github.com/owncloud/android/pull/2506



---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | Rename file root | Using document provider, rename a file in root folder | Correct renamed, check in the app or web UI |  |
| 2 | Rename file non-root | Using document provider, rename a file in non-root folder | Correct renamed, check in the app or web UI |  |
| 3 | Rename folder root | Using document provider, rename a folder in root folder | Correct renamed, check in the app or web UI |  |
| 4 | Rename folder non-root | Using document provider, rename a folder in non-root folder | Correct renamed, check in the app or web UI |  |
| 5 | Rename item with an existing name | Using document provider, rename any to another existing name | Correct error |  |
| 6 | Rename item with special characters | Using document provider, rename any item using special characters like &%ä^ | Correct error |  |
| 7 | Rename item with forbidden characters | Using document provider, rename any item using forbidden characters like \ or / | Correct error |  |
| 8 | Rename item with no permision | Using document provider, rename any shared item over which, there is no edit permission | Correct error |  |
| 9 | Rename item with longer name as allowed | Using document provider, rename any item with a longer than 256 characters name | Correct error |  |
| 10 | Rename removed item | Using document provider, rename any item that has just removed from web UI | Correct error |  |
| 11 | Rename item with no internet connection | Using document provider, rename any item with no internet connection| Correct error |  |
| 12 | Rename item with no server connection | Using document provider, rename any item with no server connection| Correct error |  |
| 13 | Rename item with server in maintenance mode | Using document provider, rename any item with server in maintenance mode| Correct error |  |
| 14 | Select several to rename | Using document provider, select several items| Rename is disabled |  |