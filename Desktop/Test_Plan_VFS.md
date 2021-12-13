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
  * [ ] 'Open folder' (Explorer) and check that all files are virtual, Status: placeholder file (cloud icon)
  * [ ] open an existing file -> file is physically available, Status: full file (green unfilled circle with green check mark)
  * [ ] create a new file, edit and save
  * [ ] right click: 'Free up space' -> placeholder is created, 'Activity' 'Sync Protocol' shows "Replaced by virtual file" 
  * [ ] create several new files more, edit some
  * [ ] on client dot menu: 'Availibility' 'Free up local space' -> placeholder for all files are created (files are dehydrated)

 * [ ] Tests concerning free up space
   * [ ] Create several new files in a subfolder, edit some of them, also have dehydrated files available
   * [ ] 'Open folder', right click on the folder in Explorer, 'Free up space' in Windows file menu -> all files are dehydrated, check all placeholder files are there, check trash bin on server
   * [ ] Create a new folder and move (also use 'Cut' and'Paste') several dehydrated files into it -> all files are moved into the folder, remain dehydrated and disappear from previous location (known issue: https://github.com/owncloud/client/issues/9101)
     
* [ ] Tests when a file or folder is locked
  * [ ] Open a file in LibreOffice, edit, save, don't exit
  * [ ] 'Free up space' in Explorer -> no red error message, client shows "i" (Status: spinning icon)
  * [ ] Exit libreoffice -> file is dehydrated correctly (Status: placeholder)
  * [ ] ...
  
* [ ] Test with a long path (make sure LongPathsEnabled in Windows registry is off **)
  * [ ] Create a file with a long path (> 260)
  * [ ] 'Free up space' -> no red error message 
  
* [ ] Switch between VFS ON/OFF
  * [ ] Add a second account with VFS OFF
  * [ ] Switch to VFS ON using client dot menu -> file status changes (Status: full file)
  * [ ] in Explorer: right-click on a folder and 'Free up space' -> all files in folder get dehydrated (Status: placeholder)
  * [ ] on client dot menu: 'Availibility' 'Free up space' -> all files in sync root get dehydrated
  * [ ] Switch back to VFS OFF -> all files are physically (overlay icons are shown)

* [ ] Connect to a server account having "big" data prepared VFS ON
  * [ ] many files
  * [ ] many subfolders
  * [ ] large file
  * [ ] ...

  TODO: Provide a zip-file containing test-data e.g. on https://download.owncloud.com/desktop/

** https://docs.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=cmd
