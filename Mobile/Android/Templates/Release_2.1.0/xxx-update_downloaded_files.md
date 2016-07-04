###  Upgrade downloaded files 

#### Pr: https://github.com/owncloud/android/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Update file |  1. In app, download a file<br>2. In server, update the file<br>3. In app, pull down and tap on the file|  The new version is downloaded and displayed. The modification date is updated   |  |  |
| 2 | Update pic |  1. In app, download a pic<br>2. In server, update the pic by overwritting it with another pic using the same name<br>3. In app, pull down and tap on the pic|  The new version is downloaded and displayed. The modification date is updated. The thumbnail is updated   |  |  |
| 3 | Conflict |  1. In app, download a file<br>2. Switch the device connection off<br>3. In device, update the file<br>4. In server, update the file<br>5. Restore the connection<br>6. In app, sync the file |  The conflict is detected.    |  |  |
| 4 | Conflict - Av. offline|  1. In app, download a file and set it as av. off.<br>2. Switch the device connection off<br>3. In device, update the file<br>4. In server, update the file<br>5. Restore the connection |  The conflict is detected.    |  |  |