###  Maintenance mode 

#### Pr: https://github.com/owncloud/ios/pull/821 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Operations**|||||||
| 1 | Login | With maintenance mode enabled, login in the app | Not possible. Message is shown |  |  |
| 2 | Download file| With maintenance mode enabled, download a file | Not possible. Message is shown |  |  |
| 3 | Download folder| With maintenance mode enabled, download a folder | Not possible. Message is shown |  |  |
| 4 | Upload file| With maintenance mode enabled, download a file | Not possible. Message is shown. File is not queued |  |  |
| 5 | Instant Upload | 1. With maintenance mode enabled, take a photo with instant uploads enabled<br> 2. Disable maintenance mode| 1. Photo is queued, but not uploaded.<br>2. Photo is uploaded |  |  |
| 6 | New folder | With maintenance mode enabled, create a new folders | Not possible. Message is shown |  |  |
| 7 | Rename | With maintenance mode enabled, rename a file | Not possible. Message is shown |  |  |
| 8 | Move | With maintenance mode enabled, move a file | Not possible. Message is shown |  |  |
| 9 | Txt file | With maintenance mode enabled, create a txt file | File is queued but not uploaded (queued) |  |  |
| 10 | Remove | With maintenance mode enabled, remove a file | Not possible. Message is shown |  |  |
| 11 | Share with users/groups | With maintenance mode enabled, share with a user/group | Not possible. Message is shown |  |  |
| 12 | Share by link | With maintenance mode enabled, share by link | Not possible. Message is shown |  |  |
| 13 | Av offline | With maintenance mode enabled, set a file as av. offline | File is set but content is not downloaded. Message is shown |  |  |
|**Multiaccount**|||||||
| 14 | Both in maintenance | Set several accounts, all of them in maintenance mode. Try several options | Message is always shown |  |  |
| 15 | Some in maintenance | Set several accounts, some of them in maintenance mode. Try several options in all account | Message is shown if it is in maintenance, not shown if not in maintenance |  |  |
|**Special servers**|||||||
| 16 | Redirected server | Set a redirected server in maintenance mode. Try several options | Message is always shown |  |  |
| 17 | Shibboleth server | Set a shibboleth server in maintenance mode. Try several options | Message is always shown |  |  |
