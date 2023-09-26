###  Firewall error messages 

#### Pr: https://github.com/owncloud/android/pull/1895

Devices: Nexus 10 v5, HTC One v4.3

Server: v8.2 (v9 and greater with bugs in server side)


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Mime type uploads | 1. Set a rule in firewall related with mime type<br>2. Upload files that does not fit the rule  | Specific error is displayed in uploads view and notification | P t5 t4 |  |
| 2 | Mime type download | 1. Set a rule in firewall related with mime type<br>2. Download files that does not fit the rule  | Specific error is displayed in notification | - | Rule only for downloads |
| 3 | File size uploads | 1. Set a rule in firewall related with file size<br>2. Upload files which size exceeds the size in the rule | Specific error is displayed in uploads view and notification | P t5 m4|  |
| 4 | User device login | 1. Set a rule in firewall user device is Android<br>2. Try to login with an Android device  | Authentication is forbidden | P m5 t4 | Only in server < 9 |
| 5 | User device download | 1. Set a rule in firewall user device is Android<br>2. Download files with an Android device | Specific error is displayed in notification | P t5 m4 | Only in server < 9  |
| 6 | User device uploads | 1. Set a rule in firewall user device is Android<br>2. Upload files with an Android device | Specific error is displayed in notification and uploads view| P t5 m4 | Only in server < 9  |
| 7 | User group login | 1. Set a rule in firewall user group<br>2. Try to login with the user in the group of the rule | Authentication is forbidden | P t5 m4 | Only in server < 9 |
| 8 | User group download | 1. Set a rule in firewall user group<br>2. Download files with the user in the group of the rule | Specific error is displayed in notification | P t5 m4  | Only in server < 9 |
| 9 | User group uploads | 1. Set a rule in firewall user group<br>2. Download files with the user in the group of the rule | Specific error is displayed in notification and uploads view | P t5 m4 | Only in notif. Not in uploads view |
| 10 | Request time login | 1. Set a rule in firewall request time<br>2. Try to login in the request time | Authentication is forbidden | P t4 m5 | Only in server < 9 |
| 11 | Request time download | 1. Set a rule in firewall request time<br>2. Download files in request time | Specific error is displayed in notification | P t4 m5 | Only in server < 9 |
| 12 | Request time uploads | 1. Set a rule in firewall request time<br>2. Download files in request time | Specific error is displayed in notification in uploads view| P t4 m5 | Only in notif. Not in uploads view | 
| 13 | Request type share link | 1. Set a rule in firewall request type by share link<br>2. Share a file by link | Specific error is displayed in notification | - | Not for mobile. Only browsers |
| 14 | Request type webdav | 1. Set a rule in firewall request type by webdav<br>2. Perform a opeation on the webdav enpoint | Specific error is displayed in notification | P m5 t4 | Only in server < 9 |