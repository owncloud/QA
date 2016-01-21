###  Distinguish users in share view 

#### Pr: https://github.com/owncloud/ios/pull/563 

Devices: iPhone 6 Plus v8.4, iPad Air v9.0

Server version: 8.2.2


---

 
TestID | Test Case | Steps | Expected Result | Result | Related Comment
:------------: | :------------- | :------------- | :-------------- | :----- | :------
|**Display**
| 1 |  Same display name  |  1. Swipe to share a file/folder <br>2. Input characters to search a user who matches with more than one user|  Results are displayed, and users with the same display name shows the username between parenthesis
| 2 |  Same display name + one group |  1. Swipe to share a file/folder <br>2. Input characters which match with more than one user and at least a group|  Results are displayed, and users with the same display name shows the username between parenthesis. The groups are showed with "(group)" as usual
| 3 | No coincidences | 1. Swipe to share a file/folder<br> 2. Input a pattern which does not match with any user| No results are displayed  
|**Share**
| 4 |Correct sharee| 1. From previous test cases, select one user marked with (...) to share | Check that the file is shared with the correct user.
