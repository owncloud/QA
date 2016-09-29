###  Separate video and photos in instant uploads 

#### Pr: https://github.com/owncloud/ios/pull/782 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**View**||||||
| 1 | Instant Upload Photos | Check the option in settings view| The option is correctly displayed in both orientations  |  |  |
| 1 | Instant Upload Videos | Check the option in settings view| The option is correctly displayed in both orientations  |  |  |
| 1 | Background mode | 1. Enable one of the instant uploads (photos or video)<br>2. Enable both options<br>3. Disable both options| 1. Background mode options is visible<br>2. Background mode options is visible<br>3. Background mode options is not visible  |  |  |
|**Actions**||||||
| 1 | Photos enabled | 1. Enable the I.U. only for photos<br>2. Take some photos<br>3. Take some videos| 2. Photos are uploaded<br>3. Videos are not uploaded  |  |  |
| 1 | Videos enabled | 1. Enable the I.U. only for videos<br>2. Take some videos<br>3. Take some photos| 2. Videos are uploaded<br>3. Photos are not uploaded  |  |  |
| 1 | Both enabled | 1. Enable the I.U. for both videos and photos<br>2. Take some videos<br>3. Take some photos| 2. Videos are uploaded<br>3. Photos are uploaded  |  |  |
| 1 | Both disabled | 1. Disable the I.U. for both videos and photos<br>2. Take some videos<br>3. Take some photos| 2. Videos are not uploaded<br>3. Photos are not uploaded  |  |  |
|**Multiaccount**||||||
| 1 | Options persistance | 1. Login to several accounts<br>2. Enable I.U. with Background mode<br>3. Switch to other account| The I.U. settings do not change |  |  |
|**Settings options**||||||
| 1 | Multiaccount disabled | 1. Disable multiaccount<br>2. Enable I.U. with Background mode| The I.U. settings are correctly displayed |  |  |
| 1 | Passcode + Touch id | 1. Enable passcode<br>2. Enable I.U. with Background mode<br>3. Disable Passcode + Touch id| All options are correctly displayed |  |  |
| 1 | More | 1. Disable "More" options<br>2. Enable I.U. with Background mode<br>3. Enable "More" options| All options are correctly displayed |  |  |
|**Upgrade**||||||
| 1 | All enabled | 1. Install prevous version<br>2. Enable I.U with background mode<br>3. Upgrade to this version| Both I.U. and background mode are enabled |  |  |
| 1 | Without background | 1. Install prevous version<br>2. Enable I.U without background mode<br>3. Upgrade to this version| Both I.U. enabled and background mode disabled |  |  |