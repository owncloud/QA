### Spaces Permissions


**Devices**: Samsung A51, Android 12<br>
**Server**: 10.12.0


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**Files - oC10 & oCIS**||||
| Can edit |  1. User1 shares a txt file with User2 including edit permission<br>2. User2 opens the file with editor and modifies the file  | Changes are pushed to the server. Check in web | 
| Can not edit |  1. User1 shares a txt file with User2 without edit permission<br>2. User2 opens the file with editor and modifies the file  |  Error in upload to server. Check in web that file was not uplaoded|  |
| Label "open with" in read only mode | User1 shares a txt file with User2 without edit permission | Label "open with" adds a "read only" clarification in list of files, details view and preview | 
| Can share |  1. User1 shares a txt file with User2 including share permission<br>2. User2 shares with user3  | User3 has access to the file. Check in web | 
| Can not share |  1. User1 shares a txt file with User2 without share permission<br>2. User2 shares with user3 | Not posible. User3 does not have access to the file | 
| Can not move |   |  | 
| Can not delete |   | | 
| Can not rename |   |  | 
|**Folders - oCIS**||||
| Viewer |  Open an available space with viewer permission| FAB is hidden in all folders and subfolders | P m12 | |
| Writer - Manager | Open an available space with writer or manager permissions permission| FAB is displayed in all folders and subfolders |  P m12 | |
| Copy to viewer | 1. Select an item to copy<br>2. Select a space with viewer permission as target | Not allowed in picker |  P m12 | |
| Move to viewer | 1. Select an item to move<br>2. Select a space with viewer permission as target | Not allowed in picker |  P m12 | |
| Create folder in picker | 1. Select an item to move<br>2. Select a space with viewer permission as target | Option to create folder is hidden |  P m12 | |
|**Folders - oC10**||||
| Shared without permissions | 1. User1 shares a folder with User2 without edit permission<br>2. User2 uploads something to the shared folder | Error in upload to server. Check in web that file was not uplaoded |  P m12 | |
| Share from 3rd party app | 1. User1 shares a folder with User2 without edit permission <br>2. User2 opens Gallry/Photos app and shares some content with oC, choosing the shared folder | Option to select and create folder are hidden | P m12 | FIXED: Option available|
| Create folder in picker | 1. Select an item to move<br>2. Select a space with viewer permission as target | Option to create folder is hidden |  P m12 | |
|**Document provider**||||
| Viewer | In document provider, open an available space with viewer permission| No way to create folder| P m12 | |
| Copy to viewer | 1. In document provider, select an item to copy in any provider<br>2. Select a space with viewer permission as target | Not allowed | P m12 | |
| Move to viewer | 1. In document provider, select an item to move<br>2. Select a space with viewer permission as target | Not allowed  | P m12 | |
| Shared without permissions | In document provider, try to copy items to a shared folders without edit permission (oC10) | Not allowed  | P m12 | |