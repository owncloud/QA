#### Android X  

#### Pr: https://github.com/owncloud/android/pull/2402



---

 
| Num | Test Case | Steps | Expected Result | Result | Related Comment |
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Camera uploads**||||||
| 1 | Camera uploads pics | Take same camera stuff and wait till 15 minutes it is uploaded | Pics uploaded | |
| 2 | Camera uploads videos | Take same camera stuff and wait till 15 minutes it is uploaded | Videos uploaded | |
|**Available offline**||||||
| 3 | Files | Select several files as av. offline<br>Modify them in the device<br>Wait till 15 mins to check the stuff| Files uploaded |  |  |
| 4 | Folders | Select several folders as av. offline<br>Modify some content inside in the device<br>Wait till 15 mins to check the stuff| Stuff uploaded |  |  |
| 5 | Reboot | Select several item as av. offline<br>Reboot the device| Stuff synced.  No crashes |  |  |
| 6 | Conflict I | Modify an av. offline file locally and in web UI<br>Wait till 15 mins to check the stuff<br>Fix the conclit with "local" | Conflict arised. Local version synced |  |  |
| 7 | Conflict II | Modify an av. offline file locally and in web UI<br>Wait till 15 mins to check the stuff<br>Fix the conclit with "server" | Conflict arised. Server version synced |  |  |
| 8 | Conflict III | Modify an av. offline file locally and in web UI<br>Wait till 15 mins to check the stuff<br>Fix the conclit with "both" | Conflict arised. Both versions synced | |  |
|**Smoke test**||||||
| 9 | Smoke test | Smoking test in the app | All OK | |  |
