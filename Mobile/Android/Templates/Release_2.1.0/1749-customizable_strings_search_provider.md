###  Customizable strings for users&groups search provider 

#### Pr: https://github.com/owncloud/ios/pull/1749 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :-------------- |
|**Search engine**||||||
| 1 | Internal share users | Try to share a file with a user | Users are correctly shown in search view, and share is completed correctly |  |  |
| 2 | Internal share groups| Try to share a file with a group | Group is correctly shown in search view, and share is completed correctly with all group's users|  |  |
| 3 | Federated share | Try to share a file with a user in a remote server| Users are correctly shown in search view, and share is completed correctly after accept the share in remote server |  |  |
|**Authorities**||||||
| 4 | Two oC apps | Install two oC based apps in the same device | Both of them are correctly installed |  |  |
| 5 | Two oC apps from previous version | 1. Install a oC based app<br>2. Install another one based in previous version<br>3. Install a third one based in previous version| 1. Correctly installed<br>2. Correctly installed<br>3. Install error |  |  |