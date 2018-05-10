#### User Quota

#### PR: https://github.com/owncloud/android/pull/2214


---

 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----- | :------------: |
|**View**||||||
| 1 | Portrait | Open drawer and check quota | Correctly displayed |  |  |
| 2 | Landscape | Open drawer and check quota | Correctly displayed |  |  |
|**Default options**||||||
| 3 | Default | Open drawer and check quota | It is displayed the quota with no limit |  |  |
| 4 | Unlimited | Open drawer and check quota | It is displayed the quota with no limit |  |  |
| 5 | 1 GB | Open drawer and check quota | It is displayed the quota with 1GB limit |  |  |
| 6 | 5 GB | Open drawer and check quota | It is displayed the quota with 1GB limit |  |  |
| 7 | 10 GB | Open drawer and check quota | It is displayed the quota with 10GB limit |  |  |
|**Other options**||||||
| 8 | 10MB | Open drawer and check quota | It is displayed the quota with 10MB limit |  |  |
| 9 | 500MB | Open drawer and check quota | It is displayed the quota with 500MB limit |  |  |
| 10 | 100GB | Open drawer and check quota | It is displayed the quota with 100GB limit |  |  |
|**Progress bar**||||||
| 11 | Empty | Open an empty account | Progress bar 0% |  |  |
| 12 | Full | Open a full account | Progress bar 100% |  |  |
| 13 | 25% | Open an account with 25% out of the quota| Progress bar 25% |  |  |
| 14 | 50% | Open an account with 50% out of the quota| Progress bar 50% |  |  |
| 15 | 75% | Open an account with 75% out of the quota| Progress bar 75% |  |  |
