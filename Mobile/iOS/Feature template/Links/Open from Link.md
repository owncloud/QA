### Open Link in app

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: 

---

**oC10**

Link format: `owncloud://<host>/f/<file-id>` <br>
F. ex.: `owncloud://demo.owncloud.com/f/45`
 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Single account**|||||||
| File in root | 1. Get private link of file in root<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| Folder in root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| File in non-root | 1. Get private link of file in non-root<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| Folder in non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content is displayed |  |  |
| Browsed Folder | 1. Get private link of a folder<br>2. Browse through the folder structure<br>3. Kill the app.<br>4. Open the link | App is opened and the item of the link displayed, not the latest browsed |  |  |
| No Connection file | 1. Remove device connection<br>2. Get private link of any cached file<br>3. Open the link in a device | App is opened and the item of the link highlighted |  | |
| No Connection folder | 1. Remove device connection<br>2. Get private link of any cached folder<br>3. Open the link in a device | App is opened and the item of the link highlighted |  |  |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters<br>2. Open the link in the device | App is opened and the file is highlighted |   |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters <br>2. Open the link in the device | App is opened and the folder is highlighted |   |  |
| File blanks | 1. Get private link of a file which name contains blanks<br>2. Open the link in the device | App is opened and the file is highlighted |   |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks<br>2. Open the link in the device | App is opened and the folder is highlighted |   |  |
| Hidden file | 1. Get private link of a hidden file<br>2. Open the link in the device | App is opened and the file is highlighted if `Show hidden files` option is enabled in `Settings`. Otherwise, just browsing to the containing folder |  | |
|**Security**|||||||
| Passcode | 1. Enable passcode in `Security`<br>2. Open any private link of a file in device | After entering correct passcode, file is correctly highligthed |  |  |
| Biometric | 1. Enable Biometric in `Security`<br>2. Open private link of a folder in device  | After entering correct biometric, folder content is correctly displayed |  |   |
|**Multiaccount**|||||||
| Different accounts | 1. Get private link of three items in three different oC10 accounts<br>2. Open the links in the device when the current open account is a different one | App is opened and the items are correctly highlighted/opened inside their correct accounts |  |  |
| Shared with several | 1. Three users available: User1, User2, User3.<br>2. Add User2 and User3 account to the app<br>3. In web, User1 shares a file with User2 and User3<br>4. Get the link and click it in the device | Both accounts have the item accesible. Any of them open the item |  |  |
|**Error handling**|||||||
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in the device | Error: `Link resolution failed`|   |   |
| Account not attached | 1. Get private link of a file or folder in an account that is not attached to the device<br>2. Open the link in the device | Error: `Link resolution failed` |  |  |
|**Others**|||||||
| Multiple Window in iPad | 1. Open ownCloud app and two different accounts in multiwindow mode<br>2. Open a link in the first account<br>3. Open a link in the second account| Links are correcly resolved and content displayed in both accounts |   |  |

**oCIS**

Link format: `owncloud://<host>/f/<file-id>` <br>
F. ex.: `owncloud://ocis.owncloud.works/f/3ffbf849-6ff7-488f-84aa-eba5aba6138b$5004b524-0799-4d9c-bca0-52ce0a1bf1aa%2180469d84-3c5c-47ce-9d92-2a421a15ed83`

| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Single account**|||||||
| File in Personal - root | 1. Get private link of file in root<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| Folder in Personal - root  | 1. Get private link of a folder in root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| File in Personal - non-root | 1. Get private link of file in non-root<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| Folder in Personal - non-root  | 1. Get private link of a folder in non-root<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| File in Custom space - root | 1. Get private link of file in root folder of custom space<br>2. Open the link in the device | App is opened and the file is highlighted |  |  |
| Folder in Custom space - non-root | 1. Get private link of folder in non-root folder of custom space<br>2. Open the link in the device | App is opened and folder content displayed |  |  |
| Empty Folder | 1. Get private link of an empty folder<br>2. Open the link in the device | App is opened and folder with no content is displayed |  |  |
| Browsed Folder | 1. Get private link of a folder<br>2. Browse through the folder structure<br>3. Kill the app.<br>4. Open the link | App is opened and the item of the link displayed, not the latest browsed |  |  |
| No Connection file | 1. Remove device connection<br>2. Get private link of any cached file<br>3. Open the link in a device | App is opened and the item of the link highlighted |  | |
| No Connection folder | 1. Remove device connection<br>2. Get private link of any cached folder<br>3. Open the link in a device | App is opened and the item of the link highlighted |  |  |
|**Names**|||||||
| File special characters | 1. Get private link of a file which name contains special characters<br>2. Open the link in the device | App is opened and the file is highlighted |   |  |
| Folder special characters | 1. Get private link of a folder which name contains special characters <br>2. Open the link in the device | App is opened and the folder is highlighted |   |  |
| File blanks | 1. Get private link of a file which name contains blanks<br>2. Open the link in the device | App is opened and the file is highlighted |   |  |
| Folder blanks | 1. Get private link of a folder which name contains blanks<br>2. Open the link in the device | App is opened and the folder is highlighted |   |  |
| Hidden file | 1. Get private link of a hidden file<br>2. Open the link in the device | App is opened and the file is highlighted if `Show hidden files` option is enabled in `Settings`. Otherwise, just browsing to the containing folder |  | |
|**Security**|||||||
| Passcode | 1. Enable passcode in `Security`<br>2. Open any private link of a file in device | After entering correct passcode, file is correctly highligthed |  |  |
| Biometric | 1. Enable Biometric in `Security`<br>2. Open private link of a folder in device  | After entering correct biometric, folder content is correctly displayed |  |   |
|**Multiaccount**|||||||
| Different accounts | 1. Get private link of three items in three different oCIS accounts in different spaces<br>2. Open the links in the device when the current open account is a different one | App is opened and the items are correctly highlighted/opened inside their correct accounts |  |  |
| Shared with several | 1. Three users available: User1, User2, User3.<br>2. Add User2 and User3 account to the app<br>3. In web, User1 shares a file with User2 and User3<br>4. Get the link and click it in the device | Both accounts have the item accesible. Any of them open the item |  |  |
|**Error handling**|||||||
| Non existing item | 1. Get private link of a file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in the device | Error: `Link resolution failed`|   |   |
| Space not available | 1. Get private link of a file or folder in an space that is disabled<br>2. Open the link in the device | Error: `Link resolution failed` |  |  |
| Account not attached | 1. Get private link of a file or folder in an account that is not attached to the device<br>2. Open the link in the device | Error: `Link resolution failed` |  |  |
|**Others**|||||||
| Multiple Window in iPad | 1. Open ownCloud app and two different accounts in multiwindow mode<br>2. Open a link in the first account<br>3. Open a link in the second account| Links are correcly resolved and content displayed in both accounts |   |  |