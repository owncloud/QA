# Desktop Sync Client Regression Test

This is the short regression test for deskop sync client 

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify Windows install & versions | Fresh install on **Windows 10** (.msi). <br/> Check versions in General tab. | All versions are correct (ownCloud installed version). | | |
| 2  | Verify Windows UI visually | Visually check all tabs | Tabs look correct | | |
| 3  | Verify basic sync on Windows | Sync a file to the server | File has been synced | | |
| 4  | Verify overlay icons on Windows | Check the overlay icons | Overlay icons are present | | |
| 5  | Verify VFS enable on Windows | Enable VFS | VFS enabled. Overlay icons changed. | | |
| 6  | Verify macOS install & versions | Install ownCloud desktop client on latest **macOS** (.pkg). Check versions. | All versions are correct (ownCloud installed version). | | |
| 7  | Verify macOS UI visually | Visually check all tabs | Tabs look correct | | |
| 8 | Verify basic sync on macOS | Sync a file to the server | File has been synced | | |
| 9 | Verify overlay icons on macOS | Check the overlay icons | Overlay icons are present | | |
| 10 | Verify Ubuntu/Debian install & versions | 1. Install on **Ubuntu/Debian with GNOME**. <br/> 2. `sudo apt install owncloud-client-nautilus`. <br/> 3. Check versions. | All versions are correct (ownCloud installed version). | | |
| 11 | Verify Ubuntu/Debian UI visually | Visually check all tabs | Tabs look correct | | |
| 12 | Verify basic sync on Ubuntu/Debian | Sync a file to the server | File has been synced | | |
| 13 | Verify overlay icons on Ubuntu/Debian | Check the overlay icons | Overlay icons are present | | |
| 14 | Verify Fedora install & versions | 1. Install on **Fedora with GNOME/Nautilus**. <br/> 2. `sudo yum install owncloud-client-nautilus`. <br/> 3. Check versions. | All versions are correct (ownCloud installed version). | | |
| 15 | Verify Fedora UI visually | Visually check all tabs | Tabs look correct | | |
| 16 | Verify basic sync on Fedora | Sync a file to the server | File has been synced | | |
| 17 | Verify overlay icons on Fedora | Check the overlay icons | Overlay icons are present | | |
| 18 | Verify openSUSE/KDE install & version | Install on **openSUSE with KDE/dolphin**. | ownCloud installed version is correct | | |
| 19 | Verify openSUSE/KDE UI visually | Visually check all tabs | Tabs look correct | | |
| 20 | Verify overlay icons on openSUSE/KDE | Check the overlay icons | Overlay icons are present | | |
| 21 | Verify basic sync on openSUSE/KDE | Sync a file to the server | File has been synced | | |
| 22 | Verify context menu on openSUSE/KDE | Check context menu in the file manager | Context menu in the file manager is present | | |
| 23 | Verify AppImage works | Check AppImage | AppImage works | | |
| 24 | Verify Testpilot install & version (Beta/RC) | For Beta or RC: Install **Testpilot** client on Windows 10. Check versions. | ownCloud installed version is correct | | |
| 25 | Verify Testpilot UI visually | Visually check all tabs | Tabs look correct | | |
| 26 | Verify basic sync on Testpilot | Sync a file to the server | File has been synced | | |
| 27 | Verify overlay icons on Testpilot | Check the overlay icons | Overlay icons are present | | |
| 28 | Verify public link on Testpilot | Create a public link | Public link created and can be opened in a browser | | |
| 29 | Verify VFS enable on Testpilot | Enable VFS | VFS enabled. Overlay icons changed. | | |
| 30 | Verify Testpilot branding | Branded client doesn't show ownCloud name or logo | Branding is consistent | | |
