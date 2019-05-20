###  Log rotation

#### Pr: https://github.com/owncloud/ios-app/pull/382

Devices: iPhoneX v12.2<br>
Server: 10.1


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| Settings Portrait  | Open Settings | Log file option correctly displayed | P m12 |
| Settings Landscape | Open Settings | Log file option correctly displayed | P m12 |  |  |
| Browse logs Portrait | Browse Logs | Log files correctly displayed, initially empty | P m12 |  |  |
| Browse logs Landscape | Browse Logs | Log files correctly displayed, initially empty | P m12 |  |  |
|**Actions**||||||
| Log file disabled | Disable option Log file. Browse in the account andperform some actions | No log file is generated | |
| Log file enabled | Disable option Log file. Browse in the account andperform some actions | Log file generated with today's date | |
| New file | With the option enabled, generate logs<br>In device, change the date to tomorrow<br>Generate some logs | New log file | |
| Delete one file | With the option enabled, generate logs<br>Swipe on the log file and delete | File deleted and new one generated with new logs | |
| Delete all files | With the option enabled, generate logs<br>SIn browse files view, delete all | everything removed | |


