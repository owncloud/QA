# Synchronization

## 1. Sync of large items

### Precondition

Desktop Client:

* In the Settings tab, set '[x] Ask for confirmation before synchronizing folders larger than [ 10 MB ]'

It is recommended to

*   lower the limit to 10MB (instead of the default 500MB)
*   have a local server - with a remote server a 500MB sync can easily take 10 minutes

How to generate files of a certain size:

Linux, macOS: 

dd if=/dev/zero of=upload_test bs=file_size count=1 

Windows

`C:\Windows\System32\fsutil.exe file create new path size`

example:

`C:\Windows\System32\fsutil.exe file createnew C:\Temp\temp.tmp 20867615232`

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Add a folder exceeding the server storage limit | Before the initial sync, upload a folder that exceeds the limit to the server <br/> Connect the client to the server | A warning message appears <br/> Message has these buttons: <br/> - Synchronize all <br/> - Synchronize none <br/> - Apply manual changes (is greyed out) |
| 2 | Check **Synchronize all** button | Click **Synchronize all** button | Client syncs the folder |
| 3 | Add large size file to already synced folder | Make an already synced folder exceed the limit by adding a large file on the server | The file is downloaded to the client,&nbsp;the folder is larger than the limit, no warning message |
| 4 | Add large size file to already synced top-level folder | On the server, upload&nbsp;a file in the top level sync folder that is larger than the limit | File is synced to the client without asking |
| 5 | Add large size folder | After completing an initial sync, log out the client <br/>Upload a new folder to the server that exceeds the limit <br/>Connect the client to the server | A warning message appears <br/>`There are folders that were not synchronized because they are too big or external storages: <folder_name>`
| 6 | Check **Synchronize none** button | Refuse by selecting **Synchronize none** | Folder has not been synced to the client |
| 7 | Check selective sync |1.  After completing the sync, log out the client <br/>2.  Upload two additional folders to the server that exceed the limit <br/>3.  Log in the client to the server <br/>4.  In the selective sync list, select one folder <br/>5.  Click **Apply manual changes** button | Selected folder is synced to the client <br/>GitHub issue: https://github.com/owncloud/client/issues/7230 |
| 8 | Share large sub folder | Create a big subfolder e.g. A/B/Big subfolder <br/>Share the subfolder with another user | User is asked if they want to sync too big folder |
| 9 | Sync a file | Sync a file larger than 200MB | Synced |

## 2. Sync of external storages

### Precondition

**In the desktop client**

1.  Verify in General tab 'Ask for confirmation before synchronizing external storages' checkbox is checked
2.  Add new external storage

How to add a shared folder from Windows

**In WebUI - become enterprise:**

1.  Add these two keys into your config.php: 'license-key', 'marketplace.key'
2.  systemctl restart apache2
3.  Go to Marketplace
4.  Install Enterprise License Key
5.  Install [External Storage: Windows Network Drives][1]

[1]: https://marketplace.owncloud.com/apps/windows_network_drive

Run the below commands on server

```
sudo apt-get update -y
sudo apt-get install -y smbclient php-smbclient coreutils
sudo phpenmod -v ALL smbclient
```  
    
**On Windows machine**
  
1. Create a folder (not on the shared desktop, Sharing won't be available)
2. Right click on it -> select Properties -> Sharing -> Advanced sharing
3. Enter share name -> Apply
4. Select Permissions 
5. Add a user and give him permissions -> OK

**In WebUI**

1. Go to Settings -> Admin ->  Storage
2. Enable external storage
3. Folder name: Folder name that will be in ownCloud
4. External storage: Windows network drive
5. Authentication: Username and password
6. Host: WM ip
7. Share: name as entered on Windows machine
8. Remote subfolder: emtpy
9. Domain: workgroup
10. Username: as added on Windows machine
11. Password

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Check **Synchronize None** button| Select 'Synchronize None' in the confirmation message | Nothing has been synchronized |
| 2 | Check **Synchronize all** button| Select 'Synchronize all' | Everything has been synced |
| 3 | Check **Apply manual changes** button| Select 'Apply manual changes' | ""Apply manual changes"" button becomes enabled when a change was made <br/>GitHub issue [#7230](https://github.com/owncloud/client/issues/7230) |
| 4 | Check if external storage is synced  | 'Ask for confirmation before synchronizing external storages' checkbox is not checked <br/>Sync external storage | No message |
| 5 | Rename external storage | Rename external storage |  Not allowed [#7408](https://github.com/owncloud/client/issues/7408) |
| 6 | Move external storage | Move external storage |  Not allowed [#7408](https://github.com/owncloud/client/issues/7408) |

## 3. Account: Add Space

### Precondition

1.  Open ownCloud desktop client
2.  Go to account tab
3.  Click Add Space 

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Check Add Space Window |""Add a Space"" window has been shown | **Cancel**, **Back** and **Next** buttons present, Back &amp; Next buttons are greyed out <br/>**Sync**, **Image**, **Name**, **Web URL** columns are present <br/>User can sort the spaces based on the columns, but ""Personal"" and ""Shares"" always stay on top <br/>""Open in Web"" button works <br/>Space image has been shown
| 2 | Check Add Space Window | Select a space and click Next | 'Pick a local folder' window is shown |
| 3 | Check Add Space Window | Select local sync path and click Next | 'Deselect remote folders' window is shown |
| 4 | Check Add Space Window | Click **Add sync connection** button | Connection has been added |

## 4. Unsuccessful sync

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Check federated share | User1 shares a file with User2 from another server (federated share) <br/>Turn off the first server  <br/>Check the account of User2 | Storage unavailable message (503 error) <br/>Other files has been synced <br/>GitHub issue [#5859](https://github.com/owncloud/client/issues/5859) |
| 2 | Sync a file without etag on the server | Sync a file that has no etag on the server | Other files have been synced <br/>'Server reported no etag"" message |

## 5. Chunk upload

### Precondition

Have a file that is larger than chunksize, e.g. 40MB. move it into the sync folder.

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Verify large files are sent in automatically adjusted chunks | Verify large files are sent in automatically adjusted chunks: <br/>open the logdir folder (on Ubuntu: /tmp/ownCloud_logdir), examine the latest logfile | Example output <br/>`zgrep 'Chunked upload' 20190618\_1208\_owncloud.log.1.gz` <br/> `06-18 12:08:59:150 [ info sync.propagator.upload ]: Chunked upload of 10000000 bytes took 21088 ms, desired is 60000 ms, expected good chunk size is 28452200 bytes and **nudged next chunk size to**  19226100 bytes` `06-18 12:09:39:559 [ info sync.propagator.upload ]: Chunked upload of 19226100 bytes took 40408 ms, desired is 60000 ms, expected good chunk size is 28547960 bytes and nudged next chunk size to  23887030 bytes` <br/> `06-18 12:09:51:031 [ info sync.propagator.upload ]: Chunked upload of 5422796 bytes took 11471 ms, desired is 60000 ms, expected good chunk size is 28364376 bytes and nudged next chunk size to  26125703 bytes` |
| 2 | Change file during upload | The uploaded file is changed by the user during upload | File has been synced |
| 3 | Observe peak memory use | Add many large new local files<br/>Trigger an upload<br/>Observe memory use | Increase during sync is < 100MB <br/>GitHub issue [#7226](https://github.com/owncloud/client/issues/7226) |

## 6. Sync of multiple items

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Sync many files to the server | Sync 1000 files from the client to the server | Files are synced to the server |
| 2 | Sync many files to the client | Sync 1000 files from the server to the client | Files are synced to the client |
| 3 | Check if multithreading works | Check if multithreading works. <br/>Open a terminal <br/>Export an env <br/>`export OWNCLOUD_MAX_PARALLEL=1` <br/>Start the client within the env context (from same terminal) `owncloud -s` <br/>Default: 6 (By default, the client uses 6 parallel threads if this variable is not set.) <br/>Mac: `/Applications/owncloud.app/Contents/MacOS/owncloud` | Multithreading is quicker |

## 7. Force sync now

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Check force sync | Make some changes to your files/folders in ownCloud <br/>Go to your Account tab <br/>Open three dots menu <br/>Select 'Force sync now'&nbsp; | Sync has been trigered immediately |

## 8. Pause/Resume sync

### Precondition

In the server:
- Upload large file &gt;500MB

In the client:
- set download limit to 5000 KB/s

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Check pause sync | Connect the client to the server <br/>Let the file download be about >100MB <br/>Pause the sync | Sync has been paused | 
| 2 | Check resume sync | Resume the sync | Sync has been resumed from where the download was paused |

## 9. Remove folder sync connection

### Precondition

1.  Go to the desktop client
2.  Go to Account tab
3.  Click on the three dots menu

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Check Remove folder sync connection window | Select Remove folder sync connection | **Confirm Folder Sync Connection Removal** dialog is shown with following message: <br/>Do you really want to stop syncing the folder &amp;lt;local-sync-path&amp;gt;? <br/>Note: This will not detete any files |
| 2 | Check cancel button | Select Cancel | Window has been closed |
| 3 | Check Remove folder sync connection button | Select `Remove folder sync connection` from context menu <br/> Click on&nbsp;**Remove Folder Sync Connection** button | Folder has been removed from the list of folder sync connection in the Account tab <br/>No data have been deleted locally <br/>No data have been deleted on the server
| 4 | Check side bar entry in file manager | Check side bar entry in file manager | Win: Sidebar entry in file manager has also been deleted <br/>Linux: Sidebar entry remains |

## 10. Conflicts

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Edit same file on the server and client while syncing | Pause syncing <br/> Edit the file content on the client <br/> Edit the same file on the server with different content <br/> Resume the sync | Edited file is synced from the server and local edited file will appear as a conflict file |
| 2 | Delete the local conflict file | Delete the local conflict file to resolve the conflict | Conflict has been resolved |

## 11. Antivirus

### Precondition

Use composable infractructure&nbsp;https://github.com/owncloud/qa-enterprise/tree/master/compose-infrastructure

```
docker-compose \
    -f owncloud-base.yml \
    -f owncloud-official.yml \
    -f owncloud-exported-ports.yml \
    -f cache/redis.yml \
    -f database/mariadb.yml \
    -f services/clamav.yml \
    -f configs/enable_files_antivirus_daemon.yml \
    up -d
```

Running on [localhost:9680][1]
 
Virus can be downloaded  or simply paste X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* into a text file

 [1]: http://localhost:9680

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Add Test Virus | Add Test Virus to sync directory <br/> Upload to the server | Error message: <br/>File not uploaded to the server |


## 12. Too many concurrent hash computations

| ID | Test Case                       | Steps to reproduce                                                                                                                                                                                                    | Expected Result                                                                                                                                                                                            | Result | Related Comment |
|----|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1 | Stress test on client by lowering number of open file descriptors | On linux: <br/>Check the ulimit ulimit -n (probably 1024) <br/>Consider lowering it with ulimit -n 100, then starting the owncloud client from the shell that has the reduced limit. <br/>Have a sync folder with many moderately large files. If the limit is 1024, having around 1500 files should be good. It should be fully synced. <br/>Quit the client, delete the sync database (.sync_*) <br/>Start the client. Now the error should appear. <br/> There's no guarantee that the error will trigger, depends on how fast the io happens compared to the propagation jobs starting. | Sync has succeeded |