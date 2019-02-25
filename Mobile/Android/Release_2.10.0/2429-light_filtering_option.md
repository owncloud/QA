#### Light filtering option 

#### Pr: https://github.com/owncloud/android/pull/2429

Device: Nexus 6P v7, Pixel2 v9
Server: 10.0.9

Filter app: Twilight

---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**View**||||||
| 1 | Option in Settings | Open settings view | Option is correctly displayed in both orientations | P m7 m9 |  |
| 2 | Warning | Enable option | Option is correctly enabled and warning is shown | P m7 m9|  |
|**Option enabled with filter installed**||||||
| 3 | Wizard view | Tap anywhere in the view | tap works | P m7 m9|
| 4 | Auth view | Tap anywhere in the view | tap works | P m7  m9|
| 5 | Settings view | Tap anywhere in the view | tap works | P m7 m9 |
| 6 | Move/copy view | Tap anywhere in the view | tap works | P m7 m9 |
| 7 | Passcode view | Tap anywhere in the view | tap works | P m7 m9 | FIXED: Crash
| 8 | Fingerprint view | Tap anywhere in the view | tap works | P m7 m9 |
| 9 | Pattern lock view | Tap anywhere in the view | tap works | P m7 m9 |
| 10 | Privacy policy view | Tap anywhere in the view | tap works | P m7 m9 |
| 11 | Folder picker camera uploads view | Tap anywhere in the view | tap works | P m7 m9 |
| 12 | Camera folder picker view | Tap anywhere in the view | tap works | P m7 m9 | FIXED: Can not tap
| 13 | Logs view | Tap anywhere in the view | tap works | P m7 m9 |
| 14 | File list | Tap anywhere in the view | tap works | P m7 m9 |
| 15 | File options (3-dot button) | Tap anywhere in the view | tap works | P m7 m9 |
| 16 | Sorting options | Tap anywhere in the view | tap works | P m7 m9 |
| 17 | Searching options | Tap anywhere in the view | tap works | P m7 m9 |
| 18 | Drawer | Tap anywhere in the view | tap works | P m7 m9 |
| 19 | Multiselection mode | Tap anywhere in the view | tap works | P m7 m9 |
| 20 | Multiselection options | Tap anywhere in the view | tap works | P m7 m9 |
| 21 | FAB options| Tap anywhere in the view | tap works | F m7 | Upload crashes
| 22 | Create folder view | Tap anywhere in the view | tap works | P m7 m9 |
| 23 | Uploads view | Tap anywhere in the view | tap works | P m7 m9 | FIXED Can not tap
| 24 | Feedback view | Tap anywhere in the view | tap works | P m7 m9 |
| 25 | Upload picker | Tap anywhere in the view | tap works | P m7 m9 |
| 26 | Upload picker options | Tap anywhere in the view | tap works | P m7 m9 |
| 27 | Picker from other apps | Tap anywhere in the view | tap works | P m7 m9 |
| 28 | Upload from camera | Tap anywhere in the view | tap works | P m7 m9 |
| 29 | File/Move picker | Tap anywhere in the view | tap works | P m7 m9 |
| 30 | Remove view | Tap anywhere in the view | tap works | P m7 m9 |
| 31 | Rename view | Tap anywhere in the view | tap works | P m7 m9 |
| 32 | Details view | Tap anywhere in the view | tap works | P m7 m9 | FIXED: crash
| 33 | Share view | Tap anywhere in the view | tap works | P m7 m9 |
| 34 | Share with users search | Tap anywhere in the view | tap works | P m7 m9 |
| 35 | Share with users permissions | Tap anywhere in the view | tap works | P m7 m9 |
| 36 | Create/Edit public link view | Tap anywhere in the view | tap works | P m7 m9 |
| 37 | Get public link | Tap anywhere in the view | tap works | P m7 m9 |
| 38 | Remove public link | Tap anywhere in the view | tap works | P m7 m9 |
| 39 | Universal link | Tap anywhere in the view | tap works | P m7 m9 |
| 40 | File preview images | Tap anywhere in the view | tap works | P m7 m9 |
| 41 | File preview text | Tap anywhere in the view | tap works | P m7 m9 | FIXED: crash
| 42 | File preview options | Tap anywhere in the view | tap works | P m7 m9 |
| 43 | Share with oC view | Tap anywhere in the view | tap works | P m7 m9 |
| 44 | Paste text in oC view | Tap anywhere in the view | tap works | P m7 m9 |