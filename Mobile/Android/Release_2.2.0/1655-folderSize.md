### Folder Size - Sort by Size

#### Pr: https://github.com/owncloud/android/pull/1655 

Server:

Devices:


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Folder Size**||||||
| 1 | Empty in root | Create a new folder in root | Folder size is 0B |  |  |
| 2 | Empty in no-root | Create a new folder in no-root folder | Folder size is 0B |  |  |
| 3 | Size < 1MB | Upload a file that size is < 1 MB into a folder | Size is correctly shown as xx KB (check in portrait and landscape) |  |  |
| 4 | Size > 1MB | Upload a file that size is >= 1 MB into a folder | Size is correctly shown as xx MB (check in portrait and landscape) |  |  |
| 5 | Upload | From a non-empty folder, upload more files into the folder | Size is updated |  |  |
| 6 | Upgrade | From a non-empty folder, upgrade any file into the folder | Size is updated |  |  |
| 7 | Delete | From a non-empty folder, delete some content | Size is updated |  |  |
| 8 | Delete all | From a non-empty folder, delete all content | Size is 0B |  |  |
| 9 | Subfolders | 1. Create a deep stucture of folders, and upload files into all of them <br>2. Try to upload/delete some content| The folder size is correct in all the folders of the structure |  |  |
|**Sort by Size**||||||
| 10 | View | Tap on (...) menu and select "Sort" | The option "Biggest - Smallest" is shown with the other two options (check in portrait and landscape) |  |  |
| 11 | Sort in List view | 1. With list view, select to sort a folder by size | File list is correctly sorted |  |  |
| 12 | Sort in Grid view | 1. With grid view, select to sort a folder by size | File list is correctly sorted |  |  |
| 13 | Upload new file | 1. Sort by size<br>2. Upload a new file into the folder | File list is correctly sorted with the new file|  |  |
| 14 | Upload several files | 1. Sort by size<br>2. Upload a new file into the folder | File list is correctly sorted with the new file|  |  |
| 15 | Upgrade av. offline | 1. Sort by size<br>2. Upgrade an av. offline file into the folder | File list is correctly sorted |  |  |
| 16 | Delete file | 1. Sort by size<br>2. Delete a file into the folder | File list is correctly sorted without the deleted file|  |  |
| 17 | Delete several files | 1. Sort by size<br>2. Delete several files into the folder | File list is correctly sorted without the deleted files|  |  |
|**External Actions**||||||
| 18 | Upload | 1. In server side, upload some content into a folder sorted by size<br>2. In app, pull down to refresh | Size is updated and folder is re-sorted correctly |  |  |
| 19 | Delete | 1. In server side, delete some content from a folder sorted by size<br>2. In app, pull down to refresh | Size is updated and folder is re-sorted correctly|  |  |
| 20 | Upgrade | 1. In server side, upgrade some content into a folder sorted by size<br>2. In app, pull down to refresh | Size is updated and folder is re-sorted correctly|  |  |
| 21 | Upgrade av. offline | 1. In server side, upgrade some av. offline file into a folder sorted by size | Size is updated and folder is re-sorted correctly|  |  |
|**Document Provider**||||||
| 22 | File list | 1. Set sort by size<br>2. Share a file with ownCloud using the document provider | File list shows the size of the folders sorted by size|  |  |