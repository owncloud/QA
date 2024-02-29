### Documents provider (SAF)

**Server(s)**: oC 10.13.4<br>
**Device(s)**: Samsung Galaxy Tab A8, Android 13. Pixel2, Android 11<br>
**Execution date**: 15/02/2024<br>
**Tester**:  jrecio<br>
**Context**: Sanity check over the feature and gather all existing problems in an epic<br>

---

Recommended app to test: [Files](https://play.google.com/store/apps/details?id=com.marc.files)
 
| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :-----: | :------
|**Add/List account**|||||
| Add one account | 1. Add one account to oC<br>2. Open Doc. provider app | Account available in SAF | P t13 |
| Add two accounts | 1. Add two accounts from different servers to oC<br>2. Open Doc. provider app | Both accounts available in SAF| P t13  | 
| Same server | Add two accounts of the same server to oC<br>Open Doc. provider app  | Both accounts available in SAF | P t13  |
| Personal and Custom spaces | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider | Account is listed in SAF<br>All spaces listed in root level  | P t13  |  |
| Add new space | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. In web, add a new space<br>4. In document provider app, pull to refresh | New space is listed in SAF| P t13 |  |
| Remove existing space | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. In web, remove an existing space<br>4. In document provider app, pull to refresh | Space removed is no longer listed  in SAF| P t13 |  |
| Two accounts with spaces | 1. Add two oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. Switch to one account to other in the Document Provider app | Both apps showing their correct list of spaces in SAF| P t13  |  |
| Space disabled | 1. Add oCIS accounts<br>2. In web, disable existing space<br>3. Open any app with access to Document Provider | Disabled space is not listed in SAF|  P t13 |   |
|**Remove account**| Accounts added before||||
| Remove one account | Remove one account from oC<br>Open Doc. provider app | Account not available anymore  in SAF | P t13 |
| Remove two account | Remove two accounts from oC<br>Open Doc. provider app | Both accounts not available anymore  in SAF | P t13 |
| Remove all accounts | Remove all accounts from oC<br>Open Doc. provider app | No accounts available  in SAF| P t13 |
| Uninstall the app | Uninstall the oC app from the device | All accounts no longer available in SAF| P t13|
|**Browse**|||||
| Browse oC10 | Browse through folder structure in different accounts | Correct browsing, all items displayed  in SAF | P t13 |
| Browse Personal oCIS | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Browse through space in document provider app| 2. Root folder listed in SAF<br>3. All folders' content is listed  | P t13 |  |
| Browse No Personal oCIS | 1. Add oCIS account with custom spaces<br>2. Open any app with access to Document Provider to open the custom spaces<br>3. Browse through spaces in document provider app| All folders' content is listed in custom spaces in SAF| P t13 |  |
| Setting disabled | 1. Add some accounts<br>2. In app Settings, go to `Security` and click option `Lock access from document provider`<br>3. Open any app with access to Document Provider | Access to oC locked in all accounts in SAF| P t13 |  |
|**Create folder**|||
| Create folder root | Create a folder in root folder in SAF | Correctly created, check in the app or web UI | P t13 | 
| Create folder non-root | Create a folder in non-root folder in SAF | Correctly created, check in the app or web UI |P t13  | 
| Create folder existing | Create a folder with existing name in SAF | Error: `Failed to create folder` |P t13   |
| Folder with special characters | Create folder with special characters like &%ä^ in SAF | Correctly created, check in the app or web UI |P t13  |
| Folder with forbidden characters | Create folder with for6bidden characters like \ or /  in SAF| Error: `Failed to create folder`| P t13 | 
| Folder with longer name as allowed | Create folder with a longer than 256 characters name in SAF| Error: `Failed to create folder` | P t13  |
| No internet connection | Create folder with no internet connection in SAF| Error: `Failed to create folder` | P t13  |
| No server connection | Create folder with no server connection in SAF| Error: `Failed to create folder` | P t13 |
| Maintenance mode (oC10) | Create folder with server in maintenance mode in SAF| Error: `Failed to create folder` | P t13 |
|**Rename**|||
| Rename file root | Rename a file in root folder in SAF | Correctly renamed, check in the app or web UI | P t13 |
| Rename file non-root | Rename a file in non-root folder in SAF | Correctly renamed, check in the app or web UI | P t13|
| Rename folder root | Rename a folder in root folder in SAF | Correctly renamed, check in the app or web UI | P t13 |
| Rename folder non-root | Rename a folder in non-root folder in SAF | Correctly renamed, check in the app or web UI |  P t13|
| Select several to rename | Select several items in SAF| Rename is disabled |P t13 |
| Rename to empty name | Set blank the item name while renaming in SAF | Error: `You need to rename this` | P t13  |
| Cancel rename | Open rename option<br>Cancel without renaming in SAF | File is not renamed | P t13 |
| Rename item with an existing name | Rename any item to another existing name in SAF | Error: `A file with this name already exist`| P t13 |
| Rename item with special characters | Rename any item using special characters like &%ä^ in SAF | Correctly renamed, check in the app or web UI | P t13 |
| Rename item with forbidden characters |Rename any item using forbidden characters like \ or / in SAF| Error: `Failed to rename document` | P t13 |
| Rename item with longer name as allowed | Rename any item with a longer than 256 characters name  in SAF| Error: `Failed to rename document` | P t13 |
| Rename removed item | Rename any item that has just removed from web UI in SAF| Error: `Failed to rename document` | P t13 |
| Rename item with no internet connection | Rename any item with no internet connection in SAF| Error: `Failed to rename document` | P t13 |
| Rename item with no server connection | Rename any item with no server connection in SAF|Error: `Failed to rename document` | P t13 |
| Rename item with server in maintenance mode | Rename any item with server in maintenance mode in SAF| Error: `Failed to rename document` | P t13 |
|**Copy**|||
| Copy file same oC10 account |  1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Copy a file to another location in the same oC10 account| File copied. Check in web | P t13 |  |
| Copy many files same oC10 account |  1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Copy 500 files to another location in the same oC10 account| Files copied. Check in web | P t13 |  |
| Copy file to same space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file to another location in the same space | File copied. Check in web | P t13 |  |
| Copy folder to same space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders to another location in the same space | File copied. Check in web | F t13 | Fails with many files and subfolders |
| Copy many items to same space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders to another location in the same space | All items copied. Check in web | F t13 | Fails with many files and subfolders |
| Copy file to another space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file to another space in same provider | File copied. Check in web | P t13 |  |
| Copy folder to another space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders to another space in same provider | Folder copied. Check in web | P t13 |  |
| Copy many items to another space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders to another space in same provider  | All items copied. Check in web | F t13| Fails with many items  |
| Copy file other oC10 account | 1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Copy any file to other oC10 and oCIS accounts | File copied. Check in web | P t13  | 
| Copy file to another oCIS account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file to another account (two different spaces) and oC10 account | File copied. Check in web | F t13 | Sometimes fails, unestable. The higher the size to move, the more likely it fails. In oC10 fails when copying to non-root folder   |
| Copy folder to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders to another account (two different spaces) and oC10 account | Folder copied. Check in web | F t13 | Sometimes fails, unestable. The higher the size to move, the more likely it fails |
| Copy many items to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders to another account (two different spaces) and oC10 account | All items copied. Check in web | F t13 | Sometimes fails, unestable. The higher the size to move, the more likely it fails|
| Copy file from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file from another provider to oC10 and oCIS account (any space) | File created in accounts (check in web) | P t13 |  |
| Copy folder from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders from another provider to oC10 and oCIS account (any space) | Folders created in accounts (check in web) | P t13 |  |
| Copy many items from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders from another provider to oC10 and oCIS account (any space) | All items created in accounts (check in web) | P t13 |  |
|**Move**|||
| Move file to same oC10 account | Move a file to another location in the same oC10 account| File moved. Check in web | P t13 |  |
| Move file to same oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another location in the same space | File moved. Check in web | P t13 |  |
| Move folder to same oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another location in the same space | File moved. Check in web | P t13  |  |
| Move many items to same oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another location in the same space | All items  moved. Check in web | P t13 |  |
| Move file to another oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another space in same provider | File moved. Check in web | P t13  |  |
| Move folder to another oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another space in same provider | Folder moved. Check in web | P t13 |  |
| Move many items to another oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another space in same provider  | All items moved. Check in web |  P t13 |  |
| Move file to another oC10 account | 1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Move file to another oC10 account and oCIS (two different spaces) account | File moved. Check in web | F t13 | "Couldn't copy 3 items" in oC10 but works in oCIS |
| Move file to another oCIS account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another account (two different spaces)  | File moved. Check in web |  P t13 |  |
| Move folder to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another account (two different spaces) and oC10 | Folder moved. Check in web | F t13 | Unestable, not always work fine |
| Move many items to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another account (two different spaces) and oC10 | All items moved. Check in web | F t13 | Unestable, not always work fine |
| Move file to another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another provider in device | File moved | P t13 |  |
| Move folder to another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another provider in device | Folder moved | P t13 |  |
| Move many items to another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another provider in device | All items moved | P t13 |  |
| Move file from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file from another provider to oC10 and oCIS account (any space) | File created in accounts (check in web) | P t13 |  |
| Move folder from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders from another provider to oC10 and oCIS account (any space) | Folders created in accounts (check in web) | F t13  | Unestable, not always work fine |
| Move many items from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders from another provider to oC10 and oCIS account (any space) | All items created in accounts (check in web) | F t13|Unestable, not always work fine|
|**Delete**|||
| Delete file root | Delete a file in root folder | Correctly deleted, check in the app or web UI | P t13 |
| Delete file non-root | Delete a file in non-root folder | Correctly deleted, check in the app or web UI | P t13 |
| Delete folder root | Delete a folder in root folder | Correctly deleted, check in the app or web UI | P t13 |
| Delete folder non-root | Delete a folder in non-root folder | Correctly deleted, check in the app or web UI | P t13 |
| Delete several  | Delete several items at the time| Correctly deleted, check in the app or web UI | P t13 |
| No internet connection | Delete any item with no internet connection| Error: `Couldn't delete this item` <br> (in notification) | P t13 | Is this the best way?
| No server connection | Delete any item with no server connection| Error: `Couldn't delete this item` <br> (in notification) | P t13 | Is this the best way?
| Maintenance mode (oC10) | Delete any item with server in maintenance mode| Error: `Couldn't delete this item` <br> (in notification) | P t13 | Is this the best way?
|**Create file**||||||
| Create new file root| From a 3rd party app, create new file and save in oC using the doc prov, selecting the root folder | New file is correctly saved | P m11 | |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | New file is correctly saved in the folder | P m11 |  |  | 
| Create new file oCIS spaces | From a 3rd party app, create new file and save in oC, selecting a non-root folder in a custom space  | New file is correctly saved in the space  | P m11 |  |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | Added a numeral to the file name | P m11|  |  |
| Conflict II | From a 3rd party app, create new file and save in oC, setting an existing name from a previous conflict | Added a second numeral to the file name | P m11 |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save it in oC in different accounts and target folders | File is correctly saved in all accounts and locations | P m11 |  |  |
|**Edit file**|||||
| Edit non downloaded file | Open a file with any editor and update the content.<br>Save the changes | Changes visible in oC  | P m11 |
| Edit downloaded file | Open a file with any editor and update the content.<br>Save the changes | Changes visible in oC  | P m11 |
| Edit external | Using a 3rd party app, open a oC file using document provider and edit it.<br>Save the changes | Changes visible in oC  | P m11 |