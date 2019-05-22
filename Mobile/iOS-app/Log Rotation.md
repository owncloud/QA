###  Log rotation

#### Pr: https://github.com/owncloud/ios-app/pull/382

Devices: iPhoneX v12.2, iPad v12.2<br>
Server: 10.1


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**View**||||||
| Settings Portrait  | Open Settings | Log file option correctly displayed | P m12 t12|
| Settings Landscape | Open Settings | Log file option correctly displayed | P m12 t12|  |  |
| Browse logs Portrait | Browse Logs | Log files correctly displayed, initially empty | P m12 t12|  |  |
| Browse logs Landscape | Browse Logs | Log files correctly displayed, initially empty | P m12 t12|  |  |
|**Actions**||||||
| Log file disabled | Disable option Log file. Browse in the account and perform some actions | No log file is generated | P m12 t12 | IMPROV: Option visible, maybe should be hidden. FIXED: From scratch Logging disabled
| Log file enabled | Disable option Log file. Browse in the account and perform some actions | Log file generated with today's date | P m12 t12 |
| New file | With the option enabled, generate logs<br>In device, change the date to tomorrow<br>Generate some logs | New log file | P m12 t12 |
| New file more days | With the option enabled, generate logs<br>In device, change the date to a dy one week after<br>Generate some logs | New log file with correct day | P m12 t12 |
| Delete one file | With the option enabled, generate logs<br>Swipe on the log file and delete | File deleted and new one generated with new logs | P m12 t12 |
| Delete all files | With the option enabled, generate logs<br>In browse files view, delete all | everything removed | P m12 t123 | Today's file is not deleted (new logs generated)
| More than 10 | Generate more than 10 files | Only last 10 are retained | P m12 t12 | Latest 11 stored: current + 10 closed 

