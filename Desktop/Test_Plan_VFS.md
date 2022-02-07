## Testplan WINDOWS VFS

### Template: 
[Test_Plan_VFS.md](https://github.com/owncloud/QA/blob/master/Desktop/Test_Plan_VFS.md)

## Prerequirements

Prepare a server with the latest version on Hetzner ([make_oc10_apps.sh](https://github.com/owncloud/QA/blob/master/tools/hetzner-deploy/make_oc10_apps.sh)) or locally e.g. `docker run -ti --rm -p 8080:8080 owncloud/server:10.8`

-> server URL

Have a client build ready, link URL here:

-> e.g. https://download.owncloud.com/desktop/ownCloud/testing/2.9.2.6206/

Test environment:
- Windows 10 -> add the version here (`winver` or client 'About' 'Versions' tab ) 
- Install LibreOffice and CPUSTRES (activate 4-5 threads to get a CPU load of appr. 60 %)

### VFS Documentation

- https://doc.owncloud.com/desktop/2.9/vfs.html
- https://www.userfilesystem.com/programming/faq/#nav_howdoesthefreeupspacemenuworks
- https://docs.microsoft.com/en-us/windows/win32/cfapi/build-a-cloud-file-sync-engine#cloud-files-api-architecture

### General

- Enable the client logging (on 'Settings' 'Log Settings')
- Login to the server and watch the trash bin

## Testing

* [ ] Add an account and connect to the server with VFS ON
  * [ ] 'Open folder' (Explorer) and check that all files are virtual, status: placeholder file (cloud icon)
  * [ ] open an existing file -> file is physically available, status: full file (green unfilled circle with green check mark)
  * [ ] create a new file locally, edit, save and exit -> status: full file
  * [ ] right click: 'Free up space' -> placeholder is created, 'Activity' 'Sync Protocol' shows "Replaced by virtual file" 
  * [ ] open LibreOffice, edit a new file and save, to not exit -> file status: spinning (cylcling) icon
      * [ ] exit LibreOffice -> file status: full file

* [ ] Tests concerning free up space
  * [ ] Create several new files in a subfolder, edit some of them, also have dehydrated files available
  * [ ] 'Open folder', right click on the folder in Explorer, 'Free up space' in Windows file menu -> all files are dehydrated, check all placeholder files are there, check trash bin on server
  * [ ] Create a new folder and move (also use 'Cut' and'Paste') several dehydrated files into it -> all files are moved into the folder, remain dehydrated and disappear from previous location (known issue: https://github.com/owncloud/client/issues/9101)
     
- Use file lock detection tool such as https://lockhunter.com/?utm_source=saashub&utm_medium=marketplace&utm_campaign=saashub
- LO means LibreOffice, which locks the files that it opens on Windows

* [ ] Tests when a file or folder is locked
  * [ ] Open a file in LibreOffice, edit, save, don't exit, which results in having the document file locked
  * [ ] 'Free up space' in Explorer on the locked file -> no red error message, client shows "i" (Status: spinning icon), Activity tells that file is in use
  * [ ] Exit libreoffice -> file is dehydrated correctly (Status: placeholder) after a few seconds
  * [ ] 'Free up space' in Explorer on the parent directory -> locked file stays locked, other non locked files are dehydrated
  * [ ] Create file via LibreOffice, keep it open in LO, file is not synced. As soon as LO is closed, file is synced.
  * [ ] Move locally locked file on the server -> Creates a new file, syncs it down
  * [ ] Delete locked file on the server -> Red error message appears, file stays locally. After LO is closed, file is removed if file was NOT changed locally after the delete.
  * [ ] Delete locked file on the server -> Red error message appears, file stays locally. Now, change the file locally in LO and save. After LO is closed, file is synced to cloud as new file. No version history any more.
  * [ ] Lock file that is in sync locally with LO. Move the file on server side. Save File and close LO -> The file gets synced to the server with the former name and appears as new file.
  * [ ] Create a directory and open a file within that with LO. Rename the parent dir on the server and leave the file unchanged. After LO is closed, the directory is renamed locally.
  * [ ] Create a directory and open a file within that with LO. Rename the parent dir on the server change the file in LO. Save and close after the parent dir rename failed. After close of LO, dir gets renamed and file uploaded.

* [ ] File Operations
  * [ ] Move file and directory locally -> Both dehydrated and hydrated files are moved accordingly on the server
  * [ ] Move an empty dehydrated folder inside the sync root and to a location outside the sync root -> accordingly moved on server
  * [ ] Move file and directory on the server -> Both dehydrated and hydrated files are moved accordingly locally
  * [ ] Create file in directory and open with LO. Do not change. Remove the directory on the server. After closing LO, directory and file are removed. (See #9293)
  * [ ] Create file in directory and open with LO. Remove the directory on the server. Edit the file and save it. After closing LO, directory and file are created again. (See #9293)
  * [ ] On server: create FolderA and 2 files NewFile and Newfile inside FolderB
    * [ ] watch client -> a red warning message "...file name clash..." is shown for some seconds, then the "i" icon ('Activity''Not synced' tab also shows file name clash)
    * [ ] 'Open folder' and check status of FolderB and NewFile -> spinning icon ("cycle mode") for folder and file
    * [ ] Move FolderB to another place (outside the syncroot) -> Known issue: FolderB is moved locally but not deleted on server


* [ ] Test with a long path (make sure LongPathsEnabled in Windows registry is off ** )
  * [ ] Create a file with a long path (> 260)
  * [ ] 'Free up space' -> no red error message
  
* [ ] Test with ignored or 'problematic' files, see https://doc.owncloud.com/desktop/2.9/filenames.html
  * [ ] Test with files that are on the ignore list, ie. files with the extension `.part`.
  * [ ] Create files that contain ':' or have a trailing space, they will be ignored in the sync
  * [ ] Create files with problematic name like `CON`, `PRN` or `AUX`, expect reasonable sync indicator icons

* [ ] Switch between VFS ON/OFF
  * [ ] Add a second account with VFS OFF
  * [ ] Switch to VFS ON using client dot menu -> file status changes (Status: full file)
  * [ ] in Explorer: right-click on a folder and 'Free up space' -> all files in folder get dehydrated (placeholder file, Status: cloud icon)
  * [ ] Switch back to VFS OFF -> all files are physically (overlay icons are shown)

* [ ] Client sync operations
  * [ ] 'Pause sync' (on client dot menu) while client is syncing  -> current 2.10 behaviour: 'Not Synced' tab shows entry "Operation canceled" ... "Fatal error" => Known issue: should NOT be a fatal error but a less severe status  
  * [ ] 'Resume sync' -> sync is continued and runs successfully

* [ ] Connect to a server account having "big" data prepared VFS ON
  * [ ] many files
  * [ ] many subfolders
  * [ ] large file
  * [ ] ...

  TODO: Provide a zip-file containing test-data e.g. on https://download.owncloud.com/desktop/ or in the issue (test plan ticket)

* [ ] Switch machine status (standby, suspend, hybernate ...)
  * [ ] Close lid of a laptop while client is syncing -> reopen and see client continues the sync 
  * [ ] On Windows VM command line: call shutdown /h -> client continues after relogin 
  * [ ] ...

** https://docs.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=cmd
