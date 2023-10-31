###  Forbidden reshare 

#### Pr: https://github.com/owncloud/ios/pull/948 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Allow resharing disabled**|||||||
| 1 | Allow resharing file | 1. In WebUI, disable "Allow resharing"<br>2. In app, try to reshare file | Option not displayed, but displayed in other items |  |  |
| 2 | Allow resharing folder | 1. In WebUI, disable "Allow resharing"<br>2. In app, try to reshare folder | Option not displayed, but displayed in other items|  |  |
| 3 | Allow resharing federated | User1(Server1) shares with User2(Server2). Server2 does not allow resharing | Option not displayed, but displayed in other items |  |
|**Allow resharing enabled**|||||||
| 4 | Allow resharing file | 1. In WebUI, enable "Allow resharing"<br>2. In app, try to reshare file | Reshare correct |  |  |
| 5 | Allow resharing folder | 1. In WebUI, enable "Allow resharing"<br>2. In app, try to reshare file | Reshare correct |  |  |
| 6 | Allow resharing federated | User1(Server1) shares with User2(Server2). Server2 allows resharing | Reshare correct |  |