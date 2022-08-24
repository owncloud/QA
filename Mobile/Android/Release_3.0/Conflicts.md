#### Conflicts

#### PRs: 

Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**File**||||
| Update file | 1. Create a txt file, and download it to the app<br>2. Update the file in the server or in another client<br>3. Tap on the file| The content is updated |
| Update file - Conflict Server | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Server" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Server version is downloaded to the device |
| Update file - Conflict Device | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Device" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Device version is uploaded to the server |
| Update file - Conflict Both | 1. Create a txt file, and download it to the app<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Device version is uploaded to the server and server version is downloaded |
|**Folder**||||
| Folder conflict | 1. Create some txt files inside two different folders, and download them to the app<br>2. Switch the device connection off<br>3. Update the files in the server and in the devices<br>4. Switch the device connection on<br>5. Sync the container folders | Conflict is detected and notification shows it. Folder marked with conflict|
