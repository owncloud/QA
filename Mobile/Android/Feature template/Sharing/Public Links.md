###  Public Links 


Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :----------------------- | 
| **Public links** |   |  |
| Create link file |  1. Select a file from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Save | Check that link is listed in the share view. Check that the file in the file list of the app includes the link icon. Check in web that the link was created |  |  |
| Create link folder |  1. Select a folder from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Save | Check that link is listed in the share view. Check that the folder in the file list of the app includes the link icon. Check in web that the link was created |  |  |
| Multiple links | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` to create several links on the item<br>4. Save<br> repeat 3. and 4. 10 times to create 10 links over the same item | Check that all created links are listed in the share view. Check in web that the link list was created |  |  |
| Link name | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Add a name to the link, different of the default one, including special characters<br>5. Save | Check in web that the link was created with correct name |  |  |
| Password | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Enable `Password` and add new password<br>5. Save<br>6. Click on the chain icon to copy the link to the clipboard and paste it in a browser| 5. Check in web that the link was created with password enabled<br>6. Link is opened in the browser and password is asked |  |  |
| Expiration | 1. Select an item from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Enable `Expiration` and add date<br>5. Save | Check in web that the link was created with expiration date enabled with the correct date|
| **From web** |   |  |
| Link from the web - file | In the web, create a public link on a file adding name, password and expiration date<br>| The link is correctly shown in the app with the name, the password enabled and the correct expiration date. Check that the item in the file list of the app includes the link icon  |  |  |
| Link from the web - folder | In the web, create a public link on a folder adding upload only permission, password and expiration date<br>| The link is correctly shown in the app with the permission, password enabled and the correct expiration date. Check that the item in the file list of the app includes the link icon  |  |  |
| **Permissions** |   |  |
| Download / View (folders) | 1. Select a folder from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Select `Download/View` as permission level<br>5. Save | Check in web that the link was created with `Download/View` permission|  |  |
| Download / View / Upload (folders)| 1. Select a folder from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Select `Download/View/Upload` as permission level<br>5. Save | Check in web that the link was created with `Download/View/Upload` permission  |  |  |
| Upload only (folders)| 1. Select a folder from the list by clicking on the 3-dot-button<br>2. Select `Share`<br>3. Click on `+` of `Public Links` section<br>4. Select `Upload Only` as permission level<br>5. Save | Check in web that the link was created with `Upload only` permission   |  |  |
| **Edit link** |   |  |
| Edit name | 1. Over an existing link, edit by clicking the pencil icon<br>2. Change the link name<br>3. Save | Check in web that the link includes the new name|  |  |
| Add Password and Expiration | 1. Over an existing link without password and expiration, edit by clicking the pencil icon<br>2. Add a password and expiration date to the link<br>3. Save | Check in web that the link has password and correct expiration date|  |  |
| Remove Password and Expiration | 1. Over an existing link with password and expiration, edit by using the pencil icon<br>2. Remove the password and expiration date<br>3. Save | Check in web that the link does not have neither password nor expiration date |  |  |
| Edit permission (folder)| 1. Over an existing link (folder) with all permissions, edit by using the pencil icon and revoke `Edit` | Check that sharee is not allowed to edit the item (opened with 3rd party app, error in uploads view) |   |  |
| Revoke `Share` | 1. Over an existing share with all permissions, edit by using the pencil icon and revoke `Share` perimssion | Check that sharee is not allowed to share the item with other users (share icon hidden) |   |  |
| **Delete link** |   |  |
| Remove link | 1. Create several links over the same item, no matter the link properties<br>2. Remove one of them by clickin on the trashbin icon in the list<br>3. Remove all of them  | 2. Check in web that the removed link is not listed anymore<br>3. Check in web that item does not have links anymore. Check that the item in the file list of the app includes the link icon |
| **Server options (oC10)** |   |  |
| Server doesn't support share api preview | 1. In oC10 server dashboard, open `Sharing` and disable `Allow apps to use the Share API`<br>2. In the app, share any item | `Share with users and groups option` and `Public Link` are hidden inside the Share view. Only visible the link|  |  |
| Server doesn't support public links | 1. In oC10 server dashboard, open `Sharing` and disable `Server doesn't support public links`<br>2. In the app, open `Share` over any item | Only private link and `Users and groups` is visible, `Public Link` is hidden  |  |  |
| Allow public links | 1. In oC10 server dashboard, open `Sharing` and disable `Allow public uploads`<br>2. From the app, open `Share` over a folder<br>3. Click on `+` of `Public Links` section| Only `Link Name`, `Password` and `Expiration` options available. Permission level options are hidden |  |  |
| Enforced Password read-only |  1. In oC10 server dashboard, open `Sharing` and check `Enforce password protection for read-only links`<br>2. In the app, create a link over a folder with `Download/View` permission with empty password<br>3. In the app, create a link over a folder with `Download/View` permission including a password| 2. Error `Password is mandatory` <br>3. Link is created (check in web)  |  |  |
| Enforced Password read-write | 1. In oC10 server dashboard, open `Sharing` and check `Enforce password protection for read-write links`<br>2. In the app, create a link over a folder with `Download/View/Upload` permission with empty password<br>3. In the app, create a link over a folder with `Download/View/Upload` permission including a password | 2. Error `Password is mandatory` <br>3. Link is created (check in web)  |  |  |
| Enforced Password upload-only | 1. In oC10 server dashboard, open `Sharing` and check `Enforce password protection for upload-only links`<br>2. In the app, create a link over a folder with `Upload Only` permission with empty password<br>3. In the app, create a link over a folder with `Upload/Only` permission including a password | 2. Error `Password is mandatory` <br>3. Link is created (check in web)  |  |  |
| Default expiration | 1. In oC10 server dashboard, open `Sharing` and check `Set default expiration date`<br>2. Set 30 days<br>3. In the app, create a link over any item<br>4. Switch off `Expiration` | 3. `Expiration` is enabled by default with date 30-days forward (check also in web)<br>4. Expiration disabled (check also in web) |  |  |
| Expiration enforced |1. In oC10 server dashboard, open `Sharing` and check `Set default expiration date`<br>2. Set 30 days<br>3. Check `Enforce as maximum expiration date`<br>4. In the app, create a link over any item | 3. `Expiration` is enabled by default with date 30-days forward (check also in web)<br>4. Expiration is not allowed to be disabled because enforcement |  |  |
| Password + Expiration enforced | Create a new public link with the expiration and password enforced in server | The link can not be saved until password is set. Expiration can not be deleted |  |  |
| Allow resharing | Create a new public link with the allow resharing disabled | Sharee can not share the item |   |  |
|**Errors** |   |  |
| No connection | 1. Remove device connection<br>2. Select an item from the list by clicking on the 3-dot-button<br>3. Select `Share`<br>4. Click on `+` of `Public Link` section<br>4. Save | Error: `Device is not connected to a network` |  |  |
| No server connection | 1. Switch server off<br>2. Select an item from the list by clicking on the 3-dot-button<br>3. Select `Share`<br>4. Click on `+` of `Public Link` section<br>4. Save | Error: `Error connecting to the server` |   |  |
| Maintenance mode (oC10) | 1. Set server in maintenance mode<br>22. Select an item from the list by clicking on the 3-dot-button<br>3. Select `Share`<br>4. Click on `+` of `Public Link` section<br>4. Save  | Error: `System in maintenance mode` |   |  |