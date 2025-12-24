# Tests

## 1. Server smoke test via desktop client

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Connect via OpenID-Connect | Connect with openID-Connect | Redirect roundtrip to IDP, user can log in | | |
| 2  | Verify server-to-client file sync | Sync a file from a server to a client | File has been synced to the client | | |
| 3  | Verify client-to-server file sync | Sync a file from a client to a server | The file has been synced to the server | | |
| 4  | Verify public link share creation | Share a file via public link (enforce password/expiry). ocis: Share a file opens WebUI. | ocis: WebUI opens. | | |
| 5  | Verify sync of shared file content edit | Make changes to the content of the shared file | Changes synced to server. Collaborator receives changes. | | |
| 6  | Verify collaborator does NOT receive rename of shared file | Rename a shared file | Changes synced to server. Collaborator has **NOT** received the changes. | | |
| 7 | Verify collaborator does NOT receive move of shared file | Move a shared file | Changes synced to server. Collaborator has **NOT** received the changes. | | |
| 8 | Verify collaborator's file is deleted when share is deleted | Delete a shared file | File deleted on server. File also deleted from collaborator. | | |
| 9 | Verify 'Server Activity' tab logs sharing actions | 1. Go to Activity tab.<br/> 2. Check the server activity.<br/> 3. If needed trigger some notifications:<br/> <br/> **Server admin**<br/> Sharing -> enable the checkbox:<br/> [x] Automatically accept new incoming local user shares<br/> <br/> **User alice**<br/> - Opens the web UI, settings, sharing.<br/> - Enable mail and stream notification for 'A file or folder has been shared'.<br/> <br/> User alice connects a desktop client and opens the 'Server Activity' tab.<br/> User bob shares his Photos folder with alice.<br/> Wait 1 minute.<br/> User alice sees a line 'bob shared Photos with you' in the activity tab of the client.<br/> User bob removes the share for his Photos.<br/> User alice sees 'bob removed the share for Photos'. | Server activities have been logged (tab is not empty). | | |
| 10 | Verify actionable share notification in client | Send notification with action by sharing a folder.<br/> <br/> **Server admin**<br/> Sharing -> disable the checkbox:<br/> [ ] Automatically accept new incoming local user shares<br/> <br/> **User bob** shares his Photos folder with alice.<br/> <br/> Wait 1 minute.<br/> User alice sees a bell icon when she refreshes the web ui:<br/> "bob" shared "Photos" with you<br/> [Accept] [Decline]<br/> <br/> User alice sees a Notification on the client activity tab:<br/> "bob" shared "Photos" with you<br/> [Dismiss] [Accept] [Decline]<br/> Click accept.<br/> The message refreshes and disappear a few seconds later.<br/> The bell icon in the web UI also disappears.<br/> wait 1 minute<br/> Client starts syncing the new contents. | User alice sees a Notification on the client activity tab: `"bob" shared "Photos" with you [Dismiss] [Accept] [Decline]` | | |

## 2. Desktop sync client smoke test

### Precondition

This is the smoke test for community desktop sync client and a regression test for branded desktop sync client 

Background

*   latest stable server
*   includes visual checks

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

## 3. Desktop sync client regression test

### Precondition

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

## 4. Smoke test for Beta and RCs

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify macOS client installation does not crash | Install owncloud on mac. Wait 5s. | No crash | | | 
| 2  | Verify Windows client installation does not crash | Install owncloud on windows. Wait 5s. | No crash | | | 
| 3  | Verify Linux client installation does not crash | Install owncloud on linux (pick one distro). Wait 5s. | No crash | | | 
| 4  | Verify branded Testpilot client installation does not crash and branding is correct | Install testpilotcloud on one platform (pick one of mac, win or linux). Wait 5s. | No crash. Branding looks ok. | | | 
