### Scoped Storage Migration


#### PR: https://github.com/owncloud/android/pull/

**Devices**: Pixel2 v11, Nexus 6P v7, Huawei P8Lite v6<br>
**Server**: 10.8

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Wizard navigation** |   |  
| Displayed | Upgrade from previous version | Wizard is displayed  | P m11 |  | 
| 1st slide - Presentation | 1. Upgrade from previous version | Wizard is displayed, 1st slide is a presentation with a correct link to "Learn more". Correct in both orientations  | F m11 |  Learn more does nothing | 
| 1st slide - Remind me later | 1. Upgrade from previous version<br>2. Select "Remind me later" in the 1st slide | Wizard is gone.<br>In `Settings`, wizard could be re-triggered<br>Files keep in the legacy storage<br>New downloads are done inside the scoped storage  | F m11 | No Remind me later | 
| 1st slide - Next | 1. Upgrade from previous version<br>2. Select "Next" in the 1st slide | Jump to the 2nd slide  | P m11  |  | 
| 2nd slide - Decision | 1. Upgrade from previous version | Wizard is displayed, 2nd slide prompts user to take a decision: migrate & clear or migrate & keep files. Correct displayed in both orientations   | P m11 |  | 
| 2nd slide - Migrate & clean | 1. Upgrade from previous version<br>2. In 1st slide select Next<br>2. In 2nd slide select "Migrate & clean" | Jump to the 3rd slide | P m11  |  | 
| 2nd slide - Migrate & Keep | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select "Migrate & Keep" | Jump to the 3rd slide | P m11 |  | 
| 3nd slide - Migration | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select any option | Migration is being done. Correctly displayed in both orientations| P m11 |  | 
| 4th slide - End | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select any option<br>3. Wait till migration finishes | Migration done slice. Correctly displayed in both orientations | P m11 |  | 
| 4th slide - Close | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select any option<br>3. Wait till migration finishes<br>4. Select "Close"  | Wizard is gone, app is displayed |  P m11|  | 
| **Wizard navigation errors** |   |
| 1st slide - Kill | 1. Upgrade from previous version<br>2. When 1st slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again | P m11 |  | 
| 2nd slide - Kill | 1. Upgrade from previous version<br>2. When 2nd slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again | P m11 |  | 
| 3rd slide - Kill | 1. Upgrade from previous version<br>2. When 3nd slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again? App is opened without complete migration, to be done later? | P m7 |  | 
| 4th slide - Kill | 1. Upgrade from previous version<br>2. When 4th slide is displayed, kill the app<br>2. Open the app | Wizard is not displayed.<br> App is opened with completed migration | P m11 |  | 
| Low battery | 1. Upgrade from previous version with low battery (check with emulator ow switch the device off) | It should warn user?  | F m11 | When device is switched on, no migration happens | 
| **Data migration** | 4 devices, different capabilities and versions  |
| No downloaded data  | 1. Upgrade from previous version<br>2. After migration, download a file and a folder | 1. No wizard. Legacy storage is cleaned up. Nothing downloaded in Scoped Storage<br>3. File and folder downloaded in Scoped Storage | P m11 |  | 
| Little data - Clean | 1. Download <100MB of files (including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff| F m11 m6 m7 | Av. offline queued  | 
| Little data - Keep | 1. Download <100MB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage| F m11 m6 m7 | Av. offline queued  | 
| 1GB - Clean | 1. Download 1GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff| P m11 m6 m7 |  | 
| 1GB - Keep | 1. Download 1GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage| P m11 m6 m7 |  | 
| 5GB - Clean | 1. Download 5GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff| P m11 |  | 
| 5GB - Keep | 1. Download 5GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage| P m11 |  | 
| 50GB - Clean | 1. Download 50GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff|  |  | 
| 50GB - Keep | 1. Download 50GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage |  |  |
| Multiaccount | 1. Attach 4 accounts<br>2. Download and set av. offline files and folders in all of them<br>3. Upgrade from previous version<br>3. Run wizard till it ends.<br>4. After migration, download a file and a folder | 3. Dowloaded files moved to Scoped Storage from all accounts<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage | P m11 |  |
| Security | Perform any migration with security (pattern, passcode or biometric) enabled | Migration is triggered after unlocking the app | P m7 |  |
| Logs | Perform any migration after generating some logs (enable them in Settings > Logging)|  Logs are moved to Scoped Storage | F m11 | Old location not removed |
| **Data migration errors** | 
| Not enough space | 1. In a device with limited storage, download files in legacy storage that needs more than the half of the available space<br>2. Upgrade from previous version<br>3. Run wizard till it ends, selecting "Keep" | Not enough space to keep legacy and scoped storage together. Error message? | F m7 | App crashes |
| **Uploads migration** | 4 devices, different capabilities and versions  |
| Pending & running | 1. Upload a big file and some other small files<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Uploading and pending files finish to upload to the correct path<br>No debris in legacy storage<br>Correct paths in uploads view |  |  |
| Finished | 1. Upload some files and wait till they end<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Clean uploads view |  |  |
| Failed | 1. Upload some files  with error (by removing connection, f.ex)<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Failed uploads migrated  |  |  |


|             | < 100MB | 1GB        | 5GB             | 50GB     |
|:-------------:| :----- | :-------: | :-------------: | :------: |
| Pixel5 (12)   |  
| Pixel2 (11)   |  ~1sec (clean & keep) | ~10secs (clean)<br>~8secs (keep) | ~50secs (clean)<br> ~45secs (keep)
| Nexus6P (7)   |  ~2secs (clean & keep) | ~30secs (clean)<br>~25secs (keep) |
| Huawei P8 (6) |  ~3sec (clean)<br>~2sec (keep) | ~50secs (clean)<br>~1min (keep)