## 'Firstrunwizard' Test Plan

## Testing functionality

Test Case | Expected Result | Result | Related Comment
------------- | -------------- | ----- | ------
**CLI commands** |  |   |
Enable firstrunwizard app via CLI using ```occ app:enable firstrunwizard``` | The apps gets enabled | :construction:  |
Disable firstrunwizard app via CLI using ```occ app:disable firstrunwizard``` | The apps gets disabled | :construction:  |
The administrator resets firstrunwizard for all users with ```occ firstrunwizard:reset-all``` and a user logs in | The user sees first run wizard dialog | :construction: |
The administrator resets firstrunwizard for all users with ```occ firstrunwizard:reset-all``` and a user logs, logs out and relogs in | The user sees first run wizard dialog in first login but not in second login | :construction: |
The administrator resets firstrunwizard for all users with ```occ firstrunwizard:reset-all``` and a user logs in, logs out and another user logs in | Both users see first run wizard dialog | :construction: |
**WEBUI tests** |  |   |
When the firstrunwizard is enabled create new user and login | The user sees first run wizard dialog | :construction: |
When the firstrunwizard is disabled create new user and login | The user does not see first run wizard dialog | :construction: |
When the firstrunwizard is enabled, new user logs in for first time, logs out and relogs in | The user does not see first run wizard dialog | :construction:|
When the firstrunwizard is disabled, new user logs in for first time, logs out and relogs in | The user does not see first run wizard dialog | :construction:|
**webUI with several browsers**|  |   |
Check that first run wizard dialog is shown properly using Safari as browser|  | :construction:  |
Check that first run wizard dialog is shown properly using Chrome as browser|  | :construction:  |
Check that first run wizard dialog is shown properly using Firefox as browser|  | :construction:  |
Check that first run wizard dialog is shown properly using IE 11 as browser|  | :construction:  |
Check that first run wizard dialog is shown properly using Edge as browser|  | :construction:  |