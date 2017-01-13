###  More specific errors in share view 

#### Pr: https://github.com/owncloud/android/pull/XXX 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Share API enabled**|||||||
| 1 | Server 8.1 portrait  |  In a server 8.1, try to share a file with users/groups | It is not possible. A message indicating that the server version should be updated is displayed. The "Add users or group" button is disabled  |  |  |
| 2 | Server 8.1 landscape  |  In a server 8.1, try to share a file with users/groups | It is not possible. A message is displayed indicating that the server version should be updated. The "Add users or group" button is disabled  |  |  |
| 3 | Server > 8.1   |  In a server > 8.1, try to share a file with users/groups | Content can be shared  |  |  |
|**Share API disabled**|||||||
| 4 | Server 8.1 portrait  |  In a server 8.1, try to share a file with users/groups | It is not possible. A message indicating that the server version should be updated is displayed. The "Add users or group" button is disabled  |  |  |
| 5 | Server 8.1 landscape  |  In a server 8.1, try to share a file with users/groups | It is not possible. A message indicating that the server version should be updated is displayed. The "Add users or group" button is disabled  |  |  |
| 6 | Server > 8.1   |  In a server > 8.1, try to share a file with users/groups | It is not possible. A message is displayed indicating that the server API should be enabled  |  |  |


