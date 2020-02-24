### 403 Forbidden error new handling

#### PRs: https://github.com/owncloud/ios-app/pull/632

Device/s: <br>
Server: 


---

Prec: Every restriction over an existing folder. Easiest way to handle permissions is by sharing.
 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Create forbidden**||||||
| Create Folder | Try to create a folder inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Move file inside | Try to move a file inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Copy file inside | Try to copy a file inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Rename | Try to rename a file inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Duplicate | Try to duplicate a file inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Upload from Files | Try to upload a file from Files App inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Upload from Roll | Try to upload a media file from Photo library inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Instant upload | 1. Set a folder with no creation permisson as target for instant uploads<br>2. Get some pics from the camera | Should be not choosable |  |  |  |
| Scan document | Try to scan a document inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Markup - save copy | 1. Try to mark a picture inside a folder with no creation permission<br>2. Save as copy | Not posible. Correct message  |  |  |  |
| External storage read only | 1. In web UI > Settings > Storage, add a new external storage (f. ex., other ownCloud instance)<br>2. In the external storage, set "Read Only"<br>3. In app, upload something to the shared folder | Not posible. Correct message  |  |  |  |
| Server regex | 1. In server with 10.4 version, add a rule in config/config.php file to ban new content by using a regex (f.ex 'blacklisted_files_regex' => [ '.*\.jpg' ])<br>2. Upload some filethat matches the banning regex | Not posible. Correct message  |  |  |  |
| Update | Try to update a file inside a folder with no creation permission | File correctly updated |  | 
| Delete | Try to delete an item inside a folder with no deletion permission | File Deleted |  | 
|**Delete forbidden**||||||
| Delete | Try to delete an item inside a folder with no deletion permission | Not posible |  | 
| Creation | Perform any creation operation (check section create forbidden) inside a folder with no deletion permission | File creation correct |  |  |  |
| Change | Try to mark up a picture inside a folder with no deletion permission | File correctly updated |  |  |  |
|**Change forbidden**||||||
| Creation | Perform any creation operation (check section create forbidden) inside a folder with no deletion permission | File creation correct |  |  |  |
| Markup - overwrite | Try to mark a picture inside a folder with no change permission<br>Overwrite original file | Not posible. Correct message |  |  |  |
| Delete | Try to delete an item inside a folder with no deletion permission, in Files App | Not posible. Correct message |  | 
|**Files app**||||||
| Creation | Perform any creation operation (check section create forbidden) in Files App inside a folder with no creation permission | Not posible. Correct message |  |  |  |
| Change | Try to mark a picture inside a folder with no change permission inside Files App| Not posible. Correct message |  |  |  |
| Delete | Try to delete an item inside a folder with no deletion permission, in Files App | Not posible. Correct message |  | 


