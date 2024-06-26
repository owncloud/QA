### Documents provider (SAF)

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>

---

Recommended app to test: [Files](https://play.google.com/store/apps/details?id=com.marc.files)
 
| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :-----: | :------
|**Add/List account**|||||
| Add one account | 1. Add one account to oC<br>2. Open Doc. provider app | Account available in SAF |  |
| Add two accounts | 1. Add two accounts from different servers to oC<br>2. Open Doc. provider app | Both accounts available in SAF|  | 
| Same server | Add two accounts of the same server to oC<br>Open Doc. provider app  | Both accounts available in SAF | |
| Personal and Custom spaces | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider | Account is listed in SAF<br>All spaces listed in root level  | |  |
| Add new space | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. In web, add a new space<br>4. In document provider app, pull to refresh | New space is listed in SAF|  |  |
| Remove existing space | 1. Add oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. In web, remove an existing space<br>4. In document provider app, pull to refresh | Space removed is no longer listed  in SAF|  |  |
| Two accounts with spaces | 1. Add two oCIS account with some custom spaces<br>2. Open any app with access to Document Provider<br>3. Switch to one account to other in the Document Provider app | Both apps showing their correct list of spaces in SAF|  |  |
| Space disabled | 1. Add oCIS accounts<br>2. In web, disable existing space<br>3. Open any app with access to Document Provider | Disabled space is not listed in SAF|   |   |
|**Remove account**| Accounts added before||||
| Remove one account | Remove one account from oC<br>Open Doc. provider app | Account not available anymore  in SAF |  |
| Remove two account | Remove two accounts from oC<br>Open Doc. provider app | Both accounts not available anymore  in SAF |  |
| Remove all accounts | Remove all accounts from oC<br>Open Doc. provider app | No accounts available  in SAF|  |
| Uninstall the app | Uninstall the oC app from the device | All accounts no longer available in SAF| |
|**Browse**|||||
| Browse oC10 | Browse through folder structure in different accounts | Correct browsing, all items displayed  in SAF |  |
| Browse Personal oCIS | 1. Add oCIS account<br>2. Open any app with access to Document Provider to open the personal space<br>3. Browse through space in document provider app| 2. Root folder listed in SAF<br>3. All folders' content is listed  |  |  |
| Browse No Personal oCIS | 1. Add oCIS account with custom spaces<br>2. Open any app with access to Document Provider to open the custom spaces<br>3. Browse through spaces in document provider app| All folders' content is listed in custom spaces in SAF|  |  |
| Setting disabled | 1. Add some accounts<br>2. In app Settings, go to `Security` and click option `Lock access from document provider`<br>3. Open any app with access to Document Provider | Access to oC locked in all accounts in SAF|  |  |
|**Create folder**|||
| Create folder root | Create a folder in root folder in SAF | Correctly created, check in the app or web UI | | 
| Create folder non-root | Create a folder in non-root folder in SAF | Correctly created, check in the app or web UI | | 
| Create folder existing | Create a folder with existing name in SAF | Error: `Failed to create folder` |  |
| Folder with special characters | Create folder with special characters like &%ä^ in SAF | Correctly created, check in the app or web UI | |
| Folder with forbidden characters | Create folder with for6bidden characters like \ or /  in SAF| Error: `Failed to create folder`| | 
| Folder with longer name as allowed | Create folder with a longer than 256 characters name in SAF| Error: `Failed to create folder` |  |
| No internet connection | Create folder with no internet connection in SAF| Error: `Failed to create folder` |  |
| No server connection | Create folder with no server connection in SAF| Error: `Failed to create folder` | |
| Maintenance mode (oC10) | Create folder with server in maintenance mode in SAF| Error: `Failed to create folder` | |
|**Rename**|||
| Rename file root | Rename a file in root folder in SAF | Correctly renamed, check in the app or web UI |  |
| Rename file non-root | Rename a file in non-root folder in SAF | Correctly renamed, check in the app or web UI |  |
| Rename folder root | Rename a folder in root folder in SAF | Correctly renamed, check in the app or web UI |  |
| Rename folder non-root | Rename a folder in non-root folder in SAF | Correctly renamed, check in the app or web UI |  |
| Select several to rename | Select several items in SAF| Rename is disabled |  |
| Rename to empty name | Set blank the item name while renaming in SAF | Error: `You need to rename this` |   |
| Cancel rename | Open rename option<br>Cancel without renaming in SAF | File is not renamed |  |
| Rename item with an existing name | Rename any item to another existing name in SAF | Error: `A file with this name already exist`|  |
| Rename item with special characters | Rename any item using special characters like &%ä^ in SAF | Correctly renamed, check in the app or web UI |  |
| Rename item with forbidden characters |Rename any item using forbidden characters like \ or / in SAF| Error: `Failed to rename document` |  |
| Rename item with longer name as allowed | Rename any item with a longer than 256 characters name  in SAF| Error: `Failed to rename document` |   |
| Rename removed item | Rename any item that has just removed from web UI  in SAF| Error: `Failed to rename document` |   |
| Rename item with no internet connection | Rename any item with no internet connection in SAF| Error: `Failed to rename document` |   |
| Rename item with no server connection | Rename any item with no server connection in SAF|Error: `Failed to rename document` |   |
| Rename item with server in maintenance mode | Rename any item with server in maintenance mode in SAF| Error: `Failed to rename document` |  |
|**Copy**|||
| Copy file same oC10 account |  1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Copy a file to another location in the same oC10 account| File copied. Check in web |  |  |
| Copy many files same oC10 account |  1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Copy 500 files to another location in the same oC10 account| Files copied. Check in web |  |  |
| Copy file to same space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file to another location in the same space | File copied. Check in web | |  |
| Copy folder to same space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders to another location in the same space | File copied. Check in web |  | Fails with many files and subfolders |
| Copy many items to same space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders to another location in the same space | All items copied. Check in web |  | Fails with many files and subfolders |
| Copy file to another space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file to another space in same provider | File copied. Check in web |  |  |
| Copy folder to another space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders to another space in same provider | Folder copied. Check in web |  |  |
| Copy many items to another space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders to another space in same provider  | All items copied. Check in web |  | Fails with many items  |
| Copy file other oC10 account | 1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Copy any file to other oC10 and oCIS accounts | File copied. Check in web |   | 
| Copy file to another oCIS account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file to another account (two different spaces) and oC10 account | File copied. Check in web |  | Sometimes fails, unestable. The higher the size to move, the more likely it fails. In oC10 fails when copying to non-root folder   |
| Copy folder to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders to another account (two different spaces) and oC10 account | Folder copied. Check in web |  | Sometimes fails, unestable. The higher the size to move, the more likely it fails |
| Copy many items to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders to another account (two different spaces) and oC10 account | All items copied. Check in web |  | Sometimes fails, unestable. The higher the size to move, the more likely it fails|
| Copy file from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy file from another provider to oC10 and oCIS account (any space) | File created in accounts (check in web) |  |  |
| Copy folder from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders from another provider to oC10 and oCIS account (any space) | Folders created in accounts (check in web) | |  |
| Copy many items from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders from another provider to oC10 and oCIS account (any space) | All items created in accounts (check in web) |  |  |
|**Move**|||
| Move file to same oC10 account | Move a file to another location in the same oC10 account| File moved. Check in web |   |  |
| Move file to same oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another location in the same space | File moved. Check in web |    |
| Move folder to same oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another location in the same space | File moved. Check in web |   |  |
| Move many items to same oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another location in the same space | All items  moved. Check in web |   |  |
| Move file to another oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another space in same provider | File moved. Check in web |    |  |
| Move folder to another oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another space in same provider | Folder moved. Check in web |   |  |
| Move many items to another oCIS space | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another space in same provider  | All items moved. Check in web |    |  |
| Move file to another oC10 account | 1. Add oC10 account<br>2. Open any app with access to Document Provider<br>3. Move file to another oC10 account and oCIS (two different spaces) account | File moved. Check in web |   | "Couldn't copy 3 items" in oC10 but works in oCIS |
| Move file to another oCIS account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another account (two different spaces)  | File moved. Check in web |   |  |
| Move folder to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another account (two different spaces) and oC10 | Folder moved. Check in web |   | Unestable, not always work fine |
| Move many items to another oC account | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another account (two different spaces) and oC10 | All items moved. Check in web |  | Unestable, not always work fine |
| Move file to another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file to another provider in device | File moved |   |  |
| Move folder to another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move folder with subfolders to another provider in device | Folder moved |  |  |
| Move many items to another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move more than 500 files and folders to another provider in device | All items moved |   |  |
| Move file from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Move file from another provider to oC10 and oCIS account (any space) | File created in accounts (check in web) |   |  |
| Move folder from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy folder with subfolders from another provider to oC10 and oCIS account (any space) | Folders created in accounts (check in web) |    | Unestable, not always work fine |
| Move many items from another provider | 1. Add oCIS account<br>2. Open any app with access to Document Provider<br>3. Copy more than 500 files and folders from another provider to oC10 and oCIS account (any space) | All items created in accounts (check in web) |   |Unestable, not always work fine|
|**Delete**|||
| Delete file root | Delete a file in root folder | Correctly deleted, check in the app or web UI |   |
| Delete file non-root | Delete a file in non-root folder | Correctly deleted, check in the app or web UI |   |
| Delete folder root | Delete a folder in root folder | Correctly deleted, check in the app or web UI |  |
| Delete folder non-root | Delete a folder in non-root folder | Correctly deleted, check in the app or web UI |   |
| Delete several  | Delete several items at the time| Correctly deleted, check in the app or web UI |   |
| No internet connection | Delete any item with no internet connection| Error: `Couldn't delete this item` <br> (in notification) |   |  
| No server connection | Delete any item with no server connection| Error: `Couldn't delete this item` <br> (in notification) |  |  
| Maintenance mode (oC10) | Delete any item with server in maintenance mode| Error: `Couldn't delete this item` <br> (in notification) |  |  
|**Create file**||||||
| Create new file root| From a 3rd party app, create new file and save in oC using the doc prov, selecting the root folder | New file is correctly saved |  | |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | New file is correctly saved in the folder |   |  |  | 
| Create new file oCIS spaces | From a 3rd party app, create new file and save in oC, selecting a non-root folder in a custom space  | New file is correctly saved in the space  |   |  |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | Added a numeral to the file name |  |  |  |
| Conflict II | From a 3rd party app, create new file and save in oC, setting an existing name from a previous conflict | Added a second numeral to the file name |   |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save it in oC in different accounts and target folders | File is correctly saved in all accounts and locations |   |  |  |
|**Edit file**|||||
| Edit non downloaded file | Open a file with any editor and update the content.<br>Save the changes | Changes visible in oC  |   |
| Edit downloaded file | Open a file with any editor and update the content.<br>Save the changes | Changes visible in oC  |  |
| Edit external | Using a 3rd party app, open a oC file using document provider and edit it.<br>Save the changes | Changes visible in oC  |  |