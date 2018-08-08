#### Show all shares in source user (private sharing)

#### Pr: https://github.com/owncloud/android/pull/2271


---

 
| Test  | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**Reshare**||||||
| 1 | Reshare 1 level | 1. User A shares with B.<br>2. User B shares with C | User A sees B and C. User B sees C |  |  |
| 2 | Reshare in tree | 1. User A shares with B, C and D.<br>2. User C shares with E, F, G<br>3. User D shares with H, I, J  | User A sees all shares. Other users only see their own shares|  |  |
| 3 | Reshare 3 levels | 1. User A shares with B<br>2. User B shares with C<br>3. User C shares with D | Select all appears<br>Select inverse appears |  |  |
|**Unshare**||||||
| 4 | Unshare 1 | From 1, User B unshares with C|User A sees B<br>Users B and C sees no shares |  |
| 5 | Unshare 2 | From 2, User A unshares with C and H|User A sees B, D, E, G<br>User C sees no shares<br>User D sees I, J |  |
| 6 | Unshare 3 | From 3, User B unshares with C|User A sees B, D<br>User B sees no shares<br>User C sees D|  |
