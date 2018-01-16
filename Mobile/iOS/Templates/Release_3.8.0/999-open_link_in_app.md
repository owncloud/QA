### Open private link within the app

#### Pr: https://github.com/owncloud/ios/pull/999 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Root**|||||||
| 1 | File in root supported downloaded | 1. Get private link of a supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is opened |  |  |
| 2 | File in root supported not downloaded | 1. Get private link of a  supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| 3 | File in root not supported downloaded | 1. Get private link of a non-supported format file in root<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| 4 | File in root not supported not downloaded | 1. Get private link of a non-supported format non-downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened |  |  |
|**Non-root cached**|||||||
| 5 | Non-Root folder | 1. Get private link of a cached folder in root<br>2. Open the link in the device | App is opened and the content of the folder is shown |  |  |
| 6 | File in non-root supported downloaded | 1. Get private link of a supported format downloaded file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is opened |  |  |
| 7 | File in non-root supported not downloaded | 1. Get private link of a  supported format downloaded file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| 8 | File in non-root not supported downloaded | 1. Get private link of a non-supported format file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| 9 | File in non-root not supported not downloaded | 1. Get private link of a non-supported format non-downloaded file in non-root folder, which is cached<br>2. Open the link in the device | App is opened and the file is downloaded and opened |  |  |
|**Non-root non-cached**|||||||
| 10 | Non-Root folder | 1. Get private link of a non-cached folder in root<br>2. Open the link in the device | App is opened and the content of the folder is shown |  |  |
| 11 | File in non-root supported | 1. Get private link of a supported format downloaded file in non-root folder, which is non-cached<br>2. Open the link in the device | App is opened and the file is opened |  |  |
| 12 | File in non-root not supported | 1. Get private link of a non-supported format file in non-root folder, which is non-cached<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
|**Multiaccount**|||||||
| 13 | Active account | 1. Get private link of item in the active account<br>2. Open the link in the device | App is opened and the item is correctly shown |  |  |
| 14 | Non-active account | 1. Get private link of item in a non-active account<br>2. Open the link in the device | App is opened, account swithched, and the item is correctly shown |  |  |
|**Error handling**|||||||
| 15 | No Connection cached non-downloaded file | 1. Get private link of a non-downloaded cached file<br>2. Open the link in a device | File can not be downloaded but browsed, correct error message |  |  |
| 16 | No Connection downloaded cached file | 1. Get private link of a downloaded cached file<br>2. Open the link in a device | App is opened and the file is browsed and opened. Error message? |  |  |
| 17 | No Connection non-cached file | 1. Get private link of a non-cached file<br>2. Open the link in a device | File or folder can not be browsed, correct error message |  |  |
| 18 | No Connection non-cached folder | 1. Get private link of a non-cached folder<br>2. Open the link in a device | Folder can not be browsed, correct error message |  |  |
| 19 | No Connection cached folder | 1. Get private link of a cached folder<br>2. Open the link in a device | Folder is opened, and error message shown? |  |  |
| 20 | Non existing cached item | 1. Get private link of a non-cached file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message |  |  |
| 21 | Non existing non-cached item | 1. Get private link of a non-cached file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device  | File or folder can not be browsed, correct error message |  |  |
| 22 | File not accesible | 1. Get private link of a non-accesible file<br>2. Open the link in a device  | File can not be shown, correct error message? |  |  |
| 23 | Folder not accesible | 1. Get private link of a item non-accesible folder<br>2. Open the link in a device  | Folder can not be shown, correct error message? |  |  |
| 24 | App not installed | Get private link of a non-cached file or folder | Opened in browser |  |  |