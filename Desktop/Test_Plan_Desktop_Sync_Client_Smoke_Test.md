# Desktop Sync Client Smoke Test

This is the smoke test for community desktop sync client and a regression test for branded desktop sync client 


| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Windows .msi install & certificate | Fresh install on **Windows 10** using .msi. Check publisher and certificate during install. | Verified publisher: ownCloud GmbH. Certificate info shown (Issued to, by, dates). | | |
| 2  | Verify client version on Windows | Check the versions in Settings tab | ownCloud installed version is correct | | |
| 3  | Verify basic file sync on Windows | Sync a file to the server | File has been synced | | |
| 4  | Verify overlay icons with VFS on Windows | Check the overlay icons (VFS enabled) | Overlay icon are present | | |
| 5  | Verify disabling VFS on Windows downloads files | Disable VFS | VFS disabled. Overlay icons change. **All** cloud files are downloaded and **NOT** deleted. | | Ref: GitHub Issue [#11331](https://github.com/owncloud/client/issues/11331) |
| 6  | Verify Windows crash reporter | Verify that the crash reporter works | Crash reporter sends messages to Sentry | | |
| 7  | Verify macOS .pkg install & version | Install on latest **macOS** using .pkg. Check versions in General tab. | ownCloud installed version is correct | | |
| 8  | Verify basic file sync on macOS | Sync a file to the server | File has been synced | | |
| 9  | Verify overlay icons on macOS | Check the overlay icons | Overlay icon are present | | |
| 10 | Verify VFS hydrate/dehydrate on macOS | Enable VFS. Dehydrate one file and double-click to open it. | VFS enabled. File is downloaded and no `.owncloud` suffix. | | |
| 11 | Verify macOS crash reporter | Verify that the crash reporter works | Crash reporter sends messages to Sentry | | |
| 12 | Verify Ubuntu/Debian install & version | 1. Install client on **Ubuntu/Debian with GNOME**. 2. `sudo apt install owncloud-client-nautilus`. 3. Check versions. | ownCloud installed version is correct | | |
| 13 | Verify basic file sync on Ubuntu/Debian | Sync a file to the server | File has been synced | | |
| 14 | Verify overlay icons on Ubuntu/Debian | Check the overlay icons | Overlay icon are present | | |
| 15 | Verify VFS hydrate/dehydrate on Ubuntu/Debian | Enable VFS. Dehydrate one file and double-click to open it. | VFS enabled. File is downloaded and no `.owncloud` suffix. | | |
| 16 | Verify Fedora install & version | 1. Install client on **Fedora with GNOME/Nautilus**. 2. `sudo yum install owncloud-client-nautilus`. 3. Check versions. | ownCloud installed version is correct | | |
| 17 | Verify Testpilot install & version on Windows | Install **Testpilot** client on **Windows 10**. Check versions. | ownCloud installed version is correct | | |
| 18 | Verify Testpilot initial sync | Verify initial sync worked | Initial sync worked | | |
| 19 | Verify Testpilot branding | Testpilot doesn't show ownCloud only name and logo | Testpilotcloud name and logo are present | | |
| 20 | Verify Linux AppImage works | Run the **Linux AppImage** and sync a file | AppImage works | | |
| 21 | Verify AppImage crash reporter | Verify that the crash reporter works | Crash reporter sends messages to Sentry | | |
