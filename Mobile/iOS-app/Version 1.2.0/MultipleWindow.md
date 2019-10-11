###  Multiple Window

#### Pr: https://github.com/owncloud/ios-app/pull/498

Devices: iPadPro v13.1.2, iPadAir v12<br>
Server: 10.2.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Bookmark**|||||
| Swipe | Swipe left a bookmark of the list<br>Open in another window | Option to open in a new windows is displayed<br>Root folder is displayed in a separate window | P t13 | |  |
| Long press | Long press on a bookmark of the list<br>Open in another window | Option to open in a new windows is displayed<br>Root folder is displayed in a separate window | P t13 | |  |
| Long press - Edit | Long press on a bookmark of the list<br>Select Edit | Edit bookmark view is displayed | P t13 | |  |
| Long press - Manage | Long press on a bookmark of the list<br>Select Manage | Manage bookmark view is displayed | P t13 | |  |
| Long press - Delete | Long press on a bookmark of the list<br>Select Delete | Bookmark is deleted | P t13 | |  |
|**Folder**|||||
| Card | Open the card of a folder and select "Open in a new window" | Folder content is displayed in a separate window | P t13 | |  |
| Long press | Long press on a folder and select "Open in a new window" | Folder content is displayed in a separate window | P t13 | |  |
| Close Window | After opening a new window, open the folder card and select close window | Second window is closed |P t13  | |  |
| Close All | With only one window, select in the card "Close window" | App is closed | P t13| |  |
|**File**|||||
| Card | Open the card of a file and select "Open in a new window" | File detail is displayed in a separate window | P t13| |  |
| Long press | Long press on a file and select "Open in a new window" | File detail is displayed in a separate window | P t13| |  |
|**Move**|||||
| File | With multiple window, drag & drop a file to the other window | file is moved | P t13| |  |
| Folder | With multiple window, drag & drop a folder to the other window | folder is moved | P t13| |  |
| Multiple | With multiple window, drag & drop several items | items are moved | P t13| |  |
| Different account | With multiple window, drag & drop several items between different accounts | items are moved | F t13| not moved |  |
|**UI restoration**|||||
| Restore with multiple | Open multiple window and go to backgr<br>Reopen | Windows are displayed as before killing | | |  |
|**Regression**|||||
| iOS12| Check in a iOS12 device, the option is not there |  | P t12 | |  |