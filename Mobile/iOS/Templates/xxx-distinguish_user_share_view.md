###  Distinguish users in share view 

#### Pr: https://github.com/owncloud/ios/pull/XXX 

Devices:

Server version:


Prerrequisite to perform this test plan: 

**The server must contain users who have the same display name, but different user name**

---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------: | :------------- | :------------- | :-------------- | :----- | :------
|**Display**
| 1 |  Same display name  |  1. Swipe to share a file/folder <br>2. Input characters to search a user who matches with more than one user|  Results are displayed, and users with the same display name shows the username between parenthesis
| 2 |  Same display name + one group |  1. Swipe to share a file/folder <br>2. Input characters which match with more than one user and at least a group|  Results are displayed, and users with the same display name shows the username between parenthesis. The groups are showed with "(group)" as usual
|**Share**
|3|Correct sharee| 1. From previous test cases, select one user marked with (...) to share | Check that the file is shared with the correct user.
