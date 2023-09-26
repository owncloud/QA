###  Private link from dav property 

#### Pr: https://github.com/owncloud/android/pull/2038

Server: 10.0.3, 10.0.4beta

Devices: Nexus5 v6, Nexus9 v7

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**|||||||
| 1 | File  | Open share menu of a file. | Icon is shown in right-up. Correctly displayed in both orientations | P m6 t7 |  |
| 2 | Folder  | Open share menu of a folder. | Icon is shown in right-up. Correctly displayed in both orientations | P m6 t7 |  |
|**Get private link**|||||||
| 3 | Root folder | 1. Open the app<br>2. Check property (link to root folder) using a proxy<br>3. Paste link in a browser with access to the account | Root folder is displayed | P m6 t7 |  |
| 4 | File in root folder | 1. Open share menu of a file<br>2. Click on private link<br>3. Paste link in a browser with access to the account | File is highlighted | P m6 t7 |  |
| 5 | Folder in root folder | 1. Open share menu of a folder<br>2. Click on private link<br>3. Paste link in a browser with access to the account | Content of the folder is displayed | P m6 t7|  |
| 6 | File in non-root folder | 1. Open share menu of a file that is not in root (several deep levels)<br>2. Click on private link<br>3. Paste link in a browser with access to the account | File is highlighted | P m6 t7|  |
| 7 | Folder in non-root folder | 1. Open share menu of a folder that is not in root (several deep levels)<br>2. Click on private link<br>3. Paste link in a browser with access to the account | Content of the folder is displayed | P m6 t7 |  |
|**Operations**|||||||
| 8 | Move | 1. Move a file or folder to a different location<br>2. Copy the private link and paste it in a browser | Content is correctly displayed | P m6 t7 |  |
| 9 | Copy | 1. Copy a file or folder to a different location<br>2. Copy the private link and paste it in a browser | Content is correctly displayed | P m6 t7|  |
| 10 | Rename | 1. Rename a file or folder<br>2. Click on private link<br>3. Paste link in a browser with access to the account | Content is correctly displayed | P m6 t7|  |
|**Legacy servers**|||||||
| 11 | Server 9.1 | Copy private link in a Server 9.1 | Correct behaviour | P m6 t7 | patched manually. Only av. in oC X  |
| 12 | Server 9.0 | Copy private link in a Server 9.0 | Correct behaviour | NA | Different path to patch |
| 13 | Server 8.2 | Copy private link in a Server 8.2 | Correct behaviour | NA | Different path to patch |
|**Upgrade**|One device||||||
| 14 | Upgrade from latest version | 1. Install latest version<br>2. Upgrade to that one |   | P m6 |   |