#### Clear Storage

#### Pr: https://github.com/owncloud/ios-app/pull/376

Devices: iPhone Plus v12.2, iPadAir v12.2
Server: 10.1

---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait  | Open Bookmark List and swipe left | Manage option displayed | P m12 t12 |  |  |
| Landscape | Open Bookmark List and swipe left | Manage option displayed | P m12 t12 |  |  |
| Manager portrait | Open Bookmark List and swipe left. Open Manager | Manager correctly displayed | P m12 t12 |  |  |
| Manager landscape | Open Bookmark List and swipe left. Open Manager | Manager correctly displayed | P m12 t12 |  |  |
|**Quota**||||||
| 1 Download | Add an account and download one file<br>Open manager | Device quota decreases in the size of the file. Use of files increases in the size of the file | P m12  t12|
| 10 Downloads | Add an account and download ten files<br>Open manager | Device quota decreases in the size of the files. Use of files increases in the size of the files | P m12  t12|
|**Action - Wipe data**||||||
| 1 file root| Add an account and download one file in root folder<br>In manager, remove offline | File is marked as not downloaded. Device quota increases | P m12 t12|
| 5 files root | Add an account and download five files in root folder<br>In manager, remove offline | Files are marked as not downloaded. Device quota increases | P m12 t12 |
| 1 file non-root| Add an account and download one file in non-root folder<br>In manager, remove offline | File is marked as not downloaded. Device quota increases | P m12 t12|
| 5 files non-root | Add an account and download five files in non-root folder<br>In manager, remove offline | Files are marked as not downloaded. Device quota increases | P m12 t12 |
| 50 files | Add an account and download 50 files in different folders<br>In manager, remove offline | All files is marked as not downloaded. Device quota increases | P m12 t12|
| 1 big file | Add an account and download a very big file (2 GB or more)<br>In manager, remove offline | File is marked as not downloaded. Device quota increases. Correct UX| P m12 t12|
| Many big files | Add an account and download a many big files<br>In manager, remove offline | Files are marked as not downloaded. Device quota increases. Correct UX | P m12 t12|
| Remove locally | Add an account and download a many big files<br>Remove locally these files<br>| In manager, space is wipped | P m12 t12| 
| Remove remote | Add an account and download a many big files<br>In webUI remove these files<br>| In manager, space is wipped | P m12 t12| 