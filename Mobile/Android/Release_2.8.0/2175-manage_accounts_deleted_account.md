#### Go to manage accounts when account is deleted

#### Pr: https://github.com/owncloud/android/pull/2175

Device: Samsung Galaxy S7 v7<br>
Server: 10.0.7

---

 
| Test Case | Steps | Expected Result | Result | Related Comment
:------: | :------------- | :------------- | :-------------- | :-----: | :------
|**Basic Auth**||||||
| 1 | Delete one account | 1. In web UI delete one account<br>2. In app, refresh<br>3. Select again the deleted account | Go to Manage accounts in both cases | F m7 | List of accounts twice |
| 2 | Delete several accounts | 1. In web UI delete several accounts attached to the device<br>2. In app, refresh<br>3. Select any of the deleted accounts | Go to Manage accounts in all cases | P m7 |  |
| 3 | Delete all accounts | 1. In web UI delete all accounts attached to the device<br>2. In app, refresh<br>3. Select any of the deleted accounts | Go to Manage accounts in all cases | P m7 |  |
| 4 | Add account | 1. After previous test cases, add a new account | Correctly added | P m7 |  |
|**OAuth**||||||
| 5 | Delete one account | 1. In web UI delete one account<br>2. In app, refresh<br>3. Select again the deleted account | Go to Manage accounts in both cases |  |  |
| 6 | Delete several accounts | 1. In web UI delete several accounts attached to the device<br>2. In app, refresh<br>3. Select any of the deleted accounts | Go to Manage accounts in all cases |  |  |
| 7 | Delete all accounts | 1. In web UI delete all accounts attached to the device<br>2. In app, refresh<br>3. Select any of the deleted accounts | Go to Manage accounts in all cases |  |  |
| 8 | Add account | 1. After previous test cases, add a new account | Correctly added |  |  |
