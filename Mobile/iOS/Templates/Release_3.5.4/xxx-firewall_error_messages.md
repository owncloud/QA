###  Firewall error messages 

#### Pr: https://github.com/owncloud/ios/pull/xxx 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
| 1 | Mime type uploads | 1. Set a rule in firewall related with mime type<br>2. Upload files that does not fit the rule  | Specific error is displayed in uploads view and notification |  |  |
| 2 | Mime type download | 1. Set a rule in firewall related with mime type<br>2. Download files that does not fit the rule  | Specific error is displayed in notification |  |  |
| 3 | File size uploads | 1. Set a rule in firewall related with file size<br>2. Upload files which size exceeds the size in the rule | Specific error is displayed in uploads view and notification |  |  |
| 4 | User device login | 1. Set a rule in firewall user device is Android<br>2. Try to login with an Android device  | Authentication is forbidden |  |  |
| 5 | User device download | 1. Set a rule in firewall user device is Android<br>2. Download files with an Android device | Specific error is displayed in notification |  |  |
| 6 | User device uploads | 1. Set a rule in firewall user device is Android<br>2. Upload files with an Android device | Specific error is displayed in notification and uploads view|  |  |
| 7 | User group login | 1. Set a rule in firewall user group<br>2. Try to login with the user in the group of the rule | Authentication is forbidden |  |  |
| 8 | User group download | 1. Set a rule in firewall user group<br>2. Download files with the user in the group of the rule | Specific error is displayed in notification |  |  |
| 9 | User group uploads | 1. Set a rule in firewall user group<br>2. Download files with the user in the group of the rule | Specific error is displayed in notification and uploads view|  |  |
| 10 | Request time login | 1. Set a rule in firewall request time<br>2. Try to login in the request time | Authentication is forbidden |  |  |
| 11 | Request time download | 1. Set a rule in firewall request time<br>2. Download files in request time | Specific error is displayed in notification |  |  |
| 12 | Request time uploads | 1. Set a rule in firewall request time<br>2. Download files in request time | Specific error is displayed in notification in uploads view|  |  | |
| 13 | Request type share link | 1. Set a rule in firewall request type by share link<br>2. Share a file by link | Specific error is displayed in notification |  |  |
| 14 | Request type webdav | 1. Set a rule in firewall request type by webdav<br>2. Perform a opeation on the webdav enpoint | Specific error is displayed in notification |  |  |