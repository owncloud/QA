#### Quota & Avatar (new architecture)

#### PR: https://github.com/owncloud/android/pull/2901

Devices: Pixel 2 v10<br>
Server: 10.4

---
**QUOTA**
 
| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :---- | :-------------- | :----: | :--------------: 
|**View**||||||
| Portrait | Open drawer and check quota | Correctly displayed | P m10  |  |
| Landscape | Open drawer and check quota | Correctly displayed | P m10 |  |
|**Default options**||||||
| Default | Open drawer and check quota | It is displayed the quota with default limit (check in server side) | P m10 | Same as unlimited |
| Unlimited | Open drawer and check quota | It is displayed the quota with no limit | P m10 |  |
| 1 GB | Open drawer and check quota | It is displayed the quota with 1GB limit | P m10  |  |
| 5 GB | Open drawer and check quota | It is displayed the quota with 5GB limit | P m10 |  |
| 10 GB | Open drawer and check quota | It is displayed the quota with 10GB limit | P m10 |  |
|**Other options**||||||
| 10MB | Open drawer and check quota | It is displayed the quota with 10MB limit | P m10 |  |
| 500MB | Open drawer and check quota | It is displayed the quota with 500MB limit | P m10 |  |
| 100GB | Open drawer and check quota | It is displayed the quota with 50GB limit | P m10  |   |
| 0 quota | Open drawer and check quota | It is displayed "No storage usage information availble" | P m10 |  |
|**Progress bar**||||||
| Empty | Open an empty account | Progress bar 0% | P m10  |  |
| Full | Open a full account | No storage information available | P m10 |   |
| 25% | Open an account with 25% out of the quota| Progress bar 25% | P m10  |  |
| 50% | Open an account with 50% out of the quota| Progress bar 50% | P m10  |  |
| 75% | Open an account with 75% out of the quota| Progress bar 75% | P m10  |  |

**AVATAR**

| Test Case | Steps | Expected Result | Result | Related Comment
|:---------:| :--- | :-------------- | :----- | :-----: | :--------
|**View**||||||
| Portrait | 1. Open drawer and check avatar<br>2. Open "Manage accounts" and check avatar| Correctly displayed | P m10 |  |
| Landscape | Open drawer and check avatar<br>2. Open "Manage accounts" and check avatar | Correctly displayed | P m10 |  |
|**Actions**||||||
| No Avatar | In server, remove avatar | Default avatar is correctly displayed | P m10 |  |
| Regular Avatar | In server, set an avatar for user | Avatar is correctly displayed in app (drawer and manage accounts)| P m10 |  |
| Change Avatar | 1. In server, set an avatar<br>2. In server, change the avatar for a new one | 1. Check in app the avatar is displayed<br>2. Check in app the new avatar is displayed (drawer and manage accounts) | P m10 |  |
| Multiaccount | 1. Add several accounts to the app, with different avatars<br>2. Switch accounts in the app | Every account shows the correct avatar (drawer and manage accounts) | P m10 |  |