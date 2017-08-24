###  Forbidden reshare 

#### Pr: https://github.com/owncloud/android/pull/2019 

Devices: SamsungGalaxy S7 v7, Samsung Galaxy Tab2 v5

Server: v10 (basic and OAuth2), v9 (SAML)


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Allow resharing disabled**|||||||
| 1 | Allow resharing file | 1. In WebUI, disable "Allow resharing"<br>2. In app, try to reshare file | Option not displayed, but displayed in other items. Check in preview mode | P m7 t5 |  |
| 2 | Allow resharing folder | 1. In WebUI, disable "Allow resharing"<br>2. In app, try to reshare folder | Option not displayed, but displayed in other items| P m7 t5 |  |
| 3 | Allow resharing federated | User1(Server1) shares with User2(Server2). Server2 does not allow resharing | Option not displayed, but displayed in other items | P m7 | Pending server |
|**Allow resharing enabled**|||||||
| 4 | Allow resharing file | 1. In WebUI, enable "Allow resharing"<br>2. In app, try to reshare file | Reshare correct | P m7 t5 |  |
| 5 | Allow resharing folder | 1. In WebUI, enable "Allow resharing"<br>2. In app, try to reshare file | Reshare correct | P m7 t5 |  |
| 6 | Allow resharing federated | User1(Server1) shares with User2(Server2). Server2 allows resharing | Reshare correct | P m7 | Pending server |