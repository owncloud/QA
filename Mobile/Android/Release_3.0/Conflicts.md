#### Conflicts

#### PRs: 

Devices:  <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**File detection**||||
| Update file | 1. Create a txt file, and download it to the device<br>2. Update the file in the server or in another client<br>3. Tap on the file| The content is updated |
| Update file - Conflict Server | 1. Create a txt file, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Server" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Server version is downloaded to the device |
| Update file - Conflict Device | 1. Create a txt file, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Device" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Device version is uploaded to the server |
| Update file - Conflict Both | 1. Create a txt file, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Device version is uploaded to the server and server version is downloaded |
|**Folder detection**||||
| Folder conflict | 1. Create some txt files inside two different folders, and download them to the app<br>2. Switch the device connection off<br>3. Update the files in the server and in the devices<br>4. Switch the device connection on<br>5. Sync the container folders | Conflict is detected and notification shows it. Folder marked with conflict|
| Deep folder | 1. Create txt file inside inside the folder A/B/C/D/E and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Sync the container folders | Conflict is detected and notification shows it. All parent folders marked with conflict|
| More than one in same folder | 1. Create two txt files inside the folder A/B and download them to the device<br>2. Switch the device connection off<br>3. Update both files in the server and in the device<br>4. Switch the device connection on<br>5. Sync the container folders<br>6. Fix the conflict in one of the files<br>7. Fix the conflict in the other one | 5. Conflict is detected and notification shows it. All parent folders marked with conflict<br>6. File is not marked with conflict anymore. Parent folder is, because other file is still conflicted<br>7. Both files and parent folders are no longer conflicted|
| More than one in different folder same tree | 1. Create one txt file inside the folder A/B and another one in A/B/C/D and download them to the device<br>2. Switch the device connection off<br>3. Update both files in the server and in the device<br>4. Switch the device connection on<br>5. Sync the container folders<br>6. Fix the conflict in the file inside A/B/C/D<br>7. Fix the conflict in the other one | 5. Conflict is detected and notification shows it. All parent folders marked with conflict<br>6. File is not marked with conflict anymore. "D" and "C" folders not marked as conflicted, but "A" and "B"<br>7. Both files and parent folders are no longer conflicted|
|**File Operations**||||
| Remove locally | 1. Cause a conflict in any file that is not in root folder<br>2. Remove the local copy of the file | 1. File and parent folders marked as conflicted<br>2. Neither file nor parent folders marked as conflicted |
| Remove remote | 1. Cause a conflict in any file that is not in root folder<br>2. Remove the file from server | 1. File and parent folders marked as conflicted<br>2. File removed, and parent folder not marked as conflicted |
| Copy | 1. Cause a conflict in any file that is not in root folder<br>2. Copy the file to other location  | Original file keep the conflict status<br>New copied file with no conflict (no local copy) | |  | |
| Move | 1. Cause a conflict in any file that is not in root folder<br>2. Move the file to other location, that is no root folder | New moved file is also conflicted, as well as its containing folders |  | |
| Rename | 1. Cause a conflict in any file that is not in root folder<br>2. Rename the file  | File with new name keep the conflict status |  | |
|**Folder Operations**||||
| Remove locally | 1. Cause a conflict inside any folder that is not in root folder<br>2. Remove the local copy of the folder | Folder not marked as conflicted |
| Remove remote | 1. Cause a conflict inside any folder that is not in root folder<br>2. Remove the folder from server | Everything removed, no conflicts|
| Copy | 1. Cause a conflict inside any folder that is not in root folder<br>2. Copy the containing folder to other location  | Original folder keep the conflict status<br>New copied folder with no conflict (no local copy) | |  | |
| Move | 1. Cause a conflict inside any folder that is not in root folder<br>2. Move the folder to other location | New moved folder is also conflicted |  | |
| Rename | 1. Cause a conflict inside any folder that is not in root folder<br>2. Rename the folder | Folder with new name keep the conflict status |  | |

