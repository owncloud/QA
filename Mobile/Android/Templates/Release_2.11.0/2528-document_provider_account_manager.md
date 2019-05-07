#### Document provider - Account manager

#### Pr: https://github.com/owncloud/android/pull/2527



---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
|**Add account**|||||
| 1 | Add one account | 1. Open Files/Downloads<br>2. Add one account to oC<br>3. Open again Files/Downloads | Account available in Files/Downloads  |  |
| 2 | Add two account | 1. Open Files/Downloads<br>2. Add another account to oC<br>3. Open again Files/Downloads | Both accounts available in Files/Downloads  |  |
| 3 | Same server | 1. Add several account to oC of the same server | Both accounts available in Files/Downloads  |  |
|**Remove account**| Accounts added before||||
| 4 | Remove one account | 1. Open Files/Downloads<br>2. Remove one account from oC<br>3. Open again Files/Downloads | Account not available in Files/Downloads  |  |
| 5 | Remove two account | 1. Open Files/Downloads<br>2. Remove another account from oC<br>3. Open again Files/Downloads | Both accounts not available in Files/Downloads  |  |
| 6 | Remove all accounts | 1. Open Files/Downloads<br>2. Remove all accounts from oC<br>3. Open again Files/Downloads | Both accounts not available in Files/Downloads  |  |
| 7 | Uninstall the app | Uninstall the app from the device | All accounts not available in    Files/Downloads|  |
|**Regression**|Several accounts attached||||
| 8 | Browse | Browse through folder in different accounts | Correct browsing  |  |
| 9 | Create folder | Create folder with different names in different accounts | Correct created  |  |
| 10 | Delete | Delete some items in different accounts | Correct deleted  |  |
| 11 | Rename | Rename some items in different accounts | Correct renamed  |  |
| 12 | Edit | Edit some files in different accounts | Correct edited  |  |