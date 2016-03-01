###  Sort by date/alphabetical 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server:

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----- | :-------------- |
|**View**||||||
| 1 | Change options button |  1. Open app  |  1. In top-right appears ... instead of (+)  |  |  |
| 2 | Sort option portrait |  1. Tap on (...) with the device in portrait<br>2.Tap on "Sort"  |  1. An option "Sort" appears<br>2. Two options are displayed: "A-Z" and "Newest - Oldest"  |  |  |
| 3 | Sort option landscape |  1. Tap on (...) with the device in landscape<br>2.Tap on "Sort"  |  1. An option "Sort" appears<br>2. Two options are displayed: "A-Z" and "Newest - Oldest"  |  |  |
|**Sort by**||||||
| 4 | A-Z  |  1. Upload some files and folders on root, some of the with special characters<br>2. Tap on (...) and select Sort by 'A-Z'<br> 3. Browse in a folder | 2. The content appears sorted by A-Z. First folders, then files<br>3. The order is the same as previous step |  |
| 5 | Date |  1. Upload some files and folders on root, some of the with special characters<br>2. Tap on (...) and select Sort by 'Date'<br> 3. Browse in a folder | 2. The content appears sorted by date. No matter whether is file or folder<br>3. The order is the same as previous step |  |  |
|**Actions**||||||
| 6 | Rename - by A-Z |  1. In a populated folder, set sort by 'A-Z'<br>2. Rename a file or folder<br> | The renamed item is set correctly with its new name |  |  |
| 7 | Rename - by Date |  1. In a populated folder, set sort by Date<br>2. Rename a file or folder<br> | The order does not change |  |  |
| 8 | Update - by A-Z |  1. In web, upload some files. A few minutes later create a txt file, and after that update more files<br>2. Set sort by A-Z<br>3. With an external app, change the  txt file | 2. The content is correctly sorted by date, first the newest.<br>3. The order does not change |  |  |
| 9 | Update - by Date |  1. In web, upload some files. A few minutes later create a txt file, and after that update more files<br>2. Set sort by date<br>3. With an external app, change the  txt file | 2. The content is correctly sorted by date, first the newest.<br>3. The txt file is set on the top of the list |  |  |
| 10 | Move - by A-Z |  1. In a populated folder, set sort by 'A-Z'<br>2. Move a file or folder to another location<br> | The content is correctly sorted by 'A-Z' |  |  |
| 11 | Move - by Date|  1. In a populated folder, set sort by Date<br>2. Move a file or folder to another location<br> | The content is correctly sorted by Date |  |  |
| 12 | Delete - by A-Z |  1. In a populated folder, set sort by 'A-Z'<br>2. Delete a file or folder<br> | The content is correctly sorted by A-Z |  |  |
| 13 | Delete - by Date |  1. In a populated folder, set sort by Date<br>2. Delete a file or folder<br> | The content is correctly sorted by Date|  |  |
|**External Actions**||||||
| 14 | Rename (A-Z) |  1. In app, set sort by 'A-Z'<br>2. In the web rename a file or folder<br>3. In app, pull down | The renamed item is set correctly with its new name |  |  |
| 15 | Rename (Date)|  1. In app, set sort by 'Date'<br>2. In the web rename a file or folder<br>3. In app, pull down | The order does not change |  |  |
| 16 | Delete |  1. In the web delete a file or folder<br>2. In app, pull down | The deleted  item does not appear anymore, and the content is correctly sorted (Date/A-Z) |  |  |
| 17 | Move |  1. In the web move a file or folder to another location<br>2. In app, pull down | The moved item does not appear anymore in the corrent folder, and the content is correctly sorted (Date/A-Z) |  |  |
| 18 | Update file in web (Date)|  1. In app, set sort by 'Date'<br>2. In the web, change the content a txt file <br>3. In app, pull down | The updated file appears on the top |  |  |
| 19 | Update file in web (A-Z)|  1. In app, set sort by 'A-Z'<br>2. In the web, change the content a txt file <br>3. In app, pull down | The order does not change |  |  |
| 20 | Update file with doc provider (Date) |  1. Set "sorted by Date"<br>2. Open a txt file with an external app using doc provider <br>3. Change the file and save it | The updated file appears on the top |  |  |
| 21 | Update file with doc provider (A-Z)|  1. Set "sorted by A-Z"<br>2. Open a txt file with an external app using doc provider <br>3. Change the file and save it | The order does not change |  |  |
| 22 | Update folder - by Date |  1. Set sort by Date<br>2. With an external app or the web, upload files into a folder| The uploaded folder is on the top |  |  |
| 23 | Update folder - by A-Z |  1. Set sort by A-Z<br>2. With an external app or the web, upload files into a folder| The order does not change |  |  |