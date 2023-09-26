### Uploads migration


Devices: Samsung A51 <br>
Server: 11.10


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**From 2.21**|||
| Empty | 1. Install 2.21 with no pending uploads<br>2. Update to 3.0 | Uploads view empty | P m12 |  |
| Only finished | 1. Install 2.21<br>2. Upload 30 files<br>3. Update to 3.0 | All finished uploads available in uploads view with correct size, time, account and folder | P m12 | No thumbnails?  |
| Only failed | 1. Install 2.21<br>2. Remove device connection<br>3. Upload 30 files<br>4. Update to 3.0<br>5. Retry uploads with device connection | 3. Uploads fail<br>4. All failed uploads available in uploads view with correct size, time, account and folder<br>5. Uploads completed | P m12 | FIXED: Enqueued but not completed |
| Only In progress | 1. Install 2.21<br>2. Upload one big file<br>3. Update to 3.0 | Upload resumed in uploads view  till it finishes | P m12 |  |
| In progress + finished | 1. Install 2.21<br>2. Upload many files (50)<br>3. Upload a big file and other files that will be enqueued<br>3. Update to 3.0 | Finished uploads in uploads view<br>In progress uploads resumed | P m12 |  |
| Finished + failed | 1. Install 2.21<br>2. Upload many files (50) and wait till it finishes<br>3. Upload some files to a folder that was deleted in another client or web<br>4. Update to 3.0 | Finished uploads in uploads view<br>Failed uploads in uploads view | P m12 |  |
| In progress + failed | 1. Install 2.21<br>2. Upload some files to an account in maintenance mode<br>3. Upload a big file to another account<br>4. Update to 3.0 before upload ends<br>5. Remove maintenance mode from first account and retry | 4. Failed uploads in uploads view<br>4. In progress upload resumed<br>5. Uploads resumed | P m12 |  |
| In progress + finished + failed| 1. Install 2.21<br>2. Upload many files (50) to account in server 1 and wait till they end<br>3. Stop server 1 and upload some files to a folder inside, to make them fail<br>4. Upload a bigfile to server 2<br>5. Update to 3.0 | Finished uploads in uploads view<br>In progress uploads resumed<br>Failed uploads in uploads view | P m12 |  |
| Multiaccount | 1. Install 2.21<br>2. Attach 3 accounts<br>3. Upload some files to every account and wait till they end<br>4. Upload some big files to every account<br>3. Before that uploads end, update to 3.0 | Finished uploads in uploads view<br>In progress uploads resumed | P m12 |  |
|**From 2.18 (Scoped Storage)**|||
| Only finished | 1. Install 2.x<br>2. Upload 30 files<br>3. Update to 3.0 | All finished uploads available in uploads view with correct size, time, account and folder | F m12 | FIXED: Crash. Uploads replayed |
| Only failed | 1. Install 2.x<br>2. Remove device connection<br>3. Upload 30 files<br>4. Update to 3.0 | 3. Uploads fail<br>4. All failed uploads available in uploads view with correct size, time, account and folder | P m12  | FIXED: Crash. Must be manually retried |
| Only In progress | 1. Install 2.x<br>2. Upload one big file<br>3. Update to 3.0 | Upload resumed in uploads view  | F m12 | FIXED: Crash. Do not end |
| In progress + finished | 1. Install 2.x<br>2. Upload many files (50)<br>3. Update to 3.0 | Finished uploads in uploads view<br>In progress uploads resumed | F m12 | In progress does not end. Finished disappear and retriggered|
| Finished + failed | 1. Install 2.x<br>2. Upload many files (50) and wait till it finishes<br>3. Upload some files to a folder that was deleted in another client or web<br>4. Update to 3.0 | Finished uploads in uploads view<br>Failed uploads in uploads view | F m12 | Finished retriggered |
| In progress + failed | 1. Install 2.x<br>2. Upload some files to an account in maintenance mode<br>3. Upload a big file to another account<br>4. Update to 3.0 before upload ends<br>5. Remove maintenance mode from first account and retry | 4. Failed uploads in uploads view<br>4. In progress upload resumed<br>5. Uploads resumed | F m12 | In progress does not end |
| In progress + finished + failed| 1. Install 2.2x<br>2. Upload many files (50) to account in server 1 and wait till they end<br>3. Stop server 1 and upload some files to a folder inside, to make them fail<br>4. Upload a bigfile to server 2<br>5. Update to 3.0 | Finished uploads in uploads view<br>In progress uploads resumed<br>Failed uploads in uploads view |  |  |
| Multiaccount | 1. Install 2.x<br>2. Attach 3 accounts<br>3. Upload some files to every account and wait till they end<br>4. Upload some big files to every account<br>3. Before that uploads end, update to 3.0 | Finished uploads in uploads view<br>In progress uploads resumed |  |  |