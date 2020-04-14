### Universal Link in app

#### Pr: https://github.com/owncloud/ios-app/pull/609 

Devices: iPadAir v13

Server: 10.4


---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Cached**|||||||
| File in root supported downloaded | 1. Get private link of a supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is opened | P t13 |  |
| File in root supported not downloaded | 1. Get private link of a  supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | F t13 | File download and not opened |
| File in root not supported downloaded | 1. Get private link of a non-supported format file in root<br>2. Open the link in the device | App is opened and the preview is displayed | P t13 |  |
| File in root not supported not downloaded | 1. Get private link of a non-supported format non-downloaded file in root<br>2. Open the link in the device | App is opened and the preview is displayed | P t13 |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content | P t13 |  |
| Browsed Folder | 1. Get private link of a folder<br>2. Browse through the folder structure<br>3. Kill the app.<br>4. Open the link | App is opened and the item of the link displayed, not the latest browsed | F t13 | Latest browsed is opened. |
|**Non-cached**|||||||
| Folder root | 1. Get private link of a non-cached folder in root (create it in other client)<br>2. Open the link in the device | App is opened and the content of the folder is shown |  |  |
| Folder non-root| 1. Get private link of a non-cached folder in non-root (create it in other client)<br>2. Open the link in the device | App is opened and the content of the folder is shown |  |  |
| File in non-root supported | 1. Get private link of a supported format downloaded file in non-root folder, which is non-cached (upload with other client)<br>2. Open the link in the device | App is opened and the file is opened | |  |
| File in non-root not supported | 1. Get private link of a non-supported format file in non-root folder, which is non-cached (upload with other client)<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| Shared file | 1. User1 shares with user2 and send the link<br>2. User2 open the link | File downloaded and displayed in user2 acocunt |  |  |
| Shared Folder | 1. User1 shares with user2 and send the link<br>2. User2 open the link | Folder opened in user2 account|  |  |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters | File opened or highlighted |  |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters | Folder opened |  |  |
| File blanks | 1. Get private link of a file which name contains blanks | File opened or highlighted |  |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks | Folder opened | |  |
|**Security**|||||||
| Passcode | 1. Enable passcode<br>2. Open private link | After entering correct passcode, item is correctly open |  |  |
| Biometric | 1. Enable Biometric<br>2. Open private link | After entering correct biometric, item is correctly open |  |  |
|**Multiaccount**|||||||
| Different accounts | 1. Get private link of three items in three different accounts<br>2. Open the links in the device | App is opened and the items are correctly shown inside their accounts |  |  |
|**Error handling**|||||||
| No Connection cached non-downloaded file | 1. Get private link of a non-downloaded cached file<br>2. Open the link in a device | File can not be downloaded but browsed, correct error message |  |  |
| No Connection cached downloaded file | 1. Get private link of a downloaded cached file<br>2. Open the link in a device | App is opened and the file is browsed and opened. | | | 
| No Connection non-cached file | 1. Get private link of a non-cached file<br>2. Open the link in a device | File or folder can not be browsed, correct error message |  |  |
| No Connection non-cached folder | 1. Get private link of a non-cached folder<br>2. Open the link in a device | Folder can not be browsed, correct error message | |  |
| No Connection cached folder | 1. Get private link of a cached folder<br>2. Open the link in a device | Folder is opened  |  |  |
| Non existing cached item | 1. Get private link of a non-cached file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message |  |  |
| Non existing non-cached item | 1. Get private link of a non-cached file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device  | File or folder can not be browsed, correct error message |  |  |
| File not accesible | 1. Get private link of a non-accesible file<br>2. Open the link in a device  | File can not be shown, correct error message |  |  |
| Folder not accesible | 1. Get private link of a item non-accesible folder<br>2. Open the link in a device  | Folder can not be shown, correct error message |  |  |
| Account not attached | Get private link of a file or folder in an account that is not attached to the device | Opened in browser |  |  |
| Public link | Get public link of a folder | Opened in browser | |  |
| App not installed | Get private link of a non-cached file or folder | Opened in browser |  |  |
| Public link | Get public link of a folder | Opened in browser | |  |