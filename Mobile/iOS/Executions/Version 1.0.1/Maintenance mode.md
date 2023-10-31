#### Maintenance mode 

#### PRs: https://github.com/owncloud/ios-app/pull/158<br>


Device/s: iPhone 6Plus v12.1, iPadAir v12 <br>
Server: 10.0.10

Number of tests: 17<br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
| :--------- | :---- | :-------------- | :---: | :------------: |
|**Maintenance mode**||||||
| Login | Try to login with maintenance mode enabled | Maintenance mode message displayed | P m12 t12| |
| Add new bookmark | Try to add a new bookmark with maintenance mode enabled | Maintenance mode message displayed | P m12 t12| |
| Rename | Try to rename an item with maintenance mode enabled | Renamed after disabling maintenance mode | P m12 t12 | |
| Rename II | Try to rename two items with the same name with maintenance mode enabled | Renamed the first after disabling maintenance mode, second with error | P m12 t12 | |
| Move | Try to move an item with maintenance mode enabled | Moved after disabling maintenance mode  | P m12 t12 |
| Move II | Try to move twice an item with maintenance mode enabled | Moved after disabling maintenance mode. Second one with error | P m12 t12 | FIXED: Message disappeard|
| Duplicate | Try to duplicate an item with maintenance mode enabled | Duplicated after disabling maintenance mode | P m12 t12 | |
| Duplicate II | Try to duplicate twice an item with maintenance mode enabled | Duplicated after disabling maintenance mode. Second with error | P m12 t12 | |
| Delete | Try to delete an item with maintenance mode enabled | Deleted after disabling maintenance mode | P m12 t12 | |
| Delete II | Try to delete twice an item with maintenance mode enabled | Deleted after disabling maintenance mode | NA | Check agains after issue #188|
| New folder | Try to create a new folder with maintenance mode enabled | Folder created after disabling maintenance mode | P m12 t12 | FIXED: Not enqueued, Fails first time, then not determinist |
| New folder II | Try to create two folder with maintenance mode enabled | Folder created after disabling maintenance mode. Second with error | P m12 t12 | FIXED: Not enqueued, Fails first time, then not determinist |
| Download | Try to download a files with maintenance mode enabled and the same name | Maintenance mode message displayed | F m12 t12 | Not network, system error... different errors with the same steps| 
| Download II | Download a file. While it is being downloaded, enable maintenance mode | Maintenance mode message displayed | NA | download is not broken by the server | 
| Upload | Try to login with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | FIXED: Uploads not resumed. |
| Upload II |Upload a bunch of files. While they are being uploaded, enable maintenance mode | Maintenance mode message displayed | P m12 t12 | FIXED: Many alerts (one for each file). There are no status message |
| Upload III |Upload a huge file. While it is being uploaded, enable maintenance mode. Then, disable maintenance mode | Maintenance mode message displayed. After disabling, upload resumes | P m12 t12 |  |
