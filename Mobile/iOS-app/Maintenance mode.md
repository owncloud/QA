#### Maintenance mode 

#### PRs: https://github.com/owncloud/ios-app/pull/158<br>


Device/s: iPhone 6Plus v12.1, iPadAir v12 <br>
Server: 10.0.10

Number of tests: 11<br>
Number of automated tests:   <br>
Coverage: <br>


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
| :--------- | :---- | :-------------- | :---: | :------------: |
|**Maintenance mode**||||||
| Login | Try to login with maintenance mode enabled | Maintenance mode message displayed | P m12 t12| |
| Add new bookmark | Try to add a new bookmark with maintenance mode enabled | Maintenance mode message displayed | P m12 t12| |
| Rename | Try to rename an item with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | |
| Move | Try to move an item with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | FIXED: Message disappeard|
| Duplicate | Try to duplicate an item with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | |
| Delete | Try to delete an item with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | |
| New folder | Try to create a new folder with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | FIXED: Not enqueued, Fails first time, then not determinist |
| Download | Try to download a file with maintenance mode enabled | Maintenance mode message displayed | F m12 t12 | Not network, system error... different errors with the same steps| 
| Download II | Download a file. While it is being downloaded, enable maintenance mode | Maintenance mode message displayed | NA | downloaded is not broken by the server | 
| Upload | Try to login with maintenance mode enabled | Maintenance mode message displayed | P m12 t12 | FIXED: Uploads not resumed. |
| Upload II |Upload a bunch of files. While they are being uploaded, enable maintenance mode | Maintenance mode message displayed | F m12 t12 | Many alerts (one for each file). There are no sttus message |
