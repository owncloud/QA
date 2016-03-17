###  Edit permission in public shared links 

#### Pr: https://github.com/owncloud/android/pull/1510

Devices: Nexus5 v6

Server: v9


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**View**||||||
|1|Folders|1. Long press to share a folder by link<br>| A switch button with the option "Allow editing" appears| P m6||
|2|Files|1. Long press to share a folder by link<br>| A switch button with the option "Allow editing" does not appear|P m6||
|**Orientation**||||||
|3|Portrait|1. Long press to share a folder by link<br>| A switch button with the option "Allow editing" appears correctly|P m6||
|4|Landscape|1. Long press to share a folder by link<br>| A switch button with the option "Allow editing" appears correctly|P m6||
|**Actions**||||||
|5|Allow - Upload|1. Long press to share a folder by link.<br>2. Enable "Allow Editing"<br>3. Copy the link and paste in a browser<br>4. Upload content to the folder| 2. Check also in server that is enabled<br>4. Content is upload. Check in app|P m6||
|6|Allow - New folder|1. Long press to share a folder by link.<br>2. Enable "Allow Editing"<br>3. Copy the link and paste in a browser<br>4. Create a subfolder|2. Check also in server that is enabled<br>4. Subfolder is created and content can be uploaded on it. Check in app|P m6||
|7|Disabling Allow|1. From 6, disable "Allow Editing"<br>2. Copy the link and paste in a browser|1. Check also in server that is disabled<br>2. No options for editing are available|P m6||
|**External actions**||||||
|8|Allow |1. In server, share a folder by link and enable "Allow editing".| Check in app that "Allow editing" is also enabled|P m6||
|9|Disable allow|1. From 8, in server side disable "Allow editing".| Check in app that "Allow editing" is also disabled|P m6||
|**Capabilities**||||||
|10|Allow public uploads|1. In server side, disable the capability "Allow public uploads"<br>2. In app, long press to share a folder by link| The switch button with the option "Allow editing" does not appear|P m6|Related to the server: https://github.com/owncloud/core/issues/23325|
|**Offline**||||||
|11|Offline device|1. Long press to share a folder by link.<br>2. Switch the device connection off<br>3. Enable "Allow editing"| A error message is returned. Check in app and server that "Allow editing" is disabled| P m6||
|12|Offline server|1. Long press to share a folder by link.<br>2. Switch the server off<br>3. Enable "Allow editing"| A error message is returned. Check that "Allow editing" is disabled|P m6||
|**Shibboleth**|One device|||||
|13|Expiration|1. In a shibboleth server, share a folder by link<br>2. Wait until the session expires and then, switch "Allow editing" on<br>3. Enable "Allow editing"| 2. Credentials are required and "Allow editing" is not enabled<br>3. The public share allows to edit|P m6||

