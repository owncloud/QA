###  Customizable strings for users&groups search provider 

#### Pr: https://github.com/owncloud/ios/pull/1749 

Devices: Motorola MotoE v4.4.4, Nexus5 v5.0.1, Nexus7 v4.3

Server: v9.1


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Search engine**||||||
| 1 | Internal share users | Try to share a file with a user | Users are correctly shown in search view, and share is completed correctly | P m5 m4 t4|  |
| 2 | Internal share groups| Try to share a file with a group | Group is correctly shown in search view, and share is completed correctly with all group's users| P m5 m4 t4|  |
| 3 | Federated share | Try to share a file with a user in a remote server| Users are correctly shown in search view, and share is completed correctly after accept the share in remote server | P m5 m4 t4 |  |
|**Authorities**||||||
| 4 | Two oC apps | Install two oC based apps in the same device | Both of them are correctly installed | P m5 t4| Change the authority parameters |
| 5 | Two oC apps from previous version | 1. Install a oC based app<br>2. Install another one based in previous version<br>3. Install a third one based in previous version| 1. Correctly installed<br>2. Correctly installed<br>3. Install error | P m5 t4| Change the authority parameters |