# Branded Release - QA Client Test

## Precondition

Build the clients:

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
| 1  | Verify VFS enforced on Windows for QA Client | Check VFS with **QA Testing Client** on **Windows** | 1. VFS on Windows **cannot** be turned off after account setup from client GUI. <br/> 2. ownCloud client icon shown in file manager sidebar. | | |
| 2  | Verify VFS enforced on macOS for QA Client | Check VFS with **QA Testing Client** on **mac** | 1. VFS **not available** on mac at all. <br/> 2. ownCloud client icon shown in file manager sidebar. | | |
| 3  | Verify QA Client install on Debian | Install the package **QA Testing Client** on **Debian latest** and log in | 1. Server address is **not** fixed <br/> 2. Installed version correct <br/> 3. Theme consistent <br/> 4. Overlay icons shown <br/> 5. **No VFS** | | |
