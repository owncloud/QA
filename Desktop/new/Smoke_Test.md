## Desktop Sync Client Smoke Test - TestRail

## T5066: Desktop Sync Client Smoke Test

| **Status**   | Type          | Priority | Estimate | References | Is Automated | Automation Type | Need Implement |
|----------|--------------|----------|----------|------------|--------------|----------------|----------------|
| Untested | Smoke & Sanity | Medium   | None     | None       | No           | None           | No             |


---

## Preconditions
This is the smoke test for the community desktop sync client and a regression test for the branded desktop sync client.

Background
- Latest stable server
- Includes visual checks

---

## Steps

| Step | Description |
|------|------------|
| **1. Windows:** <br> - Fresh install the ownCloud desktop client using the `.msi` installer. <br> - During installation, check the MSI details page for: <br> &nbsp;&nbsp; - **Verified publisher** <br> &nbsp;&nbsp; - **Certificate expiry** | **Verified publisher:** ownCloud GmbH <br> **Show information about the publisher's certificate:** <br> - Issued to: ownCloud GmbH <br> - Issued by: `<Issuer>` Code Signing CA <br> - Valid from `<start-date>` to `<end-date>` <br> **Reference:** [Enterprise Issue #4334](https://github.com/owncloud/enterprise/issues/4334#issuecomment-749115521) |
| 2. Check the version from Settings tab → About | ownCloud installed version is correct |
| 3. Sync a file to the server | Ensure the file has been synced. |
| 4. Check the overlay icons (VFS enabled) | Confirm overlay icons are present. |
| 5. Disable VFS | - Disable VFS. <br> - Confirm overlay icons have changed. <br> - Check that all cloud files are downloaded and NOT deleted (in both client and server). <br> Reference: [GitHub Issue #11331](https://github.com/owncloud/client/issues/11331) |
| 6. Verify that the crash reporter works | Confirm that the crash reporter sends messages to Sentry. |
| **7. Mac** <br> &nbsp;&nbsp;&nbsp;&nbsp; - Install the ownCloud desktop client using the `.pkg` installer. <br> &nbsp;&nbsp;&nbsp;&nbsp; - Check the version from the **Settings tab → About** | <br> ownCloud installed version is correct. |
| 8. Sync a file to the server | File has been synced. |
| 9. Check the overlay icons | Overlay icons are present. |
| 10. Enable VFS  <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dehydrate one file and double-click to open it | VFS has beed enabled <br> File is downloaded and no `.owncloud` suffix. |
| 11. Verify that the crash reporter works | Confirm that the crash reporter sends messages to Sentry. |
| **12. Ubuntu or Debian with GNOME desktop**  <br> &nbsp;&nbsp;&nbsp;&nbsp; - Install ownCloud client. <br> &nbsp;&nbsp;&nbsp;&nbsp; - Install Nautilus extension: <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```sudo apt install owncloud-client-nautilus``` <br> &nbsp;&nbsp;&nbsp;&nbsp; - Check the version from the Settings tab -> About| ownCloud installed version is correct
| 13. Sync a file to the server | File has been synced. |
| 14. Check the overlay icons | Overlay icons are present. |
| 15. Enable VFS <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dehydrate one file and double-click to open it. | VFS is enabled <br> File is downloaded without the `.owncloud` suffix. |
| **16. Fedora with GNOME desktop** <br> &nbsp;&nbsp;&nbsp;&nbsp; - Install ownCloud client. <br> &nbsp;&nbsp;&nbsp;&nbsp; - Install Nautilus extension: <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;```sudo yum install owncloud-client-nautilus``` <br> &nbsp;&nbsp;&nbsp;&nbsp; - Go to **Settings tab → About** | ownCloud installed version is correct. |
| **17. Testpilot on Windows:** <br> &nbsp;&nbsp;&nbsp;&nbsp; - Install the Testpilot client. <br> &nbsp;&nbsp;&nbsp;&nbsp; - Check the version from Settings tab → About. | ownCloud installed version is correct |
| **18. Verify initial sync worked** | Initial sync worked | 
| 19. Testpilot doesn't show ownCloud only name and logo | Testpilotcloud name and logo are present | 
| **20. Linux AppImage** <br> &nbsp;&nbsp;&nbsp;&nbsp; Run and sync a file | Verify that the AppImage works | 
| 21. Verify that the crash reporter works | Crash reporter sends messages to Sentry. |


### Results

| Untested <br> QA T. <br> 6/3/2024 7:35 AM <br> Assigned To  | This test was marked as 'Untested'. |
|----------|-------------------------------|








