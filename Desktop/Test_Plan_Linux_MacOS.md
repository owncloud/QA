# Linux/macOS

## 1. Placeholder suffix virtual files - Linux

### Precondition

1.  Open the desktop client
2.  Go to Account tab
3.  You can enable/disable virtual files support in the three dots menu

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify enabling VFS shows warning and file context options | Enable Virtual File Support by clicking on the three dots menu in the Account tab | 1. Warning message that the feature is experimental <br/> 2. Three new options shown in the file system in the context menu: <br/> * Available online only / Always available locally <br/> * Make always available locally <br/> * Free up local space | | | 
| 2  | Verify 'Free up local space' converts file to online-only placeholder | Select 'Free up local space' against a file | *   File has an .owncloud extension <br/> *   1B size <br/> *   Current state: Available online only | | | 
| 3  | Verify 'Free up local space' converts all folder contents to online-only placeholders | Select 'Free up local space' against a folder | * All files inside have an .owncloud extension <br/> * Current state: Available online only | | | 
| 4  | Verify making a file always available locally removes placeholder and restores full file size | Make a file always available locally | *   .owncloud extensition has been removed from file name <br/> *   file size is the size of the file itself <br/> *   current state: Always available locally | | | 
| 5  | Verify making a folder always available locally syncs all contained files and sets status correctly | Make a folder always available locally | * All files inside the folder are available locally <br/> * Current state: Always available locally | | | 
| 6  | Verify folder state after partial hydration of files | 1. Have a folder with two files <br/> 2. Free up space <br/> 3. Double click one file to hydrate it | Current state: Some available online only | | | 
| 7  | Verify all files are downloaded when VFS is disabled | Disable VFS | All files are available locally | | | 
| 8  | Verify warning when downloading an online-only file while offline | 1. Free up local space agaisnt a file <br/> 2. Go offline <br/> 3. Download the file | Warning message has been shown <br/> GitHub issue: [#7333](https://github.com/owncloud/client/issues/7333) | | | 
| 9  | Verify account creation with VFS enabled via Account Wizard | [AUTOMATED] Create vfs folders from Account wizard (add a new account and turn on VFS) | New account can be created with VFS | | | 
| 10  | Verify adding a new sync connection with VFS enabled via Folder Wizard | Create vfs folders from Folder wizard (add a new sync connection and turn on VFS) | New sync connection can be added with VFS | | | 

## 2. Pin inheritance

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify syncing a new server-side file into a non-pinned folder with VFS enabled | 1.  Have a folders that is not pinned <br/> 2.  Add a new file on the server into that folder | File has been synced and it's dehydrated | | | 
| 2  | Verify syncing a new server-side file into a pinned folder with VFS enabled | 1.  Have a folders that is pinned <br/> 2.  Add a new file on the server into that folder | File has been synced and it's hydrated <br/> GitHub issue: [#6815](https://github.com/owncloud/client/issues/6815#issuecomment-512247733) | | | 
| 3  | Verify re-created server file inherits always-local pin state after deletion and re-sync | 1.  Create file ""a"" in always-local folder, mark it online only (free up space), sync <br/> 2.  Delete ""a"" on the server, sync <br/> 3.  Create file ""a"" on the server, sync | It should be hydrated and inherit the always-local pin state. <br/> GitHub issue: [#7273](https://github.com/owncloud/client/issues/7273) | | | 

## 3. File operations

### Precondition

VFS is on

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify file rename is synced to the server | Rename a file | File has been renamed on the server as well | | | 
| 2  | Verify deleted file is recreated after sync | Delete a file | File has been created again | | | 
| 3  | Verify file content edit triggers download and sync | Edit content a file | File has been downloaded and edited content has been synced on the server | | | 
| 4  | Verify newly created file is not virtual | Create a new file | New file has been added and synced but is not virtual | | | 
| 5  | Verify copy-paste of virtual file within sync folder creates a non-synced copy | 1.  Copy a virtual file <br/> 2.  Paste it at the same location | File browser asks or creates a copy. But the copy is not synced to the server | | | 
| 6  | Verify placeholder file is copied when pasting virtual file outside sync folder | 1.  Copy virtual file <br/> 2.  Paste it outside the owncloud sync folder | Placeholder file has been copied | | | 
| 7  | Verify moving a virtual file within sync folder triggers a recreation | Move a virtual file within the sync folder | The source virtual file is moved to the destination but is not synced to the server. And the virtual file is recreated in the source location. <br/> GitHub issue: [#9251](https://github.com/owncloud/client/issues/9251) | | | 

## 4. .owncloud suffix

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify client correctly ignores .owncloud files and syncs regular files | 1. Upload files (test, test.owncloud, test.owncloud.owncloud) to server <br/> 2. Sync files with VFS OFF <br/> 3. Sync files with VFS ON | 'test' is synced down and available in the file system. 'test.owncloud' and 'test.owncloud.owncloud' are ignored by client. | | | 
| 2  | Verify renaming a file to add/remove .owncloud suffix toggles its virtual/physical state | 1.  Turn on VFS <br/> 2.  Rename test.txt to test.txt.owncloud -> file has been replaced by virtual file <br/> 3.  Double click on the file -> file has been downloaded | It's possible to replace virtual and physical files just by renaming in both ways <br/> GitHub issue: [#7338](https://github.com/owncloud/client/issues/7338) | | | 
| 3  | Verify removing .owncloud suffix and opening file converts placeholder to physical file | 1.  Have a virtual file <br/> 2.  Remove .owncloud extension <br/> 3.  Open the file | Physical file has been created by renaming the virtual file | | | 

## 5. Forbidden file types

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify client ignores .owncloud files added locally with VFS ON | 1.  Turn VFS on <br/> 2.  Add a file ending .owncloud in the client | 1.File is ignored <br/> 2.Check the entry for the ignored file in not synced tab (in Activity tab) <br/> 3.Ignored file should have blue 'i' icon in ignored tab. | | | 
| 2  | Verify client ignores .owncloud files added locally with VFS OFF | 1.  Turn VFS off <br/> 2.  Add a file ending .owncloud in the client | 1.File is ignored <br/> 2.Check the entry for the ignored file in not synced tab (in Activity tab) <br/> 3.Ignored file should have blue 'i' icon in ignored tab. | | | 
