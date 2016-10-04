###  Separate video and photos in instant uploads 

#### Pr: https://github.com/owncloud/ios/pull/782 

Device: iPhone 9.3.2, iPad Air 

Server: 9.1.1 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**View**||||||
| 1 | Instant Upload Photos | Check the option in settings view| The option is correctly displayed in both orientations  | F m9 t10| Photos enabes Videos switch  |
| 2 | Instant Upload Videos | Check the option in settings view| The option is correctly displayed in both orientations  | P m9 t10|  |
| 3 | Background mode | 1. Enable one of the instant uploads (photos or video)<br>2. Enable both options<br>3. Disable both options| 1. Background mode options is visible<br>2. Background mode options is visible<br>3. Background mode options is not visible  | P m9 t10 |  |
|**Actions**||||||
| 4 | Photos enabled | 1. Enable the instant uploads only for photos<br>2. Take some photos<br>3. Take some videos| 2. Photos are uploaded<br>3. Videos are not uploaded  | F m9 t10 | Files before enabling are uploaded  |
| 5 | Videos enabled | 1. Enable the instant uploads only for videos<br>2. Take some videos<br>3. Take some photos| 2. Videos are uploaded<br>3. Photos are not uploaded  | F m9 t10 | Files before enabling are uploaded |
| 6 | Both enabled | 1. Enable the instant uploads for both videos and photos<br>2. Take some videos<br>3. Take some photos| 2. Videos are uploaded<br>3. Photos are uploaded  | P m9 t10 |  |
| 7 | Both disabled | 1. Disable the instant uploads for both videos and photos<br>2. Take some videos<br>3. Take some photos| 2. Videos are not uploaded<br>3. Photos are not uploaded  | F m9 t10 | Files before enabling are uploaded |
|**Multiaccount**||||||
| 8 | Options persistance | 1. Login to several accounts<br>2. Enable instant uploads with Background mode<br>3. Switch to other account| The instant uploads settings do not change | F m9 t10 | Disbled option is enabled switching the account |
|**Settings options**||||||
| 9 | Multiaccount disabled | 1. Disable multiaccount<br>2. Enable instant uploads with Background mode| The instant uploads settings are correctly displayed | P m9 t10 |  |
| 10 | Add accounts | 1. Enable multiaccount<br>2. Enable instant uploads with Background mode<br>3. Add more accounts after setting instant uploads settings| The instant uploads settings and new accounts are correctly displayed | P m9 t10 |  |
| 11 | Passcode + Touch id | 1. Enable passcode<br>2. Enable instant uploads with Background mode<br>3. Disable Passcode + Touch id| All options are correctly displayed | P m9 t10 |  |
| 12 | More | 1. Disable "More" options<br>2. Enable instant uploads with Background mode<br>3. Enable "More" options| All options are correctly displayed | P m9 t10 |  |
|**Upgrade**||||||
| 13 | All enabled | 1. Install previous version<br>2. Enable instant uploads with background mode<br>3. Upgrade to this version| Both instant uploads and background mode are enabled | P m9 t10 |  |
| 14 | Without background | 1. Install previous version<br>2. Enable instant uploads without background mode<br>3. Upgrade to this version| Both instant uploads enabled and background mode disabled | P m9 t10 |  |