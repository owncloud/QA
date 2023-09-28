###  Multiselect 

#### Pr: https://github.com/owncloud/android/pull/1176 

Devices: Nexus5 v5.0.1, Nexus7 v4.3, Nexus9 v6

Server: 9.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**List View**||||||
|*One folder options*||||||
| 1 | Portrait |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete | P m5 t4 t6 |  |
| 2 | Landscape |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete | P m5 t4 t6|  |
|*One file options*||||||
| 3 | Portrait |  Long press on a file  | On the top menu appears the options to share, download(open with and sync if it is downloaded), rename, move, copy, delete, send, av off, details | P m5 t4 t6| SOLVED: "Open with" incorrect. Icon for download |
| 4 | Landscape |  Long press on a file  | On the top menu appears the options to share, download(open with if it is downloaded), rename, move, copy, delete, send, av off, details | P m5 t4 t6| SOLVED: "Open with" incorrect. Icon for download |
|*Several selected options*||||||
| 5 | Portrait |  Long press to select more than one items  | On the top menu appears the options to sync, move, copy, delete, av off | P m5 t4 t6| SOLVED: "Open with" incorrect |
| 6 | Landscape | Long press to select more than one items | On the top menu appears the options to sync, move, copy, delete, av off | P m5 t4 t6| SOLVED: "Open with" incorrect |
| 7 | Number | Long press to select more than one items. Check with a huge number | On the top left menu appears the number of selected items. | P m5 t4 t6| SOLVED: "Open with" incorrect |
|**Grid View**||||||
|*One folder options*||||||
| 8 | Portrait |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete | P m5 t4 t6|  |
| 9 | Landscape |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete | P m5 t4 t6|  |
|*One file options*||||||
| 10 | Portrait |  Long press on a file  | On the top menu appears the options to share, download (open with and sync if it is downloaded), rename, move, copy, delete, send, av off, details | P m5 t4 t6| SOLVED: "Open with" incorrect |
| 11 | Landscape |  Long press on a file  | On the top menu appears the options to share, download (open with if it is downloaded), rename, move, copy, delete, send, av off, details | P m5 t4 t6| SOLVED: "Open with" incorrect |
|*Several selected options*||||||
| 12 | Portrait |  Long press to select more than one items  | On the top menu appears the options to sync, move, copy, delete | P m5 t6| SOLVED: "Open with" incorrect |
| 13 | Landscape | Long press to select more than one items | On the top menu appears the options to sync, move, copy, delete | P m5 t6| SOLVED: "Open with" incorrect |
| 14 | Number | Long press to select more than one items. Check with a huge number | On the top left menu appears the number of selected items. | P m5 t6| SOLVED: "Open with" incorrect |
|**Actions**||||||
|*Actions one file selected*||||||
| 15 | Share |  Select only one file and the option "Share" (only if branding option is enabled) | File can be shared as usually | P m5 t6|  |
| 16 | Move |  Select only one file and the option "Move"  | File can be moved as usually  | P m5 t6|  |
| 17 | Copy |  Select only one file and the option "Copy"  | File can be copied as usually  | P m5 t6|  |
| 18 | Download |  Select only one file and the option "Download"  | File can be downloaded as usually  | P m5 t6|  |
| 19 | Cancel Download |  Select only one file and the option "Download". When it is being downloaded, tap on cancel  | File is not downloaded  | P m5 t6|  |
| 20 | Sync |  Select only one downloaded file and the option "Sync"  | File can be synced as usually  | P m5 t6|  |
| 21 | Rename |  Select only one file and the option "Rename"  | File can be renamed as usually  | P m5 t6|  |
| 22 | Delete locally |  Select only one downloaded file and the option "Delete" and "local only"  | File can be deleted as usually  | P m5 t6|  |
| 23 | Delete from server |  Select only one file and the option "Delete" and "from server" | File can be deleted as usually  | P m5 t6|  |
| 24 | Send |  Select only one file and the option "Send"  | File can be send as usually  | P m5 t6|  |
| 25 | Av off |  Select only one file and the option "Av. off."  | File can be set as av. off. as usually  | P m5 t6|  |
| 26 | No Av off |  Select only one av. off. file and the option "No Av. off."  | File can be unset as av. off. as usually  | P m5 t6|  |
| 27 | Details |  Select only one file and the option "Details"  | Details are dislayed as usually | P m5 t6|  |
|*Actions several files selected*||||||
| 28 | Move |  Long press to select more than one files  | All selected files are moved to the new location  | P m5 t6| SOLVED: Incorrect icon |
| 29 | Copy |  Long press to select more than one files  | All selected files are copied to the new location | P m5 t6|  |
| 30 | Download |  Long press to select more than one files  | All selected files are downloaded to the device | P m5 t6|  |
| 31 | Cancel Download |  Long press to select more than one files and the option "Download". When they are being downloaded, tap on cancel | File is not downloaded  | P m5 t6|  |
| 32 | Delete locally |  Long press to select more than one files  | All selected files are deleted from the device, not from server| P m5 t6|  |
| 33 | Delete from server |  Long press to select more than one files  | All selected files are deleted from device and server | P m5 t6|  |
| 34 | Av off |  Long press to select more than one files  | All selected files are av. off. | P t4 m5| Just in case of t and several files and one of them already downloaded "Download" and Av Off will appear  |
| 35 | Unset Av off |  Long press to select more than one files that are av off| All selected files are not av. off. |  P t4 m5| New icon Av off strikethrough |
| 36 | Mixed Av off I|  Long press to select more than one files, some are av off and some other not. Choose "Set as av off"| All selected files are av. off. | P t6 m5 |  |
| 37 | Mixed Av off II|  Long press to select more than one files, some are av off and some other not. Choose "Unset as av off"| All selected files are not av. off. | P t6 m5 |  |
|*Actions one folder selected*||||||
| 38 | Share |  Long press to select a folder (only if branding option is enabled) | Folder is shared as usually | P m5 t6|  |
| 39 | Move |  Long press to select a folder | Folder is moved as usually | P m5 t6| SOLVED: Incorrect icon |
| 40 | Copy |  Long press to select a folder  | Folder is copied as usually | P m5 t6|  |
| 41 | Sync |  Long press to select a folder  | Folder is synced as usually | P m5 t6|  |
| 42 | Rename |  Long press to select a folder  | Folder is renamed as usually | P m5 t6|  |
| 43 | Delete locally|  Long press to select a folder  | Folder is deleted locally as usually | P m5 t6|  |
| 44 | Delete from server|  Long press to select a folder  | Folder is deleted from server as usually | P m5 t6|  |
|*Actions several folders selected*||||||
| 45 | Move I |  Long press to select more than one folder  | All selected folders are moved to the new location | P m5 t6 | SOLVED: Incorrect icon |
| 46 | Move II |  Long press to select more than one folder. Select as target one of the selected folders  | All selected are moved but the selected one. | P m5 t6| SOLVED: The target remains as selected |
| 47 | Copy |  Long press to select more than one folder  | All selected folders are copied to the new location | P m5 t6|  |
| 48 | Sync |  Long press to select more than one folder  | All selected folders are synced to the new location | P m5 t6|  |
| 48 | Cancel Sync |  Long press to select more than one folder  | Cancel the sync once it has been started | P m5 t6|  |
| 49 | Delete locally |  Long press to select more than one folder  | All selected folders are deleted locally and remain on server| P m5 t6|  |
| 50 | Delete from server|  Long press to select more than one folder  | All selected folders are deleted from server | P m5 t6|  |
|*Actions mixed items selected*||||||
| 51 | Move |  Long press to select more than one items (files and folders)  | All selected items are moved to the new location | P m5 t6|  |
| 52 | Copy |  Long press to select more than one items (files and folders) | All selected items are copied to the new location | P m5 t6|  |
| 53 | Sync |  Long press to select more than one items (files and folders) | All selected items are synced  | P m5 t6|  |
| 54 | Delete locally|  Long press to select more than one items (files and folders)  | All selected items are deleted locally and remain on server| P m5 t6|  |
| 55 | Delete from server|  Long press to select more than one items (files and folders)  | All selected items are deleted from server| P m5 t6|  |
|**External actions**||||||
| 56 | No internet connection  | 1. Switch the device connection off<br>2. Long press to select some items and try to move/copy/sync/delete  | Actions are not performed | P m5 t6|  |
| 57 | No server connection  | 1. Switch the server off.<br>2. Long press to select some items and try to move/copy/sync/delete them | Actions are not performed | P m5 t6|  |
| 58 | Copy + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Copy<br>4. Select a location target  | Selected files/folders are not copied | P m5 t6|  |
| 59 | Move + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Move<br>4. Select a location target  | Selected files/folders are not moved | P m5 t6 |  |
| 60 | Delete + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Delete<br> | Selected files/folders are not deleted | P m5 t6|  |
| 61 | Sync + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Sync | Selected files/folders are not synced | P m5 t6 | SOLVED: Deleted items counted |
| 62 | Copy + Deleted target |  1. Long press to select some items.<br>2. Select copy.<br>3. Select a location target.<br>4. In server, delete the location target  | Selected files/folders are not copied | P m5 t6|  |
| 63 | Move + Deleted target |  1. Long press to select some items.<br>2. Select move.<br>3. Select a location target.<br>4. In server, delete the location target  | Selected files/folders are not moved | P m5 t6|  |
| 64 | Credentials changed |  1. Long press to select some items.<br>2. In server, change credentials<br>3. Select any option move/copy/sync/delete.<br> | Credentials are required | P m5 t6 |  |
