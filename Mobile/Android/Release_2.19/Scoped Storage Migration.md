### Scoped Storage Migration


#### PR: https://github.com/owncloud/android/pull/

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.8

| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
| **Wizard navigation** |   |  
| Displayed | Upgrade from previous version | Wizard is displayed  |  |  | 
| 1st slide - Presentation | 1. Upgrade from previous version | Wizard is displayed, 1st slide is a presentation with a correct link to "Learn more". Correct in both orientations  |  |  | 
| 1st slide - Remind me later | 1. Upgrade from previous version<br>2. Select "Remind me later" in the 1st slide | Wizard is gone.<br>In `Settings`, wizard could be re-triggered<br>Files keep in the legacy storage<br>New downloads are done inside the scoped storage  |  |  | 
| 1st slide - Next | 1. Upgrade from previous version<br>2. Select "Next" in the 1st slide | Jump to the 2nd slide  |  |  | 
| 2nd slide - Decision | 1. Upgrade from previous version | Wizard is displayed, 2nd slide prompts user to take a decision: migrate & clear or migrate & keep files. Correct displayed in both orientations   |  |  | 
| 2nd slide - Migrate & clean | 1. Upgrade from previous version<br>2. In 1st slide select Next<br>2. In 2nd slide select "Migrate & clean" | Jump to the 3rd slide |  |  | 
| 2nd slide - Migrate & Keep | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select "Migrate & Keep" | Jump to the 3rd slide |  |  | 
| 3nd slide - Migration | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select any option | Migration is being done. Correctly displayed in both orientations|  |  | 
| 4th slide - End | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select any option<br>3. Wait till migration finishes | Migration done slice. Correctly displayed in both orientations |  |  | 
| 4th slide - Close | 1. Upgrade from previous version<br>2. In 1st slide select "Next"<br>2. In 2nd slide select any option<br>3. Wait till migration finishes<br>4. Select "Close"  | Wizard is gone, app is displayed |  |  | 
| **Wizard navigation errors** |   |
| 1st slide - Kill | 1. Upgrade from previous version<br>2. When 1st slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again? App is opened without migration, to be done later? |  |  | 
| 2nd slide - Kill | 1. Upgrade from previous version<br>2. When 2nd slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again? App is opened without migration, to be done later? |  |  | 
| 3rd slide - Kill | 1. Upgrade from previous version<br>2. When 3nd slide is displayed, kill the app<br>2. Open the app | Wizard is displayed again? App is opened without complete migration, to be done later? |  |  | 
| 4th slide - Kill | 1. Upgrade from previous version<br>2. When 4th slide is displayed, kill the app<br>2. Open the app | Wizard is not displayed.<br> App is opened with completed migration |  |  | 
| Low battery | 1. Upgrade from previous version with low battery (check with emulator ow switch the device off) | It should warn user?  |  |  | 
| **Data migration** | 4 devices, different capabilities and versions  |
| No downloaded data - Clean | 1. Upgrade from previous version<br>2. In 2nd slide, select "Migrate and clean"<br>3. After migration, download a file and a folder | 2. Legacy storage is cleaned up<br>Nothing downloaded in Scoped Storage<br>3. File and folder downloaded in Scoped Storage |  |  | 
| No downloaded data - Keep | 1. Upgrade from previous version<br>2. In 2nd slide, select "Migrate and keep"<br>3. After migration, download a file and a folder | 2. Legacy storage is cleaned up<br>Nothing downloaded in Scoped Storage<br>3. File and folder downloaded in Scoped Storage |  |  | 
| Little data - Clean | 1. Download <100MB of files (including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff|  |  | 
| Little data - Keep | 1. Download <100MB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage|  |  | 
| 1GB - Clean | 1. Download 1GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff|  |  | 
| 1GB - Keep | 1. Download 1GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage|  |  | 
| 5GB - Clean | 1. Download 5GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff|  |  | 
| 5GB - Keep | 1. Download 5GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage|  |  | 
| 20GB - Clean | 1. Download 20GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff|  |  | 
| 20GB - Keep | 1. Download 20GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage|  |  |
| 50GB - Clean | 1. Download 50GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and clean"<br>4. After migration, download a file and a folder | 3. Legacy storage is cleaned up<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff|  |  | 
| 50GB - Keep | 1. Download 50GB of files(including av. offline files and folders)<br>2. Upgrade from previous version<br>3. In 2nd slide, select "Migrate and keep"<br>4. After migration, download a file and a folder | 3. Legacy storage with all the files downloaded before<br>Dowloaded files moved to Scoped Storage<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage |  |  |
| Multiaccount | 1. Attach 4 accounts<br>2. Download and set av. offline files and folders in all of them<br>3. Upgrade from previous version<br>3. Run wizard till it ends.<br>4. After migration, download a file and a folder | 3. Dowloaded files moved to Scoped Storage from all accounts<br>4. File and folder downloaded in Scoped Storage together with the migrated stuff<br>File and folder not downloaded in legacy storage |  |  |
| **Data migration errors** | 
| Not enough space | 1. In a device with limited storage, download files in legacy storage that needs more than the half of the available space<br>2. Upgrade from previous version<br>3. Run wizard till it ends, selecting "Keep" | Not enough space to keep legacy and scoped storage together. Error message? |  |  |
| **Delayed migration** |
| Option in Settings? |  |  |  |
| Option removed after doing migration? |  |  |  |
| **Uploads migration** | 4 devices, different capabilities and versions  |
| Pending & running | 1. Upload a big file and some other small files<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Uploading and pending files finish to upload to the correct path<br>No debris in legacy storage<br>Correct paths in uploads view |  |  |
| Finished | 1. Upload some files and wait till they end<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Clean uploads view |  |  |
| Failed | 1. Upload some files  with error (by removing connection, f.ex)<br>2. Upgrade from previous version<br>3. Run the wizard till it ends | Failed uploads migrated  |  |  |