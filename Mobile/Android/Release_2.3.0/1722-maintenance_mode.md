###  Maintenance mode 

#### Pr: https://github.com/owncloud/android/pull/1722 

Devices: Huawei 6P v7.0, Nexus9 v6.0

Server: 9.1.3

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Operations**|||||||
| 1 | Login | With maintenance mode enabled, login in the app | Not possible. Message is shown | P m7 t6|  |
| 2 | Download file| With maintenance mode enabled, download a file | Not possible. Message is shown | P m7 t6|  |
| 3 | Synchronize folder| With maintenance mode enabled, download a folder | Not possible. Message is shown | P m7 t6|  |
| 4 | Upload file| With maintenance mode enabled, upload a file | Not possible. Message is shown. File is not queued | F m7 t6| Upload view shows "Unknown error" |
| 5 | Instant Upload | 1. With maintenance mode enabled, take a photo with instant uploads enabled<br> 2. Disable maintenance mode| 1. Photo is queued, but not uploaded.<br>2. Photo is uploaded | F m7 t6| Upload view shows "Unknown error" |
| 6 | Open with external app | With maintenance mode enabled, open a file with an external app  | File is opened. Maintenance mode does not affect | P m7 t6|  |
| 7 | Open from external app | With maintenance mode enabled, open a file of a external app  | 1. Photo is queued, but not uploaded.<br>2. Photo is uploaded | F m7 t6| Upload view shows "Unknown error" |
| 8 | New folder | With maintenance mode enabled, create a new folders | Not possible. Message is shown | P m7 t6 |  |
| 9 | Rename | With maintenance mode enabled, rename a file | Not possible. Message is shown | P m7 t6|  |
| 10 | Move | With maintenance mode enabled, move a file | Not possible. Message is shown | P m7 t6|  |
| 11 | Copy | With maintenance mode enabled, copy a file | Not possible. Message is shown | P m7 t6|  |
| 12 | Remove | With maintenance mode enabled, remove a file | Not possible. Message is shown | P m7 t6| |
| 13 | Refresh account | With maintenance mode enabled, refresh account | Not possible. Message is shown | - | Nothing in any case. |
| 14 | Share with users/groups | With maintenance mode enabled, share with a user/group | Not possible. Message is shown | F m7 t6| Message is not shown |
| 15 | Share by link | With maintenance mode enabled, share by link | Not possible. Message is shown | P m7 t6|  |
| 16 | Av offline | With maintenance mode enabled, set a file as av. offline | File is set but content is not downloaded. Message is shown | P m7 t6|  |
|**Multiaccount**|||||||
| 17 | Both in maintenance | Set several accounts, all of them in maintenance mode. Try several options | Message is always shown | P m7 t6|  |
| 18 | Some in maintenance | Set several accounts, some of them in maintenance mode. Try several options in all account | Message is shown if it is in maintenance, not shown if not in maintenance | P m7 t6|  |
|**Special servers**|||||||
| 19 | Redirected server | Set a redirected server in maintenance mode. Try several options | Message is always shown | P m7 t6|  |
| 20 | Shibboleth server | Set a shibboleth server in maintenance mode. Try several options | Message is always shown | F m7 t6| Not recognized |