###  Autocompletion in federated sharing 

#### Pr: https://github.com/owncloud/ios/pull/606 

Devices: iPhone6 v8, iPad mini2 v9

Server: v9

Precondition: Set some servers with federation app. Set a server as trusted to federated sharing.

---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :-----: | :------- | :---- | :-------------- | :----: | :-------------- |
| 1 | User in other server (with autoc.)|  1. Share a file/folder with a user of a trusted server typing only his name| The autocompletion shows the complete federated URL and not the (remote)| P m8 t9||
| 2 | User in other server (without autoc.) |  1. Share a file/folder with a user of a non-trusted server typing only his name| When the @ is written is shown as 'remote'| P m8 t9||
| 3 | Two users with same name  (with autoc.) |  1. Share a file/folder with a user of a trusted server typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, the remote including whole URL|P m8 t9| SOLVED: Is shown as if two users in the same server|
| 4 | Two users with same name  (without autoc.) |  1. Share a file/folder with a user of a non-trusted server typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, the remote including @remote|P m8 t9||
| 5 | Three users with same name  (with autoc.) |  1. Share a file/folder with two users of different trusted servers typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, including correct URLs|P m8 t9||
| 6 | Three users with same name  (without autoc.) |  1. Share a file/folder with two users of different servers (trusted/non-trusted) typing only his name. Another user with the same name exists in the current server| Both users are shown correctly, including correct URLs and the one in non-trusted as @remote|F m8 t9|SOLVED: If the user ends with @ -> bad result|
