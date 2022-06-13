## Regression Testplan Patch Release

### Template: 
[Regression_Test_Plan_Patch_Release.md](https://github.com/owncloud/QA/blob/master/Desktop/Regression_Test_Plan_Patch_Release.md)

(from: https://testlink.owncloud.team/linkto.php?tprojectPrefix=desktop&item=testcase&id=desktop-158)

__TO DO__
- So far squish tests only run on Ubuntu, for future: should run on Windows and macOS as well
- Qt and OpenSSL versions: is it necessary to check it here? (for Win and macOS configured in craft, for Linux the system OpenSSL is used, qt packages are ownCloud packages), versions are listed in automated test result (e.g. https://github.com/owncloud/client/issues/8870#issuecomment-896795228)
- manual check remains for file browser integration (overlay icons) and WinVFS

<!-- Updates:
 * General tab -> Settings tab, About, Versions
 * dowload, keys checker.
-->

<!-- Not clickable :-(
| Nr | Action | Expected Result | :heavy_check_mark:  | :x:  | |
|-|-|-|-|-|-|
| 1 | Fresh install on Win10 using MSI | The MSI details page has<br>- Verified publisher: ownCloud GmbH<br>- certificate expires > 1y | <ul><li>[ ] </ul></li> | <ul><li>[ ] </uk></li> |
-->

### Download:

----
* [ ] Fresh install on **Win10**/**Win11** using the unbranded ownCloud client MSI installer.
     * [ ] The MSI details page has
         * Verified publisher: ownCloud GmbH
         * certificate expires > 1y
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.15.2 for client 3.0.0
         * OpenSSL 1.1.1n for client 3.0.0
* [ ] Visually check all tabs
     * [ ] Tabs look correct
* [ ] Connect to a latest 10.X.x server, e.g. demo.owncloud.org
     * [ ] VFS is enabled per default
         * [ ] Files are virtual (right click menu shows grayed out "Free up local space")
     * [ ] Sync a file to the server
         * [ ] File has been synced
     * [ ] Share a file with another user on the same server
         * [ ] File has been shared successfully
     * [ ] Create a public link
         * [ ] Public link has been created and can be opened in a browser
* [ ] Connect to a latest oCIS server, e.g. ocis.ocis-traefik.released.owncloud.works (see: https://owncloud.dev/ocis/deployment/continuous_deployment/ and https://owncloud.dev/ocis/getting-started/demo-users/)
     * [ ] VFS is enabled per default
* [ ] Login to oCIS server in browser and create some folders/subfolders and files 
     * [ ] Check on client-side (in 'Explorer' and check 'Synced' and 'Not synced' tab )
        * [ ] All files and folders are synced to the client
        * [ ] Files and folders are virtual (right click menu shows grayed out "Free up local space")
        * [ ] Right click on a file and on a folder containing files and "Make locally available" 
     * [ ] Sync a file/folder to the server
         * [ ] File has been synced
         * [ ] Folder has been synced
     * [ ] Delete a file/folder locally
         * [ ] File is deleted on server
         * [ ] Folder is deleted on server
     * [ ] Delete file/folder on server
         * [ ] File is deleted locally
         * [ ] Folder is deleted locally
     * [ ] Share a file with another user on the same server ('Explorer' right click menu)
         * [ ] File has been shared successfully
     * [ ] Create a public link ('Explorer' right click menu)
         * [ ] Public link has been created and can be opened in a browser
* [ ] Login to oCIS and share a folder and a file with another user
     * [ ] Check on the server, that the other user accepts the share
     * [ ] Add the other user account in the client and check whether the two new shares are visible
* [ ] Login to oCIS server and create a space (see https://owncloud.dev/ocis/getting-started/demo-users/ for accounts having the right to create spaces)
     * [ ] add the space in client (button "Add a space")
     * [ ] space is added / VFS is enabled per default
* [ ] disable / re-enable VFS
     * [ ] VFS has been disabled / enabled
     * [ ] check Explorer icons: VFS _OFF_: overlay icons, VFS _ON_: (Win) icon in 'Status' column
 ----
 * [ ] Install the previous stable version of **Testpilot client on Win 10** VFS _ON_
     * [ ] Update to new version should be suggested on 'Update channel' 'Beta' (see "Settings" tab)
* [ ] Update to new version while previous version of the client is still running
     * [ ] Client is terminated without problems by the MSI installer  
     * [ ] New version of the client starts, no error messages, no obvious problems 
     * [ ] Make sure the account(s) is/are still configured and the users are logged in
     * [ ] winVFS is still enabled
     * [ ] "Open folder" and make sure folders/files are there  
     * [ ] check db in sync root: .sync_journal.db is the only *.db file (enable 'hidden files' in 'View')
-----
* [ ] Downgrade to new version 2.X.x is prevented
    * [ ] Install the next (unreleased) client version (daily2.X.x+1 or 2.X+1) on **Win 10**, configure an account with VFS _ON_
    * [ ] Downgrade to 2.X.x (need to deinstall newer version first)
    * [ ] Start client 2.X.x -> red error message "Downgrading the folder from 2.X.x+1 to 2.X.x is not supported"
    * [ ] Add a new account and try to reuse existing sync root -> error popup: "The folder ... is used in a folder sync connection! Please pick another one!"
 ----
* [ ] Install ownCloud desktop client on latest **macOS** using .pkg installer
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.15.2 for client 3.0.0
         * OpenSSL 1.1.1n for client 3.0.0
* [ ] Visually check all tabs
     * [ ] Tabs look correct
 * [ ] Sync a file to the server
     * [ ] File has been synced
 * [ ] Check the overlay icons
     * [ ] Overlay icons are present
 * [ ] Share a file with another user on the same server
     * [ ] File has been shared successfully
 * [ ] Create a public link
     * [ ] Public link has been created and can be opened in a browser
 * [ ] Enable VFS
     * [ ] VFS has been enabled
     * [ ] Overlay icons have changed (after 'Free up space') - overlay icons do not change for experimental VFS
 ----
 * [ ] Install ownCloud client on **Ubuntu**, Mint or Debian with GNOME desktop
 ```sudo apt install owncloud-client-nautilus``` (the ```Files``` file-browser)
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.15.2 for client 3.0.0
         * OpenSSL at least 1.1.1 (depends on the operating system)
  * [ ] Check the overlay icons
     * [ ] Overlay icons are present
  ----
 * [ ] Install ownCloud client on **Fedora** or CentOS with GNOME and Nautilus file manager (or openSUSE with KDE and dolphin)
 ```sudo yum install owncloud-client-nautilus``` or openSUSE with KDE and Dolphin ``sudo zypper install owncloud-client-dolphin``
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.15.2 for client 3.0.0
         * OpenSSL at least 1.1.1 (depends on the operating system)
 * [ ] Visually check all tabs
     * [ ] Tabs look correct
 * [ ] Sync a file to the server
     * [ ] File has been synced
 * [ ] Check the overlay icons
     * [ ] Overlay icons are present
 * [ ] Share a file with another user on the same server
     * [ ] File has been shared successfully
 * [ ] Create a public link
     * [ ] Public link has been created and can be opened in a browser
 * [ ] Enable VFS
     * [ ] VFS has been enabled (suffix ```.owncloud``` after 'Free up space')
 ----
 * [ ] For Beta or RC: Install **Testpilot client on Windows 10**
     * [ ] disable VFS in connction wizard
         * [ ] files are synced physically (right click menu doesn't show "Always keep on this device") 
     * [ ] Settings tab, About has correct versions:
         * testpilot client version
         * Qt 5.15.2 (optional)
         * OpenSSL 1.1.1n (optional)
 * [ ] Visually check all tabs
     * [ ] Tabs look correct
 * [ ] Sync a file to the server
     * [ ] File has been synced
 * [ ] Check the overlay icons
     * [ ] Overlay icons are present
 * [ ] Share a file with another user on the same server
     * [ ] File has been shared successfully
 * [ ] Create a public link
     * [ ] Public link has been created and can be opened in a browser
 * [ ] Enable VFS (stop other owncloud client!)
     * [ ] VFS has been enabled
     * [ ] status icon in Explorer column is shown, on "Free up local space" changes to cloud icon
 * [ ] Disable VFS
     * [ ] Exclude a folder from being synced (selective sync)
     * [ ] Folder is deleted locally 
     * [ ] Folder is not deleted on server  
 * [ ] Make sure the testpilotcloud-client is "branded" which means that everywhere the colorful testpilotcloud icon is shown and all text mentions 'Testpilot' instead of the usual ownCloud icon and 'ownCloud' client.  
     * [ ] This applies to:
         * MSI-installer, Connection Wizard, Sync-Folder-Connection Logo, About dialog.

----

 * [ ] Download signatures and keys are valid. Verify if the automated key-checker at
     * [ ] https://jenkins.int.owncloud.com/view/monitor/job/monitor-certs/lastCompletedBuild/console
         * was run today/yesterday
         * has latest platform versions of each family.
         * has stable, daily & testing
         * has all Release.key, repomd.xml.key expiries > 1y

