### Message Queue

#### PR: [https://github.com/owncloud/ios-app/pull/662](https://github.com/owncloud/ios-app/pull/662)

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Uploads**|
| Several files - Remove target - View | 1. Select to upload many files<br>2. Before submitting, remove the target folder | Error notified in status. Correct badges in account list and app icon with correct number of errors| F m13  | Stucked  |
| Several files - Remove target - Apply to all | 1. Set maintenance mode, or switch oC server off<br>2. Upload many files<br>3. Apply same action (retry) to all files after recovering conneciton | Action applied to all pending files |   |  |
| Several files - Remove target - Show all | 1. Set maintenance mode, or switch oC server off<br>2. Upload many files<br>3. Show all<br>4. Select one| 3. All actions are listed.<br>4. Only the selected action is done. Other ones keep pending. Number of actions decreases in status icon, list of accounts and app icon  |   |  |
| Auto uploads | 1. Enable AutoUploads (no matter videos or photos)<br>2. Set an account and target folder<br>3. Close the app<br>4. In another client or web, move/remove/rename the target folder<br>5. Take some content from the camera and reopen the app| Error notified in status. Correct badges in account list, and app icon with correct number of errors |  F m13 | stucked |
| Cancelling pending| 1. Upload 20 files<br>2. In Status view, cancel 3 when they are pending| They are removed from the queue. Not uploaded. 17 files in the folder | P m13  |  |
| Cancelling uploading| 1. Upload 20 files<br>2. In Status view, cancel 3 when they are running| They are removed from the queue. Not uploaded. 17 files in the folder | P m13  |  |
| Multiaccount| 1. Attach several accounts<br>2. Cause errors in both (f.ex removing target folder)<br>3.  | They are removed from the queue. Not uploaded. 17 files in the folder | P m13  |  |
|**Quota**|
| Oversize quota| 1. In any account, set the quota very close to the current usage<br>2. Upload something, so the quota is overpassed  | Correct error | F m13  | Keep both  |
|**File Firewall**|
|**Files APP**|
| Rename with existing | Rename an item with an existing name | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors  | P m13 |
| Notification redirection | 1. Perform the same actions in the test above<br>2. Click on the notification |  Redirected to the app | P m13  |  |
| Rename with existing - non root - redirection | Rename an item with an existing name in a non root folder | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13  |  |
| Copy with existing | Copy an item to a folder with an item with existing name | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 |  |
| Copy to non existing | Copy an item to a folder<br>Before submitting, remove the folder using other client | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 |  |
| Move to non existing | Move an item to a folder<br>Before submitting, remove the folder using other client | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 |  |
| Oversize quota| 1. In any account, set the quota very close to the current usage<br>2. Upload something in Files App, so the quota is overpassed  |  Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors | P m13  |  |
| Notification redirection multiaccount | 1. Add more accounts to the device<br>2. Perform the same actions in the tests above<br>3. Click on the notification |  Redirected to the app, to the correct account | F m13  | Redirected to the active account |
| Several notifications | Rename several items with an existing names | Notifications pop up. Errors notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 |
| Apply to all | Rename several items with an existing names<br>In the app status view, select Apply all, and cancell all | Everithing cancelled | P m13
| Fix problem | Repeating any of the cases above, fix the problem that caused the error | Status view is cleaned and badges vanish from app icon and list of bookmarks | P m13  |  |
|**Mixed errors**|
| Errors of two types | 1. Cause error in uploads (deleting the target folder)<br>2. Cause error of copy/move(by using existing name in the target folder)<br>3. Apply fix to all uploads errors | 2. Check all badges are correct with the exact number of fails, in app icon, list of bookmarks and status icon<br>Check that every kind of error must the solved separate from the other one<br>3. Uploads errors are fixed, copy errors keep pending| P m13 |  |
|**Keyboard shortcuts**|
