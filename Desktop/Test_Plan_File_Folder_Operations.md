# File/Folder operations

## 1. Rename

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify file rename syncs to server | Rename a file | File has been renamed also on server | | | 
| 2  | Verify folder rename syncs to server | Rename a folder | Folder has been renamed also on server | | | 
| 3  | Verify offline rename syncs upon reconnection | Rename a file when offline then go online | Name change has been synced on the server | | | 
| 4  | Verify renaming a single file does NOT trigger misleading "all files deleted" warning | 1.  Make sure you have only one single file in your ownCloud <br/> 2.  Rename the file | File has been renamed (no pop-up message "All files in the sync folder 'ownCloud' folder were deleted on the server...." ) <br/> GitHub issue: [#7204](https://github.com/owncloud/client/issues/7204) | | | 

## 2. Delete

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | [AUTOMATED] Verify file deletion syncs to server | AUTOMATED - Delete a file | File has been also deleted on server | | | 
| 2  | [AUTOMATED] Verify folder deletion syncs to server | AUTOMATED - Delete a folder | Folder has been also deleted on server | | | 
| 3  | Verify offline deletion syncs upon reconnection | Delete when offline then connect to the server | Item has been deleted also on the server | | | 
| 4  | Verify warning appears when deleting entire sync folder content | Delete everything (all files and folder) | A warning message that all the files in your local sync folder were deleted | | | 
| 5  | Verify 'Keep files' option in warning dialog recreates files on next sync | Select 'Keep files' | Files are recreated during the next sync | | | 
| 6  | Verify 'Remove all files' option in warning dialog permanently removes files | Delete everything again. Select 'Remove all files' in the warning window | All files have been removed and are not recreated after next sync | | | 

## 3. Edit a file

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | [AUTOMATED] Verify editing a text file syncs changes and updates mod date | AUTOMATED - Edit a content of a text file | Edited content has been synced on the server. Modification date has been changed. | | | 
| 2  | Verify offline edit syncs upon reconnection | Edit a content when offline then connect to the server | Change has been synced | | | 

## 4. Folder dates

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify creation and modification dates match server after initial sync | 1.  Create a folder on a server <br/> 2.  Do some changes to it <br/> 3.  Wait <br/> 4.  Do the **initial** sync on a client | Creation and modification date on the client are the same as on server <br/> GitHub issue: [#7119](https://github.com/owncloud/client/issues/7119) | | | 

## 5. Move

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify complex nested folder move operations sync correctly | Have folders Documents/Empty and Photos/Empty2. Run commands to move them interchangeably (see details in CSV). | Sync successful.<br/> New structure: <br/> Empty/Photos <br/> Empty2/Documents. <br/> GitHub issue: [#6694](https://github.com/owncloud/client/issues/6694) | | | 
