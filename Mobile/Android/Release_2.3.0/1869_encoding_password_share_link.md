###  Encoding password of share links 

#### PR: https://github.com/owncloud/android/pull/1869 


---

 
| TestID | Test Case | Steps | Expected Result | Result | Related Comment |
| :----: | :-------- | :---- | :-------------- | :----: | :------ |
|**Password in links**|||||||
| 1 | Encoded character %20 (space) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password |  |  |
| 2 | Encoded character %26 (&) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password |  |  |
| 3 | Encoded character %2F (/) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password |  |  |
| 4 | Encoded character %40 (@) | 1. Set a password in a shared link that include the encoded character<br>2. Open the link |  The link is opened with the password |  |  |
|**Only character**|||||||
| 5 | Encoded character %20 (space) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
| 6 | Encoded character %26 (&) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
| 7 | Encoded character %2F (/) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
| 8 | Encoded character %40 (@) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
|**Characters**|||||||
| 9 | Character (space) | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
| 10 | Character & | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
| 11 | Character / | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |
| 12 | Character @ | 1. Set a password in a shared link with only the character<br>2. Open the link |  The link is opened with the password |  |  |