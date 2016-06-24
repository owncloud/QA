###  Multiselect 

#### Pr: https://github.com/owncloud/android/pull/1176 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**List View**||||||
|*One folder options*||||||
| 1 | Portrait |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete |  |  |
| 2 | Landscape |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete |  |  |
|*One file options*||||||
| 3 | Portrait |  Long press on a file  | On the top menu appears the options to share, download, rename, move, copy, delete, send, av off, details |  |  |
| 4 | Landscape |  Long press on a file  | On the top menu appears the options to share, download, rename, move, copy, delete, send, av off, details |  |  |
|*Several selected options*||||||
| 5 | Portrait |  Long press to select more than one items  | On the top menu appears the options to sync, move, copy, delete |  |  |
| 6 | Landscape | Long press to select more than one items | On the top menu appears the options to sync, move, copy, delete |  |  |
| 7 | Number | Long press to select more than one items. Check with a huge number | On the top left menu appears the number of selected items. |  |  |
|**Grid View**||||||
|*One folder options*||||||
| 8 | Portrait |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete |  |  |
| 9 | Landscape |  Long press on a folder | On the top menu appears the options to share, sync, rename, move, copy, delete |  |  |
|*One file options*||||||
| 10 | Portrait |  Long press on a file  | On the top menu appears the options to share, download, rename, move, copy, delete, send, av off, details |  |  |
| 11 | Landscape |  Long press on a file  | On the top menu appears the options to share, download, rename, move, copy, delete, send, av off, details |  |  |
|*Several selected options*||||||
| 12 | Portrait |  Long press to select more than one items  | On the top menu appears the options to sync, move, copy, delete |  |  |
| 13 | Landscape | Long press to select more than one items | On the top menu appears the options to sync, move, copy, delete |  |  |
| 14 | Number | Long press to select more than one items. Check with a huge number | On the top left menu appears the number of selected items. |  |  |
|**Actions**||||||
|*Actions one file selected*||||||
| 15 | Share |  Select only one file and the option "Share" (only if branding option is enabled) | File can be shared as usually |  |  |
| 16 | Move |  Select only one file and the option "Move"  | File can be moved as usually  |  |  |
| 17 | Copy |  Select only one file and the option "Copy"  | File can be copied as usually  |  |  |
| 18 | Download |  Select only one file and the option "Download"  | File can be downloaded as usually  |  |  |
| 19 | Cancel Download |  Select only one file and the option "Download". When it is being downloaded, tap on cancel  | File is not downloaded  |  |  |
| 20 | Sync |  Select only one downloaded file and the option "Sync"  | File can be synced as usually  |  |  |
| 21 | Rename |  Select only one file and the option "Rename"  | File can be renamed as usually  |  |  |
| 22 | Delete locally |  Select only one downloaded file and the option "Delete" and "local only"  | File can be deleted as usually  |  |  |
| 23 | Delete from server |  Select only one file and the option "Delete" and "from server" | File can be deleted as usually  |  |  |
| 24 | Send |  Select only one file and the option "Send"  | File can be send as usually  |  |  |
| 25 | Av off |  Select only one file and the option "Av. off."  | File can be set as av. off. as usually  |  |  |
| 26 | No Av off |  Select only one av. off. file and the option "No Av. off."  | File can be unset as av. off. as usually  |  |  |
| 27 | Details |  Select only one file and the option "Details"  | Details are dislayed as usually |  |  |
|*Actions several files selected*||||||
| 28 | Move |  Long press to select more than one files  | All selected files are moved to the new location  |  |  |
| 29 | Copy |  Long press to select more than one files  | All selected files are copied to the new location |  |  |
| 30 | Download |  Long press to select more than one files  | All selected files are downloaded to the device |  |  |
| 31 | Cancel Download |  Long press to select more than one files and the option "Download". When they are being downloaded, tap on cancel | File is not downloaded  |  |  |
| 32 | Delete locally |  Long press to select more than one files  | All selected files are deleted from the device, not from server|  |  |
| 33 | Delete from server |  Long press to select more than one files  | All selected files are deleted from device and server |  |  |
| 34 | Av off |  Long press to select more than one files  | All selected files are av. off. |  |  |
|*Actions one folder selected*||||||
| 35 | Share |  Long press to select a folder (only if branding option is enabled) | Folder is shared as usually |  |  |
| 36 | Move |  Long press to select a folder | Folder is moved as usually |  |  |
| 37 | Copy |  Long press to select a folder  | Folder is copied as usually |  |  |
| 38 | Sync |  Long press to select a folder  | Folder is synced as usually |  |  |
| 39 | Rename |  Long press to select a folder  | Folder is renamed as usually |  |  |
| 40 | Delete locally|  Long press to select a folder  | Folder is deleted locally as usually |  |  |
| 41 | Delete from server|  Long press to select a folder  | Folder is deleted from server as usually |  |  |
|*Actions several folders selected*||||||
| 42 | Move I |  Long press to select more than one folder  | All selected folders are moved to the new location |  |  |
| 43 | Move II |  Long press to select more than one folder. Select as target one of the selected folders  | All selected are moved but the selected one. |  |  |
| 44 | Copy |  Long press to select more than one folder  | All selected folders are copied to the new location |  |  |
| 45 | Sync |  Long press to select more than one folder  | All selected folders are synced to the new location |  |  |
| 46 | Delete locally |  Long press to select more than one folder  | All selected folders are deleted locally and remain on server|  |  |
| 47 | Delete from server|  Long press to select more than one folder  | All selected folders are deleted from server |  |  |
|*Actions mixed items selected*||||||
| 48 | Move |  Long press to select more than one items (files and folders)  | All selected items are moved to the new location |  |  |
| 49 | Copy |  Long press to select more than one items (files and folders) | All selected items are copied to the new location |  |  |
| 50 | Sync |  Long press to select more than one items (files and folders) | All selected items are synced  |  |  |
| 51 | Delete locally|  Long press to select more than one items (files and folders)  | All selected items are deleted locally and remain on server|  |  |
| 52 | Delete from server|  Long press to select more than one items (files and folders)  | All selected items are deleted from server|  |  |
|**External actions**||||||
| 53 | No internet connection  | 1. Switch the device connection off<br>2. Long press to select some items and try to move/copy/sync/delete  | Actions are not performed |  |  |
| 54 | No server connection  | 1. Switch the server off.<br>2. Long press to select some items and try to move/copy/sync/delete them | Actions are not performed |  |  |
| 55 | Copy + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Copy<br>4. Select a location target  | Selected files/folders are not copied |  |  |
| 56 | Move + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Move<br>4. Select a location target  | Selected files/folders are not moved |  |  |
| 57 | Delete + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Delete<br> | Selected files/folders are not deleted |  |  |
| 58 | Sync + Delete selected |  1. Long press to select some items.<br>2. In server, delete some on them.<br>3. Select Sync | Selected files/folders are not synced |  |  |
| 59 | Copy + Deleted target |  1. Long press to select some items.<br>2. Select copy.<br>3. Select a location target.<br>4. In server, delete the location target  | Selected files/folders are not copied |  |  |
| 60 | Move + Deleted target |  1. Long press to select some items.<br>2. Select move.<br>3. Select a location target.<br>4. In server, delete the location target  | Selected files/folders are not moved |  |  |
| 61 | Credentials changed |  1. Long press to select some items.<br>2. In server, change credentials<br>3. Select any option move/copy/sync.<br> | Credentials are required |  |  |