## Testplan WINDOWS VFS

### Template: 
[Test_Plan_VFS.md](https://github.com/owncloud/QA/blob/master/Desktop/Test_Plan_VFS.md)

## Prerequirements

Prepare a latest version server and link here:
`make_oc10_apps.sh` https://github.com/owncloud/QA/blob/master/tools/hetzner-deploy/make_oc10_apps.sh
-> server URL

Download link for the client to be tested:
-> e.g. https://download.owncloud.com/desktop/ownCloud/testing/2.9.2.6206/

Test environment: Windows 10 -> add the version here (`winver`)

## General Hints  

- VFS documentation see https://doc.owncloud.com/desktop/2.9/vfs.html
- Enable logging in client
- Login to the server and watch the Trash bin

## Testing

* [ ] Add an account and connect to the server with VFS ON
  * [ ] 'Open folder' (Explorer) and check that all files are virtual (Status: placeholder file)
  * [ ] open an existing file -> file is physically available (Status: full file)
  * [ ] create a new file, edit and save
  * [ ] right click: 'Free up space' -> placeholder is created, 'Activity' 'Sync Protocol' shows "Replaced by virtual file" 
  * [ ] create several new files more, edit some
  * [ ] on client dot menu: 'Availibility' 'Free up local space' -> placeholder for all files are created

  * [ ] create a new folder and move some files into it -> check all files moved
  * [ ] ...


* [ ] Switch between VFS ON/OFF
  * [ ] Add a second account with VFS OFF
  * [ ] Switch to VFS ON using client dot menu -> file status changes (Status: full file)
  * [ ] in Explorer: right-click on a folder and 'Free up space' 
  * [ ] on client dot menu: 'Availibility' 'Free up space'
  * [ ] ...

* [ ] Connect to server account having 'big' data prepared VFS ON
  * [ ] many files
  * [ ] many subfolders
  * [ ] large file
  * [ ] ...


