### 403 Forbidden error new handling

#### PRs: https://github.com/owncloud/ios-app/pull/632

Device/s: iPhoneX v13, iPadPro v13<br>
Server: 10.3.2, 10.4 (external storage & regex cases)


---

Prec: Every restriction over an existing folder. Easiest way to handle permissions is by sharing.
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Create forbidden**||||||
| Create Folder | Try to create a folder inside a folder with no creation permission | Not posible. Correct message | P m13 t13 |  |  |
| Move file inside | Try to move a file inside a folder with no creation permission | Not posible. Correct message | P m13 t13 |  |  |
| Copy file inside | Try to copy a file inside a folder with no creation permission | Not posible. Correct message | P m13 t13 |  |  |
| Rename | Try to rename a file inside a folder with no creation permission | Correct renamed | P m13 t13 |  |  |
| Duplicate | Try to duplicate a file inside a folder with no creation permission | Not posible. Correct message | P m13 t13 | FIXED: Should be prevented |  |
| Upload from Files | Try to upload a file from Files App inside a folder with no creation permission | Not posible. Correct message | P m13 t13 |  |  |
| Upload from Roll | Try to upload a media file from Photo library inside a folder with no creation permission | Not posible. Correct message | P m13 t13 |  |  |
| Instant upload | 1. Set a folder with no creation permisson as target for instant uploads<br>2. Get some pics from the camera | Should be not choosable | P m13 t13 | To improve |  |
| Scan document | Try to scan a document inside a folder with no creation permission | Not posible. Correct message | P m13 t13 |  |  |
| Public link | Try to create a public link on an item inside a folder with no creation permission | Link is created with only "Download/view" | P m13 | FIXED: Not opened |  |  |
| Markup - save copy | 1. Try to mark a picture inside a folder with no creation permission<br>2. Save as copy | Not posible. Correct message  | P m13 t13 |  |  |
| Server regex | 1. In server with 10.4 version, add a rule in config/config.php file to ban new content by using a regex (f.ex 'blacklisted_files_regex' => [ '.*\.jpg' ])<br>2. Upload some file that matches the banning regex | Not posible. Correct message  | P m13 t13 | FIXED: Error message improvable. FIXED: Loop in error message |  |
| Subfolders | Perform any creation operation inside a subfolder inside a folder with no creation permission | Not posible. Correct message  | P m13 t13 |  |  |
| Update | Try to update a file inside a folder with creation permission | File correctly updated | P m13 t13 | 
| Delete | Try to delete an item inside a folder with deletion permission | File Deleted | P m13 t13 | 
|**Delete forbidden**||||||
| Delete | Try to delete an item inside a folder with no deletion permission | Not posible | P m13 t13 | 
| Creation | Perform any creation operation (check section create forbidden) inside a folder with no deletion permission | File creation correct | P m13 t13 |  |  |
| Change | Try to mark up a picture inside a folder with no deletion permission | File correctly updated | P m13 t13 |  |  |
| Subfolders | Perform any deletion operation inside a subfolder inside a folder with no deletion permission | Not posible | P m13 t13 |  |  |
|**Change forbidden**||||||
| Creation | Perform any creation operation (check section create forbidden) inside a folder with no deletion permission | File creation correct | P m13 t13 |  |  |
| Markup - overwrite | Try to mark a picture inside a folder with no change permission<br>Overwrite original file | Not posible. Option hidden | P m13 t13 |  |  |
| Markup - save copy | Try to mark a picture inside a folder with no change permission<br>Save copy in new file | Correctly saved | P m13 t13 | FIXED: Not allowed |  |
| Delete | Try to delete an item inside a folder with no deletion permission, in Files App | Not posible. Correct message | P m13 t13 | 
| Subfolders | Perform any change operation inside a subfolder inside a folder with no change permission | Not posible | P m13 t13 |  |  |
|**External storage**||||||
| External storage read only | 1. In web UI > Settings > Storage, add a new external storage (f. ex., other ownCloud instance)<br>2. In the external storage, set "Read Only" (server versions >= 10.4)<br>3. In app, upload/copy/move something, create a new folder, duplicate content int the shared folder | Not posible. Options hidden<br>Check operations available in the items inside the folder: copy, move, open in, make av offline  | P m13 t13  |  |  |
| External storage with no permissions | 1. In web UI > Settings > Storage, add a new external storage (f. ex., other ownCloud instance, or a folder in your machine accesible via sFTP). It must not have write permissons<br>2. In app, upload/copy/move something, create a new folder, duplicate content into the shared folder | Error message. Not handled by oC since restriction is in the backend  | P m13 t13 |  |  |
|**Files app**||||||
| Creation | Perform any creation operation (check section create forbidden) in Files App inside a folder with no creation permission | Not posible, option disabled | P m13 t13 |  |  |
| Change | Try to mark a picture inside a folder with no change permission inside Files App| Not posible, option hidden | P m13 t13 |  |  |
| Delete | Try to delete an item inside a folder with no deletion permission, in Files App | Not posible, option hidden | P m13 t13 | 


