#### User Quota

#### PR: https://github.com/owncloud/android/pull/2214

Devices: Samsung Galaxy S7 v7, Samsung Galaxy Tab2 v6<br>
Server: 10.0.8

---

 
| Test Case | Case | Steps | Expected Result | Result | Related Comment
|:---------:| :--- | :-------------- | :----- | :-----: | :--------
|**View**||||||
| 1 | Portrait | Open drawer and check quota | Correctly displayed | P m7 t6 |  |
| 2 | Landscape | Open drawer and check quota | Correctly displayed | P m7 t6 |  |
|**Default options**||||||
| 3 | Default | Open drawer and check quota | It is displayed the quota with default limit (check in server side) | P m7 t6| Same as unlimited |
| 4 | Unlimited | Open drawer and check quota | It is displayed the quota with no limit | P m7 t6|  |
| 5 | 1 GB | Open drawer and check quota | It is displayed the quota with 1GB limit | P m7 | FIXED: Not correctly displayed |
| 6 | 5 GB | Open drawer and check quota | It is displayed the quota with 5GB limit | P m7 t6|  |
| 7 | 10 GB | Open drawer and check quota | It is displayed the quota with 10GB limit | P m7 t6| FIXED: 1E+1 GB |
|**Other options**||||||
| 8 | 10MB | Open drawer and check quota | It is displayed the quota with 10MB limit | P m7 t6 |  |
| 9 | 500MB | Open drawer and check quota | It is displayed the quota with 500MB limit | P m7 t6| FIXED: Not correctly displayed |
| 10 | 100GB | Open drawer and check quota | It is displayed the quota with 100GB limit | P m7 t6 | FIXED: Not correctly displayed |
| 11 | 0 quota | Open drawer and check quota | It is displayed "No storage usabe information availble" | P m7 t6 |  |
| 12 | Unknown | Open drawer and check quota after switching connection off | It is displayed the quota with no limit | NA | Not reproducible |
|**Progress bar**||||||
| 13 | Empty | Open an empty account | Progress bar 0% |  P m7 t6|  |
| 14 | Full | Open a full account | Progress bar 100% | P m7 t6|  |
| 15 | 25% | Open an account with 25% out of the quota| Progress bar 25% | P m7 t6 |  |
| 16 | 50% | Open an account with 50% out of the quota| Progress bar 50% | P m7 t6 |  |
| 17 | 75% | Open an account with 75% out of the quota| Progress bar 75% | P m7 t6 |  |
