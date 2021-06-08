#### Document provider 

#### PR: 

Devices: <br>
Server: 

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
| :-------- | :---- | :-------------- | :-----: | :------
|**Add account**|||||
| Add one account | Add one account to oC<br>Open Doc. provider app | Account available   |  |
| Add two accounts | Add two accounts from different servers to oC<br>Open Doc. provider app | Both accounts available |  | 
| Same server | Add two accounts of the same server to oC<br>Open Doc. provider app  | Both accounts available | |
|**Remove account**| Accounts added before||||
| Remove one account | Remove one account from oC<br>Open Doc. provider app | Account not available anymore  |  |
| Remove two account | Remove two accounts from oC<br>Open Doc. provider app | Both accounts not available anymore  |  |
| Remove all accounts | Remove all accounts from oC<br>Open Doc. provider app | No accounts available |  |
| Uninstall the app | Uninstall the oC app from the device | All accounts not available | |
|**Browse**|||||
| Browse | Browse through folder structure in different accounts | Correct browsing, all items displayed  |  |
| Passcode | Enable passcode in oC app | Browsing is not posible through the accounts  |  |
| Pattern | Enable pattern lock in oC app | Browsing is not posible through the accounts  |  |
| Biometrical | Enable biometrical lock in oC app | Browsing is not posible through the accounts  |  |
|**Create folder**|||
| Create folder root | Create a folder in root folder | Correct created, check in the app or web UI | | 
| Create folder non-root | Create a folder in non-root folder | Correct created, check in the app or web UI | | 
| Create folder existing | Create a folder with existing name | Correct error |  |
| Folder with special characters | Create folder with special characters like &%ä^ | Correct error | |
| Folder with forbidden characters | Create folder with for6bidden characters like \ or / | Correct error | | 
| Folder with longer name as allowed | Create folder with a longer than 256 characters name | Correct error |  |
| No internet connection | Create folder with no internet connection| Correct error |  |
| No server connection | Create folder with no server connection| Correct error | |
| Maintenance mode | Create folder with server in maintenance mode| Correct error | |
|**Rename**|||
| Rename file root | Rename a file in root folder | Correct renamed, check in the app or web UI | |
| Rename file non-root | Rename a file in non-root folder | Correct renamed, check in the app or web UI | |
| Rename folder root | Rename a folder in root folder | Correct renamed, check in the app or web UI |  |
| Rename folder non-root | Rename a folder in non-root folder | Correct renamed, check in the app or web UI |  |
| Select several to rename | Select several items| Rename is disabled | |
| Rename to empty name | Set blank the item name while renaming | Not posible |  |
| Cancel rename | Open rename option<br>Cancel without renaming | File is not renamed |  |
| Rename item with an existing name | Rename any item to another existing name | Correct error | |
| Rename item with special characters | Rename any item using special characters like &%ä^ | Correct error |  |
| Rename item with forbidden characters |Rename any item using forbidden characters like \ or / | Correct error | |
| Rename item with no permision | Rename any shared item over which, there is no edit permission | Correct error |  |
| Rename item with longer name as allowed | Rename any item with a longer than 256 characters name | Correct error | |
| Rename removed item | Rename any item that has just removed from web UI | Correct error | |
| Rename item with no internet connection | Rename any item with no internet connection| Correct error | |
| Rename item with no server connection | Rename any item with no server connection| Correct error | |
| Rename item with server in maintenance mode | Rename any item with server in maintenance mode| Correct error | |
|**Copy**|||
| Copy file same oC account | Copy a file to another location in the same oC account| Correctly copied |  |  |
| Copy file other oC account | Copy a file to other account | Correctly copied |  | 
| Copy file to other location | Copy a file to other location| Nothing happens in oC |  |  |
| Special characters | Copy the file which contain special characters | Correctly copied | |  |
| Same name file | Copy twice the same file to the same location | Error of conflict | |  Pending [issue](https://github.com/owncloud/android/issues/2623) to solve name conflicts  |
| Folder with subfolders same oC | Copy a folder with subfolders to the same account, different location| Correctly copied |  |  |
| Folder with subfolders to other oC account | Copy a folder with subfolders to other account| Correctly copied |  |  |
| Folder to other location | From doc prov, copy a folder with subfolders to other location| Nothing happens in oC |  |  |
| Same name folder | Copy twice the same folder to the same location | Error of conflict | | Pending [issue](https://github.com/owncloud/android/issues/2623) to solve name conflicts  |
| No connection | Copy an item with no connection | Correct error, item not copied | |  |
| Source removed | Copy an item and before submitting, remove the source item from web UI | Correct error, item not copied |  |  |
| Target removed | Copy an item and before submitting, remove the target folder from web UI | Correct error, item not copied | |  |
|**Move**|||
| Move file to same oC account | Move a file to another location in the same oC account| Correctly moved |  |  |
| Move file to other oC account | Move a file to other account| Correctly moved |  | Error to move -> not in this scope
| Move file to other location | Move a file to other location| Correctly moved (removed from oC) | |  |
| Move several file to other location | Move several files to other location| Correctly moved (removed from oC) | |  |
| Move file from other location to oC | Move a bunch of files from other location to oC| Correct created |  | Not in this scope |
| Folder with subfolders same oC | Move a folder with subfolders to the same account, different location| Correctly moved | |  |
| Folder with subfolders to other oC account | Move a folder with subfolders to other account| Correctly moved (removed from one account, created in the another one) | | Not in this scope |
| Folders to other location | Move some folder with subfolders to other location| Correct moved (removed from oC) |   |  |
| Move several folders from other location to oC | Move several folders from other location to oC| Correctly moved | | Not in this scope |
| No connection | Move an item with no connection |Correct error, item not moved |  |  |
| Source removed | Move an item and before submitting, remove the source item from web UI | Correct error, item not moved |  |  |
| Target removed | Move an item and before submitting, remove the target folder from web UI | Correct error, item not moved |  |  |
|**Delete**|||
| Delete file root | Delete a file in root folder | Correct deleted, check in the app or web UI |  |
| Delete file non-root | Delete a file in non-root folder | Correct deleted, check in the app or web UI |  |
| Delete folder root | Delete a folder in root folder | Correct deleted, check in the app or web UI |  |
| Delete folder non-root | Delete a folder in non-root folder | Correct deleted, check in the app or web UI |  |
| Delete several  | Delete several items at the time| Correctly deleted |  |
| Delete item with no permision | Delete any shared item over which, there is no deletion permission | Correct error | | 
| Delete deleted item | Delete any item that has just deleted from web UI | Correct error | | 
| No internet connection | Delete any item with no internet connection| Correct error |  | 
| No server connection | Delete any item with no server connection| Correct error |  | 
| Maintenance mode | Delete any item with server in maintenance mode| Correct error |  | 
|**Create file**||||||
| Create new file root| From a 3rd party app, create new file and save in oC using the doc prov, selecting the root folder | New file is correctly saved | | |  |
| Create new file non-root| From a 3rd party app, create new file and save in oC, selecting a non-root folder | New file is correctly saved in the folder |  |  |  | 
| Create new file special chars| From a 3rd party app, create new file and save in oC, selecting a non-root folder which contains special characters | New file is correctly saved in the folder  |  |  |
| Conflict | From a 3rd party app, create new file and save in oC, setting an existing name | Added a numeral to the file name |  |  |  |
| Conflict II | From a 3rd party app, create new file and save in oC, setting an existing name from a previous conflict | Added a second numeral to the file name |  |  |  |
| Multiaccount | Add several accounts<br>From a 3rd party app, create new file and save it in oC in different accounts and target folders | File is correctly saved in all accounts and locations |  |  |  |
| No connection | Create the new file with no connection | Correct error |  |  |  |
| Auth failure | Change credentials before uploading the file | Correct error  | |  |  |
| Remove target folder | Remove the target folder before submitting the new file | Correct error  |  |  |  |
| No permission | Share a folder with no edit permission<br>Create the file inside the folder | Correct error |  |  |  |
|**Edit file**|||||
| Edit non downloaded file | Open a file with any editor and update the content.<br>Save the changes | Changes visible in oC  |  |
| Edit downloaded file | Open a file with any editor and update the content.<br>Save the changes | Changes visible in oC  | |
| Edit external | Using a 3rd party app, edit a oC file using document provider.<br>Save the changes | Changes visible in oC  | |
| Edit removed file | Open a file with any editor and update the content.<br>Save the changes, and remove the file using other client | Correct error  |  | |
| Edit with no connection | With no connection, open a downloaded  file with any editor and update the content.<br>Save the changes after removing the file using other client or the web | File is updated when connection is recovered  |  | 
| Edit with no server connection | With no server connection, open a downloaded file with any editor and update the content.<br>Save the changes, and remove the file using other client | File is updated when connection is recovered  |  | 
| Edit with maintenance mode | With maintenance mode, open a downloaded file with any editor and update the content.<br>Save the changes, and remove the file using other client | File is updated when maintenance mode is off  | | 
|**Conflicting**|||||
| Conflict local | Using document provider, open a file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take local option in conflict | conflict is shown <br>Local version uploaded  | |
| Conflict server | Using document provider, open a file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take server option in conflict | Changes in oC<br>Server version downloaded  |  |
| Conflict both | Using document provider, open a file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take both option in conflict | Changes in oC<br>Both versions keep  | |
| Conflict with av. offline | Using document provider, open an av. offline file with any editor and update the content.<br>Make another change in other client or webUI.<br>Save the changes.<br>Take local option in conflict | Conflict is shown in oC  | |