###  Sharing Shortcuts v12.0

Devices: <br>
Server: oCIS 2.0.0, oC 10.11.0


---

 
| Test Case | Description | Expected | Result | Comment |
| :-------- | :---------- | :------- | :-----: | :----- | 
| **Shared with me** | To be done oCIS - oC10  |  |
| Shared with me, one file |1. User1 shares a file with User2<br>2. User2 checks the "Shared with me" section in the app | File is listed in "Pending" | P m16 t15 |  |
| Shared with me, one folder |1. User1 shares a folder with User2<br>2. User2 checks the "Shared with me" section in the app | Folder is listed in "Pending" | P m16 t15 |  |
| Accept pending file | 1. User2 accepts any shared file in pending section | File is listed in "Accepted"| F m16 t15 |  |
| Accept pending folder | 1. User2 accepts any shared folder in pending section | Folder is listed in "Accepted"|  F m16 t15 | Blank view, need to browse to refresh |
| Decline pending file | 1. User2 declines any shared file in pending section | File is listed in "Declined"| P m16 t15 |  |
| Decline pending folder | 1. User2 declines any shared folder in pending section | Folder is listed in "Declined"| P m16 t15 |  |
| Unshare approved file | 1. User2 unshares any shared (approved) file in pending section, using the available option in three-dot-button | File is listed in "Declined"| P m16 t15 |  |
| Unshare approved folder |  User2 unshares any shared (approved) folder in pending section, using the available option in three-dot-button | Folder is listed in "Declined"| P m16 t15 |  |
| Accept declined file | 1. User2 accepts any file in declined section | File is listed in "Accepted"| P m16 t15 |  |
| Accept declined folder | 1. User2 accepts any folder in declined section | Folder is listed in "Accepted"|  P m16 t15 |  |
| Unshare pending file | 1. User2 swipes any file in the pending section | File is listed in "Declined"| P m16 t15 |  |
| Unshare pending folder | 1. User2 swipes any folder in the pending section | Folder is listed in "Declined"|  P m16 t15|  |
| Unshare accepted file | 1. User2 swipes any file in the accepted section | File is listed in "Declined"| F m16 t15 | Item in both sections if unshared from other client |
| Unshare accepted folder | 1. User2 swipes any folder in the accepted section | Folder is listed in "Declined"| F m16 t15 | Item in both sections if unshared from other client|
| Owner remove shared file | 1. User2 remove User1 as recipient of the file<br>2. User2 checks the "Shared with me" section in the app | File is not listed in any section| P m16 t15 |  |
| Owner remove shared folder | 1. User2 remove User1 as recipient of the folder<br>2. User2 checks the "Shared with me" section in the app | Folder is not listed in any section| P m16 t15 |  |
| Same file twice | 1. User1 and User2 shares with User3 an item with same name<br>2. User3 accepts both<br>3. User3 unshares both| 1. Both items listed in "Pending"<br>2. Both items listed in "Accepted"<br>3. Both items listed in "Declined"| P m16 t15 |  |
| Reshare | 1. User1 shares with User2 an item with all permissions granted<br>2. User2 accepts share<br>3. User2 shares item with User3| User3 with the item in "Pending" | F m16 t15 | Resharing does not work |
| **Shared by me** | To be done oCIS - oC10  |  |
| File shared by me | User1 shares a file with User2 | File is listed in "Shared by me" pointing to User2 | P m16 t15 |  |
| Folder shared by me | User1 shares a folder with User2 | Folder is listed in "Shared by me" pointing to User2 | P m16 t15 |  |
| Pointer | 1. User1 shares a folder with User2<br>2. In "Shared by me" section, User1 clicks on the right arrow | Moved to the item in folder structure| P m16 t15 |  |
| Unshare | 1. User1 shares a folder with User2<br>2. In "Shared by me" section, User1 swipes item to unshare  | Item removed from User1's "Shared by me" and not accesible to User2 anymore | F m16 t15 | Not posible<br>Action missing in oC10  |
| **Shared by link** | To be done oCIS - oC10  |  |
| Link on file | Create a link over a file | File is listed in "Shared by link"  | P m16 t15 |  |
| Link on folder | Create a link over a folder | Folder is listed in "Shared by link"  | P m16 t15 |  |
| Copy action | 1. Create a link over any item<br>2. Open "Shared by link" and click on "Copy" for the item<br>4. Paste it in any editor | Link correct (compare wit web)  | P m16 t15 |  |
| Pointer | 1. Create a link over any item<br>2. Open "Shared by link"<br>3. Click on the right arrow | Moved to the item in folder structure| P m16 t15 |  |
| Unshare | 1. Create a link over any item<br>2. Open "Shared by link"<br>3. Swipe left on the item to unshare  | Item removed from  "Shared by me" | F m16 t15 |  |
