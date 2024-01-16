### Conflict Handling

Server(s): <br>
Device(s): <br>
Execution date: <br>
Tester:  <br>
Context: <br>
 
--

Tests: <br>
Automated:

 
| Test Case | Steps | Expected | Result | Related Comment / Defect | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
| Update file | 1. Add a txt file to the account<br>2. Download it to the app by clicking on it<br>2. Update the file in the web or in another client<br>3. Open again the file by clicking on it | File content is updated with the changes | |  |
| Update file - Conflict Server | 1. Add a txt file in non-root folder<br> 2. Download it to the app by clicking on it<br>3. Switch the device connection off<br>4. Modify the file in both web and  device<br>5. Switch the device connection on<br>6. Click on the file to open it<br>7. Solve the conflict with `Server` | 6. Conflict is detected and marked in file and parent folder<br>7. Server version is downloaded to the device |
| Update file - Conflict Device |  1. Add a txt file in non-root folder<br> 2. Download it to the app by clicking on it<br>3. Switch the device connection off>4. Modify the file in both web and  device<br>5. Switch the device connection on<br>6. Click on the file to open it<br>7. Solve the conflict with `Device` | 6. Conflict is detected and marked in file and parent folder<br>6. Device version is uploaded to the server (check in web) |
| Update file - Conflict Both |  1. Add a txt file in non-root folder<br> 2. Download it to the app by clicking on it<br>3. Switch the device connection off>4. Modify the file in both web and device<br>5. Switch the device connection on<br>6. Click on the file to open it<br>7. Solve the conflict with `Both` | 6. Conflict is detected and notification shows it<br>7. Device version is uploaded to the server and server version is downloaded |