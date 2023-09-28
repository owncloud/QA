### Scoped Storage Migration


#### PR: https://github.com/owncloud/android/pull/

**Devices**: Pixel2 v11, Nexus 6P v7, Huawei P8Lite v6<br>
**Server**: 10.8

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Wizard navigation** |   |  
| Displayed | Upgrade from previous version | Wizard is displayed  | P m11 m7 |  | 
| 1st slide - Presentation | 1. Upgrade from previous version | Wizard is displayed, 1st slide is a presentation. Correct in both orientations  | P m7 m11 |  | 
| 2nd slide - Files to migrate | 1. Upgrade from previous version | Wizard is displayed, 2nd slide shows the ampount of files to migrate and a short explanation  | P m11 m7 |  | 
| 3nd slide - Migration | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select "Migrate" | Migration is being done. Progress bar displayed. Correctly displayed in both orientations| P m11 m7|  | 
| 4th slide - End | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select "Migrate"<br>3. Wait till migration finishes | Migration done and close. Correctly displayed in both orientations | P m11 m7 |  | 
| **Wizard navigation errors** |   |
| 1st slide - Kill | 1. Upgrade from previous version<br>2. When 1st slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again | P m11 m7 |  | 
| 2nd slide - Kill | 1. Upgrade from previous version<br>2. When 2nd slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again | P m11 m7 |  | 
| 3rd slide - Kill | 1. Upgrade from previous version<br>2. When 3nd slide is displayed, kill the app<br>3. Open the app | Wizard is displayed again. App is opened without complete migration, to be done later? | P m11 m7 |  | 
| 4th slide - Kill | 1. Upgrade from previous version<br>2. When 4th slide is displayed, kill the app<br>2. Open the app | Wizard is not displayed.<br> App is opened with completed migration | P m11 m7 |  | 
| Low battery | 1. Upgrade from previous version with low battery (check with emulator or switch the device off) | It should warn user?  | F m11 P m7 m9 | Weird in Pixel2 (Andorid11). When device is switched on, no migration happens. Only in that device. | 
| **Data migration** | 4 devices, different capabilities and versions  |
| No downloaded data  | 1. Upgrade from previous version<br>2. After migration, download a file and a folder | 1. No wizard. Legacy storage is cleaned up. Nothing downloaded in Scoped Storage<br>3. File and folder downloaded in Scoped Storage | P m11 m7 m6 |  | 
| Little data  | 1. Download <100MB of files (including av. offline files and folders)<br>2. Upgrade from previous version<br>3. After migration, download a file and a folder | 2. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>3. File and folder downloaded in Scoped Storage together with the migrated stuff| P m11 m6 m7 | FIXED: Av. offline queued  | 
| 1GB  | 1. Download 1GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. After migration, download a file and a folder | 2. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>3. File and folder downloaded in Scoped Storage together with the migrated stuff| P m11 m6 m7 |  | 
| 5GB  | 1. Download 5GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. After migration, download a file and a folder | 2. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>3. File and folder downloaded in Scoped Storage together with the migrated stuff| P m11 m7 |  | 
| 10GB | 1. Download 10GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. After migration, download a file and a folder | 2. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>3. File and folder downloaded in Scoped Storage together with the migrated stuff| P m11 |  | 
| Multiaccount | 1. Attach 4 accounts<br>2. Download and set av. offline files and folders in all of them<br>3. Upgrade from previous version<br>4. Run wizard till it ends.<br>5. After migration, download a file and a folder | 3. Dowloaded files moved to Scoped Storage from all accounts<br>5. File and folder downloaded in Scoped Storage together with the migrated stuff.<br>File and folder not downloaded in legacy storage | P m11 m7 | FIXED: Files repeated in list |
| Security | Perform any migration with security (pattern, passcode or biometric) enabled | Migration is triggered after unlocking the app | P m7 m11|  |
| Logs | Perform any migration after generating some logs (enable them in Settings > Logging)|  Logs are moved to Scoped Storage | P m11 m7 | FIXED: Old location not removed |
| Deep structure | Perform any migration in an account that contains a deep folder structure with downloaded files inside | Dowloaded files moved to Scoped Storage, preserving the deep structure | P m7 m11 | Fixed: Repetitions |
| **Data migration errors** | 
| Warning | 1. In a device with limited storage, download a big file which size exceeds the device available space<br>2. Upgrade from previous version<br>3. Run wizard till it ends | A warning is displayed about limited storage. Both orientations | P m7 m11 |  |
| Not enough space for a big file| 1. In a device with limited storage, download many little files in legacy storage and a very big file (5GB) that needs more than the half of the available space<br>2. Upgrade from previous version<br>3. Run wizard till it ends |Big file is not migrated, but the other small files are migrated | P m7 m11 | FIXED: App crashes |
| Not enough space | 1. In a device with limited storage, download many little files in legacy storage that all together needs more than the available spacem but individually they have space<br>2. Upgrade from previous version<br>3. Run wizard till it ends |All files are migrated with no errors | P m7 m11 | FIXED: App crashes |
| **Uploads migration** | 4 devices, different capabilities and versions  |
| Pending & running | 1. Upload a big file and some other small files<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Uploading and pending files finish to upload to the correct path<br>No leftovers in legacy storage<br>Correct paths in uploads view | P m7 m11| Need manual trigger |
| Failed | 1. Upload some files  with error (by removing connection, f.ex)<br>2. Upgrade from previous version<br>3. Run the wizard till it ends<br>4. Retry failed uplads | 3. Failed uploads are in the list<br>4. Files uploaded, and locally stored in Scoped Storage. Nothing in logacy storage  | P m7 m11 |  |


|             | < 100MB | 1GB        | 5GB             | 10GB     | 
|:-------------:| :----- | :-------: | :-------------: | :------: | 
| Pixel2 (11)   |  ~1sec  | ~15secs | ~50secs | ~1min40secs
| Nexus6P (7)   |  ~2secs  | ~30secs | 3GB<br> ~1min15secs
| Huawei P8 (6) |  ~3sec | ~1min