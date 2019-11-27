###  Sharing error handling

#### Pr: https://github.com/owncloud/android/pull/2708

Devices: Pixel 2 v10<br>
Server: 10.3

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**Private share errors**||||||
| Share yourself | Share an item with yourself | Correct error | P m10 | Should be avoided |  |
| Already shared | Share an item with a user<br>Share again | Correct error | P m10 |  |  |
| Non existing | Select an user to share without submitting<br> Remove/disable the user from admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Share API | Search for a group to share, without submitting<br>Disable "Allow using Share API" in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Group sharing | Search for a group to share, without submitting<br>Disable "Allow sharing with groups" in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Member in group sharing | Search for a user to share, without submitting. Such user is not in the same group<br>Enable "Restrict users to only share with users in their groups" in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Resharing | Create a share<br>Search for a user to re-share, without submitting. <br>Disable "Allow resharing" in Admin dashboard<br>Submit the selection | Correct error | P m10  |  |  |
| Exclude groups | Search for a group to share, without submitting<br>Enable "Exclude groups", and add the searched group<br>Submit the selection| Correct error | P m10 |  |  |
| External creation | Search for a user to share, without submitting<br>Create the same share in oher client<br>Submit the selection| Correct error | P m10 |  |  |
| External deletion | Create a share<br>In the web, delete the share<br>In the app delete the share| Correct error (was deleted before) | P m10 | Server isntance not found |  |
| Federation | Type a federated share, without submitting<br>Disable "allow user to create federated shares"<br>Submit the selection| Correct error | P m10 | FIXED: Not able to share with federation |  |
| No connection | Remove connection from device<br>Perform a share | Correct error | P m10 |  |  |
| Server not reachable | Disconnect the server from the device network without losing connection<br>Perform a share | Correct error | P m10  |  |  |
|**Public share errors**||||||
| Share API | Create a link, without submitting<br>Disable "Allow using Share API" in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Share by link | Create a link, without submitting<br>Disable "Allow share via link" in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Password enforced | Create a link with no password, without submitting<br>Enable "Enforce password" (no matter which permission) in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| Expiration enforced | Create a link with no expiration date, without submitting<br>Enable "Enforce expiration"  in Admin dashboard<br>Submit the selection | Correct error | NA | Link is created with the expiration |  |
| Resharing | Create a share<br>Sharee creates a link, without submitting. <br>Disable "Allow resharing" in Admin dashboard<br>Submit the selection | Correct error | P m10 |  |  |
| No connection | Remove connection from device<br>Create a link| Correct error | P m10 |  |  |
| Server not reachable | Disconnect the server from the device network without losing connection<br>Create a link | Correct error | P m10 |  |  |
| External deletion | Open an existing link<br>In the web, delete the link<br>In the app edit the link (name, permissions...) | Correct error (was deleted before) | P m10 | Share ID does not exist |  |
| External deletion II | Create a link<br>In the web, delete the link<br>In the app delete the link| Correct error (was deleted before) | P m10 | FIXED: Server instance not found |  |
