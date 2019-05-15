#### Document provider - Account manager

#### Pr: https://github.com/owncloud/android/pull/2527

Devices: Nexus 5X v8<br>
Server: 10.1

---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**Add account**|||||
| 1 | Add one account | 1. Open Files/Downloads<br>2. Add one account to oC<br>3. Open again Files/Downloads | Account available in Files/Downloads  | P m8 |
| 2 | Add two account | 1. Open Files/Downloads<br>2. Add another account to oC<br>3. Open again Files/Downloads | Both accounts available in Files/Downloads  | P m8 | FIXED: If not browsed, crash.
| 3 | Same server | 1. Add several account to oC of the same server | Both accounts available in Files/Downloads  | P m8 |
|**Remove account**| Accounts added before||||
| 4 | Remove one account | 1. Open Files/Downloads<br>2. Remove one account from oC<br>3. Open again Files/Downloads | Account not available in Files/Downloads  | P m8 |
| 5 | Remove two account | 1. Open Files/Downloads<br>2. Remove another account from oC<br>3. Open again Files/Downloads | Both accounts not available in Files/Downloads  | P m8 |
| 6 | Remove all accounts | 1. Open Files/Downloads<br>2. Remove all accounts from oC<br>3. Open again Files/Downloads | Both accounts not available in Files/Downloads  | P m8 |
| 7 | Uninstall the app | Uninstall the app from the device | All accounts not available in    Files/Downloads| P m8 |
|**Regression**|Several accounts attached||||
| 8 | Browse | Browse through folder in different accounts | Correct browsing  | P m8 |
| 9 | Create folder | Create folder with different names in different accounts | Correct created  | NA | Not in the branch. To test in regression
| 10 | Delete | Delete some items in different accounts | Correct deleted  | P m8 |
| 11 | Rename | Rename some items in different accounts | Correct renamed  | P m8 |
| 12 | Edit | Edit some files in different accounts | Correct edited  | NA | Not in the branch yet. To regression.