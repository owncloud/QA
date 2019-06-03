#### User Quota

#### PR: https://github.com/owncloud/ios-app/pull/337

Devices: iPhoneX v12, iPadAir v12<br>
Server: 10.1<br>


---

 
 
| Test Case | Steps | Expected | Result | Related Comment |
| :-------- | :---- | :------- | :----: | :------------------------- |
|**View**||||
| Portrait | Open drawer and check quota | Correctly displayed | P m12 t12 |  |
| Landscape | Open drawer and check quota | Correctly displayed | P m12 t12 |  |
|**Default options**||||
| Default | Open drawer and check quota | FIXED: It is displayed the quota with default limit (check in server side) | P m12 t12| FIXED: Not correctly calculated and displayed |
| Unlimited | Open drawer and check quota | It is displayed the quota with no limit | P m12  t12| FIXED: Not correctly calculated and displayed |
| 1 GB | Open drawer and check quota | It is displayed the quota with 1GB limit | P m12 t12| FIXED: Not correctly calculated and displayed |
| 5 GB | Open drawer and check quota | It is displayed the quota with 5GB limit | P m12 t12| FIXED: Not correctly calculated and displayed |
| 10 GB | Open drawer and check quota | It is displayed the quota with 10GB limit |  P m12 t12| FIXED: Not correctly calculated and displayed  |
|**Other options**||||
| 10MB | Open drawer and check quota | It is displayed the quota with 10MB limit | P m12 t12|  |
| 500MB | Open drawer and check quota | It is displayed the quota with 500MB limit | P m12 t12|  |
| 100GB | Open drawer and check quota | It is displayed the quota with 100GB limit | P m12 t12|  |
|**Inside folders**||||
| Empty | Open an empty folder | No size | P m12 t12 |  |
| Non-empty | Open an non-empty folder | Correct size | P m12 t12|  |
