### Deep Links


**Server(s)**: 10.13.3, oCIS 4.0<br>
**Device(s)**: Pixel 2, Android 11<br>
**Execution date**: 05/12/2023<br>
**Tester**: jrecio<br>
**Context**: <br>

---

 
| Test Case | Steps | Expected Result | Result | Related Comment |
| :-------- | :---- | :-------------- | :----: | :-------------- |
|**Files - Single Account**|||||||
| Root-Preview-Downloaded oC10 | 1. Get deep link of a image/txt file that is downloaded in root folder of oC10<br>2. Click the link in the device | App is opened and file content is displayed | P m11 t13 | FIXED: [link](https://github.com/owncloud/android/pull/4212#issuecomment-1827677419) |
| Root-Preview-Downloaded oCIS (personal) | 1. Get deep link of a image/txt file that is downloaded in root folder of oCIS' personal space<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Root-Preview-Downloaded oCIS (custom) | 1. Get deep link of a image/txt file that is downloaded in root folder of oCIS' custom space<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Root-Preview-Non Downloaded oC10 | 1. Get deep link of a image/txt file that is not downloaded in root folder of oC10<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 t13 | FIXED: [link](https://github.com/owncloud/android/pull/4212#issuecomment-1827677419) |
| Root-Preview-Non Downloaded oCIS (personal) | 1. Get deep link of a image/txt file that is not downloaded in root folder of oCIS' personal space<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Root-Preview-Non Downloaded oCIS (custom) | 1. Get deep link of a image/txt file that is not downloaded in root folder of oCIS' custom space with upload permissions<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Non Root-Preview-Downloaded oC10 | 1. Get deep link of a image/txt file that is downloaded in non-root folder of oC10<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Non Root-Preview-Downloaded oCIS (personal) | 1. Get deep link of a image/txt file that is downloaded in non-root folder of oCIS' personal space<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Non Root-Preview-Downloaded oCIS (custom) | 1. Get deep link of a image/txt file that is downloaded in non-root folder of oCIS' custom space with upload permissions (not discovered)<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Non Root-Preview-Non Downloaded oC10 | 1. Get deep link of a image/txt file that is not downloaded in non-root folder of oC10 (not discovered)<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Non Root-Preview-Non Downloaded oCIS (personal) | 1. Get deep link of a image/txt file that is not downloaded in non-root folder of oCIS' personal space<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Non Root-Preview-Non Downloaded oCIS (custom) | 1. Get deep link of a image/txt file that is not downloaded in non-root folder of oCIS' custom space with upload permissions<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Root-No Preview-Downloaded oC10 | 1. Get deep link of any file without preview that is downloaded in root folder of oC10<br>2. Click the link in the device | App is opened and file content is displayed | P m11  | FIXED: [link](https://github.com/owncloud/android/pull/4212#issuecomment-1827677419) |
| Root-No Preview-Downloaded oCIS (personal) | 1. Get deep link of any file without preview that is downloaded in root folder of oCIS' personal space<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Root-No Preview-Downloaded oCIS (custom) | 1. Get deep link of any file without preview that is downloaded in root folder of oCIS' custom space with upload permissions<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Root-No Preview-Non Downloaded oC10 | 1. Get deep link of any file without preview that is not downloaded in root folder of oC10<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11  | FIXED: [link](https://github.com/owncloud/android/pull/4212#issuecomment-1827677419) |
| Root-No Preview-Non Downloaded oCIS (personal) | 1. Get deep link of any file without preview that is not downloaded in root folder of oCIS' personal space<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Root-No Preview-Non Downloaded oCIS (custom) | 1. Get deep link of any file without preview that is not downloaded in root folder of oCIS' custom space with upload permissions<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Non Root-No Preview-Downloaded oC10 | 1. Get deep link of any file without preview that is downloaded in non-root folder of oC10<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Non Root-No Preview-Downloaded oCIS (personal) | 1. Get deep link of any file without preview that is downloaded in non-root folder of oCIS' personal space<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Non Root-No Preview-Downloaded oCIS (custom) | 1. Get deep link of any file without preview that is downloaded in non-root folder of oCIS' custom space with upload permissions (not discovered)<br>2. Click the link in the device | App is opened and file content is displayed | P m11 |  |
| Non Root-No Preview-Non Downloaded oC10 | 1. Get deep link of any file without preview that is not downloaded in non-root folder of oC10 (not discovered)<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Non Root-No Preview-Non Downloaded oCIS (personal) | 1. Get deep link of any file without preview that is not downloaded in non-root folder of oCIS' personal space<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
| Non Root-No Preview-Non Downloaded oCIS (custom) | 1. Get deep link of any file without preview that is not downloaded in non-root folder of oCIS' custom space with upload permissions<br>2. Click the link in the device | App is opened, file downloaded and file content is displayed | P m11 |  |
|**Folders - Single Account**|||||||
| Root oC10 | 1. Get deep link of a folder in root<br>2. Click the link in the device | App is opened and folder content displayed | P m11 |  |
| Space Root oCIS | 1. Get deep link of a space (oCIS)<br>2. Click the link in the device | App is opened and root folder of the space displayed | P m11 |  |
| Root oCIS personal | 1. Get deep link of a folder in root of Personal (oCIS)<br>2. Click the link in the device | App is opened and folder content displayed | P m11 |  |
| Root oCIS custom | 1. Get deep link of a folder in root of custom space (oCIS)<br>2. Click the link in the device | App is opened and folder content displayed |  P m11 |  |
| Non-root - Not Discovered oC10 | 1. Get deep link of a folder in non-root (not discovered)<br>2. Click the link in the device | App is opened and folder content displayed | P m11 |   |
| Non-root - Not Discovered oCIS personal | 1. Get deep link of a folder in non-root of personal space (not discovered)<br>2. Click the link in the device | App is opened and folder content displayed | P m11 |   |
| Non-root - Not Discovered oCIS custom | 1. Get deep link of a folder in non-root of custom space (not discovered)<br>2. Click the link in the device | App is opened and folder content displayed | P m11  |   |
| Non-root - Discovered oC10 | 1. Get deep link of a folder in non-root (discovered)<br>2. Click the link in the device | App is opened and folder content displayed | P m11 |   |
| Non-root - Discovered oCIS personal | 1. Get deep link of a folder in non-root of personal space (discovered)<br>2. Click the link in the device | App is opened and folder content displayed | P m11 |   |
| Non-root - Discovered oCIS custom | 1. Get deep link of a folder in non-root of custom space (discovered)<br>2. Click the link in the device | App is opened and folder content displayed | P m11  |   |
| Empty Folder | 1. Get deep link of an empty folder<br>2. Click the link in the device | App is opened and folder with no content | P m11 |  |
|**Files - Multiaccount**|||||||
| Three oC10 accounts | 1. Add three oC10 accounts to the device<br>2. Get deep link of one file in every account, in root and non-root folders<br>3. Click the links in the device | App is opened and the files are correctly displayed | P m11 | FIXED: [link](https://github.com/owncloud/android/pull/4212#issuecomment-1827753077)  |
| Three oCIS accounts | 1. Add three oCIS accounts with different spaces to the device<br>2. Get deep link of one file in every account, in root and non-root folders and in personal and custom spaces<br>3. Click the links in the device | App is opened and files are correctly displayed | P m11 |  |
| oCiS + oC10 | 1. Add and oCIS and oC10 accounts to the device<br>2. Get deep link of one file in every account, in root and non-root folders and in personal and custom spaces<br>3. Click the links in the device | App is opened and files are correctly displayed | P m11 |  |
|**Folder - Multiaccount**|||||||
| Three oC10 accounts | 1. Add three oC10 accounts to the device<br>2. Get deep link of one folder in every account, in root and non-root folders<br>3. Click the links in the device | App is opened and the folders' content is correctly displayed | P m11 | FIXED: [link](https://github.com/owncloud/android/pull/4212#issuecomment-1827753077)  |
| Three oCIS accounts | 1. Add three oCIS accounts with different spaces to the device<br>2. Get deep link of one folder in every account, in root and non-root folders and in personal and custom spaces<br>3. Click the links in the device | App is opened and folders' content is correctly displayed | P m11 |  |
| oCIS + oC10 | 1. Add and oCIS and oC10 accounts to the device<br>2. Get deep link of one folder in every account, in root and non-root folders and in personal and custom spaces<br>3. Click the links in the device | App is opened and folders' content is correctly displayed | P m11 |  |
|**Security**|||||||
| Passcode | 1. Enable passcode in `Settings`<br>2. Click on deep link over any item | After typing correct passcode, item is correctly displayed | P m11 |   |
| Pattern | 1. Enable pattern in `Settings`<br>2. Click on deep link over any item | After entering correct passcode, item is correctly displayed | P m11 |   |
| Biometric | 1. Enable Biometric in `Settings`<br>2. Click on deep link over any item | After entering correct biometric, item is correctly open | P m11 |  |
|**Error handling**|||||||
| No Connection - Non Downloaded file | 1. Get deep link of a non-downloaded discovered file<br>2. Remove device connection<br>3. Click the link in a device | File can not be downloaded but browsed, correct error message about lack of connection | F m11 | Only Sync error |
| No Connection - Non Discovered file | 1. Get deep link of a non-discovered file<br>2. Remove device connection<br>3. Click the link in a device | File not accesible, correct error | F m11 | Sync error |
| No Connection - Downloaded - Discovered file| 1. Get deep link of a downloaded discovered file<br>2. Open the link in a device | App is opened and the file is browsed and opened<br>Correct error message about lack of connection | F m11 |  Sync error| 
| No Connection - Non discovered folder | 1. Get deep link of a non-discovered folder<br>2. Open the link in a device | File not accesible, correct error  | F m11  | Sync error  |
| Non existing item | 1. Get deep link of any file or folder<br>2. Delete or move the item from its original location<br>3. Open the link in a device | Error: `User doesn't have access to the file` | P m11  |   |
| Space not available | 1. In an oCIS server, disable an space<br>2. Get deep link of a file or folder inside the space | Error: `User doesn't have access to the file` | P m11 |
| Account not attached | Get deep link of a file or folder in an account that is not attached to the device | Item not opened, correct error message about unknown item | P m11 |  |
| App not installed | Get deep link of a non-cached file or folder in an account | Not opened, because profix is not recognized | P m11 |  |

