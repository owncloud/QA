###  Sync: Change wording and syncing icons

#### Pr: https://github.com/owncloud/ios/pull/690

Devices: iPhone6 v9.3.2, iPadAir v8.4

Server: 9.1beta2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Wording in Menu**||||||
| 1 | Available offline portrait | With portrait orientation, swipe on a file, and "more"<br>|Menu is diplayed with the option "Available offline"| P m9 t8 | |
| 2 | Available offline landscape | With landscape orientation, long press on a file<br>|Menu is diplayed with the option "Available offline"| P m9 t8 | |
| 3 | Not Available offline portrait | With portrait orientation, swipe on a file, and "more"<br>|Menu is diplayed with the option "Not available offline"| P m9 t8 | |
| 4 | Not Available offline landscape | With landscape orientation, long press on a file<br>|Menu is diplayed with the option "Not available offline"| P m9 t8 | |
|**Sync icons**||||||
| 5 | Initial status | Log in in a new account that contains several files and folders  | Files and folders do not show any icon | P m9 t8 | |
| 6 | Download folder | Swipe on a folder which contains a lot of files to download them  | When folder is being downloaded, an icon with two double circled white arrows on a blue circle is shown on top right. When downloading ends, the icon disappears | P m9 t8 | |
| 7 | Cancel Download folder | 1. Swipe on a folder which contains a lot of files to download them<br>2. Swipe to cancle the download  | When folder is being downloaded, an icon with two double circled white arrows on a blue circle is shown on top right.<br>2. Icon disappears | P m9 t8 | |
| 8 | Download files | Tap in some files  | Files are downloaded and a icon is shown in top right: white tick on a green circle | P m9 t8 | |
| 9 | Cancel Download files | 1. Tape on a file to download<br>2. Tap on (x) to cancel the download | 1. The blue circle icon is shown during the download<br>2. Icon disappears | P m9 t8 | |
| 10 | Not Downloaded file + Available offline | Swipe on a non-downloaded file and select "Set as available offline"  | During the download the blue circle icon is shown. File is downloaded and are shown two icons:  white tick on a green circle (top right) and yellow arrow with a bar underneath (bottom right)| P m9 t8 | |
| 11 | Downloaded file + Available offline | Swipe on a downloaded file and select "Set as available offline"  | Two icons are shown:  white tick on a green circle (top right) and yellow arrow with a bar underneath (bottom right). File keeps on being downloaded| P m9 t8  |  |
| 12 | Not Downloaded folder + Available offline | Swipe on a non-downloaded folder and select "Available offline"<br>2. Browse into the folder | During the download the blue circle icon is shown. Finally, that icon disappears and no icon is shown.<br>All filles into the folder have the green tick icon| P m9 t8 | |
| 13 | Downloaded folder + Available offline | Swipe on a downloaded folder and select "Available offline" | During the download the blue circle icon is shown. Finally, that icon disappears the yellow arrow is shown.<br>All filles into the folder have the green tick and yellow arrow icons | P m9 t8 |  |
| 14 | Unavailable offline file| On an available offline file, swipe and select "Not available offline"| The yellow arrow  disappears| F m9 t8 | Yellow arrow does not disappear |
| 15 | Unavailable offline folder| On an available offline folder, swipe and select "Not available offline"| The yellow arrow disappears on folder and on all the contained files| F m9 t8 | Yellow arrow does not disappear | |
| 16 | Delete locally + Not available offline | Swipe on a downloaded file that is not available offline, and select "delete locally" | No icons are shown| P m9 t8 | |
| 17 | Conflict | 1. Upload a file<br>2. Upload again the same file<br>3. Solve the conflict with "overwrite"| 2. Conflict is detected<br>3. The blue circle icon is shown while the file is being overwritten| | |
| 18 | File new version | 1. In app, download a file<br>2. In server, update the file<br>3. In app, pull down<br>4. Tap on the file| 1. Tick over green background is shown<br>3. New version is detected and background becomes grey<br>4 File is updated and icon becomes green again | P m9 t8 | |
| 19 | New version + Available offline| 1. In app, set a file as available offline<br>2. In server, update the file<br>3. In app, pull down| 1. Yellow arrow and green tick are shown<br>3. New version is detected and tick background becomes grey during the update. Finally, it becomes green again | P m9 t8 | |
| 20 | Update Folder + Available offline| 1. In app, set a folder as available offline<br>2. In server, upload some files into the folder<br>3. In app, pull down| 1. Yellow arrow is shown<br>3. New version is detected and blue circle is shown during the update. Finally, it disappears | P m9 t8 | |