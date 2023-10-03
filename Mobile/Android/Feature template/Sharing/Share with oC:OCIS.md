### Share with oC / oCIS


**Server(s)**: <br>
**Device(s)**: <br>
**Execution date**: <br>
**Tester**: <br>
**Context**: <br>


 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Share with oCIS**||||||
| Only Personal | 1. Open a 3rd party app (like "Photos") and select one item<br>2. Share with oC, using an account that does not have custom spaces<br>3. Upload in root folder<br>4. Open "Uploads" in the bottom bar | 2. List of spaces listed, only "Personal"<br>3. File upload to root<br>4. Upload visible as "UPLOADED", with the correct path and space| |  |
| Personal + custom spaces | 1. Open a 3rd party app (like "Photos") and select one item<br>2. Share with oC, using an account that include custom spaces<br>3. Select a custom space<br>4. Upload in non-root folder<br>5. Open "Uploads" in the bottom bar | 2. List of spaces listed with all the spaces<br>4. File upload to non-root<br>5. Upload visible as "UPLOADED" with the correct path and spac | |  |
| Multiaccount - Personal | 1. Add two oCIS accounts to the app<br>2. Open a 3rd party app (like "Photos") and select one item<br>3. Share with oC<br>4. Choose one account and upload to personal space, root folder<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. File upload to root of Personal<br>5. Upload visible as "UPLOADED" with the correct path and space | |  |
| Multiaccount - custom | 1. Add two oCIS accounts to the app<br>2. Open a 3rd party app (like "Photos") and select one item<br>3. Share with oC<br>4. Choose one oCIS account and upload to a custom space, non-root folder<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. File upload to non-root of chosen space<br>5. Upload visible as "UPLOADED" with the correct path and space | | |
| Several files | 1. Add two accounts to the app<br>2. Open a 3rd party app (like "Photos") and select several items<br>3. Share with oC<br>4. Choose one account and upload to non-root folder of any space<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. Files upload to non-root in the chosen space<br>5. Uploads visible as "UPLOADED" with the correct path and space | |  |
| Conflict in Personal | 1. Open a 3rd party app (like "Photos") and select many items<br>2. Share with oC<br>3. Choose one account, Personal space, and upload to non-root folder<br>4. Repeat 1. 2. and 3. to trigger a conflict | Conflict dialog is shown | NA |  |
| Conflict in custom space| 1. Open a 3rd party app (like "Photos") and select many items<br>2. Share with oC<br>3. Choose one account, a custom space, and upload to non-root folder<br>4. Repeat 1. 2. and 3. to trigger a conflict | Conflict dialog is shown | NA |  |
| Share with security | 1. Enable any security method (passcode/pattern/biometric)<br>2. Open a 3rd party app (like "Photos") and select an item<br>2. Share with oCIS | Security asked |  |  |
| No upload permissions | 1. Open a 3rd party app (like "Photos") and select an item<br>2. Share with oC<br>3. Choose one space in the account, that is granted only with "Can view" | Error: `You have no permissions` <br>`to add content here` |  |  |
|**Share with oC10**||||||
| One file - One account | 1. Open a 3rd party app (like "Photos") and select one item<br>2. Share with oC<br>3. Upload in root folder<br>4. Open "Uploads" in the bottom bar | 2. Root folder listed<br>3. File upload to root<br>4. Upload visible as "UPLOADED"  with the correct path | P t13 m11 |  |
| One file - Multiaccount | 1. Add two accounts to the app<br>2. Open a 3rd party app (like "Photos") and select one item<br>3. Share with oC<br>4. Choose one account and upload to root folder<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. File upload to root<br>5. Upload visible as "UPLOADED"  with the correct path | |  |
| Several files - One account | 1. Open a 3rd party app (like "Photos") and select several items<br>2. Share with oC<br>3. Upload in non-root folder<br>4. Open "Uploads" in the bottom bar | 2. Root folder listed<br>3. Files upload to non-root<br>4. Uploads visible as "UPLOADED"  with the correct path | |  |
| Several files - Multiaccount | 1. Add two accounts to the app<br>2. Open a 3rd party app (like "Photos") and select many items<br>3. Share with oC<br>4. Choose one account and upload to non-root folder<br>5. Open "Uploads" in the bottom bar | 3. Dialog to select account is displayed<br>4. Files upload to non-root<br>5. Uploads visible as "UPLOADED"  with the correct path |  |   |
| No folder permissions | 1. Open a 3rd party app (like "Photos") and select an item<br>2. Share with oC<br>3. Choose one folder in the account with no upload permission (shared without permission, f. ex) | Not posible to submit the upload.<br>Error: <br>`You have no permissions to add`<br>` content here!` | |  |
| Conflict | 1. Open a 3rd party app (like "Photos") and select many items<br>2. Share with oC<br>3. Choose one account and upload to non-root folder<br>4. Repeat 1. 2. and 3. to trigger a conflict | Conflict dialog is shown | NA |  |
| Share with security | 1. Enable any security method (passcode/pattern/biometric)<br>2. Open a 3rd party app (like "Photos") and select an item<br>2. Share with oC10 | Security asked |  |  |
|**Share text**||||||
| Share text root - One account | 1. Open a 3rd party app with text(web Browser)<br>2. Select text and share with oC<br>3. Upload in root folder<br>4. Enter a name for the txt file<br>5. Open "Uploads" in the bottom bar | 2. Root folder listed<br>4. File upload to root with the given name<br>5. Upload visible as "UPLOADED" with the correct path |  |  |
| Share text non-root - Multiaccount | 1. Add two accounts to the app<br>2. Open a 3rd party app with text(web Browser)<br>3. Select text and share with oC<br>4. Choose one of the accounts and upload in non-root folder<br>5. Enter a name for the txt file<br>6. Open "Uploads" in the bottom bar | 4. Root folder listed<br>5. File upload to root with the given name<br>5. Upload visible as "UPLOADED"  with the correct path |  |  |
| Share text oCIS  | 1. Add two oCIS accounts to the app<br>2. Open a 3rd party app with text(web Browser)<br>3. Select text and share with oC<br>4. Choose one of the accounts, a custom space, and upload in non-root folder<br>5. Enter a name for the txt file<br>6. Open "Uploads" in the bottom bar | 4. Root folder listed<br>5. File upload to non-root of the space with the given name<br>5. Upload visible as "UPLOADED" with the correct path and space |  |  |
| Forbidden characters | 1. Open a 3rd party app with text (web Browser)<br>2. Select text and share with oC<br>3. Upload in root folder<br>4. Enter a name for the txt file including forbidden characters like "/" or "\\" | Error: `Forbidden characters: / \`<br>Upload button locked |  |  |
| Log txt name | 1. Open a 3rd party app with text(web Browser)<br>2. Select text and share with oC<br>3. Upload in root folder<br>4. Enter a very long name for the txt file (longer than 223) | Error: `Filename must not be longer than`<br>`223 characters`<br>Upload button locked | |  |
| Share with security | 1. Enable any security method (passcode/pattern/biometric)<br>2. Open a 3rd party app with text(web Browser)| Security asked|  |  |
|**Other errors**||||
| Share item no connection | 1. Remove connection from device<br>2. Open a 3rd party app and share any content with any oC account  | Upload enqueued waiting for connection | |  |
| Share item no server connection | 1. Switch server off<br>2. Open a 3rd party app and share any content with any oC account  | Error: `An error occurred while`<br>` connection with the server` (notification)<br>`Connection error` (uploads view) |  |  |
| Maintenance mode | 1. Set server in maintenance mode (oC10)<br>2. Select an item from the list by clicking on the 3-dot-button and click on `Remove`<br>3. Select `YES` | Error: `System in maintenance mode` (notification)<br>`Server is unavailable` (uploads view)|  |  |
