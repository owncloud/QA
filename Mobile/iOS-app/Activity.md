#### Activity 

#### PRs: https://github.com/owncloud/ios-app/pull/233

Device/s: iPhoneX v12.1<br>
Server: 10.0.10

Number of tests: <br>
Number of automated tests: <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | Automated |
| :-------- | :---- | :------- | :----: | :------------------------- | :-------: |
|**View**||||||
| Portrait | Open Activity view  | Correct view in portrait | P m12 | | 
| Landscape | Open Activity view | Correct in landscape | P m12| | 
|**Actions**||||||
| Upload file | Upload a file from files app | Progress is shown in Activity View| P m12 | |
| Download file | Download a file inside the app | Progress is shown in Activity View| P m12 | |
| Delete item | Delete an item  inside the app | Action is shown in Activity View| P m12 | |
| Rename item | Rename an item  inside the app | Action is shown in Activity View| P m12 | |
| Duplicate item | Duplicate an item  inside the app | Action is shown in Activity View| P m12 | |
| Copy item | Copy an item inside the app  | Action is shown in Activity View| P m12 | |
| Create folder | Create a new folder | Action is shown in Activity View| P m12 | |
|**Several Actions**||||||
| Upload + more | 1. Upload a huge file<br>2. While it is being uploaded, create a folder, move a file and rename another file | All actions are enqueued and finish correctly| P m12 | |
| Download + more | 1. Download a huge file<br>2. While it is being downloaded, duplicate a folder, copy a file and delete another file | All actions are enqueued and finish correctly|  | |
|**Cancel Actions**||||||
| Upload file | Upload a file from files app and cancel it from Activity| Progress is shown in Activity View| P t12 | |
| Download file | Download a file inside the app  and cancel it from Activity| Progress is shown in Activity View and when it is cancelled, it disappears. Actions is not completed| F m12 | Needed two clicks to resume |
| Delete item | Delete an item  inside the app  and cancel it from Activity| Action is shown in Activity View and when it is cancelled, it disappears. Actions is not completed| NA | |
| Rename item | Rename an item  inside the app  and cancel it from Activity| Action is shown in Activity View and when it is cancelled, it disappears. Actions is not completed|NA | |
| Duplicate item | Duplicate an item  inside the app  and cancel it from Activity| Action is shown in Activity View and when it is cancelled, it disappears. Actions is not completed|NA | |
| Copy item | Copy an item inside the app  and cancel it from Activity | Action is shown in Activity View and when it is cancelled, it disappears. Actions is not completed| F m12 | Action stucked|
| Duplicate item | Duplicate an item  inside the app  and cancel it from Activity| Action is shown in Activity View and when it is cancelled, it disappears. Actions is not completed| F m12| Action stucked |
| Create folder | Create a new folder  and cancel it from Activity| Action is shown in Activity View and when it is cancelled, it disappears. Actions is not completed| NA | |
|**Multiaccount**||||||
| Two accounts - Download | Download files in two accounts at the same time | Downloads run at the time and finishes correctly| F m12 | App stucked |
| Two accounts - Upload | Upload files in two accounts at the same time | Upload run at the time and finishes correctly| F m12 | App stucked |
| Three accounts - Download | Download files in three accounts at the same time | Downloads run at the time and finishes correctly| F m12  | App stucked |
| Three accounts - Upload | Upload files in three accounts at the same time | Upload run at the time and finishes correctly| F m12 | App stucked |
|**Issues**||||||
| No connection - Upload | Upload a file with no connection<br>Recover connection |File enqueued in Activity<br>Action done |  |  |
| No connection - Upload many | Upload many files with no connection<br>Recover connection |Files enqueued in Activity<br>Actions done |  |  |
| No connection - Download | Download many file with no connection<br>Recover connection |Files enqueued in Activity<br>Actions done |  |  |
| No connection - Download many | Download a file with no connection<br>Recover connection |File enqueued in Activity<br>Action done |  |  |
| No connection - Rename | Rename an item with no connection<br>Recover connection |Item enqueued in Activity<br>Action done |  |  |
| No connection - Delete | Delete an item with no connection<br>Recover connection |File enqueued in Activity<br>Action done |  |  |
| No connection - Duplicate | Duplicate an item with no connection<br>Recover connection |File enqueued in Activity<br>Action done |  |  |
| No connection - Move | Move an item with no connection<br>Recover connection |File enqueued in Activity<br>Action done |  |  |
| No connection - Copy | Copy an item with no connection<br>Recover connection |File enqueued in Activity<br>Action done |  |  |
| No connection - Create folder | Create a folder with no connection<br>Recover connection |Action enqueued in Activity<br>Action done |  |  |
| No connection - Cancel | Enqueue some actions with no connection<br>Remove several of them from Activity<br>Recover connection | Actions done. Removed actions not done |  |  |
