# Branded Release

## 1. Cactus - fixed server url, VFS off, doesn't use own icons

### Precondition

Build three clients:
* **Cactus** theme: cactus_test
    - VFS is unchecked
    - Fixed server url
    - Don't use your own icons (tray icons/mac menu icons)
    - Optional: Sidebar icon for macOS (in Finder links)
* **btr-testing** theme: btrtesting
    - VFS checked, enforced unchecked
    - Use your own icons
    - No optional: Sidebar icon for macOS
* **QA Testing Client** theme: hg
    - VFS checked, enforced checked
    - Don't Use your own icons
    - No optional: Sidebar icon for macOS

Install Linux packages and appimages according to our owncloud documentation: 
https://doc.owncloud.com/desktop/next/installing.html#installation-on-linux

To build the client:

1.  Log in to customer
2.  Go to ownBrander
3.  Change user - &gt; e.g. Carlos Damken Testing cloud -&gt; Switch to user
4.  Select Desktop in the left menu
5.  Adjust the version
6.  Click Generate

Download the built packages

1.  Login with an admin account to customer
2.  Go to All files -&gt; ownBrander customer builds -&gt; e.g. carlos_damken -&gt; Desktop Client

| ID | Test Case                        | Steps to reproduce                                                                                                                                            | Expected Result                                                                                                                                                                                    | Result | Related Comment |
|----|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Cactus install on Windows | Install **Cactus** on **Windows** and log in | 1. Server address fixed to https://cloud.damken.com <br/> 2. Installed version correct <br/> 3. Theme consistent (tray icons) <br/> 4. Overlay icons shown <br/> 5. Branded icon shown in Explorer sidebar <br/> 6. VFS **not** available in GUI <br/> 7. Cannot switch connections to VFS | | |
| 2  | Verify Cactus install on macOS | Install **Cactus** on **macOS** and log in | 1. Server address fixed <br/> 2. Installed version correct <br/> 3. Theme consistent (tray icons) <br/> 4. Overlay icons shown <br/> 5. Branded icon shown in Finder sidebar <br/> 6. VFS **not** available <br/> 7. Cannot switch connections to VFS | | |
| 3  | Verify Cactus AppImage on Ubuntu | Install **Cactus** Appimage on **Ubuntu latest** and log in | 1. Server address fixed <br/> 2. Installed version correct <br/> 3. Theme consistent (tray icons) <br/> 4. Overlay icons shown <br/> 5. VFS **not** available | | |
| 4  | Verify Cactus AppImage on Fedora | Install **Cactus** Appimage on **Fedora latest** and log in | 1. Server address fixed <br/> 2. Installed version correct <br/> 3. Theme consistent (tray icons) <br/> 4. Overlay icons shown <br/> 5. VFS **not** available | | |

## 2. QA Client - VFS enforced, editable server url

### Precondition

Same as https://owncloud.testrail.io/index.php?/cases/view/2435

| ID | Test Case                        | Steps to reproduce                                                                                                                                            | Expected Result                                                                                                                                                                                    | Result | Related Comment |
|----|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify VFS enforced on Windows for QA Client | Check VFS with **QA Testing Client** on **Windows** | 1. VFS on Windows **cannot** be turned off after account setup from client GUI. <br/> 2. ownCloud client icon shown in file manager sidebar. | | |
| 2  | Verify VFS enforced on macOS for QA Client | Check VFS with **QA Testing Client** on **mac** | 1. VFS **not available** on mac at all. <br/> 2. ownCloud client icon shown in file manager sidebar. | | |
| 3  | Verify QA Client install on Debian | Install the package **QA Testing Client** on **Debian latest** and log in | 1. Server address is **not** fixed <br/> 2. Installed version correct <br/> 3. Theme consistent <br/> 4. Overlay icons shown <br/> 5. **No VFS** | | |

## 3. BTR Client - VFS default, editable server url

### Precondition

Same as https://owncloud.testrail.io/index.php?/cases/view/2435

| ID | Test Case                        | Steps to reproduce                                                                                                                                            | Expected Result                                                                                                                                                                                    | Result | Related Comment |
|----|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify VFS configurable on Windows for BTR Client | Check **btr-testing** VFS on **Windows** | VFS is available and can be turned off. | | |
| 2  | Verify VFS not on macOS for BTR Client | Check **btr-testing** VFS on **mac** | VFS is **not** available. | | |
| 3  | Verify BTR Client install on openSUSE | Install **btr-testing** package on **openSUSE latest** and log in | 1. Server address is **not** fixed <br/> 2. Installed version correct <br/> 3. Theme consistent <br/> 4. Overlay icons shown <br/> 5. **VFS not available** | | |

## 4. Linux tests

| ID | Test Case                        | Steps to reproduce                                                                                                                                            | Expected Result                                                                                                                                                                                    | Result | Related Comment |
|----|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify all supported Linux packages are built | Check the list of linux distributions in customer: ownBrander builds -> theme -> Desktop Client -> theme-version-linux.tar | All supported platforms are built per [documentation](https://doc.owncloud.com/desktop/next/installing.html#system-requirements). | | |
| 2  | Verify Linux Install tests pass | Run Linux Install tests for themes: DamkenCloud, QA Test Client, BTR Client. [How-to](https://confluence.owncloud.com/display/OG/Automated+Tests#AutomatedTests-LinuxInstallTest) | They passed. | | |

## 5. Migration

| ID | Test Case                        | Steps to reproduce                                                                                                                                            | Expected Result                                                                                                                                                                                    | Result | Related Comment |
|----|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify migration on Windows | Install previous version and update manually to the new version on **windows** | Accounts configured, VFS On/Off state preserved, client syncs. | | |
| 2  | Verify migration on macOS | Install previous version and update manually to the new version on **mac** | Accounts configured, VFS On/Off state preserved, client syncs. | | |
| 3  | Verify migration on Linux package | Install previous version and update manually to the new version on **linux package** | Accounts configured, VFS On/Off state preserved, client syncs. | | |
| 4  | Verify migration on Linux appimage | Install previous version and update manually to the new version on **linux appimage** | Accounts configured, VFS On/Off state preserved, client syncs. | | |
