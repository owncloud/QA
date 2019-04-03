#### User Quota

#### PR: https://github.com/owncloud/ios-app/pull/337

Devices: iPhoneX v12<br>
Server: <br>


---

 
| Steps | Expected Result | Result | Related Comment
| :---- | :-------------- | :----- | :------------: |
|**View**||||||
| Portrait | Open drawer and check quota | Correctly displayed | P m12 |  |
| Landscape | Open drawer and check quota | Correctly displayed | P m12 |  |
|**Default options**||||||
| Default | Open drawer and check quota | It is displayed the quota with default limit (check in server side) | F m12 |  |
| Unlimited | Open drawer and check quota | It is displayed the quota with no limit | F m12 |  |
| 1 GB | Open drawer and check quota | It is displayed the quota with 1GB limit | F m12 |  |
| 5 GB | Open drawer and check quota | It is displayed the quota with 5GB limit | F m12 |  |
| 10 GB | Open drawer and check quota | It is displayed the quota with 10GB limit |  F m12|  |
|**Other options**||||||
| 10MB | Open drawer and check quota | It is displayed the quota with 10MB limit |  |  |
| 500MB | Open drawer and check quota | It is displayed the quota with 500MB limit |  |  |
| 100GB | Open drawer and check quota | It is displayed the quota with 100GB limit |  |  |
| 0 quota | Open drawer and check quota | It is displayed "No storage usabe information availble" |  |  |
| Unknown | Open drawer and check quota after switching connection off | It is displayed the quota with no limit |  |  |
|**Inside folders**||||||
| Empty | Open an empty folder | No size |  |  |
| Non-empty | Open an non-empty folder | Correct size |  |  |
