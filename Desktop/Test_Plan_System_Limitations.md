# System Limitations

## 1. Low disk space

### Precondition

[low_disk_space.html](https://doc.owncloud.com/desktop/6.0/advanced_usage/low_disk_space.html)

Check free space on Windows 10: wmic logicaldisk get size,freespace,caption

Create a new file of the requested size to fill up free space, e.g.: C:\Windows\System32\fsutil.exe file createnew C:\Temp\temp.tmp 20867615232

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify error message when free space is below minimum required for sync | Make sure your free space is below 48MB <br/> Force sync | ""Only x MB are available, need at least 48 MB to start"" error message | | | 
| 2  | Verify low disk space warning prevents sync that reduces free space below 238 MB | Sync a file from the server that will reduce free space below 238 MB | ""Disk space is low: Downloads that would reduce space below 238 MB were skipped."" error message | | | 

## 2. Deep Hierarchy

### Precondition

Deep hierarchy requires long path names.

*   Linux typically allows 4096
*   Windows typically allows a total path length of 260, but
*   Windows 10, Version 1607, and Later can be configured to allow longer paths (file or folder names remain at 260): 
    *   activate  the “Enable Win32 long paths” group policy, or
    *   set the registry value HKEY\_LOCAL\_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem@LongPathsEnabled to 1.

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify sync of files located deep in folder hierarchy | Sync a file which is deep down in hierarchy <br/> e.g. mkdir -p 1qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcv <br/> cd 1qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvb/qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcv <br/> echo hello >> h.txt | File has been synced <br/> GitHub issue [#7266](https://github.com/owncloud/client/issues/7266) | | |
| 2 | Verify virtual file creation for max-length deep path file | 1.  Create a file with a maximum length path deep in the hierarchy <br/> 2. Turn on Virtual files | File has been replaced by a virtual file | | |

## 3. Special characters and lengths

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify sharing a file with a user having special characters in username | Share a file with a user with special characters in their user name (_.@-) | File has been shared | | |
