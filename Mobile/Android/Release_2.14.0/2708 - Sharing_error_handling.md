###  Sharing error handling

#### Pr: https://github.com/owncloud/android/pull/2708

Devices: <br>
Server: 

---

 
| Test Case | Description | Expected | Result | Comments  
| :-------- | :---------- | :------- | :----: | :---------- 
|**Private share errors**||||||
| Share yourself | Share an item with yourself | Correct error |  | Should be avoided |  |
| Already shared | Share an item with a user<br>Share again | Correct error |  |  |  |
| Non existing | Select an user to share without submitting<br> Remove/disable the user from admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Share API | Search for a group to share, without submitting<br>Disable "Allow using Share API" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Group sharing | Search for a group to share, without submitting<br>Disable "Allow sharing with groups" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Member in group sharing | Search for a user to share, without submitting. Such user is not in the same group<br>Enable "Restrict users to only share with users in their groups" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Resharing | Create a share<br>Search for a user to re-share, without submitting. <br>Disable "Allow resharing" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Exclude groups | Search for a group to share, without submitting<br>Enable "Exclude groups", and add the searched group<br>Submit the selection| Correct error |  |  |  |
| External creation | Search for a user to share, without submitting<br>Create the same share in oher client<br>Submit the selection| Correct error |  |  |  |
| External deletion | Create a share<br>In the web, delete the share<br>In the app delete the share| Correct error (was deleted before) |  |  |  |
| Federation | Type a federated share, without submitting<br>Disable "allow user to create federated shares"<br>Submit the selection| Correct error |  |  |  |
| No connection | Remove connection from device<br>Perform a share | Correct error |  |  |  |
| Server not reachable | Disconnect the server from the device network without losing connection<br>Perform a share | Correct error |  |  |  |
|**Public share errors**||||||
| Share API | Create a link, without submitting<br>Disable "Allow using Share API" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Share by link | Create a link, without submitting<br>Disable "Allow share via link" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Password enforced | Create a link with no password, without submitting<br>Enable "Enforce password" (no matter which permission) in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Expiration enforced | Create a link with no expiration date, without submitting<br>Enable "Enforce expiration"  in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| Resharing | Create a share<br>Sharee creates a link, without submitting. <br>Disable "Allow resharing" in Admin dashboard<br>Submit the selection | Correct error |  |  |  |
| No connection | Remove connection from device<br>Create a link| Correct error |  |  |  |
| Server not reachable | Disconnect the server from the device network without losing connection<br>Create a link | Correct error |  |  |  |
| External deletion | Open an existing link<br>In the web, delete the link<br>In the app edit the link (name, permissions...) | Correct error (was deleted before) |  |  |  |
| External deletion II | Create a link<br>In the web, delete the link<br>In the app delete the link| Correct error (was deleted before) |  |  |  |
