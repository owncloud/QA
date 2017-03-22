###  Modify share view 

#### Pr: https://github.com/owncloud/ios/pull/859 

Devices: iPhone6 v10.2.1, iPad Air v10

Server: 10.0, 9.1, 8.1

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**View**||||||
| 1 | Portrait | Check the share view in portrait | View is correct in both orientations | P m10 t10 |  |
| 2 | Landscape | Check the share view in landscape | View is correct in both orientations| P m10 t10 |  |
| 3 | Share file with a user | Share a file with a user | View is correct in both orientations | P m10 t10|  |
| 4 | Share folder with a group | Share a folder with a group | View is correct in both orientations | P m10 t10|  |
| 5 | Share by link | Share a file by link | View is correct in both orientations| P m10 t10 |  |
| 6 | Share by link with password | Share by link with password | View is correct in both orientations| P m10 t10|  |
| 7 | Share by link with expiration | Share by link with expiration | View is correct in both orientations| P m10 t10|  |
| 8 | Share by link with password and expiration | Share by link with password and expiration | View is correct in both orientations| P m10 t10 |  |
| 9 | Share by link and with users | Share a file by link and with users/groups | View is correct in both orientations | P m10 t10|  |
| 10 | Share with lot of users | Share a file with a lot of users | View is correct in both orientations | P m10 t10|  |
|**Branding options**||||||
| 11 | Only share link | Enable share link and disable share by users in customer options | View is correct in both orientations | P m10 t10|  |
| 12 | Only share with users | Disable share link and enable share by users in customer options | View is correct in both orientations | P m10 t10|  |
| 13 | Neither link nor users | Disable both share link and share by users in customer options | View is correct in both orientations | P m10 t10|  |
|**Share API server**||||||
| 14 | Allow public upload | 1. In server, enable "allow public upload".<br> 2. Share a folder by link<br>3. In server, disable "allow public upload"<br>4. Share folder by link  | 2. Allow editing appears<br>4. Allow editing does not appear | P m10 t10|  |
| 15 | Enforce password | 1. In server, enable password protection.<br> 2. Share by link<br>3. Remove the password  | 2. Password is asked<br>3. Password can not be removed. Correct view | P m10 t10|  |
| 16 | Enforce expiration | 1. In server, enforce expiration.<br> 2. Share by link<br>3. Disable expiration  | 2. Expiration is asked<br>3. Expiration can not be removed. Correct view | P m10 t10|  |
| 17 | Enforce expiration date | 1. In server, enforce expiration date.<br> 2. Share by link<br>3. Disable expiration date  | 2. Expiration date is set automatically<br>3. Expiration can not be set to a . Correct view | P m10 t10|  |