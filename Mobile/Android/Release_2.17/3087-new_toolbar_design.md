###  New toolbar design

#### PR: https://github.com/owncloud/android/pull/3087

Devices: Pixel2 v11, Nexus 6P v7<br>
Server: 10.6

---

 
| Test Case | Steps | Expected Result | Result | Comments |
| :-------- | :---- | :-------------- | :----: | :------- |
|**Toolbar file list root**||||||
| Portrait | Open the list of files in portrait | Toolbar correctly visible and placed| P m11 m7 |  |
| Landscape | Open the list of files in landscape | Toolbar correctly visible and placed| P m11 m7 |  |
| Search portrait | Open the list of files in portrait<br>Tap on lens icon<br>Input any string | List of files filtered correctly| P m11 m7 |  |
| Search landscape | Open the list of files in landscape<br>Tap on lens icon<br>Input any string | List of files filtered correctly| P m11 m7 |  |
| Avatar portrait | Open the list of files in portrait<br>Tap on avatar | Prompted to Manage Accounts view| P m11 m7 |  |
| Avatar landscape | Open the list of files in landscape<br>Tap on avatar | Prompted to Manage Accounts view| P m11 m7 |  |
| Change avatar| Open the list of files to check the avatar<br>In server, upload a different avatar<br>Reload the files view | Avatar is refreshed | P m11 m7 |
| Remove avatar| From previous test case, go to server and remove the avatar<br>Reload the files view | Avatar is refreshed and set the default one | P m11 m7 |
|**Toolbar non-root**||||||
| Portrait | Open the list of files (non-root folder) in portrait | Toolbar correctly visible and placed| P m11 m7|  |
| Landscape | Open the list of files (non-root folder) in landscape | Toolbar correctly visible and placed| P m11 m7 | FIXED: Back arrow disappears |
| Search portrait | Open the list of files (non-root folder) in portrait<br>Tap on lens icon<br>Input any string | List of files filtered correctly| P m11 m7  |  |
| Search landscape | Open the list of files (non-root folder) in landscape<br>Tap on lens icon<br>Input any string | List of files filtered correctly| P m11 m7  |  |
| Avatar | Open the list of files (non-root folder) | No avatar there, three dot button instead| P m11 m7  |  |
|**Toolbar av offline**||||||
| Portrait root | Open the list of files in portrait<br>Set file and folder as av. offline<br>Open av. offline view in bottom bar | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 |  |
| Landscape root | Open the list of files in landscape<br>Set file and folder as av. offline <br>Open links view in bottom bar | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Back arrow disappears |
| Portrait non-root | Open the list of files in portrait<br>Set file and folder as av. offline<br>Open av. offline view in bottom bar<br>Browse through the folder  | Toolbar correctly visible and placed with all elements as in file list. No avatar|  P m11 m7|  |
| Landscape non-root | Open the list of files in landscape<br>Set file and folder as av. offline <br>Open av. offline view in bottom bar<br>Browse through the folder | Toolbar correctly visible and placed with all elements as in file list. No avatar| P m11 m7 |  |
|**Toolbar links**||||||
| Portrait root | Open the list of files in portrait<br>Create link of file and folder <br>Open links view in bottom bar | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 |  |
| Landscape root | Open the list of files in portrait<br>Create link of file and folder <br>Open links view in bottom bar | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 |  |
| Portrait non-root | Open the list of files in portrait<br>Create link of file and folder <br>Open links view in bottom bar<br>Browse through the folder  | Toolbar correctly visible and placed with all elements as in file list. No avatar| P m11 m7 |  |
| Landscape non-root | Open the list of files in portrait<br>Create link of file and folder <br>Open links view in bottom bar<br>Browse through the folder | Toolbar correctly visible and placed with all elements as in file list. No avatar| P m11 m7 | FIXED: Back arrow disappears |
|**Previews view**||||||
| txt portrait | Open txt file | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 |  |
| txt landscape | Open txt file | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Back arrow disappears |
| image portrait | Open image file | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Back arrow is gone |
| image landscape | Open image file | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Back arrow is gone |  
| video portrait | Stream a video file | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 |  |
| video landscape | Stream a video file | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Back arrow disappears |
| non-openable portrait | Click on a non-openable file (like pdf, doc, xls or zip) | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 |  |
| non-openable landscape | Click on a non-openable file (like pdf or zip) | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Back arrow disappears |
|**Uploads view**||||||
| Portrait | Open the uploads view in portrait| Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Lens icon |
| Landscape | Open the uploads view in landscape | Toolbar correctly visible and placed with all elements as in file list| P m11 m7 | FIXED: Lens icon | 
| Clear Uploaded | Upload some files and wait till they finish<br>Open Uploads view<br>Clear list | List cleared | P m11 m7 |  |
| Clear Pending | Select a bunch of files to upload<br>Remove device connection<br>Open Uploads view<br>Remove some of the files individually from the list of pending<br>Restablish connection | Files removed are not uploaded | P m11 m7 |  |
| Clear All Pending | Select a bunch of files to upload<br>Remove device connection<br>Open Uploads view<br>Remove all files at one time with the "Clear" button<br>Restablish connection | Files removed are not uploaded | P m11 m7 |  |
| Retry failed | Select a file to upload inside a folder<br>Before submitting, remove the containing folder in other client or web<br>Submit the upload<br>Retry it after creating again the folder | Upload will fail with a "Folder error". Then upload will success | P m11 m7 |  |
|**Share with view**||||||
| Portrait | Open Gallery and select an item to share<br>Select ownCloud| Toolbar correctly visible and placed. No avatar | P m11 m7 |  |
| Landscape | Open Gallery and select an item to share<br>Select ownCloud| Toolbar correctly visible and placed. No avatar | P m11 m7 |  |
|**Manage accounts**||||||
| Sync account icon | Open Manage accounts view, in the drawer | Every account there have the option to sync account | P m11 m7 |  |
| Sync account basic | Open Manage accounts view, in the drawer<br>Add a new basic auth account(no browsing through!)<br>Click on "Sync Account"<br>Remove device connection<br>Open the account and browse | All the content in the account is discovered, so it is posible to browse with no connection | P m11 m7 |  |
| Sync account OAuth2 | Open Manage accounts view, in the drawer<br>Add a new OAuth2 account(no browsing through!)<br>Click on "Sync Account"<br>Remove device connection<br>Open the account and browse | All the content in the account is discovered, so it is posible to browse with no connection | P m11 m7 |  |
| Sync account OAuth2 expired | Open Manage accounts view, in the drawer<br>Add a new OAuth2 account(no browsing through!)<br>Wait till token expires<br>Click on "Sync Account" | Account synced (token renewed, check with mitmproxy or similar) | P m11 m7 |  |