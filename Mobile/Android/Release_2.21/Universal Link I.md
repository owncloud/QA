### Universal Link I (discovered files)

#### PR: https://github.com/owncloud/android/pull/3598

Devices: Nexus 6P v7, Huawei P20 Lite v9 <br>
Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**App opened**|||||||
| File in root downloaded | 1. Get private link of a downloaded file in root<br>2. Open the link in the device | App is opened and the file is displayed | P m7 |  |
| File in root not downloaded | 1. Get private link of a not downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | P m7 |  |
| File in non-root downloaded | 1. Get private link of a downloaded file in non-root<br>2. Open the link in the device | App is opened and the file is displayed | P m7 |  |
| File in non-root not downloaded | 1. Get private link of a not downloaded file in non-root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | P m7 |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 | FIXED: not opened |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 | FIXED: not opened |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content | P m7 | FIXED: not opened |
| Browsing | 1. Get private link of a folder in non-root<br>2. Open the link<br>3. Browse back and forth after opening | Correct browsing | P m7 | In file is not openable, goes to root folder. Works fine if file is openable -> **To fix in new arch**|
|**App closed**|||||||
| File in root downloaded | 1. Get private link of a downloaded file in root<br>2. Open the link in the device | App is opened and the file is displayed | P m7 |  |
| File in root not downloaded | 1. Get private link of a not downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | P m7 |  |
| File in non-root downloaded | 1. Get private link of a downloaded file in non-root<br>2. Open the link in the device | App is opened and the file is displayed | P m7 |  |
| File in non-root not downloaded | 1. Get private link of a not downloaded file in non-root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | P m7 |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 m9 | FIXED: Does not browse |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 m9 | FIXED: Does not browse |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content | P m7 m9 | FIXED: Does not browse |
| Browsing | 1. Get private link of a folder in non-root<br>2. Open the link<br>3. Browse back and forth after opening | Correct browsing | P m7 m9 | FIXED: Does not browse |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters | File opened | P m7  |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters | Folder opened | P m7  | FIXED: Does not browse |
| File blanks | 1. Get private link of a file which name contains blanks | File opened | P m7  |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks | Folder opened | P m7  | FIXED: Does not browse |
|**Security**|||||||
| Passcode | 1. Enable passcode<br>2. Open private link | After entering correct passcode, item is correctly open | F m7  |  After several openings, is not asked   |
| Pattern | 1. Enable pattern<br>2. Open private link | After entering correct patern, item is correctly open | F m7  | After several openings, is not asked  |
| Biometric | 1. Enable Biometric<br>2. Open private link | After entering correct biometric, item is correctly open | F m7  |  After several openings, is not asked  |
|**Branding**|||||||
| host = * | 1. Set `deep_link_host` = `*`<br>2. Open private link | Link correctly open | P m7 | Android 12 needs the url, as a must |
| host != * | 1. Set `deep_link_host` != `*` with a correct value<br>2. Open private link on a server that matches the host | Link correctly open | P m7 m12|   |
| host != * incorrect| 1. Set `deep_link_host` != `*` with a correct value<br>2. Open private link on a server that does not match the host | App not opened | P m7 m12 |   |
|**Error handling**|||||||
| No Connection non-downloaded file | 1. Get private link of a non-downloaded file<br>2. Open the link in a device | File can not be downloaded but browsed, correct error message about lack of connection | P m7 |  |
| No Connection downloaded file | 1. Get private link of a downloaded file<br>2. Open the link in a device | App is opened and the file is browsed and opened. | P m7 |  | 
| No Connection folder | 1. Get private link of a folder<br>2. Open the link in a device | Folder is opened  | P m7 | FIXED: Does not browse |
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message  about unknown link| P m7 |  |
| Account not attached | Get private link of a file or folder in an account that is not attached to the device | Item not opened, correct error message about account not attached | P m7 |  |
| App not installed | Open private link of a file or folder | Opened in browser | P m7 |  |