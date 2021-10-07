## Regression Testplan Patch Release

### Template: 
[Regression_Test_Plan_Patch_Release.md](https://github.com/owncloud/QA/blob/master/Desktop/Regression_Test_Plan_Patch_Release.md)

(from: https://testlink.owncloud.team/linkto.php?tprojectPrefix=desktop&item=testcase&id=desktop-158)

<!-- Updates:
 * General tab -> Settings tab, About, Versions
 * dowload, keys checker.
-->

<!-- Not clickable :-(
| Nr | Action | Expected Result | :heavy_check_mark:  | :x:  | |
|-|-|-|-|-|-|
| 1 | Fresh install on Win10 using MSI | The MSI details page has<br>- Verified publisher: ownCloud GmbH<br>- certificate expires > 1y | <ul><li>[ ] </ul></li> | <ul><li>[ ] </uk></li> |
-->

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
* [ ] Check the overlay icons
     * [ ] Win10: No overlay icons if using VFS. Uses status column in explorer. Overlay icons are shown without VFS
* [ ] Share a file with another user on the same server
     * [ ] File has been shared successfully
* [ ] Create a public link
     * [ ] Public link has been created and can be opened in a browser
* [ ] disable / re-enable VFS
     * [ ] VFS has been disabled / enabled
     * [ ] explorer status column changes
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
 * [ ] All platform install and gpg test ssh://git@gitea.owncloud.services:2222/client/linux-docker-install.git
    * [ ] manually deploy a linux download repo, or use a download repo from https://download.owncloud.com/desktop/ownCloud/testing/
    * [ ] in defs.sh edit `repo=` and update `platform_docker_images=`
    * [ ] RUN.sh -> paste the log/test_YYYYMMDD_hhmm.log file into the client release ticket.
 ----
 * [ ] Install ownCloud client on **Fedora** or CentOS with GNOME and Nautilus file manager (or openSUSE with KDE and dolphin)
 ```sudo yum install owncloud-client-nautilus```
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
         * [ ] files are synced physically (right click menu shows grayed out "Make available offline") 
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
     * [ ] explorer status column changes, when "free up local space" is clicked.
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
