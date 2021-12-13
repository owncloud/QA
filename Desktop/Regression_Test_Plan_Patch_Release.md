## Regression Testplan Patch Release

### Template: 
[Regression_Test_Plan_Patch_Release.md](https://github.com/owncloud/QA/blob/master/Desktop/Regression_Test_Plan_Patch_Release.md)

(from: https://testlink.owncloud.team/linkto.php?tprojectPrefix=desktop&item=testcase&id=desktop-158)

__TO DO__
- So far squish tests only run on Ubuntu, for future: should run on Windows and macOS as well
- Qt and OpenSSL versions: is it necessary to check it here? (for Win and macOS configured in craft, for Linux the system OpenSSL is used, qt packages are ownCloud packages), versions are listed in automated test result (e.g. https://github.com/owncloud/client/issues/8870#issuecomment-896795228)
- manual check remains for file browser integration (overlay icons)

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
* [ ] Fresh install on **Win10** using the unbranded ownCloud client MSI installer.
     * [ ] The MSI details page has
         * Verified publisher: ownCloud GmbH
         * certificate expires > 1y
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.12.10
         * OpenSSL 1.1.1i
* [ ] Visually check all tabs
     * [ ] Tabs look correct
* [ ] VFS is enabled per default. 
     * [ ] Files are virtual (right click menu shows grayed out "free up local space")
* [ ] Sync a file to the server
     * [ ] File has been synced
* [ ] Share a file with another user on the same server
     * [ ] File has been shared successfully
* [ ] Create a public link
     * [ ] Public link has been created and can be opened in a browser
* [ ] disable / re-enable VFS
     * [ ] VFS has been disabled / enabled
     * [ ] check Explorer icons: VFS off: overlay icons, VFS on: (Win) icon in 'Status' column
 ----
 * [ ] Install previous version of **Testpilot client on Win 10** VFS _ON_
     * [ ] Update to new version should be suggested (after changing 'Update channel' to 'Beta' on  "Settings" tab)
* [ ] Update to new version
     * [ ] No error messages, no obvious problems 
     * [ ] Make sure the account(s) is/are still configured and the users are logged in
     * [ ] winVFS is still enabled
     * [ ] "Open folder" and make sure folders/files are there  
     * [ ] check db in sync root: .sync_journal.db is the only *.db file (enable 'hidden files' in 'View')

* [ ] Downgrade to current version 2.X.x is prevented
    * [ ] Install the next client version (daily2.X.x+1 or 2.X+1) on **Win 10**, configure an account with VFS _ON_
    * [ ] Downgrade to 2.X.x (need to deinstall newer version first)
    * [ ] Start client 2.X.x -> red error message "Downgrading the folder from 2.X.x+1 to 2.X.x is not supported"
    * [ ] Add a new account and try to reuse existing sync root -> error popup: "Existing connection... Please use another sync folder"
    * [ ] Windows without VFS, MacOS, Linux: downgrade should be possible
 ----
* [ ] Install ownCloud desktop client on latest **macOS** using .pkg installer
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.12.10
         * OpenSSL 1.1.1i
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
     * [ ] Overlay icons have changed (after 'Free up space')
 ----
 * [ ] Install ownCloud client on **Ubuntu**, Mint or Debian with GNOME desktop
 ```sudo apt install owncloud-client-nautilus```
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.12.10
         * OpenSSL at least 1.1.1 (depends on the operating system)
 * [ ] Visually check all tabs -> :robot: tst_checkAlltabs
     * [ ] Tabs look correct
 * [ ] Sync a file to the server -> :robot: tst_syncing
     * [ ] File has been synced
 * [ ] Check the overlay icons
     * [ ] Overlay icons are present
 * [ ] Share a file with another user on the same server -> :robot: tst_sharing
     * [ ] File has been shared successfully
 * [ ] Create a public link -> :robot: tst_sharing
     * [ ] Public link has been created and can be opened in a browser
 * [ ] Enable VFS -> :robot: tst_vfs
     * [ ] VFS has been enabled
 ----
 * [ ] Install ownCloud client on **Fedora** or CentOS with GNOME and Nautilus file manager (or openSUSE with KDE and dolphin)
 ```sudo yum install owncloud-client-nautilus``` or openSUSE with KDE and Dolphin ``sudo zypper install owncloud-client-dolphin``
     * [ ] Settings tab, About has correct versions:
         * ownCloud client version
         * Qt 5.12.10
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
     * [ ] VFS has been enabled
 ----
 * [ ] For Beta or RC: Install **Testpilot client on Windows 10**
     * [ ] disable VFS in connction wizard
         * [ ] files are synced physically (right click menu doesn't show "Always keep on this device") 
     * [ ] Settings tab, About has correct versions:
         * testpilot client version
         * Qt 5.12.10 (optional)
         * OpenSSL 1.1.1i (optional)
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
 * [ ] Testpilot client doesn't show ownCloud name or logo
     * [ ] Not mentioned in
         * Installer, Connection Wizard, Settings page, About dialog.

----

 * [ ] Download signatures and keys are valid. Verify if the automated key-checker at
     * [ ] https://jenkins.int.owncloud.com/view/monitor/job/monitor-certs/lastCompletedBuild/console
         * was run today/yesterday
         * has latest platform versions of each family.
         * has stable, daily & testing
         * has all Release.key, repomd.xml.key expiries > 1y


 * [ ] use Hannah's python script to trigger backup
     * [ ] client responds at socket api (and log) with V2/BACKUP_FILES_FROM_RESULT
     * [ ] test with > 100 files, response lists them all.
