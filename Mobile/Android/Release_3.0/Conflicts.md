#### Conflicts

#### PRs: https://github.com/owncloud/android/pull/3766

Devices: Samsung A52, Android 12 <br>
Server: oC10 10.11, oCIS 2.0.0beta8


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link |
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**File detection**||||
| Update file | 1. Create a txt file, and download it to the device<br>2. Update the file in the server or in another client<br>3. Tap on the file| The content is updated | F m12 | File updated after reopening (known)
| Update file - Conflict Server | 1. Create a txt file, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Server" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Server version is downloaded to the device | P m12
| Update file - Conflict Device | 1. Create a txt file, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Device" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Device version is uploaded to the server | P m12
| Update file - Conflict Both | 1. Create a txt file, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | 5. Conflict is detected and notification shows it. File marked as conflict<br>6. Device version is uploaded to the server and server version is downloaded | P m12
| Update file - Conflict Both | 1. Create a txt file called file (2).txt, and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Tap on the file<br>6. Solve the conflict with "Both" | Correct file name after creating a new one | P m12
|**Folder detection**||||
| Folder conflict | 1. Create some txt files inside a folder, and download them to the app<br>2. Switch the device connection off<br>3. Update the files in the server and in the devices<br>4. Switch the device connection on<br>5. Sync the container folders | Conflict is detected and notification shows it. Folder marked with conflict| P m12
| Deep folder | 1. Create txt file inside inside the folder A/B/C/D/E and download it to the device<br>2. Switch the device connection off<br>3. Update the file in the server and in the device<br>4. Switch the device connection on<br>5. Sync the container folders | Conflict is detected and notification shows it. All parent folders marked with conflict| P m12
| More than one in same folder | 1. Create two txt files inside the folder A/B and download them to the device<br>2. Switch the device connection off<br>3. Update both files in the server and in the device<br>4. Switch the device connection on<br>5. Sync the container folders<br>6. Fix the conflict in one of the files<br>7. Fix the conflict in the other one | 5. Conflict is detected and notification shows it. All parent folders marked with conflict<br>6. File is not marked with conflict anymore. Parent folder is, because other file is still conflicted<br>7. Both files and parent folders are no longer conflicted| P m12
| More than one in different folder same tree | 1. Create one txt file inside the folder A/B and another one in A/B/C/D and download them to the device<br>2. Switch the device connection off<br>3. Update both files in the server and in the device<br>4. Switch the device connection on<br>5. Sync the container folders<br>6. Fix the conflict in the file inside A/B/C/D<br>7. Fix the conflict in the other one | 5. Conflict is detected and notification shows it. All parent folders marked with conflict<br>6. File is not marked with conflict anymore. "D" and "C" folders not marked as conflicted, but "A" and "B"<br>7. Both files and parent folders are no longer conflicted after browsing to them| P m12
| More than one in different folder same tree av. offline | 1. Create one txt file inside the folder A/B and another one in A/B/C/D and download them to the device<br>2. Set A as av. offline<br>3. Switch the device connection off<br>4. Update both files in the server and in the device<br>5. Switch the device connection on<br>6. Sync the container folders<br>7. Fix the conflict in the file inside A/B/C/D<br>8. Fix the conflict in the other one | 6. Conflict is detected and notification shows it. All parent folders marked with conflict<br>7. File is not marked with conflict anymore. "D" and "C" folders not marked as conflicted, but "A" and "B"<br>8. Both files and parent folders are no longer conflicted after browsing to them| P m12
| Sync offline | 1. Cause a conflict over a single file<br>2. Before solving the conflict, remove defice connection<br>3. Click on the conflicted file<br>4. Recover connection| 3. Conflict dialog not shown because sync is not posible, error message<br>4. Conflict dialog shown| P m12
|**File Operations**||||
| Remove locally | 1. Cause a conflict in any file that is not in root folder<br>2. Remove the local copy of the file | 1. File and parent folders marked as conflicted<br>2. Neither file nor parent folders marked as conflicted | P m12
| Remove remote | 1. Cause a conflict in any file that is not in root folder<br>2. Remove the file from server | 1. File and parent folders marked as conflicted<br>2. File removed, and parent folder not marked as conflicted | P m12 | FIXED: Parent folders as conflicted
| Copy | 1. Cause a conflict in any file that is not in root folder<br>2. Copy the file to other location  | Original file keep the conflict status<br>New copied file with no conflict (no local copy) | P m12 |  | |
| Move | 1. Cause a conflict in any file that is not in root folder<br>2. Move the file to other location, that is no root folder | New moved file is also conflicted, as well as its containing folders. Old parent folders with no conflict anymore| P m12 | |
| Rename | 1. Cause a conflict in any file that is not in root folder<br>2. Rename the file  | File with new name keep the conflict status | P m12 | |
|**Folder Operations**||||
| Remove locally | 1. Cause a conflict inside any folder that is not in root folder<br>2. Remove the local copy of the folder | Folder not marked as conflicted | P m12
| Remove remote | 1. Cause a conflict inside any folder that is not in root folder<br>2. Remove the folder from server | Everything removed, no conflicts| P m12 | FIXED: Parent folders as conflicted
| Copy | 1. Cause a conflict inside any folder that is not in root folder<br>2. Copy the containing folder to other location  | Original folder keep the conflict status<br>New copied folder with no conflict (no local copy) | NA | Copy not available in server | |
| Move | 1. Cause a conflict inside any folder that is not in root folder<br>2. Move the folder to other location | New moved folder is also conflicted | NA | Keep local copies after moving is not implemented yet|
| Rename | 1. Cause a conflict inside any folder that is not in root folder<br>2. Rename the folder | Folder with new name keep the conflict status | P m12 | |

