### Message Queue

#### PR: [https://github.com/owncloud/ios-app/pull/662](https://github.com/owncloud/ios-app/pull/662)

Devices: iPhone XR v13.4, iPadAir v13.4<br>
Server: 10.4.1

---

 
| Test Case | Steps | Expected | Result | Related Comment | 
| :-------- | :---- | :------- | :----: | :-------------- | 
|**Uploads**|
| Several files - Remove target - View | 1. Select to upload many files<br>2. Before submitting, remove the target folder | Error notified in status. Correct badges in account list and app icon with correct number of errors| P m13 t13 | FIXED: Stucked  |
| Several files - Remove target - Apply to all | 1. Select to upload many files<br>2. Before submitting, remove the target folder<br>3. Apply same action (retry) to all files | Action applied to all pending files | P m13 t13  | FIXED: Only applies to the files being processed |
| Several files - Remove target - Show all | 1. Select to upload many files<br>2. Before submitting, remove the target folder<br>3. Upload many files<br>4. Show all<br>5. Select one| 4. All actions are listed.<br>5. Only the selected action is done. Other ones keep pending. Number of actions decreases in status icon, list of accounts and app icon  | P m13 t13 |  |
| Auto uploads | 1. Enable AutoUploads (no matter videos or photos)<br>2. Set an account and target folder<br>3. Close the app<br>4. In another client or web, move/remove/rename the target folder<br>5. Take some content from the camera and reopen the app| Error notified in status. Correct badges in account list, and app icon with correct number of errors | P m13 t13 | FIXED: stucked |
| Multiaccount| 1. Attach several accounts<br>2. Cause errors in both (f.ex removing target folder beore the uploads finish) | Errors notified in status view. Correct badges in both account lists and app icon with correct number of errors, summing errors in both accounts | P m13 t13  |  |
| Cancelling uploading| 1. Upload 20 files<br>2. In Status view, cancel 3 when they are running| They are removed from the queue. Not uploaded. 17 files in the folder | P m13 t13 |  |
| Multiwindow | 1. In iPad split window with two different accounts<br>2. In one of the accounts, peform the "Remove target" test case (remove the target folder just before submitting the uploads)| All errors and notifications appears in the correct window | P t13 |  |
|**Quota**|
| Oversize quota| 1. In any account, set the quota very close to the current usage<br>2. Upload something, so the quota is overpassed  | Correct error | P m13 t13  | FIXED: Keep both  |
|**File Firewall**|
| File size | 1. In file Firewall app, set a rule to ban uploads by size (f. ex >1MB)<br>2. Upload something greater than 1MB<br>3. Fix errors grouping them | 2. Correct error<br>3. Errors fixed | P m13 t13 |  |
| Device | 1. In file Firewall app, set a rule to ban operations by device = iOS client<br>2. Upload something<br>3. Fix errors grouping them | 2. Correct error<br>3. Errors fixed | P m13 t13  |  |
| File size + Device | 1. In file Firewall app, set a rule to ban uploads by size (f. ex >1MB) and a rule to ban operations by device = iOS<br>2. Upload several file greater than 1MB<br>3. Fix errors grouping them | 2. Correct errors<br>3. Errors fixed | P m13 t13 |  |
|**Files APP**|
| Rename with existing | Rename an item with an existing name | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors  | P m13 t13 |
| Notification redirection | 1. Perform the same actions in the test above<br>2. Click on the notification |  Redirected to the app | P m13  t13 |  |
| Rename with existing - non root - redirection | Rename an item with an existing name in a non root folder | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 t13 |  |
| Copy with existing | Copy an item to a folder with an item with existing name | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 t13 |  |
| Copy to non existing | Copy an item to a folder<br>Before submitting, remove the folder using other client | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 t13|  |
| Move to non existing | Move an item to a folder<br>Before submitting, remove the folder using other client | Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 t13 |  |
| Oversize quota| 1. In any account, set the quota very close to the current usage<br>2. Upload something in Files App, so the quota is overpassed  |  Notification pops up. Error notified in status. Correct badges in account list, and app icon with correct number of errors | P m13 t13 |  |
| Notification multiaccount | 1. Add more accounts to the device<br>2. Perform the same actions in the tests above in different accounts | Notification includes the account in which the error happened | P m13 t13  | |
| Several notifications | Rename several items with existing names | Notifications pop up. Errors notified in status. Correct badges in account list, and app icon with correct number of errors| P m13 t13 |
| Apply to all | Rename several items with an existing names<br>In the app status view, select Apply all, and cancell all | Everything cancelled | P m13 t13 |
| Fix problem | Repeating any of the cases above, fix the problem that caused the error | Status view is cleaned and badges vanish from app icon and list of bookmarks | P m13 t13 |  |
|**Mixed errors**|
| Errors of two types | 1. Cause error in uploads (deleting the target folder)<br>2. Cause error by creating a folder with existing name in File App | The errors have different options to be fixed: Uploads have Cancel and Retry, and existing name only Cancel. They are displayed by separate to be fixed with their own options.<br>Check all badges are correct with the exact number of fails, in app icon, list of bookmarks and status icon<br>Check that every kind of error must the solved separate from the other one| P m13 t13 | |
| Fix Errors of two types | From previous case, fix errors of uploads by using the "Apply all" and the Cancel option | All uploads are cancelled<br>Existing name folder error persists | P m13 t13 | |
| Different errors of same type | 1. Cause error in uploads (deleting the target folder)<br>2. Cause error by exceeding account quota | The errors have same options to be fixed: Cancel and Retry. They are displayed together.<br>Check all badges are correct with the exact number of fails, in app icon, list of bookmarks and status icon<br>Check that every kind of error must the solved separate from the other one| P m13 t13 | |
| Fix Errors of same types | From previous case, fix errors of by using the "Apply all" and the Cancel option | Everything is cancelled| P m13 t13 | |
|**Keyboard shortcuts (add phisical keyboard to iPad)**|
| Notification | 1. Cause an error in a upload (deleting the target folder)<br>2. Long press cmd | Option to fix the problem are present in the keyboard shortcut menu | P t13