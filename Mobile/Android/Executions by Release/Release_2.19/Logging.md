### Logging 2.0


#### PR: https://github.com/owncloud/android/pull/3408

**Devices**: Pixel2 v11, Nexus 6P v7<br>
**Server**: 10.8


| Title | Steps     | Expected Result | Result | Comments |
| :---- | :-------- | :-------------- | :----: | :------- |
|**View**||||
| New option portrait | 1. Open `Settings`<br>2. Enable Logging | Option `Log files` available | P m11 m7 |  |
| New option landscape | 1. Open `Settings`<br>2. Enable Logging | Option `Log files` available | P m11 m7|  |
| No logs | 1. Open `Settings`<br>2. Enable Logging<br>3. Enter in Log Files and remove all existing log files | Empty log folder correct in both orientations| P m11 m7|  |
| Log entry | 1. Open `Settings`<br>2. Enable Logging<br>3. Do some actions in the app to generate logs<br>4. Go to log file list | Log entry generated with the file name, size, share button and delete button. Both orientations | P m11 m7 |  |
| App name| 1. Change app name in setup file<br>2. Open `Settings`<br>3. Enable Logging<br>4. Do some actions in the app to generate logs<br>4. Go to log file list | Log files name contains the new app name| P m11 m7 | data_folder item in setup |
|**Actions**| Logs generated |||
| Open with | 1. Click on any log entry<br>2. Open the log file | 1. "Open with" menu is displayed<br>2. Correct file is diplayed | P m11 m7|  |
| Share with | 1. Click on share icon<br>2. Share the log file | 1. "Share" menu is displayed<br>2. Correct file is shared and opened with the selected app | P m11 m7 |  |
| Delete | 1. Click on delete icon| File is removed. Entry is removed | P m11 m7 |  |
|**List**||||
| 5 logs | Generate logs of 5 different days | 5 logs entries correctly displayed | P m11 m7|  |
| 10 logs | Generate logs of 10 different days | 10 logs entries correctly displayed | P m11 m7 |  |
| + 10 logs | Generate logs of +10 different days | +10 logs entries correctly displayed | P m11 m7 |  |