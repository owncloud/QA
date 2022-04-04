### Universal Link I (discovered files)

#### Pr: https://github.com/owncloud/android/pull/

Devices: <br>
Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Cached**|||||||
| File in root downloaded | 1. Get private link of a downloaded file in root<br>2. Open the link in the device | App is opened and the file is displayed |  |  |
| File in root not downloaded | 1. Get private link of a not downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened |  |  |
| File in non-root downloaded | 1. Get private link of a downloaded file in non-root<br>2. Open the link in the device | App is opened and the file is displayed |  |  |
| File in non-root not downloaded | 1. Get private link of a not downloaded file in non-root<br>2. Open the link in the device | App is opened and the file is downloaded and opened |  |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content |  |  |
| Minimized app | 1. Get private link of a folder<br>2. Browse through the folder structure<br>3. Minimize the app.<br>4. Open the link | App is opened and the item of the link displayed, not the latest browsed |  |  |
| Browsing | 1. Get private link of a folder in non-root<br>2. Open the link<br>3. Browse back and forth after opening | Correct browsing |  |  |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters | File opened |   |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters | Folder opened |   |  |
| File blanks | 1. Get private link of a file which name contains blanks | File opened |   |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks | Folder opened |   |  |
|**Security**|||||||
| Passcode | 1. Enable passcode<br>2. Open private link | After entering correct passcode, item is correctly open |   |   |
| Pattern | 1. Enable pattern<br>2. Open private link | After entering correct patern, item is correctly open |   |   |
| Biometric | 1. Enable Biometric<br>2. Open private link | After entering correct biometric, item is correctly open |  |  |
|**Error handling**|||||||
| No Connection non-downloaded file | 1. Get private link of a non-downloaded file<br>2. Open the link in a device | File can not be downloaded but browsed, correct error message about lack of connection |  |  |
| No Connection downloaded file | 1. Get private link of a downloaded file<br>2. Open the link in a device | App is opened and the file is browsed and opened. |  |  | 
| No Connection folder | 1. Get private link of a folder<br>2. Open the link in a device | Folder is opened  | |  |
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message  about unknown link|  |  |
| Account not attached | Get private link of a file or folder in an account that is not attached to the device | Item not opened, correct error message about account not attached |  |  |
| App not installed | Open private link of a file or folder | Opened in browser | |  |