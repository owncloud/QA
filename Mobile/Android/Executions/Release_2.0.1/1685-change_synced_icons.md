###  Sync: Change wording and syncing icons

#### Pr: https://github.com/owncloud/android/pull/1685

Devices: Nexus5 v5.0.1, HTC One v4.3, Nexus 7 v4.3

Server: v9.0.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Wording in Menu**||||||
| 1 | Available offline portrait | With portrait orientation, long press on a file<br>|Menu is diplayed with the option "Set as available offline"| P m5 t4 | |
| 2 | Available offline lardscape | With landscape orientation, long press on a file<br>|Menu is diplayed with the option "Set as available offline"| P m5 t4 | |
| 3 | Folders |Long press on a folder<br>|Menu is diplayed without any option related to "available offline"| P m5 t4| |
|**Sync icons - List View**||||||
| 4 | Initial status | Log in in a new account that contains several files and folders  | Files and folders do not show any icon | P m5 t4 | |
| 5 | Syncing folder | Long press on a folder which contains a lot of files  | When folder is being synced, an icon with two double circled white arrows on a blue circle is shown on top right. When syncing ends, the icon disappears | P m5 t4 | |
| 6 | Download | Tap in some files  | Files are downloaded and a icon is shown in top right: white tick on a green circle | P m5 t4| |
| 7 | Not Downloaded + Available offline | Long press on a non-downloaded file and select "Set as available offline"  | File is downloaded and are shown two icons:  white tick on a green circle (top right) and yellow arrow with a bar underneath (bottom right)| P m5 t4| |
| 8 | Downloaded + Available offline | Long press on a downloaded file and select "Set as available offline"  | Two icons are shown:  white tick on a green circle (top right) and yellow arrow with a bar underneath (bottom right). File keeps on being downloaded| P m5 t4 | Need refresh to show the icon |
| 9 | Unavailable offline | On an available offline file, long press and select "Unset as available offline"| The yellow arrow with a bar underneath disappears| P m5 t4| Need refresh to hide the icon |
| 10 | Delete locally + Not available offline | Long press on a downloaded file that is not available offline, and select "delete locally" | No icons are shown| P m5 t4| |
| 11 | Conflict | 1. Set the device connection off<br>2. Modify a downloaded txt file in the device and in server side<br>3. Set the device connection on<br>4. Long press and select "Synchronize"<br>5. Solve the conflict| 4. A red "X" is shown on top right<br>5. A white tick over green circle is shown on top right| P m5 t4| |
| 12 | Conflict + Available offline | 1. Set the device connection off<br>2. Modify an availble offline txt file in the device and in server side<br>3. Set the device connection on<br>4. Pull down in device<br>5. Solve the conflict| 4. A red "X" is shown on top right<br>5. A white tick over green circle is shown on top right| P m5 t4| |
|**Sync icons - Grid View**||||||
| 13 | Initial status | Log in in a new account that contains several files and folders  | Files and folders do not show any icon | P m5 t4| |
| 14 | Syncing folder | Long press on a folder which contains a lot of files  | When folder is being synced, an icon with two double circled white arrows on a blue circle is shown on top right. When syncing ends, the icon disappears | P m5 t4| |
| 15 | Download | Tap in some files  | Files are downloaded and a icon is shown in top right: white tick on a green circle | P m5 t4| |
| 16 | Not Downloaded + Available offline | Long press on a non-downloaded file and select "Set as available offline"  | File is downloaded and are shown two icons:  white tick on a green circle (top right) and yellow arrow with a bar underneath (bottom right)| P m5 t4| |
| 17 | Downloaded + Available offline | Long press on a downloaded file and select "Set as available offline"  | Two icons are shown:  white tick on a green circle (top right) and yellow arrow with a bar underneath (bottom right). File keeps on being downloaded| P m5 t4| Need refresh to show the icon |
| 18 | Unavailable offline | On an available offline file, long press and select "Unset as available offline"| The yellow arrow with a bar underneath disappears| P m5 t4| Need refresh to show the icon |
| 19 | Delete locally + Not available offline | Long press on a downloaded file that is not available offline, and select "delete locally" | No icons are shown| P m5 t4| |
| 20 | Conflict | 1. Set the device connection off<br>2. Modify a downloaded txt file in the device and in server side<br>3. Set the device connection on<br>4. Long press and select "Synchronize"<br>5. Solve the conflict| 4. A red "X" is shown on top right<br>5. A white tick over green circle is shown on top right| P m4 m5| |
| 21 | Conflict + Available offline | 1. Set the device connection off<br>2. Modify an availble offline txt file in the device and in server side<br>3. Set the device connection on<br>4. Pull down in device<br>5. Solve the conflict| 4. A red "X" is shown on top right<br>5. A white tick over green circle is shown on top right| P m4 t4 m5| |
