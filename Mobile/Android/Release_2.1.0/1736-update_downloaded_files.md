###  Update downloaded files 

#### Pr: https://github.com/owncloud/android/pull/1736


Devices: Nexus5 v5.0.1, Samsung Galaxy Tab 2 v4.3

Server: v9.1 RC1

---
 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Update file |  1. In app, download a file<br>2. In server, update the file<br>3. In app, pull down and tap on the file|  The new version is downloaded and displayed. The modification date is updated   | P m5 t4 |  |
| 2 | Update pic |  1. In app, download a pic<br>2. In server, update the pic by overwritting it with another pic using the same name<br>3. In app, pull down and tap on the pic|  The new version is downloaded and displayed. The modification date is updated. The thumbnail is updated   | P m5 t4 |  |
| 3 | Conflict local|  1. In app, download a file<br>2. Switch the device connection off<br>3. In app, update the file<br>4. In server, update the file<br>5. Restore the connection<br>6. In app, sync the file |  The conflict is detected (solve with local)    | P m5 t4 |  |
| 4 | Conflict server|  1. In app, download a file<br>2. Switch the device connection off<br>3. In app, update the file<br>4. In server, update the file<br>5. Restore the connection<br>6. In app, sync the file |  The conflict is detected (solve with server)    | P m5 t4 |  |
| 5 | Conflict both|  1. In app, download a file<br>2. Switch the device connection off<br>3. In app, update the file<br>4. In server, update the file<br>5. Restore the connection<br>6. In app, sync the file |  The conflict is detected (solve with both)    | P m5 t4 |  |
| 6 | Conflict local - Av. offline|  1. In app, download a file and set it as av. off.<br>2. Switch the device connection off<br>3. In app, update the file<br>4. In server, update the file<br>5. Restore the connection |  The conflict is detected (solve with local) |  P m5 t4 |  |
| 7 | Conflict server - Av. offline|  1. In app, download a file and set it as av. off.<br>2. Switch the device connection off<br>3. In app, update the file<br>4. In server, update the file<br>5. Restore the connection |  The conflict is detected (solve with server) | P m5 t4 |  |
| 8 | Conflict both - Av. offline|  1. In app, download a file and set it as av. off.<br>2. Switch the device connection off<br>3. In app, update the file<br>4. In server, update the file<br>5. Restore the connection |  The conflict is detected (solve with both) | P m5 t4 |  |
