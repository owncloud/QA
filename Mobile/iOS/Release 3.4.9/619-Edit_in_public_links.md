###  Edit permission in public shared links 

#### Pr: https://github.com/owncloud/ios/pull/619

Devices: iPhone6 v9

Server: v9RC2


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
|1|Folders|1. Swipe to share a folder by link<br>| A switch button with the option "Allow editing" appears|P m9 t8||
|2|Files|1. Swipe to share a folder by link<br>| A switch button with the option "Allow editing" does not appear| P m9 t8 ||
|**Orientation**||||||
|3|Portrait|1. Swipe to share a folder by link<br>| A switch button with the option "Allow editing" appears correctly| P m9 t8 ||
|4|Landscape|1. Swipe to share a folder by link<br>| A switch button with the option "Allow editing" appears correctly| P m9 t8 | SOLVED: Change of orientation makes "allow editing" to ask a password|
|**Actions**||||||
|5|Allow - Upload|1. Swipe to share a folder by link.<br>2. Enable "Allow Editing"<br>3. Copy the link and paste in a browser<br>4. Upload content to the folder| 2. Check also in server that is enabled<br>4. Content is upload. Check in app|P m9 t8| SOLVED: "Get share link" does not work|
|6|Allow - New folder|1. Swipe to share a folder by link.<br>2. Enable "Allow Editing"<br>3. Copy the link and paste in a browser<br>4. Create a subfolder|2. Check also in server that is enabled<br>4. Subfolder is created and content can be uploaded on it. Check in app| P m9 t8||
|7|Disabling Allow|1. From 6, disable "Allow Editing"<br>2. Copy the link and paste in a browser|1. Check also in server that is disabled<br>3. No options for editing are available| P m9 t8|
|**External actions**||||||
|8|Allow |1. In server, share a folder by link and enable "Allow editing".| Check in app that "Allow editing" is also enabled| P m9 t8||
|9|Disable allow|1. From 8, in server side disable "Allow editing".| Check in app that "Allow editing" is also disabled| P m9 t8||
|**Capabilities**||||||
|10|Allow public uploads|1. In server side, disable the capability "Allow public uploads"<br>2. In app, swipe to share a folder by link| The switch button with the option "Allow editing" does not appear| P m9 t8||
|**Offline**||||||
|11|Offline device|1. Swipe to share a folder by link.<br>2. Switch the device connection off<br>3. Enable "Allow editing"| A error message is returned. Check in app and server that "Allow editing" is disabled| P m9 t8||
|12|Offline server|1. Swipe to share a folder by link.<br>2. Switch the server off<br>3. Enable "Allow editing"| A error message is returned. Check that "Allow editing" is disabled|P m9 t8||
|**Shibboleth**| One device |||||
|13|Expiration|1. In a shibboleth server, share a folder by link<br>2. Wait until the session expires and then, switch "Allow editing" on<br>3. Enable "Allow editing"| 2. Credentials are required and "Allow editing" is not enabled<br>3. The public share allows to edit| P m9||

