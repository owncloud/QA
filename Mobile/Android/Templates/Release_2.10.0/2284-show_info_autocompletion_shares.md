#### Show additional info in autocompletion of Shares 

#### Pr: https://github.com/owncloud/android/pull/2484

---

 
| Test | Test Case | Steps | Expected Result | Result | Related Comment
| :----: | :-------- | :---- | :-------------- | :-----: | :------
| 1 | None | 1. Set the capability as "None"<br>2. Share any item with other user | No additional info is shown neither in searching nor in list of sharees |  | |
| 2 | Email | 1. Set the capability as "Email"<br>2. Share any item with other user | User email shown in searching and in list of sharees | | |
| 3 | User ID | 1. Set the capability as "USer ID"<br>2. Share any item with other user | User ID shown in searching and in list of sharees |  | |
|**Older server (10.0.9)**||||||
| 4 | Email | 1. Set the capability as "Email"<br>2. Share any item with other user | No info is shown because such version does not ask for user email |  | |