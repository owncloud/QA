###  Firewall error messages 

#### Pr: https://github.com/owncloud/ios/pull/851 

Devices: iPhone 6S Plus v9.3

Server: 8.2

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Mime type uploads | 1. Set a rule in firewall related with mime type<br>2. Upload files that does not fit the rule  | Specific error is displayed in uploads view and notification | P m9 |  |
| 2 | File size uploads | 1. Set a rule in firewall related with file size<br>2. Upload files which size exceeds the size in the rule | Specific error is displayed in uploads view and notification | P m9 |  |
| 3 | User device login | 1. Set a rule in firewall user device is Android<br>2. Try to login with an Android device  | Authentication is forbidden | P m9 |  |
| 4 | User device download | 1. Set a rule in firewall user device is Android<br>2. Download files with an Android device | Specific error is displayed in notification | P m9 |  |
| 5 | User device uploads | 1. Set a rule in firewall user device is Android<br>2. Upload files with an Android device | Specific error is displayed in notification and uploads view| P m9 |  |
| 6 | User group login | 1. Set a rule in firewall user group<br>2. Try to login with the user in the group of the rule | Authentication is forbidden | P m9 |  |
| 7 | User group download | 1. Set a rule in firewall user group<br>2. Download files with the user in the group of the rule | Specific error is displayed in notification | P m9 |  |
| 8 | User group uploads | 1. Set a rule in firewall user group<br>2. Download files with the user in the group of the rule | Specific error is displayed in notification and uploads view| P m9 |  |
| 9 | Request time login | 1. Set a rule in firewall request time<br>2. Try to login in the request time | Authentication is forbidden | P m9 |  |
| 10 | Request time download | 1. Set a rule in firewall request time<br>2. Download files in request time | Specific error is displayed in notification | P m9 |  |
| 11 | Request time uploads | 1. Set a rule in firewall request time<br>2. Download files in request time | Specific error is displayed in notification in uploads view| P m9 |  | |
| 12 | Request type webdav | 1. Set a rule in firewall request type by webdav<br>2. Perform a opeation on the webdav enpoint | Specific error is displayed in notification | P m9 |  |