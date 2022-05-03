### Universal Link I (discovered files)

#### PR: https://github.com/owncloud/android/pull/3598

Devices: Nexus 6P v7, Pixel5 v12 <br>
Server: 10.9.1

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**App opened**|||||||
| File in root | 1. Get private link of a downloaded file in root<br>2. Open the link in the device | App is opened, details of the file displayed | P m7 m12|  |
| File in non-root | 1. Get private link of a downloaded file in non-root<br>2. Open the link in the device | App is opened, details of the file displayed | P m7 m12 |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 m12 | FIXED: not opened |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 m12 | FIXED: not opened |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content | P m7 m12 | FIXED: not opened |
| Browsing after opening folder | 1. Get private link of a folder in non-root<br>2. Open the link<br>3. Browse back and forth after opening | Correct browsing | P m7 m12 |  |
|**App closed**|||||||
| File in root | 1. Get private link of a downloaded file in root<br>2. Open the link in the device | App is opened, details of the file displayed | P m7 m12 |  |
| File in non-root | 1. Get private link of a downloaded file in non-root<br>2. Open the link in the device | App is opened, details of the file displayed | P m7 m12 |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 m12 | FIXED: not opened |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed | P m7 m12| FIXED: Does not browse |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content | P m7 m12 | FIXED: Does not browse |
| Browsing after opening folder | 1. Get private link of a folder in non-root<br>2. Open the link<br>3. Browse back and forth after opening | Correct browsing | P m7 m12 |  |
|**File type**|||||||
| Text (openable by link) downloaded | 1. Get private link of a downloaded text file<br>2. Open the link | File is opened | P m12 m7 |  |
| Text (openable by link) non-downloaded | 1. Get private link of a non-downloaded text file<br>2. Open the link | File is opened | P m12 m7|  |
| Video (openable by link) downloaded | 1. Get private link of a downloaded video file<br>2. Open the link | Video is played | P m12 m7|  |
| Video (openable by link) non-downloaded | 1. Get private link of a non-downloaded video file<br>2. Open the link | Video is played | P m12 m7 |  |
| Image (non openable by link) downloaded | 1. Get private link of a downloaded image file<br>2. Open the link | Details view is displayed | P m12 m7|  |
| Image (non openable by link) non-downloaded | 1. Get private link of a non-downloaded image file<br>2. Open the link<br>3. Click on the thumbnail | 2. Details view is displayed<br>3. File downloaded and opened | P m12 m7| |
| Audio downloaded| 1. Get private link of a downloaded audio file<br>2. Open the link | Details view is displayed | P m12 m7|  |
| Audio non-downloaded| 1. Get private link of a non-downloaded audio file<br>2. Open the link<br>3. Click on thumbnail | 2. Details view is displayed<br>3. File downloaded and opened | P m12 m7 |  |
| PDF downloaded| 1. Get private link of a downloaded PDF file<br>2. Open the link<br>3. Click on thumbnail | 2. Details view is displayed<br>3. Share sheet open | P m12 m7|  |
| PDF non-downloaded| 1. Get private link of a non-downloaded PDF file<br>2. Open the link<br>3. Click on thumbnail | 2. Details view is displayed<br>3. File downloaded and share sheet displayed | P m12 m7|  |
| Office downloaded  | 1. Get private link of a downloaded Office file<br>2. Open the link<br>3. Click on thumbnail | 2. Details view is displayed<br>3. Share sheet displayed | P m12 m7|  |
| Office non-downloaded  | 1. Get private link of a non-downloaded Office file<br>2. Open the link<br>3. Click on thumbnail | 2. Details view is displayed<br>3. File downloaded and share sheet displayed | P m12 n7| |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters | File opened | P m7 m12 |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters | Folder opened | P m7 m12 | FIXED: Does not browse |
| File blanks | 1. Get private link of a file which name contains blanks | File opened | P m7 m12 |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks | Folder opened | P m7 m12 | FIXED: Does not browse |
|**Security**|||||||
| Passcode | 1. Enable passcode<br>2. Open private link | After entering correct passcode, item is correctly open | P m12 m7|  FIXED: After several openings, is not asked   |
| Pattern | 1. Enable pattern<br>2. Open private link | After entering correct patern, item is correctly open | P m12 m7 | FIXED: After several openings, is not asked  |
| Biometric | 1. Enable Biometric<br>2. Open private link | After entering correct biometric, item is correctly open | P m12 m7 |FIXED: After several openings, is not asked  |
|**Branding**|||||||
| host = * | 1. Set `deep_link_host` = `*`<br>2. Open private link | Link correctly open | P m7 | Android 12 needs the url, as a must |
| host != * | 1. Set `deep_link_host` != `*` with a correct value<br>2. Open private link on a server that matches the host | Link correctly open | P m7 m12|   |
| host != * incorrect| 1. Set `deep_link_host` != `*` with a correct value<br>2. Open private link on a server that does not match the host | App not opened | P m7 m12 |   |
|**Error handling**|||||||
| No Connection file | 1. Get private link of a non-downloaded file<br>2. Open the link in a device<br>3. Click on the thumbnail | File con not be donwloaded, error message | P m12 m7|  |
| No Connection folder | 1. Get private link of a folder (already discovered)<br>2. Open the link in a device | Folder is opened and content displayed  | P m12 m7 | FIXED: Does not browse |
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message about unknown link| P m12 m7 |  |
| Account not attached | Get private link of a file or folder in an account that is not attached to the device | Item not opened, correct error message about account not attached | P m7 m12|  |
| No accounts | 1. Install the app without adding accounts<br>2. Get private link of a file or folder in any account<br>3. Open the link | Correct error message  | P m7 m12| FIXED: Crash |
| App not installed | Open private link of a file or folder | Opened in browser | P m7 m12 |  |

