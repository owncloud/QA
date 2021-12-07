## Testplan WINDOWS VFS

### Template: 
[Test_Plan_VFS.md](https://github.com/owncloud/QA/blob/master/Desktop/Test_Plan_VFS.md)

## Prerequirements

Prepare a server with latest version e.g. on Hetzner ([make_oc10_apps.sh](https://github.com/owncloud/QA/blob/master/tools/hetzner-deploy/make_oc10_apps.sh)) or locally `docker run -ti --rm -p 8080:8080 owncloud/server:10.8`

-> server URL

Have a client build ready, link URL here:

-> e.g. https://download.owncloud.com/desktop/ownCloud/testing/2.9.2.6206/

Test environment:
- Windows 10 -> add the version here (`winver` or client 'About''Versions' tab ) 
- Install libreoffice and CPUSTRES (activate 4-5 threads to get a CPU load of appr. 60 %)

### General Hints  

- VFS documentation see https://doc.owncloud.com/desktop/2.9/vfs.html
- Enable client logging (on 'Settings' 'Log Settings')
- Login to the server and watch the trash bin

## Testing

* [ ] Add an account and connect to the server with VFS ON
  * [ ] 'Open folder' (Explorer) and check that all files are virtual (Status: placeholder file)
  * [ ] open an existing file -> file is physically available (Status: full file)
  * [ ] create a new file, edit and save
  * [ ] right click: 'Free up space' -> placeholder is created, 'Activity' 'Sync Protocol' shows "Replaced by virtual file" 
  * [ ] create several new files more, edit some
  * [ ] on client dot menu: 'Availibility' 'Free up local space' -> placeholder for all files are created

  * [ ] create a new folder and move some files into it -> check all files moved, files disappear at previous location
  * [ ] ...

* [ ] Tests when file is locked ...
  * [ ] Open a file in LibreOffice, edit, save, don't exit
  * [ ] 'Free up space' in Explorer -> no red error message, client shows "i" (Status: spinning icon)
  * [ ] Exit libreoffice -> file is dehydrated correctly (Status: placeholder)
  
* [ ] Tests with long path (make sure LongPathsEnabled in Windows registry is off)
  * [ ] Create a file with a long path (> 260)
  * [ ] 'Free up space' -> no red error message 
  
* [ ] Switch between VFS ON/OFF
  * [ ] Add a second account with VFS OFF
  * [ ] Switch to VFS ON using client dot menu -> file status changes (Status: full file)
  * [ ] in Explorer: right-click on a folder and 'Free up space' -> all files in folder get dehydrated (Status: placeholder)
  * [ ] on client dot menu: 'Availibility' 'Free up space' -> all files in sync root get dehydrated
  * [ ] Switch back to VFS OFF -> all files are physically (overlay icons are shown)

* [ ] Connect to a server account having 'big' data prepared VFS ON
  * [ ] many files
  * [ ] many subfolders
  * [ ] large file
  * [ ] ...


  TODO: Provide data.zip e.g. on https://download.owncloud.com/desktop/
