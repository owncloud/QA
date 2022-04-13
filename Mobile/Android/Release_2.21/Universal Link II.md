### Universal Link in app

#### Pr: https://github.com/owncloud/ios-app/pull/609 

Devices: iPadAir v13, iPhoneXR v13, iPadPro 12.4 (simulator)<br>
Server: 10.4

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Cached**|||||||
| File in root supported downloaded | 1. Get private link of a supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is opened | P m13 t13 | FIXED: Only if no other view in front |
| File in root supported not downloaded | 1. Get private link of a  supported format downloaded file in root<br>2. Open the link in the device | App is opened and the file is downloaded and opened | P t13 m13| FIXED: File download and not opened after fresh install. In shniq, takes time to open it showing network unreachable.  |
| File in root not supported downloaded | 1. Get private link of a non-supported format file in root<br>2. Open the link in the device | App is opened and the preview is displayed | P t13 m13 |  |
| File in root not supported not downloaded | 1. Get private link of a non-supported format non-downloaded file in root<br>2. Open the link in the device | App is opened and the preview is displayed | P t13 m13|  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed | P m13 t13 |  |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed | P m13 t13 | FIXED: Latest browsed is opened. |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content | P t13 m13 |  |
| Browsed Folder | 1. Get private link of a folder<br>2. Browse through the folder structure<br>3. Kill the app.<br>4. Open the link | App is opened and the item of the link displayed, not the latest browsed | P t13 m13 | FIXED:Latest browsed is opened. |
|**Non-cached**|||||||
| Folder root | 1. Get private link of a non-cached folder in root (create it in other client)<br>2. Open the link in the device | App is opened and the content of the folder is shown | P m13 t13 | FIXED: It browses to the account list|
| Folder non-root| 1. Get private link of a non-cached folder in non-root (create it in other client)<br>2. Open the link in the device | App is opened and the content of the folder is shown | P m13 t13 | FIXED: It browses to the account list.<br> FIXED: In shniq works fine, but takes time... |
| File in non-root supported | 1. Get private link of a supported format downloaded file in non-root folder, which is non-cached (upload with other client)<br>2. Open the link in the device | App is opened and the file is opened | P m13 |  |
| File in non-root not supported | 1. Get private link of a non-supported format file in non-root folder, which is non-cached (upload with other client)<br>2. Open the link in the device | App is opened  and file in download view | P m13 |  |
| Shared file | 1. User1 shares with user2 and send the link<br>2. User2 open the link | File downloaded and displayed in user2 acocunt | P m13 | FIXED: Spinner forever<br>FIXED:it takes time to open |
| Shared Folder | 1. User1 shares with user2 and send the link<br>2. User2 open the link | Folder opened in user2 account| P m13 t13 | FIXED: It browses to the account list<br> |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters | File opened   | P m13 t13 |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters | Folder opened | P m13 t13 |  |
| File blanks | 1. Get private link of a file which name contains blanks | File opened | P m13 t13 |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks | Folder opened | P m13 t13 |  |
| Hidden file | 1. Get private link of a hidden file | File opened | P m13 t13 |  |
|**Security**|||||||
| Passcode | 1. Enable passcode<br>2. Open private link | After entering correct passcode, item is correctly open | P m13 t13 | FIXED: link not opened |
| Biometric | 1. Enable Biometric<br>2. Open private link | After entering correct biometric, item is correctly open | P m13 t13 | FIXED: link not opened |
|**Multiaccount**|||||||
| Different accounts | 1. Get private link of three items in three different accounts<br>2. Open the links in the device when the open account is a different one | App is opened and the items are correctly shown inside their accounts | P m13 t13 |  |
| Shared with several | 1. Three users available: User1, User2, User3.<br>2. Add User2 and User3 account to the app<br>3. In web, User1 shares an item with User2 and User3<br>3. Get the link and click it in the device | Both accounts have the item accesible. Any of them open the item | P m13 t13 |  |
|**Error handling**|||||||
| No Connection cached non-downloaded file | 1. Get private link of a non-downloaded cached file<br>2. Open the link in a device | File can not be downloaded but browsed, correct error message about lack of connection | P m13 t13 | FIXED: Nothing happens |
| No Connection cached downloaded file | 1. Get private link of a downloaded cached file<br>2. Open the link in a device | App is opened and the file is browsed and opened. | P m13 | FIXED: Not opened | 
| No Connection cached folder | 1. Get private link of a cached folder<br>2. Open the link in a device | Folder is opened  | P m13 t13 | FIXED: Nothing happens |
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | File or folder does not exist, correct error message  about unknown link| P m13 t13 | FIXED: Nothing happens |
| Item not accesible | 1. Get private link of a file<br>2. Remove the item<br>3. Open the link in a device  | File can not be shown, correct error message about unknown link | P m13 t13 | FIXED: Nothing happens |
| Account not attached | Get private link of a file or folder in an account that is not attached to the device | Item not opened, correct error message about account not attached | P m13 13 | FIXED: Nothing happens -> open in app<br> FIXED: Error about connectivity.|
| App not installed | Get private link of a non-cached file or folder in an enterprise account | Opened in browser | P m13 t13|  |
| App not installed II | Get private link of a non-cached file or folder in a regular account | Bot posible, app is not installed and scheme is not recognised | P m13 t13 |  |
|**Regressions**|||||||
| Multiple Window | 1. (iPad) Open owncloud app and two different accounts in multiwindow mode<br>2. Open a link in the first account<br>3. Open a link in the second account| Links are correcly resolved and content displayed| P t13 | Only iPad|
| Previews | Open all posible kind of files (pdf, txt, images, msoffice extensions...) | Everything is correctly previewed | P m13 t13 | FIXED: txt and msoffice files are not previewed|
| iOS12.4| 1. (iPad) Open link | Link is correcly resolved and content displayed | P t12 | |